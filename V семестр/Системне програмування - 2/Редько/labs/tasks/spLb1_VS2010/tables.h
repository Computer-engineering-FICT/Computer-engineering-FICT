struct keyStr// ключова частина запису
{char* str; // ключові поля
 int  nMod;};//---!!!уточнюється за варіантом!!!---
struct fStr	// функціональна частина запису
{long double _f;};//f-поле ---!!!уточнюється за варіантом!!!---
// ---!!!Увага: типи полів, визначені користувачем: enum|struct|union!!!---
// ---!!!повинні бути об'явлені попередньо в цьому місці!!!---
struct recrd	// структура рядка таблиці
{struct keyStr key;// примірник структури ключа
 struct fStr func;// примірник функціональної частини
 char _del;};	// ознака вилучення 
//------------------------------------------------------
// обробка записів таблиць за прямою адресою
// ---!!!Увага: типи полів повинні бути замінені в аргументах int nElm!!!---
// вибірка за прямою адресою
struct recrd* selNmb(struct recrd*, int nElm);	
// включення за прямою адресою
struct recrd* insNmb(struct recrd*pElm,
					 struct recrd*tb, int nElm, int*pQnElm);
// вилучення за прямою адресою
struct recrd* delNmb(struct recrd*, int nElm);	
// корекція за прямою адресою
struct recrd* updNmb(struct recrd*pElm,
					 struct recrd*tb, int nElm, int*pQnElm);	
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
//------------------------------------------------------
// вибірка за лінійним пошуком
struct recrd*selLin(struct keyStr, struct recrd*tb, int ln);
// включення за лінійним пошуком
struct recrd*insLin(struct recrd*pElm,
					struct recrd*tb, int*pQnElm);
// вилучення за лінійним пошуком
struct recrd*delLin(struct recrd*pElm,
					struct recrd*tb, int*pQnElm);
// корекція за лінійним пошуком
struct recrd*updLin(struct keyStr, struct recrd*pElm,
					struct recrd*tb, int*pQnElm);
// пакування для лінійного пошуку
struct recrd*pckLin(struct recrd*tb, int*pQnElm);
//------------------------------------------------------
// сортування за двійковим пошуком
struct recrd*srtBin(struct recrd*, int ln);
// вибірка за двійковим пошуком
struct recrd*selBin(struct keyStr, struct recrd*, int ln);
//---!!! реалізації дописуються за варіантом!!!---
// включення за двійковим пошуком
struct recrd*insBin(struct recrd*pElm,
					struct recrd*tb, int*pQnElm);
// вилучення за двійковим пошуком
struct recrd*delBin(struct recrd*pElm,
					struct recrd*tb, int*pQnElm);
// корекція за двійковим пошуком
struct recrd*updBin(struct keyStr, struct recrd*pElm,
					struct recrd*tb, int*pQnElm);
