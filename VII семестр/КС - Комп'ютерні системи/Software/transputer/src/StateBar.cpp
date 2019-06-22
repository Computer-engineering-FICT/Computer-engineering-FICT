#include "StdAfx.h"
#include ".\statebar.h"
#include "DataWrap.h"
#include "DlgProcess.h"
#include "Global.h"

BEGIN_MESSAGE_MAP(CStateBar, CBCGPDockingControlBar)
	ON_WM_CREATE()
	ON_WM_SIZE()
END_MESSAGE_MAP()

CStateBar::CStateBar(void)
{
	Global::GetNotifyManager()->Register(Global::ON_DOCUMENT_CHANGE,Delegate(this,(Delegate::FUNC)SetDocument));
	Global::GetNotifyManager()->Register(Global::ON_PROCESS_CHANGE,Delegate(this,(Delegate::FUNC)OnChange));
	Global::GetNotifyManager()->Register(Global::ON_SIMULATION_STATE_CHANGED,Delegate(this,(Delegate::FUNC)OnChange));
}

CStateBar::~CStateBar(void)
{
	Global::GetNotifyManager()->Release(Global::ON_DOCUMENT_CHANGE,Delegate(this,(Delegate::FUNC)SetDocument));
	Global::GetNotifyManager()->Release(Global::ON_PROCESS_CHANGE,Delegate(this,(Delegate::FUNC)OnChange));
	Global::GetNotifyManager()->Release(Global::ON_SIMULATION_STATE_CHANGED,Delegate(this,(Delegate::FUNC)OnChange));
}

int CStateBar::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
	if (CBCGPDockingControlBar::OnCreate(lpCreateStruct) == -1)
		return -1;
	CRect rectDummy;
	rectDummy.SetRectEmpty ();
	// Create view:
	if (!m_wndState.Create(rectDummy,this,1004,WS_CHILD|WS_VISIBLE))
	{
		TRACE0("Failed to create process grid\n");
		return -1;      // fail to create
	}
	m_wndState.SetDataModel(&StateDataSource(NULL));
	AdjustLayout ();
	return 0;
}

void CStateBar::AdjustLayout()
{
	if (GetSafeHwnd () == NULL)
	{
		return;
	}
	CRect rectClient;
	GetClientRect (rectClient);
	m_wndState.SetWindowPos(NULL, -1, -1, 
								rectClient.Width(), rectClient.Height(),
								SWP_NOACTIVATE | SWP_NOZORDER);
}
void CStateBar::OnSize(UINT nType, int cx, int cy)
{
	CBCGPDockingControlBar::OnSize(nType, cx, cy);

	AdjustLayout();
}

int CStateBar::SetDocument(CTransputerDoc* doc)
{
	m_doc=doc;
	m_wndState.SetDataModel(&StateDataSource(m_doc));
	m_wndState.RedrawWindow();
	return 0;
}

int CStateBar::OnChange(void* p)
{
	m_wndState.RedrawWindow();
	return 0;
}

