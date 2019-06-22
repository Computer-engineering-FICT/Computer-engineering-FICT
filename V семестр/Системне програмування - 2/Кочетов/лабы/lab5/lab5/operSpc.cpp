#include "syntaxP.h"
#include "token.h"
#include <stdio.h>
struct lxNode nodes[MAX_NODES]= // масив приймач вузлів дерева
{{_nil,NULL,NULL,0,0,0,0,0,NULL,0},{_nil,NULL,NULL,0,0,0,0,0,NULL,0},
{_nil,NULL,NULL,0,0,0,0,0,NULL,0},{_nil,NULL,NULL,0,0,0,0,0,NULL,0},
{_nil,NULL,NULL,0,0,0,0,0,NULL,0},{_nil,NULL,NULL,0,0,0,0,0,NULL,0},
{_nil,NULL,NULL,0,0,0,0,0,NULL,0},{_nil,NULL,NULL,0,0,0,0,0,NULL,0},
{_nil,NULL,NULL,0,0,0,0,0,NULL,0},{_nil,NULL,NULL,0,0,0,0,0,NULL,0},
{_nil,NULL,NULL,0,0,0,0,0,NULL,0},{_nil,NULL,NULL,0,0,0,0,0,NULL,0},
{_nil,NULL,NULL,0,0,0,0,0,NULL,0},{_nil,NULL,NULL,0,0,0,0,0,NULL,0},
{_nil,NULL,NULL,0,0,0,0,0,NULL,0},{_nil,NULL,NULL,0,0,0,0,0,NULL,0},
{_nil,NULL,NULL,0,0,0,0,0,NULL,0},{_nil,NULL,NULL,0,0,0,0,0,NULL,0},
{_nil,NULL,NULL,0,0,0,0,0,NULL,0},{_nil,NULL,NULL,0,0,0,0,0,NULL,0},
};
