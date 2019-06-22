#include "stdafx.h"
#include "..\spLb3\token.h"
#include "..\spLb7\seman.h"
#include "interpF.h"
extern union gnDat acc32; 
extern int cc;
float cnvTo_f(int td, union gnDat *p1, union gnDat *p2)
{switch(td)
 {case _d: 
	acc32._fd=p1->_fd=p2->_dd; break;
  case _f: 
	acc32._fd=p1->_fd=p2->_fd; break;
  default: 
	acc32._fd=p1->_fd=p2->_id;
 }
return acc32._fd;
}
double cnvTo_d(int td, union gnDat *p1, union gnDat *p2)
{switch(td)
 {case _d: 
	acc32._dd=p1->_fd=p2->_dd; break;
  case _f: 
	acc32._dd=p1->_fd=p2->_fd; break;
  default: 
	acc32._dd=p1->_fd=p2->_id;
 }
return acc32._dd;
}
int cnvTo_i(int td, union gnDat *p1, union gnDat *p2)
{switch(td)
 {case _d: 
	acc32._id=p1->_id=p2->_dd; break;
  case _f: 
	acc32._id=p1->_id=p2->_fd; break;
  default: 
	acc32._id=p1->_id=p2->_id;
 }
return 0;
}
union gnDat _fadd(union gnDat *p1,union gnDat *p2)
{acc32._fd=p1->_fd+p2->_fd;
 return acc32;
}
