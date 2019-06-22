#include <iostream.h>
#include <malloc.h>

#define ANUM 15
#define PNUM 3

int           T[ANUM] = {25, 39, 23, 32, 35, 35, 32, 24, 29, 37, 32, 33, 31, 21, 30};
//                        0   1   2   3   4   5   6   7   8   9  10  11  12  13  14
int A[ANUM][ANUM] = {   { 0, 11, 11, 11,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0},   //0
						{ 0,  0,  0,  0, 10,  0,  0,  0,  0, 10,  0,  0,  0,  0,  0},   //1
						{ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 14,  0,  0,  0},   //2
						{ 0,  0,  0,  0,  0,  8,  0,  0,  0,  0,  0,  0,  0,  0,  8},   //3
						{ 0,  0,  0,  0,  0,  0, 11, 11,  0,  0,  0,  0,  0,  0,  0},   //4
						{ 0,  0,  0,  0,  0,  0,  0,  0, 11, 11,  0,  0,  0,  0,  0},   //5
						{ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 18,  0,  0,  0},   //6
						{ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 20,  0,  0,  0,  0},   //7
						{ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 18},   //8
						{ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 20},   //9
						{ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 16,  0,  0},   //10
						{ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  6},   //11
						{ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 17,  0},   //12
						{ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  4},   //13
						{ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0}};  //14

int C[PNUM] = {1, 1, 1};			//коэффициенты работоспособности процов
int evLev[ANUM];	//соотв. вершин в уровне вершинам вообще
int Ctime[PNUM];
int minC;			//номер самого быстрого проца

struct EvProc{
	int ev;			//номер события
	int beg,end;    //время начала выполнения и завершения 
	EvProc *next;   //указатель на следующеее событие
};
EvProc *bCe[PNUM];				//списки события по процам (с начала)
EvProc *Ce[PNUM];		//текущие

int GetFirstLevel()
{
	int k,m=0;
	for(int i=0;i<ANUM;i++)
		evLev[i]=-1;
	for(i=0;i<ANUM;i++)
	{
		k=0;
		for(int j=0;j<ANUM;j++)
			if(A[j][i]!=0)
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
int GetNextCode(int code[], int nLev, int nProc)
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
int GetDelay(int ver, int proc, int addT)
{
	int pred=-1;
	int del=0;			//delay
	int br=0;
	EvProc *temp;	
	for(int i=0;i<ANUM;i++)
		if(A[i][ver]!=0)
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

//значение времени при текущем раскладе задача на проце nProc
int GetMinValue(int code[], int nLev, int nProc)
{
	int tt=Ctime[nProc];		//текущее время на проце
	for(int i=0;i<nLev;i++)
	{
		if(code[i]==nProc)
		{
			tt += T[evLev[i]]*C[nProc] + GetDelay(evLev[i],nProc,tt);
		}
	}
	return tt;
}

//минимизирует уровень по процам
void MinimizeLevel(int nLev)
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
			temp->beg = Ce[mcode[i]]->end + GetDelay(evLev[i],mcode[i],Ce[mcode[i]]->end);
		}
		temp->ev=evLev[i];
		temp->end=temp->beg+T[temp->ev]*C[mcode[i]];
		temp->next=NULL;
		Ce[mcode[i]]=temp;
		Ctime[mcode[i]]=temp->end;
	}
	free(code);
	free(mcode);
}

//проверяет есть ли вершина ver на уровне lev
int InLevel(int lev[], int ver, int nLev)
{
	for(int i=0;i<nLev;i++)
		if(lev[i]==ver)
			return 1;
	return 0;
}

int GetMinOnLevel(int nLev)
{
	int m=ANUM+1;
	for(int i=0;i<nLev;i++)
		if(evLev[i]<m)
			m=evLev[i];
	return m;
}

int GetMaxOnLevel(int nLev)
{
	int m=-1;
	for(int i=0;i<nLev;i++)
		if(evLev[i]>m)
			m=evLev[i];
	return m;
}

//получение следующего уровня задач
int GetNextLevel(int nLev)
{
	int nextLev[ANUM];
	int err=0;
	int nNLev=0;
	int minL=GetMinOnLevel(nLev),maxL=GetMaxOnLevel(nLev);

	for(int i=minL;i<=maxL;i++)
	{
		for(int j=maxL+1;j<ANUM;j++)
			if(A[i][j])
			{
				err=0;
				for(int k=maxL+1;k<ANUM;k++)
					if(A[k][j])
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
	return nNLev;
}

void GarbageAll()
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
}

void main()
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
		for(i=0;i<PNUM;i++)
		{
			if(Ce[i])
				cout<<Ce[i]->end<<"   ";
			else
				cout<<"          ";
		}
		cout<<endl;
	}while((nFLev=GetNextLevel(nFLev)));

	EvProc *temp;
	for(i=0;i<PNUM;i++)
	{
		temp=bCe[i];
		while(temp)
		{
			cout<<temp->ev<<" ";
			temp=temp->next;
		}
		cout<<endl;
	}
	
	GarbageAll();
}
