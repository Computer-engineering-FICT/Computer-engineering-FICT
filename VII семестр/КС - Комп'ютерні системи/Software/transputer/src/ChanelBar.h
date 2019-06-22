#pragma once

#include "Grid/GridCtrl.h"
#include "DefToolBar.h"
#include "TransputerDoc.h"
class CChanelBar :
	public CBCGPDockingControlBar
{
public:
	CChanelBar(void);
	virtual ~CChanelBar(void);
	void AdjustLayout ();
	int SetDocument(CTransputerDoc* doc);
protected:
	CGridCtrl		m_wndChanel;
	CDefToolBar		m_wndToolBar;
	DECLARE_MESSAGE_MAP()
	CTransputerDoc* m_doc;
public:
	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
	afx_msg void OnSize(UINT nType, int cx, int cy);
	afx_msg void OnInsert();
	afx_msg void OnDelete();
	afx_msg void OnClear();
	afx_msg void OnDefault();
	afx_msg void OnUpdateInsert(CCmdUI *pCmdUI);
	int OnChange(void* p);
};
