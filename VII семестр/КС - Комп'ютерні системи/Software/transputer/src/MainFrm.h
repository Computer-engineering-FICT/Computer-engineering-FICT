#pragma once
#include "EditListCtrl.h"
#include "ProcessBar.h"
#include "ChanelBar.h"
#include "ProgramBar.h"
#include "StateBar.h"
#include "ITransputerModel.h"

class CMainFrame : public CBCGPFrameWnd
{
protected: 
	CMainFrame();
	DECLARE_DYNCREATE(CMainFrame)
public:
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	virtual ~CMainFrame();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:  
	CBCGPMenuBar	m_wndMenuBar;
	CBCGPStatusBar  m_wndStatusBar;
	CBCGPToolBar    m_wndToolBar,m_wndViewToolBar,m_wndDebugToolBar;
	CProcessBar m_processbar;
	CChanelBar m_chanelbar;
	CProgramBar m_programbar;
	CStateBar m_statebar;
	ITransputerParam::Dictionary m_param;
	int m_topology_type;
protected:
	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
	afx_msg LRESULT OnToolbarContextMenu(WPARAM,LPARAM);
	DECLARE_MESSAGE_MAP()
	virtual BOOL OnShowPopupMenu (CBCGPPopupMenu* pMenuPopup);
public:
	afx_msg void OnFinished();
	afx_msg void OnDeadlock();
	afx_msg void OnStepDone();
	afx_msg void OnProcessList();
	afx_msg void OnViewChanel();
	afx_msg void OnProgram();
	afx_msg void OnViewState();
	afx_msg void OnViewProgram(void);
	afx_msg void OnDebugScale(void);
	int OnSimChange(void* p);
	CDocument* GetActiveDocument();
	void OnDocChange(void* p);
	afx_msg void OnSystem();
	afx_msg void OnViewToolbars();
	afx_msg void OnUpdateViewToolbars(CCmdUI *pCmdUI);
	afx_msg void OnUpdateToolbarsViewtoolbar(CCmdUI *pCmdUI);
	afx_msg void OnToolbarsViewtoolbar();
	afx_msg void OnUpdateToolbarsDebugtoolbar(CCmdUI *pCmdUI);
	afx_msg void OnToolbarsDebugtoolbar();
	afx_msg void OnHelpHelp();
};


