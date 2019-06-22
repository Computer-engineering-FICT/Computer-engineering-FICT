// KursDoc.cpp : implementation of the CKursDoc class
//

#include "stdafx.h"
#include "Kurs.h"

#include "KursDoc.h"
#include "eval.h"
#include <malloc.h>
#include <string.h>

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CKursDoc

IMPLEMENT_DYNCREATE(CKursDoc, CDocument)

BEGIN_MESSAGE_MAP(CKursDoc, CDocument)
	//{{AFX_MSG_MAP(CKursDoc)
	ON_COMMAND(ID_FILE_SAVE, OnFileSave)
	ON_COMMAND(ID_FILE_OPEN, OnFileOpen)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CKursDoc construction/destruction

CKursDoc::CKursDoc()
{
	Relat=NULL;
	Task=NULL;
	Cpu=(float *) malloc(sizeof(float));
	Cpu[0]=1.00;
	nRelat=0;
	nTask=0;
	nCpu=1;
	STask=NULL;
	endtime=-1;
}

CKursDoc::~CKursDoc()
{
	free(Task);
	free(Relat);
	free(Cpu);
	free(STask);
}

BOOL CKursDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)

	return TRUE;
}



/////////////////////////////////////////////////////////////////////////////
// CKursDoc serialization

void CKursDoc::Serialize(CArchive& ar)
{
	if (ar.IsStoring())
	{
		// TODO: add storing code here
	}
	else
	{
		// TODO: add loading code here
	}
}

/////////////////////////////////////////////////////////////////////////////
// CKursDoc diagnostics

#ifdef _DEBUG
void CKursDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CKursDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CKursDoc commands

void CKursDoc::AddTask(POINT p, int val)
{
	Task = (TTask *)	realloc(Task,(++nTask)*sizeof(TTask));
	Task[nTask-1].x=p.x;
	Task[nTask-1].y=p.y;
	Task[nTask-1].val=val;
	Task[nTask-1].cpu=-1;
	Task[nTask-1].beg=-1;
	Task[nTask-1].end=-1;
	STask = (int *) realloc(STask,(nTask)*sizeof(int));
	STask[nTask-1]=0;
}

void CKursDoc::AddRelat(int t1, int t2, int val)
{
	int err=0;
	for(int i=0;i<nRelat;i++)
		if((Relat[i].t1==t1 && Relat[i].t2==t2) || (Relat[i].t1==t2 && Relat[i].t2==t1))
		{
			err=1;
			break;
		}
	if(!err)
	{
		Relat = (TRelat *) realloc(Relat,(++nRelat)*sizeof(TRelat));
		Relat[nRelat-1].t1=t1;
		Relat[nRelat-1].t2=t2;
		Relat[nRelat-1].val=val;
	}
}

int CKursDoc::TaskX(int t)
{
	return Task[t].x;
}

int CKursDoc::TaskY(int t)
{
	return Task[t].y;
}

int CKursDoc::TaskV(int t)
{
	return Task[t].val;
}

void CKursDoc::SetTaskV(int t, int v)
{
	if(v>=0)
		Task[t].val=v;
}

void CKursDoc::SetRelatV(int r, int v)
{
	if(v>=0)
		Relat[r].val=v;
}

void CKursDoc::DelRelat(int r)
{
	for(int i=r;i<nRelat-1;i++)
		Relat[i]=Relat[i+1];
	nRelat--;
}

void CKursDoc::DelTask(int t)
{
	int i=0;
	while(i<nRelat)
	{
		if(Relat[i].t1==t || Relat[i].t2==t)
			DelRelat(i);
		else
			i++;
	}
	
	for(i=t;i<nTask-1;i++)
		Task[i]=Task[i+1];
	nTask--;

	for(i=0;i<nRelat;i++)
	{
		if(Relat[i].t1>t)
			Relat[i].t1--;
		if(Relat[i].t2>t)
			Relat[i].t2--;
	}
}

void CKursDoc::LineUp(int x1, int y1, int x2, int y2)
{
	int **M;
	M = (int **) malloc(nTask*sizeof(int *));
	for(int i=0;i<nTask;i++)
	{
		M[i] = (int *) malloc(nTask*sizeof(int));
		for(int j=0;j<nTask;j++)
			M[i][j]=-1;
	}

	for(i=0;i<nRelat;i++)
		M[Relat[i].t1][Relat[i].t2]=Relat[i].val;
	
	int **Levs;
	Levs = (int **) malloc(nTask*sizeof(int *));
	for(i=0;i<nTask;i++)
	{
		Levs[i] = (int *) malloc(nTask*sizeof(int));
		for(int j=0;j<nTask;j++)
			Levs[i][j]=-1;
	}
	
	int nLev=0,nTek;
	nTek=GetFirstLevel(Levs[0],M);
	while(nTek)
	{
		nLev++;
		nTek=GetNextLevel(Levs,nLev,M);
	}
	
	int dy;
	if(nLev>2)
		dy = (y2-y1)/(nLev-1);
	else
		dy=y2-y1;
	for(i=0;i<nLev;i++)
		LineUpLevel(Levs[i],x1,x2,y1+dy*i);
	
	for(i=0;i<nTask;i++)
		free(M[i]);
	free(M);
	for(i=0;i<nTask;i++)
		free(Levs[i]);
	free(Levs);
}

int CKursDoc::GetFirstLevel(int Lev[], int **M)
{
	int k,m=0;
	for(int i=0;i<nTask;i++)
	{
		k=0;
		for(int j=0;j<nTask;j++)
			if(M[j][i]>=0)
			{
				k=1;
				break;
			}
		
		if(!k)
			Lev[m++]=i;
	}
	return m;
}

int CKursDoc::GetNextLevel(int **Lev, int tek, int **M)
{
	int err=0;
	int nNLev=0;
	
	for(int i=0;i<nTask;i++)
	{
	  if(InLevel(Lev[tek-1],i))
		for(int j=0;j<nTask;j++)
			if(M[i][j]>=0)
			{
				err=0;
				for(int k=0;k<nTask;k++)
				{
					if(M[k][j]>=0 && !InPrevLevel(Lev,tek-1,k))
					{
						err=1;
						break;
					}
				}
				if(!err && (!InLevel(Lev[tek],j) || !nNLev))
					Lev[tek][nNLev++]=j;
			}
	}
	return nNLev;
}

int CKursDoc::InLevel(int lev[], int ver)
{
	int i=0;
	while(lev[i]>=0)
		if(lev[i++]==ver)
			return 1;
	return 0;
}

void CKursDoc::LineUpLevel(int lev [ ], int x1, int x2, int y)
{
	int n=0;
	while(lev[n]>=0)
		n++;

	
	if(n==1)
	{
		Task[lev[0]].x=(x1+x2)/2;
		Task[lev[0]].y=y;
	}
	else
	{
		int dx=(x2-x1)/(n-1);
		for(int i=0;i<n;i++)
		{
			Task[lev[i]].x=x1+dx*i;
			Task[lev[i]].y=y;
		}
	}
}

int CKursDoc::InPrevLevel(int **Lev, int e, int ver)
{
	for(int i=0;i<=e;i++)
	{
		int j=0;
		while(Lev[i][j]>=0)
			if(Lev[i][j++]==ver)
				return 1;
	}
	return 0;
}

int CKursDoc::Evaluate()
{
	//дл€ данных вершин получить матрицу переходов
	int **M;
	M = (int **) malloc(nTask*sizeof(int *));
	for(int i=0;i<nTask;i++)
	{
		M[i] = (int *) malloc(nTask*sizeof(int));
		for(int j=0;j<nTask;j++)
			M[i][j]=-1;
	}

	for(i=0;i<nRelat;i++)
		M[Relat[i].t1][Relat[i].t2]=Relat[i].val;

	int **Levs;
	Levs = (int **) malloc(nTask*sizeof(int *));
	for(i=0;i<nTask;i++)
	{
		Levs[i] = (int *) malloc(nTask*sizeof(int));
		for(int j=0;j<nTask;j++)
			Levs[i][j]=-1;
	}
	
	//получить уровни дл€ данных вершин
	int nLev=0,nTek;
	nTek=GetFirstLevel(Levs[0],M);
	while(nTek)
	{
		nLev++;
		nTek=GetNextLevel(Levs,nLev,M);
	}

	int *nLevs,*oLevs;
	nLevs=(int *) malloc(sizeof(int)*nTask);
	oLevs=(int *) malloc(sizeof(int)*nTask);
	int l=0,j=0;;
	//соответствие новых старым
	for(i=0;i<nTask;i++)
	{
		if(Levs[l][j]>=0)
			nLevs[i]=Levs[l][j];
		j++;
		if(Levs[l][j]<0)
		{ j=0; l++; }
	}
	
	//соответствие старых новым
	for(i=0;i<nTask;i++)
		for(j=0;j<nTask;j++)
			if(nLevs[j]==i)
			{
				oLevs[i]=j;
				break;
			}

	int **M1;
	M1 = (int **) malloc(nTask*sizeof(int *));
	for(i=0;i<nTask;i++)
	{
		M1[i] = (int *) malloc(nTask*sizeof(int));
		for(int j=0;j<nTask;j++)
			M1[i][j]=-1;
	}
	for(i=0;i<nRelat;i++)
		M1[oLevs[Relat[i].t1]][oLevs[Relat[i].t2]]=Relat[i].val;
	
	int *T;
	T = (int *) malloc(nTask*sizeof(int));
	for(i=0;i<nTask;i++)
		T[i]=Task[oLevs[i]].val;
	
	//начальные значени€
	CEval oEval;
	oEval.SetRelations(M1,nTask);
	oEval.SetTasks(T,nTask);
	oEval.SetCpu(Cpu,nCpu);
	
	//поехали!!!!
	oEval.Evaluate();
	int **R;
	R = (int **) malloc(nTask*sizeof(int *));
	for(i=0;i<nTask;i++)
		R[i] = (int *) malloc(3*sizeof(int));
	oEval.GetResults(R,&endtime);
	for(i=0;i<nTask;i++)
	{
		Task[nLevs[i]].cpu=R[i][0];
		Task[nLevs[i]].beg=R[i][1];
		Task[nLevs[i]].end=R[i][2];
	}

	//все к черту удалить
	for(i=0;i<nTask;i++)
		free(M[i]);
	free(M);
	for(i=0;i<nTask;i++)
		free(M1[i]);
	free(M1);
	for(i=0;i<nTask;i++)
		free(Levs[i]);
	free(Levs);
	free(nLevs);
	free(oLevs);
	free(T);
	for(i=0;i<nTask;i++)
		free(R[i]);
	free(R);
	
	return endtime;		
}

void CKursDoc::AddCpu(float k)
{
	float *temp=NULL;
	temp = (float *) malloc(nCpu*sizeof(float));
	for(int i=0;i<nCpu;i++)
		temp[i]=Cpu[i];
	Cpu = (float *) realloc(Cpu,(nCpu++)*sizeof(float));
	for(i=0;i<nCpu-1;i++)
		Cpu[i]=temp[i];
	Cpu[nCpu-1]=k;
	free(temp);
}

int CKursDoc::DelCpu(int c)
{
	if(nCpu>1)
	{
		for(int i=c;i<nCpu-1;i++)
			Cpu[i]=Cpu[i+1];
		return 1;
	}
	return 0;
}

void CKursDoc::RemoveCpu() 
{ 
	free(Cpu); 
	Cpu=NULL; 
	nCpu=0; 
}

void CKursDoc::CopyCpu(float * c, int nc)
{
	free(Cpu);
	Cpu = (float *) malloc(sizeof(float)*nc);
	for(int i=0;i<nc;i++)
		Cpu[i]=c[i];
	nCpu=nc;
}

void CKursDoc::Fault()
{
	endtime=-1;
	for(int i=0;i<nTask;i++)
		STask[i]=0;
}

void CKursDoc::OnFileSave() 
{
	CFileDialog *oDlg = new CFileDialog(FALSE,"xxx","noname",
		OFN_PATHMUSTEXIST | OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT,
		"Graph files (*.xxx)|*.xxx",NULL);
	UINT ret;
	ret=oDlg->DoModal();
	if(ret!=IDOK)
		return;
	
	FILE *f;
	CString fname=oDlg->GetPathName();
	if((f=fopen(LPCTSTR(fname),"wb"))==NULL)
	{
		MessageBox(NULL,"Ќевозможно сохранить файл","ќшибка",MB_OK | MB_ICONERROR);
		return;
	}

	fwrite(&nTask,sizeof(int),1,f);
	fwrite(Task,sizeof(TTask),nTask,f);
	fwrite(&nRelat,sizeof(int),1,f);
	fwrite(Relat,sizeof(TRelat),nRelat,f);
	fwrite(&nCpu,sizeof(int),1,f);
	fwrite(Cpu,sizeof(float),nCpu,f);
	fwrite(&endtime,sizeof(int),1,f);

	fclose(f);
	delete oDlg;
}

void CKursDoc::OnFileOpen() 
{
	OpenFile();
}

void CKursDoc::New()
{
	free(Task);
	free(Relat);
	free(Cpu);
	Task=NULL;
	Relat=NULL;
	Cpu=NULL;
	nTask=0;
	nRelat=0;
	endtime=0;
	Cpu=(float *) malloc(sizeof(float));
	Cpu[0]=1.00;
	nCpu=1;
}

int CKursDoc::GetFirstTask()
{
	int **M;
	M = (int **) malloc(nTask*sizeof(int *));
	for(int i=0;i<nTask;i++)
	{
		M[i] = (int *) malloc(nTask*sizeof(int));
		for(int j=0;j<nTask;j++)
			M[i][j]=-1;
	}

	for(i=0;i<nRelat;i++)
		M[Relat[i].t1][Relat[i].t2]=Relat[i].val;
	
	int *Levs;
	Levs = (int *) malloc(nTask*sizeof(int)*nTask);
	for(i=0;i<nTask;i++)
	{
		Levs[i]=-1;
	}
	
	GetFirstLevel(Levs,M);
	int nFirst=Levs[0];
	
	for(i=0;i<nTask;i++)
		free(M[i]);
	free(M);
	free(Levs);
	
	return nFirst;
}

int CKursDoc::GetNextTask(int prev)
{
	int **M;
	M = (int **) malloc(nTask*sizeof(int *));
	for(int i=0;i<nTask;i++)
	{
		M[i] = (int *) malloc(nTask*sizeof(int));
		for(int j=0;j<nTask;j++)
			M[i][j]=-1;
	}

	for(i=0;i<nRelat;i++)
		M[Relat[i].t1][Relat[i].t2]=Relat[i].val;
	
	int **Levs;
	Levs = (int **) malloc(nTask*sizeof(int *));
	for(i=0;i<nTask;i++)
	{
		Levs[i] = (int *) malloc(nTask*sizeof(int));
		for(int j=0;j<nTask;j++)
			Levs[i][j]=-1;
	}
	
	int nLev=0,nTek,next=-1,brk=0,onNext=0;
	nTek=GetFirstLevel(Levs[0],M);
	while(nTek)
	{
		for(i=0;i<nTek;i++)
			if(Levs[nLev][i]==prev)
			{
				if(i<nTek-1)
				{
					next=Levs[nLev][i+1];
					brk=1;
				}
				else
					onNext=1;
				break;
			}
		if(brk)
			break;
		nLev++;
		nTek=GetNextLevel(Levs,nLev,M);
		if(onNext && nTek)
		{
			next=Levs[nLev][0];
			break;
		}
	}
	
	for(i=0;i<nTask;i++)
		free(M[i]);
	free(M);
	for(i=0;i<nTask;i++)
		free(Levs[i]);
	free(Levs);
	return next;
}

void CKursDoc::OpenFile()
{
	CFileDialog *oDlg = new CFileDialog(TRUE,"","noname",
		OFN_PATHMUSTEXIST | OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT | OFN_FILEMUSTEXIST,
		"Graph files (*.xxx)|*.xxx",NULL);
	extern CKursApp theApp;
	char c[100];
	strcpy(c,theApp.m_pszExeName);
	(oDlg->m_ofn).lpstrInitialDir=c;
	UINT ret;
	ret=oDlg->DoModal();
	if(ret!=IDOK)
		return;
	
	FILE *f;
	CString fname=oDlg->GetPathName();
	if((f=fopen(LPCTSTR(fname),"rb"))==NULL)
	{
		MessageBox(NULL,"Ќевозможно открыть файл","ќшибка",MB_OK | MB_ICONERROR);
		return;
	}

	free(Task);
	free(Relat);
	free(Cpu);
	nTask=0;
	nRelat=0;
	nCpu=0;
	endtime=0;
	
	fread(&nTask,sizeof(int),1,f);
	Task = (TTask *) malloc(sizeof(TTask)*nTask);
	fread(Task,sizeof(TTask),nTask,f);
	fread(&nRelat,sizeof(int),1,f);
	Relat = (TRelat *) malloc(sizeof(TRelat)*nRelat);
	fread(Relat,sizeof(TRelat),nRelat,f);
	fread(&nCpu,sizeof(int),1,f);
	if(nCpu!=0)
	{
		Cpu = (float *) malloc(sizeof(float)*nCpu);
		fread(Cpu,sizeof(float),nCpu,f);
	}
	else
	{
		Cpu = (float *) malloc(sizeof(float));
		Cpu[0]=1.00;
	}
	fread(&endtime,sizeof(int),1,f);
	free(STask);
	STask=NULL;
	STask=(int *) malloc(sizeof(int)*nTask);
	for(int i=0;i<nTask;i++)
		STask[i]=0;

	fclose(f);
	delete oDlg;

}

void CKursDoc::BeginMenual()
{
	int cm=0;
	for(int i=1;i<nCpu;i++)
		if(Cpu[i]<Cpu[cm])
			cm=i;

	int tek=-1,time=0;
	tek=GetFirstTask();
	while(tek>=0)
	{
		Task[tek].beg=time;
		Task[tek].end=time+int(Task[tek].val*Cpu[cm]);
		Task[tek].cpu=cm;
		time=Task[tek].end;
		tek=GetNextTask(tek);
	}
	endtime=time;
}

void CKursDoc::TaskToCpu(int task, int cpu)
{
	int **M;
	M = (int **) malloc(nTask*sizeof(int *));
	for(int i=0;i<nTask;i++)
	{
		M[i] = (int *) malloc(nTask*sizeof(int));
		for(int j=0;j<nTask;j++)
			M[i][j]=-1;
	}

	for(i=0;i<nRelat;i++)
		M[Relat[i].t1][Relat[i].t2]=Relat[i].val;

	int **Levs;
	Levs = (int **) malloc(nTask*sizeof(int *));
	for(i=0;i<nTask;i++)
	{
		Levs[i] = (int *) malloc(nTask*sizeof(int));
		for(int j=0;j<nTask;j++)
			Levs[i][j]=-1;
	}
	
	//получить уровни дл€ данных вершин
	int nLev=0,nTek;
	nTek=GetFirstLevel(Levs[0],M);
	while(nTek)
	{
		nLev++;
		nTek=GetNextLevel(Levs,nLev,M);
	}
	
	int oldb=Task[task].beg, olde=Task[task].end, oldc=Task[task].cpu;
	//определить наименьшее врем€ с которого можно начать запускать задачу
	int maxt=GetMinTime(M,task,cpu);

	int tLev=TaskLevel(Levs,nLev,task);
	int l=-1;
	//все вышесто€щие задачи на этом проце
	for(i=0;i<nTask;i++)
		if(Task[i].cpu==cpu)
		{
			l=TaskLevel(Levs,nLev,i);
			if((l<tLev && Task[i].end>maxt) || (l==tLev && Task[i].beg<=maxt))
				maxt=Task[i].end;
		}

	//поместить задачу на процессор
	Task[task].cpu=cpu;
	Task[task].beg=maxt;
	Task[task].end=maxt+Task[task].val*Cpu[Task[task].cpu];
	
	ReProcA(M,Levs,nLev);
	
	for(i=0;i<nTask;i++)
		free(M[i]);
	free(M);
	for(i=0;i<nTask;i++)
		free(Levs[i]);
	free(Levs);
}

int CKursDoc::TaskLevel(int **Lev, int nLev, int task)
{
	int i,j;
	for(i=0;i<nLev;i++)
	{
		j=0;
		while(Lev[i][j]>=0)
		{
			if(Lev[i][j]==task)
				return i;
			j++;
		}
	}
	return -1;
}

int CKursDoc::GetMinTime(int **M, int task, int cpu)
{
	int maxt=0,tempt=0;
	for(int i=0;i<nTask;i++)
		if(M[i][task]>=0)
		{
			tempt=Task[i].end;
			if(Task[i].cpu!=cpu)
			{
				for(int j=0;j<nRelat;j++)
					if(Relat[j].t1==i && Relat[j].t2==task)
					{
						tempt+=Relat[j].val;
						break;
					}
			}
			if(tempt>maxt)
				maxt=tempt;
		}
	return maxt;
}

int CKursDoc::SortOnCpu(int *Proc,int cpu)
{
	int last=0,i,etime=-1;
	for(i=0;i<nTask;i++)
		if(Task[i].cpu==cpu)
		{
			if(Task[i].beg>=etime)
			{
				Proc[last++]=i;
				etime=Task[i].beg;
			}
			else if(Task[i].beg<etime)
			{
				for(int j=0;j<last;j++)
					if(Task[Proc[j]].beg>Task[i].beg)
					{
						for(int k=last;k>j;k--)
							Proc[k]=Proc[k-1];
						Proc[j]=i;
						last++;
						break;
					}
				etime=Task[Proc[last-1]].beg;
			}
		}
	return last;
}

void CKursDoc::ReProcA(int **M, int **Levs, int nLev)
{
	int **Proc,*last,*ic;
	int mint;
	
	Proc = (int **) malloc(nCpu*sizeof(int *));
	for(int i=0;i<nCpu;i++)
	{
		Proc[i] = (int *) malloc(nTask*sizeof(int));
		for(int j=0;j<nTask;j++)
			Proc[i][j]=-1;
	}
	last = (int *) malloc(sizeof(int)*nCpu);
	for(i=0;i<nCpu;i++)
		last[i]=SortOnCpu(Proc[i],i);	
	ic = (int *) malloc(sizeof(int)*nCpu);
	for(i=0;i<nCpu;i++)
		ic[i]=0;
	
	for(i=0;i<nLev;i++)
	{
		for(int j=0;j<nCpu;j++)
			for(;ic[j]<last[j];ic[j]++)
				if(TaskLevel(Levs,nLev,Proc[j][ic[j]])==i)
				{
					mint=GetMinTime(M,Proc[j][ic[j]],j);
					if((ic[j]>0 && mint>Task[Proc[j][ic[j]-1]].end) || ic[j]==0)
						Task[Proc[j][ic[j]]].beg=mint;
					else
						Task[Proc[j][ic[j]]].beg=Task[Proc[j][ic[j]-1]].end;
					Task[Proc[j][ic[j]]].end=Task[Proc[j][ic[j]]].beg+
								Task[Proc[j][ic[j]]].val*Cpu[Task[Proc[j][ic[j]]].cpu];
				}
				else if(TaskLevel(Levs,nLev,Proc[j][ic[j]])>i)
					break;
	}
	
	endtime=0;
	for(i=0;i<nTask;i++)
		if(Task[i].end>endtime)
			endtime=Task[i].end;
		
	for(i=0;i<nCpu;i++)
		free(Proc[i]);	
	free(Proc);
	free(last);
	free(ic);
}

void CKursDoc::ReProc()
{
	int **M;
	M = (int **) malloc(nTask*sizeof(int *));
	for(int i=0;i<nTask;i++)
	{
		M[i] = (int *) malloc(nTask*sizeof(int));
		for(int j=0;j<nTask;j++)
			M[i][j]=-1;
	}

	for(i=0;i<nRelat;i++)
		M[Relat[i].t1][Relat[i].t2]=Relat[i].val;

	int **Levs;
	Levs = (int **) malloc(nTask*sizeof(int *));
	for(i=0;i<nTask;i++)
	{
		Levs[i] = (int *) malloc(nTask*sizeof(int));
		for(int j=0;j<nTask;j++)
			Levs[i][j]=-1;
	}
	
	//получить уровни дл€ данных вершин
	int nLev=0,nTek;
	nTek=GetFirstLevel(Levs[0],M);
	while(nTek)
	{
		nLev++;
		nTek=GetNextLevel(Levs,nLev,M);
	}

	ReProcA(M,Levs,nLev);
	
	for(i=0;i<nTask;i++)
		free(M[i]);
	free(M);
	for(i=0;i<nTask;i++)
		free(Levs[i]);
	free(Levs);
}