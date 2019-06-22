#include "StdAfx.h"
#include ".\ChanelBar.h"
#include "DataWrap.h"
#include "DlgChanel.h"
#include "Global.h"

BEGIN_MESSAGE_MAP(CChanelBar, CBCGPDockingControlBar)
	ON_WM_CREATE()
	ON_WM_SIZE()
	ON_COMMAND(ID_CHANEL_ADD, OnInsert)
	ON_COMMAND(ID_CHANEL_DELETE, OnDelete)
	ON_COMMAND(ID_CHANEL_CLEAR, OnClear)
	ON_COMMAND(ID_CHANEL_DEFAULT, OnDefault)
	ON_UPDATE_COMMAND_UI(ID_PROCESS_ADD, OnUpdateInsert)
END_MESSAGE_MAP()

CChanelBar::CChanelBar(void)
{
	Global::GetNotifyManager()->Register(Global::ON_DOCUMENT_CHANGE,Delegate(this,(Delegate::FUNC)SetDocument));
	Global::GetNotifyManager()->Register(Global::ON_CHANEL_CHANGE,Delegate(this,(Delegate::FUNC)OnChange));
}

CChanelBar::~CChanelBar(void)
{
	Global::GetNotifyManager()->Release(Global::ON_DOCUMENT_CHANGE,Delegate(this,(Delegate::FUNC)SetDocument));
	Global::GetNotifyManager()->Release(Global::ON_CHANEL_CHANGE,Delegate(this,(Delegate::FUNC)OnChange));
}

int CChanelBar::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
	if (CBCGPDockingControlBar::OnCreate(lpCreateStruct) == -1)
		return -1;

	CRect rectDummy;
	rectDummy.SetRectEmpty ();
	// Create view:
	if (!m_wndChanel.Create (rectDummy,this,1002,WS_CHILD|WS_VISIBLE))
	{
		TRACE0("Failed to create process grid\n");
		return -1;      // fail to create
	}
	m_wndChanel.SetDataModel(&ChanelDataSource(NULL));
	m_wndToolBar.Create (this, dwDefaultToolbarStyle, IDR_CHANEL);
	m_wndToolBar.LoadToolBar (IDR_CHANEL, 0, 0, TRUE /* Is locked */);

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

void CChanelBar::AdjustLayout ()
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
	m_wndChanel.SetWindowPos (NULL, rectClient.left , rectClient.top + cyTlb ,
								rectClient.Width () , rectClient.Height () - cyTlb ,
								SWP_NOACTIVATE | SWP_NOZORDER);
}
void CChanelBar::OnSize(UINT nType, int cx, int cy)
{
	CBCGPDockingControlBar::OnSize(nType, cx, cy);

	AdjustLayout();
}

void CChanelBar::OnInsert()
{
	CDlgChanel dlg(this);
	dlg.m_data.name=m_doc->GetNewChanelName();
	if(!m_doc)
		return;
	dlg.m_data.m_model = m_doc->GetTransputerModel();
	if(dlg.DoModal()==IDCANCEL)
		return;
	int id = m_doc->AddChanel(dlg.m_data.name,dlg.m_data.proc1,dlg.m_data.proc2);
	if(id==-1)
	{
		CString s;
		s.Format("Chanel with name '%s' already exist",dlg.m_data.name);
		AfxMessageBox(s,MB_OK,0);
		return;
	}
	id++;
	m_wndChanel.SetFocus();
	m_wndChanel.SetFocusCell(id,m_wndChanel.GetFixedColumnCount());
	m_wndChanel.SetSelectedRange(id,m_wndChanel.GetFixedColumnCount(),id,m_wndChanel.GetColumnCount()-1,1);
}

void CChanelBar::OnDelete()
{
	CCellRange range = m_wndChanel.GetSelectedCellRange();
	std::vector<int> del_rows;
	for(int i=range.GetMinRow();i<=range.GetMaxRow();i++)
		if(m_wndChanel.IsCellSelected(i,1))
			del_rows.push_back(i-1);
	if(!del_rows.size())
		return;
	m_doc->DeleteChanels(del_rows);
	m_wndChanel.SetFocus();
	m_wndChanel.SetFocusCell(-1,-1);
	m_wndChanel.SetSelectedRange(-1,-1,-1,-1);
}

void CChanelBar::OnUpdateInsert(CCmdUI *pCmdUI)
{
	pCmdUI->Enable();
}

int CChanelBar::SetDocument(CTransputerDoc* doc)
{
	m_doc=doc;
	m_wndChanel.SetDataModel(&ChanelDataSource(m_doc));
	return 0;
}

int CChanelBar::OnChange(void* p)
{
	m_wndChanel.RedrawWindow();
	return 0;
}

void CChanelBar::OnClear()
{
	if(!m_doc)
		return;
	m_doc->ClearAllRoutes();
	m_wndChanel.RedrawWindow();
}

void CChanelBar::OnDefault()
{
	if(!m_doc)
		return;
	m_doc->DoDefaultRouting();
	m_wndChanel.RedrawWindow();
}
