// KursDoc.h : interface of the CKursDoc class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_KURSDOC_H__6A4A8FCE_FBC8_11D5_8B98_444553540000__INCLUDED_)
#define AFX_KURSDOC_H__6A4A8FCE_FBC8_11D5_8B98_444553540000__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000


struct TTask{
	int x,y;			//координаты
	int val;			//вес
	int cpu;			//процессор
	int beg,end;		//время начала и конца на проце
};
struct TRelat{
	int t1,t2;			//связываемые задачи
	int val;			//вес
};

class CKursDoc : public CDocument
{
protected: // create from serialization only
	CKursDoc();
	DECLARE_DYNCREATE(CKursDoc)

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CKursDoc)
	public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);
	//}}AFX_VIRTUAL

// Implementation
public:
	void ReProc();
	void TaskToCpu(int task, int cpu);
	void BeginMenual();
	void OpenFile();
	int GetNextTask(int prev);
	int GetFirstTask();
	void New();
	void Fault();
	void CopyCpu(float *c, int nc);
	int DelCpu(int c);
	void AddCpu(float k);
	int Evaluate();
	void LineUp(int x1, int y1, int x2, int y2);
	void DelTask(int t);
	void DelRelat(int r);
	void SetRelatV(int r, int v);
	
	int TaskV(int t);
	int TaskY(int t);
	int TaskX(int t);
	void SetTaskV(int t, int v);
	void SetTaskX(int t, int x) { Task[t].x=x; }
	void SetTaskY(int t, int y) { Task[t].y=y; }
	int TaskNum() { return nTask; }
	int TaskCpu(int t) { return Task[t].cpu; }
	int TaskBeg(int t) { return Task[t].beg; }
	int TaskEnd(int t) { return Task[t].end; }

	int GetSTask(int t) { return STask[t]; }
	void SetSTask(int t, int s) { STask[t]=s; }

	int RelatX1(int r) { return Task[Relat[r].t1].x; }
	int RelatY1(int r) { return Task[Relat[r].t1].y; }
	int RelatX2(int r) { return Task[Relat[r].t2].x; }
	int RelatY2(int r) { return Task[Relat[r].t2].y; }
	int RelatV(int r) { return Relat[r].val; }
	int RelatNum() { return nRelat; }
	int RelatT1(int r) { return Relat[r].t1; }
	int RelatT2(int r) { return Relat[r].t2; }

	int CpuNum() { return nCpu; }
	void RemoveCpu() ;
	float CpuWork(int c) { return Cpu[c]; }
	void SetCpuWork(int c, float k) { Cpu[c]=k; }
	int GetEndTime() { return endtime; }

	void AddRelat(int t1, int t2, int val);
	void AddTask(POINT p, int val);
	virtual ~CKursDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:
	TTask *Task;
	TRelat *Relat;
	float *Cpu;
	int nTask,nRelat,nCpu;
	int *STask;
		
// Generated message map functions
protected:
	void ReProcA(int **M, int **Levs, int nLev);
	int SortOnCpu(int *Proc, int cpu);
	int GetMinTime(int **M, int task, int cpu);
	int TaskLevel(int **Lev,int nLev,int task);
	int endtime;
	//{{AFX_MSG(CKursDoc)
	afx_msg void OnFileSave();
	afx_msg void OnFileOpen();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
private:
	int InPrevLevel(int **Lev, int e, int ver);
	void LineUpLevel(int lev[],int x1, int x2,int y);
	int InLevel(int lev[], int ver);
	int GetNextLevel(int **Lev, int tek, int **M);
	int GetFirstLevel(int Lev[], int **M);
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_KURSDOC_H__6A4A8FCE_FBC8_11D5_8B98_444553540000__INCLUDED_)
