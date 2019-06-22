#if !defined(AFX_CPUDIALOG_H__DABC0182_FD21_11D5_8B98_444553540000__INCLUDED_)
#define AFX_CPUDIALOG_H__DABC0182_FD21_11D5_8B98_444553540000__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// CpuDialog.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CCpuDialog dialog

class CCpuDialog : public CDialog
{
// Construction
public:
	void CopyCpu(float *c, int nc);
	void AddCpu(float k);
	CCpuDialog(CWnd* pParent = NULL);   // standard constructor
	~CCpuDialog();

	float GetCpu(int c) { return Cpu[c]; }
	int GetCpuNum() { return nCpu; }

	int nCpu;
	float *Cpu;

// Dialog Data
	//{{AFX_DATA(CCpuDialog)
	enum { IDD = IDD_DIALOG1 };
	CButton	m_bok;
	CButton	m_bset;
	CSpinButtonCtrl	m_spin;
	CEdit	m_kCpu;
	CEdit	m_nCpu;
	CListBox	m_listCpu;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CCpuDialog)
	public:
	virtual int DoModal();
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	//}}AFX_VIRTUAL

// Implementation
protected:
	void FillList();

	// Generated message map functions
	//{{AFX_MSG(CCpuDialog)
	afx_msg void OnSelchangeList1();
	virtual BOOL OnInitDialog();
	afx_msg void OnUpdateEdit1();
	afx_msg void OnButton1();
	afx_msg void OnSetfocusEdit2();
	afx_msg void OnKillfocusEdit2();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_CPUDIALOG_H__DABC0182_FD21_11D5_8B98_444553540000__INCLUDED_)
