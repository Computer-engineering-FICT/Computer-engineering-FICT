#include <stdio.h>
void	prOpBr(struct lxNode*rt);	//відкриті дужки
void	prClBr(struct lxNode*rt);	//закриті дужки
// виведення піддерва лексем
void	prLxTxt(struct lxNode*rt);	//корінь піддерева 
void	prLxTxt(struct lxNode*rt,FILE*f); //корінь піддерева 
// виведення масиву лексем
void	prLaTxt(struct lxNode*ar, unsigned n); //початок масиву лексем 
