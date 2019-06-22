#if !defined(AFX_PROPDLG_H__2FC8FBE2_FCA2_11D5_8B98_444553540000__INCLUDED_)
#define AFX_PROPDLG_H__2FC8FBE2_FCA2_11D5_8B98_444553540000__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// PropDlg.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CPropDlg dialog

class CPropDlg : public CDialog
{
// Construction
public:
	CPropDlg(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CPropDlg)
	enum { IDD = IDD_CHANGEVAL };
	CString	m_val;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CPropDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CPropDlg)
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PROPDLG_H__2FC8FBE2_FCA2_11D5_8B98_444553540000__INCLUDED_)
