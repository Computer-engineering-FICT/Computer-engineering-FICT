#pragma once
#include "Resource.h"

// CDlgProcess dialog

class CDlgProcess : public CDialog
{
	DECLARE_DYNAMIC(CDlgProcess)

public:
	CDlgProcess(CWnd* pParent = NULL);   // standard constructor
	virtual ~CDlgProcess();

// Dialog Data
	enum { IDD = IDD_DLG_PROCESS };
	struct Data
	{
		CString name;
		bool priority;
		int proc_number;
	}m_data;
protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	CFont m_bold;
	DECLARE_MESSAGE_MAP()
	afx_msg HBRUSH OnCtlColor(CDC* pDC,CWnd* wnd, UINT nCtlColor);
public:
	virtual BOOL OnInitDialog();
	afx_msg void OnBnClickedOk();
	afx_msg void OnSetFocus(CWnd* pOldWnd);
};
