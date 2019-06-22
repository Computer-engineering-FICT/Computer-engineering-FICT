// TransputerView.cpp : implementation of the CTransputerView class
//

#include "stdafx.h"
#include "Transputer.h"

#include "TransputerDoc.h"
#include "TransputerView.h"
#include ".\transputerview.h"
#include "GraphObj.h"
#include "grid/MemDC.h"
#include "Global.h"
#include "ITransputerModel.h"
#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CTransputerView

IMPLEMENT_DYNCREATE(CTransputerView, CScrollView)

BEGIN_MESSAGE_MAP(CTransputerView, CScrollView)
	ON_WM_CREATE()
	ON_WM_ERASEBKGND()
END_MESSAGE_MAP()

// CTransputerView construction/destruction

CTransputerView::CTransputerView()
{
	Global::GetNotifyManager()->Register(Global::ON_SIMULATION_STATE_CHANGED,Delegate(this,(Delegate::FUNC)OnChange));
}

CTransputerView::~CTransputerView()
{
	Global::GetNotifyManager()->Release(Global::ON_SIMULATION_STATE_CHANGED,Delegate(this,(Delegate::FUNC)OnChange));
}

BOOL CTransputerView::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: Modify the Window class or styles here by modifying
	//  the CREATESTRUCT cs

	return CView::PreCreateWindow(cs);
}

// CTransputerView drawing

void CTransputerView::OnDraw(CDC* pDC)
{
	CMemDC dc(pDC);
	CTransputerDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	ITransputer* obj = CreateTransputerObj((TOPOLOGY_TYPE)pDoc->GetTopologyParam()->GetTopology());
	ITransputerView* view = obj->CreateTransputerView(pDoc->GetTransputerModel());
	delete obj;
	view->SetScale(pDoc->GetScale());
	SetScrollSizes(MM_TEXT, view->GetPlotSize());
	view->Draw(&dc);
	delete view;
}


// CTransputerView diagnostics

#ifdef _DEBUG
void CTransputerView::AssertValid() const
{
	CScrollView::AssertValid();
}

void CTransputerView::Dump(CDumpContext& dc) const
{
	CScrollView::Dump(dc);
}

CTransputerDoc* CTransputerView::GetDocument() const // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CTransputerDoc)));
	return (CTransputerDoc*)m_pDocument;
}
#endif //_DEBUG


// CTransputerView message handlers

int CTransputerView::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
	if (CScrollView::OnCreate(lpCreateStruct) == -1)
		return -1;
	CTransputerObj trans(NULL);
	SetScaleToFitSize(trans.GetPlotSize());
	return 0;
}

int CTransputerView::OnChange(void* p)
{
	RedrawWindow();
	return 0;
}


BOOL CTransputerView::OnEraseBkgnd(CDC* pDC)
{
	// TODO: Add your message handler code here and/or call default

	return false;
}
