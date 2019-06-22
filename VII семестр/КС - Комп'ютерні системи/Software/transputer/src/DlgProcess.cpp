// DlgProcess.cpp : implementation file
//

#include "stdafx.h"
#include "Transputer.h"
#include "DlgProcess.h"
#include ".\dlgprocess.h"


// CDlgProcess dialog

IMPLEMENT_DYNAMIC(CDlgProcess, CDialog)
CDlgProcess::CDlgProcess(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgProcess::IDD, pParent)
{
}

CDlgProcess::~CDlgProcess()
{
}

void CDlgProcess::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(CDlgProcess, CDialog)
	ON_WM_CTLCOLOR()
	ON_BN_CLICKED(IDOK, OnBnClickedOk)
	ON_WM_SETFOCUS()
END_MESSAGE_MAP()


// CDlgProcess message handlers
HBRUSH CDlgProcess::OnCtlColor(CDC* pDC,CWnd* wnd, UINT nCtlColor) 
{
	HBRUSH hbr = CDialog::OnCtlColor(pDC,wnd,nCtlColor);
	if(nCtlColor!=CTLCOLOR_STATIC)
		return hbr;
	if(wnd->GetDlgCtrlID()==IDC_ST_HEAD||wnd->GetDlgCtrlID()==IDC_ST_DESC)
	{
		pDC->SetBkMode(TRANSPARENT);
		hbr = (HBRUSH)GetStockObject(WHITE_BRUSH);
	}
	return hbr;
}

BOOL CDlgProcess::OnInitDialog()
{
	CDialog::OnInitDialog();

	LOGFONT lf;
	GetFont()->GetLogFont(&lf);
	lf.lfWeight = FW_BOLD;
	m_bold.CreateFontIndirect(&lf);
	GetDlgItem(IDC_ST_HEAD)->SetFont(&m_bold);
	GetDlgItem(IDC_ED_NAME)->SetWindowText(m_data.name);
	((CComboBox*)GetDlgItem(IDC_CMB_PRIORITY))->SetCurSel(m_data.priority?1:0);
	CString s;
	s.Format("%d",m_data.proc_number);
	GetDlgItem(IDC_ED_PROCNUM)->SetWindowText(s);
	return TRUE;  // return TRUE unless you set the focus to a control
	// EXCEPTION: OCX Property Pages should return FALSE
}


void CDlgProcess::OnBnClickedOk()
{
	GetDlgItem(IDC_ED_NAME)->GetWindowText(m_data.name);
	if(m_data.name.IsEmpty())
	{
		AfxMessageBox("Process name cannot be empty");
		return;
	}
	CString s;
	GetDlgItem(IDC_ED_PROCNUM)->GetWindowText(s);
	char c;
	if(sscanf(s.GetString(),"%d%c",&m_data.proc_number,&c)!=1)
	{
		AfxMessageBox("You should enter processor number");
		return;
	}
	int id = ((CComboBox*)GetDlgItem(IDC_CMB_PRIORITY))->GetCurSel();
	m_data.priority = id==0?0:1;
	OnOK();
}

void CDlgProcess::OnSetFocus(CWnd* pOldWnd)
{
	CDialog::OnSetFocus(pOldWnd);
	GetDlgItem(IDC_ED_NAME)->SetFocus();

	// TODO: Add your message handler code here
}
