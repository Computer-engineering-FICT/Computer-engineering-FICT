#pragma once

#include "Grid/GridCtrl.h"
#include "DefToolBar.h"
#include "TransputerDoc.h"
class CStateBar :
	public CBCGPDockingControlBar
{
public:
	CStateBar(void);
	virtual ~CStateBar(void);
	void AdjustLayout ();
	int SetDocument(CTransputerDoc* doc);
protected:
	CGridCtrl		m_wndState;
	DECLARE_MESSAGE_MAP()
	CTransputerDoc* m_doc;
public:
	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
	afx_msg void OnSize(UINT nType, int cx, int cy);
	int OnChange(void* p);
};
