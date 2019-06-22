// KursView.h : interface of the CKursView class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_KURSVIEW_H__6A4A8FD0_FBC8_11D5_8B98_444553540000__INCLUDED_)
#define AFX_KURSVIEW_H__6A4A8FD0_FBC8_11D5_8B98_444553540000__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

class CKursView : public CView
{
protected: // create from serialization only
	CKursView();
	DECLARE_DYNCREATE(CKursView)

// Attributes
public:
	CKursDoc* GetDocument();

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CKursView)
	public:
	virtual void OnDraw(CDC* pDC);  // overridden to draw this view
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	protected:
	virtual BOOL OnPreparePrinting(CPrintInfo* pInfo);
	virtual void OnBeginPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnEndPrinting(CDC* pDC, CPrintInfo* pInfo);
	//}}AFX_VIRTUAL

// Implementation
public:
	int ViewType;
	virtual ~CKursView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	int bTask;
	void LButtonProc(UINT nFlags, CPoint point);
	void LButtonGraph(UINT nFlags, CPoint point);
	int TekTask;
	int State;
	int ShowResults;
	void ChangeProp();
	//{{AFX_MSG(CKursView)
	afx_msg void OnRButtonDown(UINT nFlags, CPoint point);
	afx_msg void OnAddTask();
	afx_msg void OnLButtonDown(UINT nFlags, CPoint point);
	afx_msg void OnAddRelation();
	afx_msg void OnMouseMove(UINT nFlags, CPoint point);
	afx_msg void OnPropert();
	afx_msg void OnLButtonDblClk(UINT nFlags, CPoint point);
	afx_msg void OnAddTaskm();
	afx_msg void OnDelRelation();
	afx_msg void OnDelTask();
	afx_msg void OnLButtonUp(UINT nFlags, CPoint point);
	afx_msg void OnRepaint();
	afx_msg void OnViewGraphs();
	afx_msg void OnViewProc();
	afx_msg void OnCpu();
	afx_msg void OnEvaluate();
	afx_msg void OnFault();
	afx_msg void OnFileNew();
	afx_msg void OnStateManual();
	afx_msg void OnStateNorm();
	afx_msg void OnStateTrace();
	afx_msg void OnFileOpen();
	afx_msg void OnStep();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

private:
	void DrawProc(CDC *pDC);
	void DrawGraph(CDC *pDC);
	int oldx,oldy;
	int DrawMove;
	int DrawTask;
	int PointInRect(int x, int y, int x1, int y1, int x2, int y2);
	void Arrow(int x1,int y1,int x2,int y2,CDC *pDC);
	int aTask,aRelat;
	CPalette pal;
	CPen TaskPen,aTaskPen,CpuPen,TimePen,ProcPen;
	CFont TaskFontN,TaskFontV,RelatFont;
	CBrush TaskBrush,BTaskBrush;
	int DrawRelation,Task1,Task2;
};

#ifndef _DEBUG  // debug version in KursView.cpp
inline CKursDoc* CKursView::GetDocument()
   { return (CKursDoc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_KURSVIEW_H__6A4A8FD0_FBC8_11D5_8B98_444553540000__INCLUDED_)
