// PropDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Kurs.h"
#include "PropDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CPropDlg dialog


CPropDlg::CPropDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CPropDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CPropDlg)
	m_val = _T("");
	//}}AFX_DATA_INIT
}


void CPropDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CPropDlg)
	DDX_Text(pDX, IDC_EDIT1, m_val);
	DDV_MaxChars(pDX, m_val, 5);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CPropDlg, CDialog)
	//{{AFX_MSG_MAP(CPropDlg)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CPropDlg message handlers

BOOL CPropDlg::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	GotoDlgCtrl(GetDlgItem(IDC_EDIT1));
	
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}
