struct keyStr // ключова частина запису
{char* str; // ключові поля
 unsigned short nMod;}; // ключ для прямої адреси - за варіантом

 enum tu {nol,ras,dva,tri,chre,pt,sht,sim,vsim};

struct fStr	// функціональна частина запису
{enum tu _f;};

struct recrd  // структура рядка таблиці
{struct keyStr key;  // примірник структури ключа
 struct fStr func;  // примірник функціональної частини
 char _del;};	// ознака вилучення
 
//------------------------------------------------------
// обробка записів таблиць за прямою адресою
//
// вибірка за прямою адресою
struct recrd* selNmb(struct recrd*, unsigned short nElm);
	
// включення за прямою адресою
struct recrd* insNmb(struct recrd*pElm,
					 struct recrd*tb,unsigned short nElm, short*pQnElm);

// вилучення за прямою адресою
struct recrd* delNmb(struct recrd*,unsigned short nElm);	

// корекція за прямою адресою
struct recrd* updNmb(struct recrd*pElm,
					 struct recrd*tb,unsigned short nElm, short*pQnElm);	

//------------------------------------------------------
// порівняння за відношенням нерівності
 int neqKey(struct recrd*, struct keyStr);	

 // порівняння рядків
 int cmpStr(unsigned char* s1, unsigned char* s2);

 // порівняння за відношенням порядку
 int cmpKey(struct recrd*, struct keyStr);	

 // порівняння за відношенням порядку
 int cmpKys(struct keyStr*, struct keyStr*);	

 // порівняння за відношенням схожості
 int simKey(struct recrd*, struct keyStr);	

// вибірка за лінійним пошуком за відношенням схожості
struct recrd* selLinSim(struct keyStr,
					 struct recrd*, short ln);

 //------------------------------------------------------
// вибірка за лінійним пошуком
struct recrd*selLin(struct keyStr, struct recrd*tb, short ln);

// включення за лінійним пошуком
struct recrd*insLin(struct recrd*pElm,
					struct recrd*tb, short*pQnElm);

// вилучення за лінійним пошуком
struct recrd*delLin(struct recrd*pElm,
					struct recrd*tb, short*pQnElm);

// корекція за лінійним пошуком
struct recrd*updLin(struct keyStr, struct recrd*pElm,
					struct recrd*tb, short*pQnElm);

// пакування для лінійного пошуку
struct recrd*pckLin(struct recrd*tb, short*pQnElm);

//------------------------------------------------------
// сортування за двійковим пошуком
struct recrd*srtBin(struct recrd*, short ln);

// вибірка за двійковим пошуком
struct recrd*selBin(struct keyStr, struct recrd*, short ln);

// включення за двійковим пошуком
struct recrd*insBin(struct recrd*pElm,
					struct recrd*tb, short*pQnElm);

// вилучення за двійковим пошуком
struct recrd*delBin(struct recrd*pElm,
					struct recrd*tb, short*pQnElm);

// корекція за двійковим пошуком
struct recrd*updBin(struct keyStr, struct recrd*pElm,
					struct recrd*tb, short*pQnElm);
