struct recrdKWD	// структура рядка таблиці ключових слыв ы роздыльникыв
{char* key;// примірник структури ключа
 enum tokType func;// примірник функціональної частини
 int  versn;	// номер первинноъ версыъ застосування
};
//---!!! функції етапу виконання!!!---
// порівняння рядків
int cmpStr(unsigned char* s1, unsigned char* s2);
// вибірка за двійковим пошуком
struct recrdKWD*selBin(char* kArg, struct recrdKWD*tb, int ln);
//---!!! функції етапів проектування і настроювання!!!---
// сортування для двійкового пошуку
struct recrdKWD*srtBin(struct recrdKWD*tb, int ln);
// включення за двійковим пошуком
struct recrdKWD*insBin(struct recrd*pElm,
					struct recrdKWD*tb, int*pQnElm);
// вилучення за двійковим пошуком
struct recrdKWD*delBin(struct recrdKWD*pElm,
					struct recrdKWD*tb, int*pQnElm);
// корекція за двійковим пошуком
struct recrdKWD*updBin(struct keyStr, struct recrdKWD*pElm,
					struct recrdKWD*tb, int*pQnElm);
//------------------------------------------------------
