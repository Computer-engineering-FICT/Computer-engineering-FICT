#pragma once
#include "resource.h"

// CDlgChanel dialog
#include "TransputerModel.h"
class CDlgChanel : public CDialog
{
	DECLARE_DYNAMIC(CDlgChanel)

public:
	struct Data
	{
		CString name;
		CString proc1;
		CString proc2;
		TransputerModel* m_model;
	}m_data;
	CDlgChanel(CWnd* pParent = NULL);   // standard constructor
	virtual ~CDlgChanel();

// Dialog Data
	enum { IDD = IDD_DLG_CHANEL };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	CFont m_bold;
	DECLARE_MESSAGE_MAP()
public:
	virtual BOOL OnInitDialog();
	afx_msg HBRUSH OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor);
	afx_msg void OnSetFocus(CWnd* pOldWnd);
protected:
	virtual void OnOK();
public:
	afx_msg void OnBnClickedOk();
};
