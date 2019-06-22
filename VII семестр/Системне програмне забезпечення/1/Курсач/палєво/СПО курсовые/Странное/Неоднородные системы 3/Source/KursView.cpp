// KursView.cpp : implementation of the CKursView class
//

#include "stdafx.h"
#include "Kurs.h"

#include "KursDoc.h"
#include "KursView.h"
#include "resource.h"
#include "propdlg.h"
#include "CpuDialog.h"

#include <math.h>
#include <stdlib.h>
#include <malloc.h>

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CKursView

IMPLEMENT_DYNCREATE(CKursView, CView)

BEGIN_MESSAGE_MAP(CKursView, CView)
	//{{AFX_MSG_MAP(CKursView)
	ON_WM_RBUTTONDOWN()
	ON_COMMAND(ID_ADD_TASK, OnAddTask)
	ON_WM_LBUTTONDOWN()
	ON_COMMAND(ID_ADD_RELATION, OnAddRelation)
	ON_WM_MOUSEMOVE()
	ON_COMMAND(ID_PROPERT, OnPropert)
	ON_WM_LBUTTONDBLCLK()
	ON_COMMAND(ID_ADD_TASKM, OnAddTaskm)
	ON_COMMAND(ID_DEL_RELATION, OnDelRelation)
	ON_COMMAND(ID_DEL_TASK, OnDelTask)
	ON_WM_LBUTTONUP()
	ON_COMMAND(ID_REPAINT, OnRepaint)
	ON_COMMAND(ID_VIEW_GRAPHS, OnViewGraphs)
	ON_COMMAND(ID_VIEW_PROC, OnViewProc)
	ON_COMMAND(ID_CPU, OnCpu)
	ON_COMMAND(ID_EVALUATE, OnEvaluate)
	ON_COMMAND(ID_FAULT, OnFault)
	ON_COMMAND(ID_FILE_NEW, OnFileNew)
	ON_COMMAND(ID_STATE_MANUAL, OnStateManual)
	ON_COMMAND(ID_STATE_NORM, OnStateNorm)
	ON_COMMAND(ID_STATE_TRACE, OnStateTrace)
	ON_COMMAND(ID_FILE_OPEN, OnFileOpen)
	ON_COMMAND(ID_STEP, OnStep)
	//}}AFX_MSG_MAP
	// Standard printing commands
	ON_COMMAND(ID_FILE_PRINT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_DIRECT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_PREVIEW, CView::OnFilePrintPreview)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CKursView construction/destruction

CKursView::CKursView()
{
	aTask=-1;
	bTask=-1;
	aRelat=-1;
	DrawRelation=0;
	DrawTask=0;
	DrawMove=0;
	ViewType=1;
	ShowResults=0;
	State=1;
	TekTask=-1;

	TaskPen.CreatePen(PS_SOLID,1,COLORREF(0x00000000));
	aTaskPen.CreatePen(PS_SOLID,1,COLORREF(0x0000FF00));
	ProcPen.CreatePen(PS_DOT,1,COLORREF(0x00000000));
	TaskFontN.CreatePointFont(80,"Arial");
	TaskFontV.CreatePointFont(100,"Arial");
	RelatFont.CreatePointFont(100,"Arial");
	TaskBrush.CreateHatchBrush(HS_BDIAGONAL,0x00FF0000);
	BTaskBrush.CreateHatchBrush(HS_BDIAGONAL,0x0000FF00);
	CpuPen.CreatePen(PS_SOLID,1,COLORREF(0x000000FF));
	TimePen.CreatePen(PS_SOLID,1,COLORREF(0x00FF0000));
}

CKursView::~CKursView()
{
}

BOOL CKursView::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: Modify the Window class or styles here by modifying
	//  the CREATESTRUCT cs

	return CView::PreCreateWindow(cs);
}

/////////////////////////////////////////////////////////////////////////////
// CKursView drawing

void CKursView::OnDraw(CDC* pDC)
{
	if(ViewType==1)
		DrawGraph(pDC);
	else
		DrawProc(pDC);
}

/////////////////////////////////////////////////////////////////////////////
// CKursView printing

BOOL CKursView::OnPreparePrinting(CPrintInfo* pInfo)
{
	// default preparation
	return DoPreparePrinting(pInfo);
}

void CKursView::OnBeginPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add extra initialization before printing
}

void CKursView::OnEndPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add cleanup after printing
}

/////////////////////////////////////////////////////////////////////////////
// CKursView diagnostics

#ifdef _DEBUG
void CKursView::AssertValid() const
{
	CView::AssertValid();
}

void CKursView::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CKursDoc* CKursView::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CKursDoc)));
	return (CKursDoc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CKursView message handlers

void CKursView::OnRButtonDown(UINT nFlags, CPoint point) 
{
	CMenu menu;
	VERIFY(menu.LoadMenu(IDR_MENU1));
	CMenu* pPopup = menu.GetSubMenu(0);
	pPopup->CheckMenuItem(ID_VIEW_GRAPHS,ViewType==1?MF_CHECKED:MF_UNCHECKED);
	pPopup->CheckMenuItem(ID_VIEW_PROC,ViewType==2?MF_CHECKED:MF_UNCHECKED);
	pPopup->EnableMenuItem(ID_ADD_TASK,ViewType==1?MF_ENABLED:MF_GRAYED);
	pPopup->EnableMenuItem(ID_ADD_RELATION,ViewType==1?MF_ENABLED:MF_GRAYED);
	pPopup->EnableMenuItem(ID_DEL_TASK,ViewType==1?MF_ENABLED:MF_GRAYED);
	pPopup->EnableMenuItem(ID_DEL_RELATION,ViewType==1?MF_ENABLED:MF_GRAYED);
	pPopup->EnableMenuItem(ID_PROPERT,ViewType==1?MF_ENABLED:MF_GRAYED);
	pPopup->EnableMenuItem(ID_REPAINT,ViewType==1?MF_ENABLED:MF_GRAYED);
	ASSERT(pPopup != NULL);
 
	POINT p;
	GetCursorPos(&p);
	pPopup->TrackPopupMenu(TPM_LEFTALIGN | TPM_RIGHTBUTTON, p.x, p.y,
		AfxGetMainWnd());
	
	CView::OnRButtonDown(nFlags, point);
}

void CKursView::OnAddTask() 
{
	POINT p;
	GetCursorPos(&p);
	ScreenToClient(&p);
	CKursDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	pDoc->AddTask(p,0);

	Invalidate();
}

void CKursView::OnLButtonDown(UINT nFlags, CPoint point) 
{
	if(ViewType==1)
		LButtonGraph(nFlags,point);
	else
		LButtonProc(nFlags,point);
	
	CView::OnLButtonDown(nFlags, point);
}

void CKursView::OnAddRelation() 
{
	if(aTask>=0)
	{
		Task1=aTask;
		DrawRelation=2;
	}
	else
		DrawRelation=1;		
}

void CKursView::Arrow(int x1, int y1, int x2, int y2, CDC *pDC)
{
	float l,L,k,si,co;
	int xa,ya,xd,yd,xb,yb,xc,yc;
	xa=int(float(x2+x1*0.5)/1.5);
	ya=int(float(y2+y1*0.5)/1.5);
	L=sqrt((x1-xa)*(x1-xa)+(y1-ya)*(y1-ya));
	l=L/(L-10);
	xd=int((xa+x1*(l-1))/l);
	yd=int((ya+y1*(l-1))/l);
	k=float(xa-xd)/(yd-ya);
	si=k/sqrt(1+k*k);
	co=1/sqrt(1+k*k);
	xb=xd+int(5*co);
	yb=yd+int(5*si);
	xc=xd-int(5*co);
	yc=yd-int(5*si);
	
	pDC->MoveTo(x1,y1);
	pDC->LineTo(x2,y2);
	pDC->MoveTo(xa,ya);
	pDC->LineTo(xb,yb);
	pDC->MoveTo(xa,ya);
	pDC->LineTo(xc,yc);
}

void CKursView::OnMouseMove(UINT nFlags, CPoint point) 
{
	CKursDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	
	if(nFlags&MK_LBUTTON && aTask>=0 && ViewType==1)
	{
		DrawMove=1;
		pDoc->SetTaskX(aTask,point.x);
		pDoc->SetTaskY(aTask,point.y);
		Invalidate();
	}
	
	if(DrawRelation==2 || DrawTask && ViewType==1)
		Invalidate();

	CView::OnMouseMove(nFlags, point);
}

int CKursView::PointInRect(int x, int y, int x1, int y1, int x2, int y2)
{	
	if(((x<=x1 && x>=x2) || (x<=x2 && x>=x1)) && 
	   ((y<=y1 && y>=y2) || (y<=y2 && y>=y1)))
	   return 1;
	return 0;
}

void CKursView::OnPropert() 
{
	ChangeProp();	
}

void CKursView::ChangeProp()
{
	CKursDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	
	if(aTask>=0)
	{
		CPropDlg *oDlg = new CPropDlg();
		char c[10];
		_itoa(pDoc->TaskV(aTask),c,10);
		oDlg->m_val=c;
		if((oDlg->DoModal())==IDOK)
			pDoc->SetTaskV(aTask, atoi(LPCTSTR(oDlg->m_val)));
		delete oDlg;
		Invalidate();
	}
	else if(aRelat>=0)
	{
		CPropDlg *oDlg = new CPropDlg();
		char c[10];
		_itoa(pDoc->RelatV(aRelat),c,10);
		oDlg->m_val=CString(c);
		if((oDlg->DoModal())==IDOK)
			pDoc->SetRelatV(aRelat, atoi(LPCTSTR(oDlg->m_val)));
		delete oDlg;
		Invalidate();
	}
}

void CKursView::OnLButtonDblClk(UINT nFlags, CPoint point) 
{
	ChangeProp();	
	
	CView::OnLButtonDblClk(nFlags, point);
}

void CKursView::OnAddTaskm() 
{
	DrawTask=1;		
}

void CKursView::OnDelRelation() 
{
	CKursDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	if(aRelat>=0)
	{
		pDoc->DelRelat(aRelat);
		aRelat=-1;
		Invalidate();
	}
}

void CKursView::OnDelTask() 
{
	CKursDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	if(aTask>=0)
	{
		pDoc->DelTask(aTask);
		aTask=-1;
		Invalidate();
	}	
}

void CKursView::OnLButtonUp(UINT nFlags, CPoint point) 
{
	if(DrawMove)
		DrawMove=0;
	
	CView::OnLButtonUp(nFlags, point);
}

void CKursView::OnRepaint() 
{
	CKursDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	RECT rect;
	GetClientRect(&rect);
	pDoc->LineUp(rect.left+30,rect.top+30,rect.right-30,rect.bottom-30);
	Invalidate();
}

void CKursView::OnViewGraphs() 
{
	ViewType=1;
	CWnd *pWnd = GetParent();
	CMenu *pMenu = pWnd->GetMenu();
	if(pMenu)
	{
		pMenu->CheckMenuItem(ID_VIEW_GRAPHS,MF_CHECKED);
		pMenu->CheckMenuItem(ID_VIEW_PROC,MF_UNCHECKED);
		pMenu->EnableMenuItem(ID_ADD_TASK,MF_ENABLED);
		pMenu->EnableMenuItem(ID_ADD_RELATION,MF_ENABLED);
		pMenu->EnableMenuItem(ID_DEL_TASK,MF_ENABLED);
		pMenu->EnableMenuItem(ID_DEL_RELATION,MF_ENABLED);
		pMenu->EnableMenuItem(ID_PROPERT,MF_ENABLED);
	}

	Invalidate();
}

void CKursView::OnViewProc() 
{
	ViewType=2;
	CWnd *pWnd = GetParent();
	CMenu *pMenu = pWnd->GetMenu();
	if(pMenu)
	{
		pMenu->CheckMenuItem(ID_VIEW_GRAPHS,MF_UNCHECKED);
		pMenu->CheckMenuItem(ID_VIEW_PROC,MF_CHECKED);
		pMenu->EnableMenuItem(ID_ADD_TASK,MF_GRAYED);
		pMenu->EnableMenuItem(ID_ADD_RELATION,MF_GRAYED);
		pMenu->EnableMenuItem(ID_DEL_TASK,MF_GRAYED);
		pMenu->EnableMenuItem(ID_DEL_RELATION,MF_GRAYED);
		pMenu->EnableMenuItem(ID_PROPERT,MF_GRAYED);
	}

	Invalidate();
}

void CKursView::DrawGraph(CDC * pDC)
{
	CKursDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);

	CPen *oldPen;
	CFont *oldFont;
	oldPen = (CPen *) pDC->SelectObject(&TaskPen);
	char c[10];

	POINT p;
	GetCursorPos(&p);
	ScreenToClient(&p);
		
	//ресуемая связь
	if(DrawRelation==2)
		Arrow(pDoc->TaskX(Task1),pDoc->TaskY(Task1),p.x,p.y,pDC);
	
	//все связи
	oldFont = (CFont *) pDC->SelectObject(&RelatFont);
	for(int i=0;i<pDoc->RelatNum();i++)
	{
		if(i==aRelat)
		{
			pDC->SelectObject(&aTaskPen);
			Arrow(pDoc->RelatX1(i), pDoc->RelatY1(i),
					pDoc->RelatX2(i), pDoc->RelatY2(i), pDC);
			pDC->SelectObject(&TaskPen);	
		}
		else
			Arrow(pDoc->RelatX1(i), pDoc->RelatY1(i),
					pDoc->RelatX2(i), pDoc->RelatY2(i), pDC);
		_itoa(pDoc->RelatV(i),c,10);
		pDC->TextOut((pDoc->RelatX1(i)+pDoc->RelatX2(i))/2-10,
				     (pDoc->RelatY1(i)+pDoc->RelatY2(i))/2-10,CString(c));
	}

	//все вершины
	pDC->SelectObject(&TaskFontN);
	for(i=0;i<pDoc->TaskNum();i++)
	{
		if(i==aTask)
		{
			pDC->SelectObject(&aTaskPen);
			pDC->Ellipse(pDoc->TaskX(i)-15,pDoc->TaskY(i)-15,
						 pDoc->TaskX(i)+15,pDoc->TaskY(i)+15);
			pDC->SelectObject(&TaskPen);
		}
		else
			pDC->Ellipse(pDoc->TaskX(i)-15,pDoc->TaskY(i)-15,
						 pDoc->TaskX(i)+15,pDoc->TaskY(i)+15);
		_itoa(i,c,10);
		pDC->TextOut(pDoc->TaskX(i)-17,pDoc->TaskY(i)-17,CString(c));

		//инфо о процах
		if(pDoc->GetEndTime()>=0 && ((pDoc->GetSTask(i) && State==2) || State!=2))
		{
			pDC->SetTextColor(COLORREF(0x000000FF));
			_itoa(pDoc->TaskCpu(i)+1,c,10);
			pDC->TextOut(pDoc->TaskX(i)+13,pDoc->TaskY(i)-17,CString(c));
			pDC->SetTextColor(COLORREF(0x00FF0000));
			_itoa(pDoc->TaskBeg(i),c,10);
			pDC->TextOut(pDoc->TaskX(i)-17,pDoc->TaskY(i)+13,CString(c));
			_itoa(pDoc->TaskEnd(i),c,10);
			pDC->TextOut(pDoc->TaskX(i)+10,pDoc->TaskY(i)+13,CString(c));
			pDC->SetTextColor(COLORREF(0x00000000));
		}
	}
	//вершина из основного меню
	if(DrawTask)
	{
		POINT p;
		GetCursorPos(&p);
		ScreenToClient(&p);
		pDC->Ellipse(p.x-15,p.y-15,p.x+15,p.y+15);
	}

	//веса вершин
	pDC->SelectObject(&TaskFontV);
	for(i=0;i<pDoc->TaskNum();i++)
	{
		_itoa(pDoc->TaskV(i),c,10);
		pDC->TextOut(pDoc->TaskX(i)-7,pDoc->TaskY(i)-7,CString(c));
	}
	pDC->SelectObject(oldPen);
	pDC->SelectObject(oldFont);
}

void CKursView::DrawProc(CDC * pDC)
{
	CKursDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	if(pDoc->GetEndTime()<0)
		return;

	int x1,x2,y1,y2,dx=0;
	float dy;
	RECT rect;
	GetClientRect(&rect);
	x1=rect.left+70;
	y1=rect.top+30;
	x2=rect.right-70;
	y2=rect.bottom-30;
	dy=(y2-y1)/float(pDoc->GetEndTime()+1);
	if(pDoc->CpuNum()==1)
		x1=rect.right/2;
	else
		//dx=(x2-x1)/(pDoc->CpuNum()-1);
		dx=100;

	CPen *oldPen;
	CFont *oldFont;
	CBrush *oldBrush;
	oldPen = (CPen *) pDC->SelectObject(&ProcPen);
	oldBrush = (CBrush *) pDC->SelectObject(&TaskBrush);
	
	//процессоры
	char c[30];
	oldFont=pDC->SelectObject(&RelatFont);
	for(int i=0;i<pDoc->CpuNum();i++)
	{
		sprintf(c,"%d (%.3f)",i+1,pDoc->CpuWork(i));
		pDC->TextOut(x1+i*dx-20, 10, c);
		pDC->MoveTo(x1+i*dx-20,y1);
		pDC->LineTo(x1+i*dx-20,y2);
		pDC->MoveTo(x1+i*dx+20,y1);
		pDC->LineTo(x1+i*dx+20,y2);
	}
	
	//все связи
	pDC->SelectObject(&TaskPen);
	pDC->SelectObject(&TaskFontN);
	for(i=0;i<pDoc->RelatNum();i++)
		if(pDoc->TaskCpu(pDoc->RelatT1(i)) != pDoc->TaskCpu(pDoc->RelatT2(i)))
		{
			int xa,ya,xb,yb;
			xa=x1+pDoc->TaskCpu(pDoc->RelatT1(i))*dx;
			ya=y1+dy*(pDoc->TaskBeg(pDoc->RelatT1(i))+pDoc->TaskV(pDoc->RelatT1(i))/2);
			xb=x1+pDoc->TaskCpu(pDoc->RelatT2(i))*dx;
			yb=y1+dy*(pDoc->TaskBeg(pDoc->RelatT2(i))+pDoc->TaskV(pDoc->RelatT2(i))/2);
			if(pDoc->TaskCpu(pDoc->RelatT1(i))<pDoc->TaskCpu(pDoc->RelatT2(i)))
			{
				Arrow(xa+20,ya,xb-20,yb,pDC);
				_itoa(pDoc->RelatV(i),c,10);
				pDC->TextOut((xa+xb)/2-10,(ya+yb)/2-10,CString(c));
			}
			else
			{
				Arrow(xa-20,ya,xb+20,yb,pDC);
				_itoa(pDoc->RelatV(i),c,10);
				pDC->TextOut((xa+xb)/2-10,(ya+yb)/2-10,CString(c));
			}
		}
	
	//все вершины		
	for(i=0;i<pDoc->TaskNum();i++)
	{
		if(!pDoc->GetSTask(i) && State==2)
			continue;
		
		if(i==bTask && State==3)
		{
			pDC->SelectObject(&BTaskBrush);
			pDC->Rectangle(x1+pDoc->TaskCpu(i)*dx-20, y1+dy*pDoc->TaskBeg(i),
						   x1+pDoc->TaskCpu(i)*dx+20, y1+dy*pDoc->TaskEnd(i));
			pDC->SelectObject(&TaskBrush);
		}
		else
			pDC->Rectangle(x1+pDoc->TaskCpu(i)*dx-20, y1+dy*pDoc->TaskBeg(i),
						   x1+pDoc->TaskCpu(i)*dx+20, y1+dy*pDoc->TaskEnd(i));
		_itoa(i,c,10);
		pDC->TextOut(x1+pDoc->TaskCpu(i)*dx-20,y1+dy*pDoc->TaskBeg(i),c);
		pDC->SelectObject(&RelatFont);
		_itoa(pDoc->TaskV(i),c,10);
		pDC->TextOut(x1+pDoc->TaskCpu(i)*dx-10,
			         y1+dy*(3*pDoc->TaskBeg(i)+pDoc->TaskEnd(i))/4,c);
				
		pDC->MoveTo(x1+pDoc->TaskCpu(i)*dx-30,pDoc->TaskBeg(i)*dy+y1);
		pDC->LineTo(x1+pDoc->TaskCpu(i)*dx+20,pDoc->TaskBeg(i)*dy+y1);
		pDC->MoveTo(x1+pDoc->TaskCpu(i)*dx-20,pDoc->TaskEnd(i)*dy+y1);
		pDC->LineTo(x1+pDoc->TaskCpu(i)*dx+30,pDoc->TaskEnd(i)*dy+y1);

		pDC->SetTextColor(COLORREF(0x000000FF));
		pDC->SelectObject(&TaskFontN);
		_itoa(pDoc->TaskBeg(i),c,10);
		pDC->TextOut(x1+pDoc->TaskCpu(i)*dx-40,pDoc->TaskBeg(i)*dy+y1,c);
		_itoa(pDoc->TaskEnd(i),c,10);
		pDC->TextOut(x1+pDoc->TaskCpu(i)*dx+30,pDoc->TaskEnd(i)*dy+y1-10,c);
		pDC->SetTextColor(COLORREF(0x00000000));
	}

	pDC->SelectObject(oldBrush);
	pDC->SelectObject(oldPen);
	pDC->SelectObject(oldFont);
}

void CKursView::OnCpu() 
{
	CKursDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	CCpuDialog oDlg;
	for(int i=0;i<pDoc->CpuNum();i++)	
		oDlg.AddCpu(pDoc->CpuWork(i));
	UINT ret=oDlg.DoModal();
	if(ret==IDOK)
	{
		pDoc->CopyCpu(oDlg.Cpu,oDlg.nCpu);
		pDoc->ReProc();
		Invalidate();
	}
}



void CKursView::OnEvaluate() 
{
	CKursDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	if(pDoc->Evaluate())
		ShowResults=1;
	Invalidate();
}

void CKursView::OnFault() 
{
	ShowResults=0;	
	CKursDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	pDoc->Fault();
	TekTask=pDoc->GetFirstTask();
	pDoc->SetSTask(TekTask,1);
	Invalidate();
}

void CKursView::OnFileNew() 
{
	CKursDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	pDoc->New();
	Invalidate();	
}

void CKursView::OnStateManual() 
{
	State=3;
	CWnd *pWnd = GetParent();
	CMenu *pMenu = pWnd->GetMenu();
	if(pMenu)
	{
		pMenu->CheckMenuItem(ID_STATE_NORM,MF_UNCHECKED);
		pMenu->CheckMenuItem(ID_STATE_TRACE,MF_UNCHECKED);
		pMenu->CheckMenuItem(ID_STATE_MANUAL,MF_CHECKED);
		pMenu->EnableMenuItem(ID_STEP,MF_GRAYED|MF_BYCOMMAND);
	}

	CKursDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	if(pDoc->GetEndTime()<0)
		pDoc->BeginMenual();
	Invalidate();
}

void CKursView::OnStateNorm() 
{
	State=1;
	CWnd *pWnd = GetParent();
	CMenu *pMenu = pWnd->GetMenu();
	if(pMenu)
	{
		pMenu->CheckMenuItem(ID_STATE_NORM,MF_CHECKED);
		pMenu->CheckMenuItem(ID_STATE_TRACE,MF_UNCHECKED);
		pMenu->CheckMenuItem(ID_STATE_MANUAL,MF_UNCHECKED);
		pMenu->EnableMenuItem(ID_STEP,MF_GRAYED|MF_BYCOMMAND);
	}
	Invalidate();
}

void CKursView::OnStateTrace() 
{
	State=2;
	CWnd *pWnd = GetParent();
	CMenu *pMenu = pWnd->GetMenu();
	if(pMenu)
	{
		pMenu->CheckMenuItem(ID_STATE_NORM,MF_UNCHECKED);
		pMenu->CheckMenuItem(ID_STATE_TRACE,MF_CHECKED);
		pMenu->CheckMenuItem(ID_STATE_MANUAL,MF_UNCHECKED);
		pMenu->EnableMenuItem(ID_STEP,MF_ENABLED|MF_BYCOMMAND);
	}
	CKursDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	if((TekTask=pDoc->GetFirstTask())>=0)
		pDoc->SetSTask(TekTask,1);
	Invalidate();
}

void CKursView::OnFileOpen() 
{
	CKursDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	pDoc->OpenFile();
	Invalidate();	
}

void CKursView::OnStep() 
{
	CKursDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);

	if(State==2 && pDoc->GetEndTime()>=0)
	{
		if((TekTask=pDoc->GetNextTask(TekTask))>=0)
		{
			pDoc->SetSTask(TekTask,1);
			Invalidate();
		}
	}
		
}

void CKursView::LButtonGraph(UINT nFlags, CPoint point)
{
	CKursDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
		
	if(DrawTask)
	{
		pDoc->AddTask(point,0);
		DrawTask=0;
	}
	
	int b=0;
	for(int i=0;i<pDoc->TaskNum();i++)
		if(((point.x-pDoc->TaskX(i))*(point.x-pDoc->TaskX(i))+
			(point.y-pDoc->TaskY(i))*(point.y-pDoc->TaskY(i)))<=400)
		{
			aTask=i;
			b=1;
			break;
		}
	if(!b)
		aTask=-1;
	else
	{
		oldx=pDoc->TaskX(aTask);
		oldy=pDoc->TaskY(aTask);
	}
	
	if(DrawRelation==1 && aTask>=0)
	{
		Task1=aTask;
		DrawRelation=2;
	}
	else if(DrawRelation==2 && aTask<0)
	{
		Task1=0;
		DrawRelation=0;
	}
	else if(DrawRelation==2 && aTask>=0)
	{
		
		pDoc->AddRelat(Task1,aTask,0);		
		DrawRelation=0;
	}

	b=0;
	float x1,x2,y1,y2;
	for(i=0;i<pDoc->RelatNum();i++)
	{
		x1=pDoc->RelatX1(i);
		x2=pDoc->RelatX2(i);
		y1=pDoc->RelatY1(i);
		y2=pDoc->RelatY2(i);
		
		if(int(10*((point.x-x1)/(x1-x2)))==int(10*((point.y-y1)/(y1-y2))) &&
		   PointInRect(point.x,point.y,x1,y1,x2,y2))
		{
			aRelat=i;
			b=1;
			break;
		}
	}
	if(!b)
		aRelat=-1;

	Invalidate();
}

void CKursView::LButtonProc(UINT nFlags, CPoint point)
{
	CKursDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	
	if(State!=3 || pDoc->GetEndTime()<0)
		return;

	int b=0;
	int x1,x2,y1,y2,dx=0;
	float dy;
	RECT rect;
	GetClientRect(&rect);
	x1=rect.left+70;
	y1=rect.top+30;
	x2=rect.right-70;
	y2=rect.bottom-30;
	dy=(y2-y1)/float(pDoc->GetEndTime()+1);
	if(pDoc->CpuNum()==1)
		x1=rect.right/2;
	else
		dx=100;
	
	for(int i=0;i<pDoc->TaskNum();i++)
		if(PointInRect(point.x,point.y,
						x1+pDoc->TaskCpu(i)*dx-20, y1+dy*pDoc->TaskBeg(i),
						x1+pDoc->TaskCpu(i)*dx+20, y1+dy*pDoc->TaskEnd(i)))
		{
			bTask=i;
			b=1;
			break;
		}

	int cpu=-1;
	if(!b)
	{
		for(i=0;i<pDoc->CpuNum();i++)
			if(PointInRect(point.x,point.y,x1+i*dx-20,rect.top,x1+i*dx+20,rect.bottom))
			{
				cpu=i;
				break;
			}

		if(cpu!=pDoc->TaskCpu(bTask) && cpu>=0)
			pDoc->TaskToCpu(bTask,cpu);
		
		bTask=-1;
	}
	
	Invalidate();
}

