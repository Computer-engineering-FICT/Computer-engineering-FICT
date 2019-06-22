
// ключова частина запису
struct keyString
{
	char *str;
	unsigned long nMod;
};

// функціональна частина запису
struct functionString
{
	struct
	{
		int i;
	} _f ;
};

// структура рядка таблиці
struct record
{
	// примірник структури ключа
	struct keyString key;
	// примірник функціональної частини
	struct functionString func;
	// ознака вилучення 
	char _del;
};

//------------------------------------------------------------------------------
// обробка записів таблиць за прямою адресою
// вибірка за прямою адресою
struct record *selectNumber(struct record *, unsigned char);	

// включення за прямою адресою
struct record *insertNumber(struct record *, struct record *, unsigned char, int *);

// вилучення за прямою адресою
struct record *deleteNumber(struct record *, unsigned char);

// корекція за прямою адресою
struct record *updateNumber(struct record *, struct record *, unsigned char, int *);

//------------------------------------------------------------------------------
// порівняння за відношенням нерівності
 int neqKey(struct record *, struct keyString);

// порівняння рядків
 int cmpStr(unsigned char *, unsigned char *);

// порівняння за відношенням порядку
 int cmpKey(struct record *, struct keyString);

// порівняння за відношенням порядку
 int cmpKys(struct keyString *, struct keyString*);

// порівняння за відношенням схожості
 int simKey(struct record *, struct keyString);

//------------------------------------------------------
// вибірка за лінійним пошуком
struct record *selectLinear(struct keyString, struct record *, int);

// включення за лінійним пошуком
struct record *insertLinear(struct record *, struct record *, int *);

// вилучення за лінійним пошуком
struct record *deleteLinear(struct record *, struct record *, int *);

// корекція за лінійним пошуком
struct record *updateLinear(struct keyString, struct record *, struct record *, int *);

// пакування для лінійного пошуку
struct record *packLinear(struct record *, int *);

//------------------------------------------------------
// сортування за двійковим пошуком
struct record *sortBinary(struct record *, int);

// вибірка за двійковим пошуком
struct record *selectBinary(struct keyString, struct record *, int);

// включення за двійковим пошуком
struct record *insertBinary(struct record *, struct record *, int *);

// вилучення за двійковим пошуком
struct record *deleteBinary(struct record *, struct record *, int *);

// корекція за двійковим пошуком
struct record *updateBinary(struct keyString, struct record *, struct record *, int *);