#define mant_len 23
#define removal 127
#define high_range 256

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

void error(uint8_t num)
{
  printf("error %x\n", num);
  exit(0);
}

void delay_ms(uint16_t ms)
{
}

void show_hex(uint16_t x)
{
  printf("show_hex: %04x\n", x);
}

struct ieee_binary32
{
  uint8_t bytes[4];
};

typedef struct ieee_binary32 float32;

/*
 * Распаковка 32 битного (float) формата в прямой код (знаковый бит выделен)
 */
void float_unpack_true(float32* f, uint8_t* e, int32_t* m, uint8_t* s) {
	    uint8_t _b0 = f->bytes[0];
	    uint8_t _b1 = f->bytes[1];
	    uint8_t _b2 = f->bytes[2];
	    uint8_t _b3 = f->bytes[3];
	    *s = _b0 & 0x80;
	    *e = ((_b0 << 1) | (_b1 >> 7));
	    if(*e != 0)
	    {
	      *m = 0x80 | _b1;
	    }
	    else
	    {
	      *m = _b1 & 0x7f;
	    }
	    *m <<= 8;
	    *m |= _b2;
	    *m <<= 8;
	    *m |= _b3;
}

/*
 * Распаковка 32 битного (float) формата в дополнительный код
 */
void float_unpack_comp(float32* f, uint8_t* e, int32_t* m) {
    uint8_t _s;
    float_unpack_true(f, e, m, &_s);
    if(_s)
    {
      *m = -*m;
    }
}

/*
 * Запаковка числа в прямом коде в 32 битный (float) формат.
 */
void float_pack_true(float32* f, uint8_t* e, int32_t* m, uint8_t* s) {
    int32_t __m = *m;
    uint8_t __e = *e;
    f->bytes[3] = __m & 0xff;
    __m >>= 8;
    f->bytes[2] = __m & 0xff;
    __m >>= 8;
    f->bytes[1] = (__e << 7) | (__m & 0x7f);
    f->bytes[0] = *s | (__e >> 1);
}

/*
 * Запаковка числа в дополнительном коде в 32 битный (float) формат.
 */
void float_pack_comp(float32* f, uint8_t* e, int32_t* m) {
  do
  {
    if(*m >= 0)
    {
    	uint8_t temp = 0;
    	float_pack_true(f, e, m, &temp);
    }
    else
    {
    	uint8_t temp = 0x80;
    	int32_t tempm = -*m;
    	float_pack_true(f, e, &tempm, &temp);
    }
  } while(0);
}

void show_float(float32 *z)
{
  show_hex(0x0000 | z->bytes[0]);
  delay_ms(1000);
  show_hex(0x1000 | z->bytes[1]);
  delay_ms(1000);
  show_hex(0x2000 | z->bytes[2]);
  delay_ms(1000);
  show_hex(0x3000 | z->bytes[3]);
  delay_ms(1000);
}

/*
 * Сложение чисел в формате с плавающей запятой.
 * a, b - операнды
 * z - результат
 * Все операнды даны в запакованном виде
 */
void add(float32* a, float32* b, float32* z)
{
  /* z = a + b */
  uint8_t ae, be, ze;
  int32_t am, bm, zm;


  float_unpack_comp(a, &ae, &am);
  float_unpack_comp(b, &be, &bm);
  printf("a = %d %x\n", ae, am);
  printf("b = %d %x\n", be, bm);

  /* Меняем местами в случае, если порядок первого числа
   * меньше порядка второго (ae >= be).
   * Таким образом первый операнд всегда имеет больший порядок.
   */
  if(ae < be)
  {
    ze = ae;
    ae = be;
    be = ze;

    zm = am;
    am = bm;
    bm = zm;
  }

  /*
   * Сведение операндов к одному порядку (порядку первого операнда)
   */
  while(ae != be)
  {
    be++;
    bm >>= 1;
  }

  /* Сложение */
  zm = am + bm;
  ze = be;

  {
    /* Проверка на переполнение и нормализация, если таковая необходима */
    uint8_t sign_bits = (zm >> 24) & 3;
    if(sign_bits == 1 || sign_bits == 2)
    {

      if(ze == 0xfe)
      {
        /* Переполнение порядка - его нельзя устранить. Выдается ошибка */
        error(0x01);
      }
      ze++;
      zm >>= 1;
    }
    else
    {
      /* Нормализация числа */
      int32_t high_frac_bit = (zm >> 1) & 0x800000;
      while(((zm >> 16) & 0x80) == high_frac_bit && ze > 0)
      {
        ze--;
        zm <<= 1;
      }

      /* Случай нулевого результата */
      if(zm == 0)
      {
        ze = 0;
      }
    }
  }

  printf("Sum result: %d %x\n", ze, zm);
  float_pack_comp(z, &ze, &zm);
}

/*
 * Умножение чисел в формате с плавающей запятой.
 * a, b - операнды
 * z - результат
 * Все операнды даны в запакованном виде
 */
void mul(float32* a, float32* b, float32* z)
{
  /* z = a * b */
  uint8_t ae, be, ze, as, bs, zs;
  int32_t am, bm, zm;


  float_unpack_true(a, &ae, &am, &as);
  float_unpack_true(b, &be, &bm, &bs);

  zs = as ^ bs;

  /* Переполнение порядка в одну из сторон - его нельзя устранить */
  if ( (zs < 0) || (zs > high_range) ) {
	  error (0x01);
  } else {

	  printf("a = %d %x\n", ae, am);
	  printf("b = %d %x\n", be, bm);

	  /* Вычисление порядка результата */
	  ze = ae + be - removal + 1;

	  if ( !((am == 0) && (ae == 0)) &&  !((bm == 0) && (be == 0)) ) {
		  am = am & 0x00FFFFFF;
		  bm = bm & 0x00FFFFFF;

		  zm = bm;
		  int i;
		  /* Основной цикл умножения */
		  for (i = 0; i < mant_len; i++) {
			  am = am << 1;
			  zm = zm << 1;

			  if (zm & 0x1000000) am = am | 1;

			  if (am & 0x800000) {
				  zm = zm & 0x00FFFFFF;
				  zm = zm + bm;
				  if (zm & 0x1000000) am++;
			  }
		  }
	  } else {
		  /* Случай нулевого результата */
		  zm = 0;
		  ze = 0;
	  }

	  printf("Mul result: %d %x\n", ze, am);
	  float_pack_true(z, &ze, &am, &zs);
  }
}


/*
 * Программа вычисления основной функции X:= (A + B) + (A * B) + (A^2 - B)
 * Операнды:
 * a, b - подаются в запакованном виде
 * Результат:
 * x - результат. Так же выдается в запакованном виде.
 */
int main()
{
    float32 a, b, x, y, z;
    /* Ввод первого операнда в запакованном виде */
    /* a = +15.5 */
    a.bytes[0] = 0x41;
    a.bytes[1] = 0x78;
    a.bytes[2] = 0x00;
    a.bytes[3] = 0x00;

    /* Ввод второго операнда в запакованном виде */
    /* b = +50 */
    b.bytes[0] = 0x42;
    b.bytes[1] = 0x48;
    b.bytes[2] = 0x00;
    b.bytes[3] = 0x00;

    // X := A + B
    add(&a, &b, &x);
    // Y:= A * B
    mul (&a, &b, &y);
    // Z:= X + Y
    add(&x, &y, &z);
    // X:= A * A
    mul (&a, &a, &x);

    // B := -B
    b.bytes[0] = b.bytes[0] | 0x80;

    // Y = X + B
    add(&x, &b, &y);
    // X:= Z + Y
    add(&z, &y, &x);
    return 0;
}
