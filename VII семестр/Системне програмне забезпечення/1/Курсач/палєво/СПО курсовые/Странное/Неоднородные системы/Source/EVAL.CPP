#include "stdafx.h"
#include "eval.h"
#include <malloc.h>

CEval::CEval()
{
	A=NULL;
	ANUM=0;
	T=NULL;
	C=NULL;
	PNUM=0;
	evLev=NULL;
	bCe=NULL;
	Ce=NULL;
	minC=-1;
	Ctime=NULL;
}

int CEval::GetFirstLevel()
{
	int k,m=0;
	for(int i=0;i<ANUM;i++)
		evLev[i]=-1;
	for(i=0;i<ANUM;i++)
	{
		k=0;
		for(int j=0;j<ANUM;j++)
			if(A[j][i]>=0)
			{
				k=1;
				break;
			}
		
		if(!k)
		{
			evLev[m++]=i;
		}
	}
	return m;
}

//формирует новую позицию по процам для тек. уровня
int CEval::GetNextCode(int code[], int nLev, int nProc)
{
	int p=1;
	int i=0;
	while(p && i<nLev)
	{
		code[i]+=p;
		if(code[i]==nProc)
		{
			code[i]=0;
			p=1;
		}
		else
			p=0;
		i++;
	}
	
	return p;
}

//получение задержки для вершины ver если она выполняется на проце proc
int CEval::GetDelay(int ver, int proc, int addT)
{
	int pred=-1;
	int del=0;			//delay
	int br=0;
	EvProc *temp;	
	for(int i=0;i<ANUM;i++)
		if(A[i][ver]>=0)
		{
			pred=i;
			for(int j=0;j<PNUM;j++)
				if(j!=proc)
				{
					temp = bCe[j];
					br=0;
					while(temp)
					{
						if(temp->ev==pred)
						{
							if(Ctime[proc]+addT+del<temp->end+A[pred][ver])
								del=(temp->end+A[pred][ver]) - (Ctime[proc]+addT);
							br=1;
							break;
						}						
						temp=temp->next;
					}
					if(br)
						break;
				}
		}
	return del;
}

//значение времени при текущем раскладе задач на проце nProc
int CEval::GetMinValue(int code[], int nLev, int nProc)
{
	int tt=Ctime[nProc];		//текущее время на проце
	int ttm=0;
	for(int i=0;i<nLev;i++)
	{
		if(code[i]==nProc)
		{
			tt += int(T[evLev[i]]*C[nProc]) + GetDelay(evLev[i],nProc,ttm);
			ttm=tt-Ctime[nProc];
		}
	}
	return tt;
}

//минимизирует уровень по процам
void CEval::MinimizeLevel(int nLev)
{
	int *code,*mcode;
	code = (int *) malloc(nLev*sizeof(int));
	mcode = (int *) malloc(nLev*sizeof(int));
	for(int i=0;i<nLev;i++)
		code[i]=0;
	
	int min=-1,tek=0,tekm;
	do
	{
		tekm=-1;
		for(i=0;i<PNUM;i++)
		{
			tek=GetMinValue(code, nLev, i);
			if(tek>tekm)
				tekm=tek;
		}
		if(min<0 || (min>=0 && tekm>0 && tekm<min))
		{
			min=tekm;
			for(i=0;i<nLev;i++)
				mcode[i]=code[i];
		}
	}
	while(!GetNextCode(code, nLev, PNUM));

	EvProc *temp;
	for(i=0;i<nLev;i++)
	{
		temp = new EvProc;
		if(Ce[mcode[i]]==NULL)
		{
			bCe[mcode[i]]=Ce[mcode[i]]=temp;
			temp->beg=GetDelay(evLev[i],mcode[i],0);
		}
		else	
		{
			Ce[mcode[i]]->next=temp;
			temp->beg = Ce[mcode[i]]->end + GetDelay(evLev[i],mcode[i],0);//Ce[mcode[i]]->end);
		}
		temp->ev=evLev[i];
		temp->end=temp->beg+int(T[temp->ev]*C[mcode[i]]);
		temp->next=NULL;
		Ce[mcode[i]]=temp;
		Ctime[mcode[i]]=temp->end;
	}
	free(code);
	free(mcode);
}

//проверяет есть ли вершина ver на уровне lev
int CEval::InLevel(int lev[], int ver, int nLev)
{
	for(int i=0;i<nLev;i++)
		if(lev[i]==ver)
			return 1;
	return 0;
}

int CEval::GetMinOnLevel(int nLev)
{
	int m=ANUM+1;
	for(int i=0;i<nLev;i++)
		if(evLev[i]<m)
			m=evLev[i];
	return m;
}

int CEval::GetMaxOnLevel(int nLev)
{
	int m=-1;
	for(int i=0;i<nLev;i++)
		if(evLev[i]>m)
			m=evLev[i];
	return m;
}

//получение следующего уровня задач
int CEval::GetNextLevel(int nLev)
{
	int *nextLev;
	int err=0;
	int nNLev=0;
	int minL=GetMinOnLevel(nLev),maxL=GetMaxOnLevel(nLev);
	nextLev = (int *) malloc(sizeof(int)*ANUM);

	for(int i=minL;i<=maxL;i++)
	{
		for(int j=maxL+1;j<ANUM;j++)
			if(A[i][j]>=0)
			{
				err=0;
				for(int k=maxL+1;k<ANUM;k++)
					if(A[k][j]>=0)
					{
						err=1;
						break;
					}
				if(!err && !InLevel(nextLev,j,nNLev))
					nextLev[nNLev++]=j;
			}
	}
	for(i=0;i<nNLev;i++)
		evLev[i]=nextLev[i];
	free(nextLev);
	return nNLev;
}

void CEval::GarbageAll()
{
	EvProc *temp,*ntemp;
	for(int i=0;i<PNUM;i++)
	{
		temp=bCe[i];
		while(temp)
		{
			ntemp=temp->next;
			delete temp;
			temp=ntemp;
		}
	}
	for(i=0;i<PNUM;i++)
		free(A[i]);
	free(A);
	free(T);
	free(Ctime);
	free(C);
	free(evLev);
}

int CEval::Evaluate()
{
	int i;
	minC=PNUM-1;
	Ce[minC]=NULL;
	bCe[minC]=NULL;
	for(i=PNUM-2;i>=0;i--)			//найти самый быстрый проц
	{
		if(C[i]<=C[minC])
			minC=i;
		bCe[i]=Ce[i]=NULL;
	}

	for(i=0;i<PNUM;i++)
		Ctime[i]=0;
	int nFLev=0;

	nFLev = GetFirstLevel();
	do
	{
		MinimizeLevel(nFLev);
	}while((nFLev=GetNextLevel(nFLev)));

	return Ce[minC]->end;
}

CEval::~CEval()
{
	GarbageAll();
}

void CEval::SetRelations(int **M, int num)
{
	ANUM=num;
	A = (int **) malloc(num*sizeof(int *));
	for(int i=0;i<num;i++)
	{
		A[i] = (int *) malloc(num*sizeof(int));
		for(int j=0;j<num;j++)
			A[i][j]=M[i][j];
	}
	evLev = (int *) malloc(sizeof(int)*ANUM);
}

void CEval::SetTasks(int * t, int num)
{
	T = (int *) malloc(num*sizeof(int));
	for(int i=0;i<num;i++)
		T[i]=t[i];
}

void CEval::SetCpu(float * c, int num)
{
	C = (float *) malloc(num*sizeof(float));
	PNUM=num;
	for(int i=0;i<num;i++)
		C[i]=c[i];

	Ce = (EvProc **) malloc(sizeof(EvProc *)*PNUM);
	bCe = (EvProc **) malloc(sizeof(EvProc *)*PNUM);
	Ctime = (int *) malloc(sizeof(int)*PNUM);
}

int CEval::GetResults(int *R[3], int *endtime)
{
	EvProc *temp=NULL;
	int maxend=0,onCpu=0,max=0;
	for(int i=0;i<PNUM;i++)
	{
		onCpu=0;
		temp=bCe[i];
		while(temp)
		{
			R[temp->ev][0]=i;
			R[temp->ev][1]=temp->beg;
			R[temp->ev][2]=temp->end;
			if(temp->end>maxend)
				maxend=temp->end;
			temp=temp->next;
			onCpu++;
		}
		if(onCpu>max)
			max=onCpu;
	}
	*endtime=maxend;
	return max;
}
