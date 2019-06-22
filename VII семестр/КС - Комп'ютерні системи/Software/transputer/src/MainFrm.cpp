#include "stdafx.h"
#include "DataWrap.h"
#include "Transputer.h"
#include "MainFrm.h"
#include ".\mainfrm.h"
#include "RegPath.h"
#include "DlgTopology.h"
#include <direct.h>
#ifdef _DEBUG
#define new DEBUG_NEW
#endif
IMPLEMENT_DYNCREATE(CMainFrame, CBCGPFrameWnd)
BEGIN_MESSAGE_MAP(CMainFrame, CBCGPFrameWnd)
	ON_WM_CREATE()
	ON_REGISTERED_MESSAGE(BCGM_TOOLBARMENU, OnToolbarContextMenu)
	ON_COMMAND(ID_VIEW_PROCESS, OnProcessList)
	ON_COMMAND(ID_VIEW_CHANEL, OnViewChanel)
	ON_COMMAND(ID_VIEW_PROGRAM, OnProgram)
	ON_COMMAND(ID_VIEW_STATE, OnViewState)
	ON_COMMAND(ID_FINISHED, OnFinished)
	ON_COMMAND(ID_DEADLOCK, OnDeadlock)
	ON_COMMAND(ID_STEP_DONE, OnStepDone)
	ON_COMMAND(ID_PROCES_PROGRAM, OnViewProgram)
	ON_COMMAND(ID_DEBUG_SCALE,OnDebugScale)
	ON_COMMAND(ID_SYSTEM, OnSystem)
	ON_COMMAND(ID_VIEW_TOOLBARS, OnViewToolbars)
	ON_UPDATE_COMMAND_UI(ID_VIEW_TOOLBARS, OnUpdateViewToolbars)
	ON_UPDATE_COMMAND_UI(ID_TOOLBARS_VIEWTOOLBAR, OnUpdateToolbarsViewtoolbar)
	ON_COMMAND(ID_TOOLBARS_VIEWTOOLBAR, OnToolbarsViewtoolbar)
	ON_UPDATE_COMMAND_UI(ID_TOOLBARS_DEBUGTOOLBAR, OnUpdateToolbarsDebugtoolbar)
	ON_COMMAND(ID_TOOLBARS_DEBUGTOOLBAR, OnToolbarsDebugtoolbar)
	ON_COMMAND(ID_HELP_HELP, OnHelpHelp)
END_MESSAGE_MAP()
static UINT indicators[] =
{
	ID_SEPARATOR,
	ID_INDICATOR_CAPS,
	ID_INDICATOR_NUM,
	ID_INDICATOR_SCRL,
};

CMainFrame::CMainFrame()//:m_process(&ProcessDataSource(NULL))
{
	Global::GetNotifyManager()->Register(Global::ON_SIMULATION_STATE_CHANGED,Delegate(this,(Delegate::FUNC)OnSimChange));
	Global::GetNotifyManager()->Register(Global::ON_DOCUMENT_CHANGE,Delegate(this,(Delegate::FUNC)OnDocChange));
}

CMainFrame::~CMainFrame()
{
	Global::GetNotifyManager()->Release(Global::ON_SIMULATION_STATE_CHANGED,Delegate(this,(Delegate::FUNC)OnSimChange));
	Global::GetNotifyManager()->Release(Global::ON_DOCUMENT_CHANGE,Delegate(this,(Delegate::FUNC)OnDocChange));
}

int CMainFrame::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
	if (CBCGPFrameWnd::OnCreate(lpCreateStruct) == -1)
		return -1;
	if (!m_wndMenuBar.Create (this))
	{
		TRACE0("Failed to create menubar\n");
		return -1;
	}
	m_wndMenuBar.SetBarStyle(m_wndMenuBar.GetBarStyle() | CBRS_SIZE_DYNAMIC);
	CClientDC dc (this);
	BOOL bIsHighColor = dc.GetDeviceCaps (BITSPIXEL) > 8;
	UINT uiToolbarHotID = bIsHighColor ? IDB_TOOLBAR256 : 0;
	UINT uiToolbarColdID = bIsHighColor ? IDB_TOOLBARCOLD256 : 0;
	if (!m_wndToolBar.CreateEx(this, TBSTYLE_FLAT, WS_CHILD | WS_VISIBLE | CBRS_TOP
		| CBRS_GRIPPER | CBRS_TOOLTIPS | CBRS_FLYBY | CBRS_SIZE_DYNAMIC,CRect(1,1,1,1),IDR_MAIN) ||
		!m_wndToolBar.LoadToolBar(IDR_MAIN))
	{
		TRACE0("Failed to create toolbar\n");
		return -1;      // fail to create
	}
	if (!m_wndViewToolBar.CreateEx(this, TBSTYLE_FLAT, WS_CHILD | WS_VISIBLE | CBRS_TOP
		| CBRS_GRIPPER | CBRS_TOOLTIPS | CBRS_FLYBY | CBRS_SIZE_DYNAMIC,CRect(1,1,1,1),IDR_VIEW) ||
		!m_wndViewToolBar.LoadToolBar(IDR_VIEW))
	{
		TRACE0("Failed to create toolbar\n");
		return -1;      // fail to create
	}
	if (!m_wndDebugToolBar.CreateEx(this, TBSTYLE_FLAT, WS_CHILD | WS_VISIBLE | CBRS_TOP
		| CBRS_GRIPPER | CBRS_TOOLTIPS | CBRS_FLYBY | CBRS_SIZE_DYNAMIC,CRect(1,1,1,1),IDR_DEBUG) ||
		!m_wndDebugToolBar.LoadToolBar(IDR_DEBUG))
	{
		TRACE0("Failed to create toolbar\n");
		return -1;      // fail to create
	}

	if (!m_wndStatusBar.Create(this) ||
		!m_wndStatusBar.SetIndicators(indicators,
		  sizeof(indicators)/sizeof(UINT)))
	{
		TRACE0("Failed to create status bar\n");
		return -1;      // fail to create
	}
	CString strMainToolbarTitle;
	strMainToolbarTitle.LoadString (IDB_TOOLBAR256);
	m_wndToolBar.SetWindowText (strMainToolbarTitle);
	strMainToolbarTitle.LoadString (IDS_VIEW_TOOLBAR);
	m_wndViewToolBar.SetWindowText (strMainToolbarTitle);
	strMainToolbarTitle.LoadString (IDS_DEBUG_TOOLBAR);
	m_wndViewToolBar.SetWindowText (strMainToolbarTitle);

	CBCGPToolbarEditBoxButton edTicks(ID_DEBUG_TICKS, 
		CImageHash::GetImageOfCommand (ID_DEBUG_TICKS, FALSE),ES_AUTOHSCROLL|ES_READONLY|ES_CENTER,50);
	m_wndDebugToolBar.ReplaceButton(ID_DEBUG_TICKS,edTicks);

	CBCGPToolbarComboBoxButton cmbSystem(ID_DEBUG_SCALE, 
		CImageHash::GetImageOfCommand (ID_DEBUG_SCALE, FALSE),CBS_DROPDOWN,60);
	cmbSystem.AddItem("1");
	cmbSystem.AddItem("25");
	cmbSystem.AddItem("50");
	cmbSystem.AddItem("75");
	cmbSystem.AddItem("100");
	m_wndDebugToolBar.ReplaceButton(ID_DEBUG_SCALE,cmbSystem);

	m_wndMenuBar.EnableDocking(CBRS_ALIGN_ANY);
	m_wndToolBar.EnableDocking(CBRS_ALIGN_ANY);
	m_wndViewToolBar.EnableDocking(CBRS_ALIGN_ANY);
	m_wndDebugToolBar.EnableDocking(CBRS_ALIGN_ANY);

	EnableDocking(CBRS_ALIGN_ANY);
	EnableAutoHideBars(CBRS_ALIGN_ANY);
	
	DockControlBar(&m_wndMenuBar);
	DockControlBar(&m_wndToolBar);
	DockControlBar(&m_wndViewToolBar);
	DockControlBar(&m_wndDebugToolBar);
	DockControlBarLeftOf(&m_wndViewToolBar,&m_wndDebugToolBar);
	DockControlBarLeftOf(&m_wndToolBar,&m_wndViewToolBar);

	m_processbar.Create("Process List",this,CSize(150,400),true,1001,WS_CHILD|CBRS_LEFT);
	m_processbar.EnableDocking(CBRS_ALIGN_ANY);

	m_chanelbar.Create("Chanel List",this,CSize(150,400),true,1002,WS_CHILD|CBRS_LEFT);
	m_chanelbar.EnableDocking(CBRS_ALIGN_ANY);

	m_programbar.Create("Program",this,CSize(250,400),true,1003,WS_CHILD|CBRS_RIGHT);
	m_programbar.EnableDocking(CBRS_ALIGN_ANY);

	m_statebar.Create("Process State",this,CSize(300,200),true,1004,WS_CHILD|CBRS_BOTTOM);
	m_statebar.EnableDocking(CBRS_ALIGN_ANY);

	DockControlBar(&m_processbar);
	DockControlBar(&m_chanelbar);
	DockControlBar(&m_programbar);
	DockControlBar(&m_statebar);

	return 0;
}

BOOL CMainFrame::PreCreateWindow(CREATESTRUCT& cs)
{
	if( !CBCGPFrameWnd::PreCreateWindow(cs) )
		return FALSE;
	return TRUE;
}

#ifdef _DEBUG
void CMainFrame::AssertValid() const
{
	CBCGPFrameWnd::AssertValid();
}

void CMainFrame::Dump(CDumpContext& dc) const
{
	CBCGPFrameWnd::Dump(dc);
}
#endif //_DEBUG

LRESULT CMainFrame::OnToolbarContextMenu(WPARAM,LPARAM lp)
{
	return 0;
	CPoint point (BCG_GET_X_LPARAM(lp), BCG_GET_Y_LPARAM(lp));

	CMenu menu;
	VERIFY(menu.LoadMenu (IDR_POPUP_TOOLBAR));

	CMenu* pPopup = menu.GetSubMenu(0);
	ASSERT(pPopup != NULL);

	CBCGPPopupMenu* pPopupMenu = new CBCGPPopupMenu;
	pPopupMenu->Create (this, point.x, point.y, pPopup->Detach ());

	return 0;
}

BOOL CMainFrame::OnShowPopupMenu (CBCGPPopupMenu* pMenuPopup)
{
/*    CBCGPFrameWnd::OnShowPopupMenu (pMenuPopup);
    if (pMenuPopup != NULL &&
		pMenuPopup->GetMenuBar ()->CommandToIndex (ID_VIEW_TOOLBARS) >= 0)
    {
		if (CBCGPToolBar::IsCustomizeMode ())
		{
			return FALSE;
		}
		pMenuPopup->RemoveAllItems ();
		CMenu menu;
		VERIFY(menu.LoadMenu (IDR_POPUP_TOOLBAR));
		CMenu* pPopup = menu.GetSubMenu(0);
		ASSERT(pPopup != NULL);
		pMenuPopup->GetMenuBar ()->ImportFromMenu (*pPopup, TRUE);
    }*/
	return TRUE;
}

void CMainFrame::OnProcessList()
{
	ShowControlBar (&m_processbar,
					!(m_processbar.GetStyle () & WS_VISIBLE),
					FALSE, TRUE);
	RecalcLayout ();
}

void CMainFrame::OnViewChanel()
{
	ShowControlBar (&m_chanelbar,
					!(m_chanelbar.GetStyle () & WS_VISIBLE),
					FALSE, TRUE);
	RecalcLayout ();
}

void CMainFrame::OnProgram()
{
	ShowControlBar (&m_programbar,
					!(m_programbar.GetStyle () & WS_VISIBLE),
					FALSE, TRUE);
	RecalcLayout ();
}

void CMainFrame::OnViewState()
{
	ShowControlBar (&m_statebar,
					!(m_statebar.GetStyle () & WS_VISIBLE),
					FALSE, TRUE);
	RecalcLayout ();
}

void CMainFrame::OnViewProgram(void)
{
	CString process = m_processbar.GetActiveProcess();
	if(process.IsEmpty())
		return;
	m_programbar.SelectProcess(process);
	ShowControlBar (&m_programbar,
					TRUE,
					FALSE, TRUE);
	RecalcLayout ();
}

void CMainFrame::OnDeadlock()
{
	Global::GetNotifyManager()->Raise(Global::ON_SIMULATION_STATE_CHANGED,GetActiveDocument());
	CString s;
	s ="Deadlock detected";
	AfxMessageBox(s);
}

void CMainFrame::OnFinished()
{
	Global::GetNotifyManager()->Raise(Global::ON_SIMULATION_STATE_CHANGED,GetActiveDocument());
	CString s;
	s.Format("Simulation successfully finished in %s clocks",((CTransputerDoc*)GetActiveDocument())->GetTickCount(true));
	AfxMessageBox(s);
}

void CMainFrame::OnStepDone()
{
	Global::GetNotifyManager()->Raise(Global::ON_SIMULATION_STATE_CHANGED,GetActiveDocument());
}

int CMainFrame::OnSimChange(void* p)
{
	CTransputerDoc* doc = (CTransputerDoc*)GetActiveDocument();
	if(!doc)
		return 0;
	CBCGPToolbarEditBoxButton* edTicks= (CBCGPToolbarEditBoxButton*)m_wndDebugToolBar.GetButton(m_wndDebugToolBar.CommandToIndex(ID_DEBUG_TICKS));
	edTicks->GetEditBox()->SetWindowText(doc->GetTickCount());
	edTicks->GetEditBox()->SetReadOnly();
	m_wndDebugToolBar.RedrawWindow();
	return 0;
}

void CMainFrame::OnDebugScale()
{
	CBCGPToolbarComboBoxButton* cmbScale = (CBCGPToolbarComboBoxButton*)m_wndDebugToolBar.GetButton(m_wndDebugToolBar.CommandToIndex(ID_DEBUG_SCALE));
	CString s;
	cmbScale->GetComboBox()->GetWindowText(s);
	int scale;char c;
	if(sscanf(s.GetString(),"%d%c",&scale,&c)==1)
	{
		if(scale>0 && scale<=100)
		{
			Global::GetRegistry("Settings")->Write("Scale",scale);
			CTransputerDoc* doc = (CTransputerDoc*)GetActiveDocument();
			if(!doc)
				return;
			doc->SetScale(scale);
			return;
		}
	}
	scale = 50;
	CTransputerDoc* doc = (CTransputerDoc*)GetActiveDocument();
	if(doc)
		scale = doc->GetScale();
	s.Format("%d",scale);
	cmbScale->SetText(s);
}

CDocument* CMainFrame::GetActiveDocument()
{
	CView* view = GetActiveView();
	if(!view)
		return 0;
	return view->GetDocument();
}

void CMainFrame::OnDocChange(void* p)
{
	CTransputerDoc* doc((CTransputerDoc*)p);
	if(!doc)
		return;
	CString s;
	s.Format("%d",doc->GetScale());
	CBCGPToolbarComboBoxButton* cmbScale = (CBCGPToolbarComboBoxButton*)m_wndDebugToolBar.GetButton(m_wndDebugToolBar.CommandToIndex(ID_DEBUG_SCALE));
	cmbScale->SetText(s);	
	ITransputerParam* param = doc->GetTopologyParam();
	param->GetValues(m_param);
	m_topology_type = param->GetTopology();
}

void CMainFrame::OnSystem()
{
	CDlgTopology dlg(this);
	dlg.m_data.param = m_param;
	dlg.m_data.topology_type = m_topology_type;
	if(dlg.DoModal()!=IDOK)
		return;
	m_topology_type = dlg.m_data.topology_type;
	m_param = dlg.m_data.param;
	CTransputerDoc* doc = (CTransputerDoc*)GetActiveDocument();
	doc->SetTopologyParam(m_topology_type,m_param);
	CBCGPRegistry* reg = Global::GetRegistry("Settings");
	reg->Write("Topology",m_topology_type);
	reg->DeleteKey(BCGPGetRegPath("Settings")+"\\Topology param");
	reg->CreateKey("Topology param");
	for(int i=0;i<(int)m_param.size();i++)
	{
		reg->Write(m_param[i].first.c_str(),m_param[i].second.c_str());
	}
}

void CMainFrame::OnViewToolbars()
{
	ShowControlBar (&m_wndToolBar,
					!(m_wndToolBar.GetStyle () & WS_VISIBLE),
					FALSE, TRUE);
	RecalcLayout ();
}


void CMainFrame::OnUpdateViewToolbars(CCmdUI *pCmdUI)
{
	pCmdUI->SetCheck(m_wndToolBar.GetStyle () & WS_VISIBLE);
}

void CMainFrame::OnUpdateToolbarsViewtoolbar(CCmdUI *pCmdUI)
{
	pCmdUI->SetCheck(m_wndViewToolBar.GetStyle () & WS_VISIBLE);
}

void CMainFrame::OnToolbarsViewtoolbar()
{
	ShowControlBar (&m_wndViewToolBar,
					!(m_wndViewToolBar.GetStyle () & WS_VISIBLE),
					FALSE, TRUE);
	RecalcLayout ();
}

void CMainFrame::OnUpdateToolbarsDebugtoolbar(CCmdUI *pCmdUI)
{
	pCmdUI->SetCheck(m_wndDebugToolBar.GetStyle () & WS_VISIBLE);
}

void CMainFrame::OnToolbarsDebugtoolbar()
{
	ShowControlBar (&m_wndDebugToolBar,
					!(m_wndDebugToolBar.GetStyle () & WS_VISIBLE),
					FALSE, TRUE);
	RecalcLayout ();
}

void CMainFrame::OnHelpHelp()
{
	HINSTANCE a = ShellExecute(this->m_hWnd, "open", Global::GetWorkDir()+"\\doc\\index.html", NULL, NULL, SW_SHOWNORMAL);
}
