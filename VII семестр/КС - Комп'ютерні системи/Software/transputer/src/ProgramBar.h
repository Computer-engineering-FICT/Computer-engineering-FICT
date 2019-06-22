#pragma once

#include "Grid/GridCtrl.h"
#include "DefToolBar.h"
#include "TransputerDoc.h"
class CProgramBar :
	public CBCGPDockingControlBar
{
public:
	CProgramBar(void);
	virtual ~CProgramBar(void);
	void AdjustLayout ();
	int SetDocument(CTransputerDoc* doc);
protected:
	CGridCtrl		m_wndProgram;
	CDefToolBar		m_wndToolBar;
	DECLARE_MESSAGE_MAP()
	CTransputerDoc* m_doc;
	CString m_process;
public:
	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
	afx_msg void OnSize(UINT nType, int cx, int cy);
	afx_msg void OnInsert();
	afx_msg void OnDelete();
	afx_msg void OnProcess();
	afx_msg void OnUpdateInsert(CCmdUI *pCmdUI);
	int OnChange(void* p);
	int UpdateProcessCombo(void*);
	void SelectProcess(CString& name);
};
