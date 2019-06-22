// DlgChanel.cpp : implementation file
//

#include "stdafx.h"
#include "Transputer.h"
#include "DlgChanel.h"
#include ".\dlgchanel.h"


// CDlgChanel dialog

IMPLEMENT_DYNAMIC(CDlgChanel, CDialog)
CDlgChanel::CDlgChanel(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgChanel::IDD, pParent)
{
}

CDlgChanel::~CDlgChanel()
{
}

void CDlgChanel::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(CDlgChanel, CDialog)
	ON_WM_CTLCOLOR()
	ON_WM_SETFOCUS()
	ON_BN_CLICKED(IDOK, OnBnClickedOk)
END_MESSAGE_MAP()


// CDlgChanel message handlers

BOOL CDlgChanel::OnInitDialog()
{
	CDialog::OnInitDialog();

	LOGFONT lf;
	GetFont()->GetLogFont(&lf);
	lf.lfWeight = FW_BOLD;
	m_bold.CreateFontIndirect(&lf);
	GetDlgItem(IDC_ST_HEAD)->SetFont(&m_bold);
	GetDlgItem(IDC_ED_NAME)->SetWindowText(m_data.name);
	CComboBox* combo = (CComboBox*)GetDlgItem(IDC_CMB_PROC1);
	combo->ResetContent();
	for(int i=0;i<m_data.m_model->GetProcessCount();i++)
	{
		combo->AddString(m_data.m_model->GetProcess(i).name.c_str());
	}
	combo->SetCurSel(0);

	combo = (CComboBox*)GetDlgItem(IDC_CMB_PROC2);
	combo->ResetContent();
	for(int i=0;i<m_data.m_model->GetProcessCount();i++)
	{
		combo->AddString(m_data.m_model->GetProcess(i).name.c_str());
	}
	combo->SetCurSel(0);
	return TRUE;  // return TRUE unless you set the focus to a control
	// EXCEPTION: OCX Property Pages should return FALSE
}

HBRUSH CDlgChanel::OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor)
{
	HBRUSH hbr = CDialog::OnCtlColor(pDC,pWnd,nCtlColor);
	if(nCtlColor!=CTLCOLOR_STATIC)
		return hbr;
	if(pWnd->GetDlgCtrlID()==IDC_ST_HEAD||pWnd->GetDlgCtrlID()==IDC_ST_DESC)
	{
		pDC->SetBkMode(TRANSPARENT);
		hbr = (HBRUSH)GetStockObject(WHITE_BRUSH);
	}
	return hbr;
}

void CDlgChanel::OnSetFocus(CWnd* pOldWnd)
{
	CDialog::OnSetFocus(pOldWnd);

	GetDlgItem(IDC_ED_NAME)->SetFocus();

}

void CDlgChanel::OnOK()
{
	
	CDialog::OnOK();
}

void CDlgChanel::OnBnClickedOk()
{
	bool id = true;
	CComboBox* combo = (CComboBox*)GetDlgItem(IDC_CMB_PROC1);
	if(combo->GetCurSel()==-1)id=false;
	combo = (CComboBox*)GetDlgItem(IDC_CMB_PROC2);
	if(combo->GetCurSel()==-1)id=false;
	if(!id)
	{
		AfxMessageBox("You should choose exist process");
		return;
	}
	GetDlgItem(IDC_ED_NAME)->GetWindowText(m_data.name);
	if(m_data.name.IsEmpty())
	{
		AfxMessageBox("Chanel name cannot be empty");
		return;
	}
	GetDlgItem(IDC_CMB_PROC1)->GetWindowText(m_data.proc1);
	GetDlgItem(IDC_CMB_PROC2)->GetWindowText(m_data.proc2);

	OnOK();
}
