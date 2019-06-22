#include "StdAfx.h"
#include ".\processbar.h"
#include "DataWrap.h"
#include "DlgProcess.h"
#include "Global.h"

BEGIN_MESSAGE_MAP(CProcessBar, CBCGPDockingControlBar)
	ON_WM_CREATE()
	ON_WM_SIZE()
	ON_COMMAND(ID_PROCESS_ADD, OnInsert)
	ON_COMMAND(ID_PROCESS_DELETE, OnDelete)
	ON_COMMAND(ID_PROCES_PROGRAM, OnViewProgram)
	ON_UPDATE_COMMAND_UI(ID_PROCESS_ADD, OnUpdateInsert)
END_MESSAGE_MAP()

CProcessBar::CProcessBar(void)
{
	Global::GetNotifyManager()->Register(Global::ON_DOCUMENT_CHANGE,Delegate(this,(Delegate::FUNC)SetDocument));
	Global::GetNotifyManager()->Register(Global::ON_PROCESS_CHANGE,Delegate(this,(Delegate::FUNC)OnChange));
}

CProcessBar::~CProcessBar(void)
{
	Global::GetNotifyManager()->Release(Global::ON_DOCUMENT_CHANGE,Delegate(this,(Delegate::FUNC)SetDocument));
	Global::GetNotifyManager()->Release(Global::ON_PROCESS_CHANGE,Delegate(this,(Delegate::FUNC)OnChange));
}

int CProcessBar::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
	if (CBCGPDockingControlBar::OnCreate(lpCreateStruct) == -1)
		return -1;

	CRect rectDummy;
	rectDummy.SetRectEmpty ();
	// Create view:
	if (!m_wndProcess.Create (rectDummy,this,1001,WS_CHILD|WS_VISIBLE))
	{
		TRACE0("Failed to create process grid\n");
		return -1;      // fail to create
	}
	m_wndProcess.SetDataModel(&ProcessDataSource(NULL));
	m_wndToolBar.Create (this, dwDefaultToolbarStyle, IDR_PROCESS);
	m_wndToolBar.LoadToolBar (IDR_PROCESS, 0, 0, TRUE /* Is locked */);

	m_wndToolBar.SetBarStyle(m_wndToolBar.GetBarStyle() |
		CBRS_TOOLTIPS | CBRS_FLYBY);
		
	m_wndToolBar.SetBarStyle (
		m_wndToolBar.GetBarStyle () & 
			~(CBRS_GRIPPER | CBRS_SIZE_DYNAMIC | CBRS_BORDER_TOP | CBRS_BORDER_BOTTOM | CBRS_BORDER_LEFT | CBRS_BORDER_RIGHT));

	m_wndToolBar.SetOwner (this);
	// All commands will be routed via this control , not via the parent frame:
	m_wndToolBar.SetRouteCommandsViaFrame (FALSE);
	// Fill view context (dummy code, don't seek here something magic :-)):
	AdjustLayout ();
	return 0;
}

void CProcessBar::AdjustLayout ()
{
	if (GetSafeHwnd () == NULL)
	{
		return;
	}

	CRect rectClient;
	GetClientRect (rectClient);

	int cyTlb = m_wndToolBar.CalcFixedLayout (FALSE, TRUE).cy;

	m_wndToolBar.SetWindowPos (NULL, rectClient.left, rectClient.top, 
								rectClient.Width (), cyTlb,
								SWP_NOACTIVATE | SWP_NOZORDER);
	m_wndProcess.SetWindowPos (NULL, rectClient.left , rectClient.top + cyTlb ,
								rectClient.Width () , rectClient.Height () - cyTlb ,
								SWP_NOACTIVATE | SWP_NOZORDER);
}
void CProcessBar::OnSize(UINT nType, int cx, int cy)
{
	CBCGPDockingControlBar::OnSize(nType, cx, cy);

	AdjustLayout();
}

void CProcessBar::OnInsert()
{
	CDlgProcess dlg(this);
	dlg.m_data.name=m_doc->GetNewProcessName();
	dlg.m_data.priority=false;
	dlg.m_data.proc_number=0;
	if(dlg.DoModal()==IDCANCEL)
		return;
	int id = m_doc->AddProcess(dlg.m_data.name,dlg.m_data.priority,dlg.m_data.proc_number);
	if(id==-1)
	{
		CString s;
		s.Format("Process with name '%s' already exist",dlg.m_data.name);
		AfxMessageBox(s,MB_OK,0);
		return;
	}
	id++;
	m_wndProcess.SetFocus();
	m_wndProcess.SetFocusCell(id,m_wndProcess.GetFixedColumnCount());
	m_wndProcess.SetSelectedRange(id,m_wndProcess.GetFixedColumnCount(),id,m_wndProcess.GetColumnCount()-1,1);
}

void CProcessBar::OnDelete()
{
	CCellRange range = m_wndProcess.GetSelectedCellRange();
	std::vector<int> del_rows;
	for(int i=range.GetMinRow();i<=range.GetMaxRow();i++)
		if(m_wndProcess.IsCellSelected(i,1))
			del_rows.push_back(i-1);
	if(!del_rows.size())
		return;
	if(IDNO==AfxMessageBox("You are to delete some process. \nIt will clean all process programs and related chanels.\nProceed?",MB_YESNO,0))
		return;
	m_doc->DeleteRows(del_rows);
	m_wndProcess.SetFocus();
	m_wndProcess.SetFocusCell(-1,-1);
	m_wndProcess.SetSelectedRange(-1,-1,-1,-1);
}

void CProcessBar::OnUpdateInsert(CCmdUI *pCmdUI)
{
	pCmdUI->Enable();
}

int CProcessBar::SetDocument(CTransputerDoc* doc)
{
	m_doc=doc;
	m_wndProcess.SetDataModel(&ProcessDataSource(doc));
	return 0;
}

int CProcessBar::OnChange(void* p)
{
	m_wndProcess.RedrawWindow();
	return 0;
}

void CProcessBar::OnViewProgram(void)
{
	GetParent()->SendMessage(WM_COMMAND,ID_PROCES_PROGRAM,NULL);
}

CString CProcessBar::GetActiveProcess(void)
{
	int id = m_wndProcess.GetFocusCell().row-1;
	if(id<0)
		return "";
	return m_doc->GetProcessName(id);
}
