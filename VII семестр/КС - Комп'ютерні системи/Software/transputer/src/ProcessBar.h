#pragma once

#include "Grid/GridCtrl.h"
#include "DefToolBar.h"
#include "TransputerDoc.h"
class CProcessBar :
	public CBCGPDockingControlBar
{
public:
	CProcessBar(void);
	virtual ~CProcessBar(void);
	void AdjustLayout ();
	int SetDocument(CTransputerDoc* doc);
protected:
	CGridCtrl			m_wndProcess;
	CDefToolBar		m_wndToolBar;
	DECLARE_MESSAGE_MAP()
	CTransputerDoc* m_doc;
public:
	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
	afx_msg void OnSize(UINT nType, int cx, int cy);
	afx_msg void OnInsert();
	afx_msg void OnDelete();
	afx_msg void OnUpdateInsert(CCmdUI *pCmdUI);
	int OnChange(void* p);
	afx_msg void OnViewProgram(void);
	CString GetActiveProcess(void);
};
