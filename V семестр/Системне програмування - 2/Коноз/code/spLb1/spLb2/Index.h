struct indStr// структура індексу у вигляды двыйкового дерева
{struct keyStr* pKyStr;//вказівник на ключову частину
 struct indStr* pLtPtr;//вказівник вліво
 struct indStr* pRtPtr;//вказівник вправо
};
struct hdIxStr
{struct hdTbStr*pHdTb;
 struct indStr*	pBgNdx;// вказівник на початок масиву структур індексу
 struct indStr*	pRtNdx;// вказівник на кореневий вузол масиву структур індексу
};
struct hdIxStr*crLsIx(struct hdTbStr*p);// перетворення індексу як списку
void	cvLsBn(struct hdIxStr*p);	// перебудова списку в двійкове дерево 
void	extDnIx1(struct hdIxStr*p, struct keyStr*);// додавання елементу до індекса 
void	extDnIx1(struct hdIxStr*p);// додавання сементу до індекса 
