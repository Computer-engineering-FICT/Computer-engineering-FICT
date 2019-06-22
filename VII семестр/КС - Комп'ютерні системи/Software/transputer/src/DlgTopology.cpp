// DlgTopology.cpp : implementation file
//

#include "stdafx.h"
#include "Transputer.h"
#include "DlgTopology.h"
#include ".\dlgtopology.h"
#include "ITransputerModel.h"

// CDlgTopology dialog

IMPLEMENT_DYNAMIC(CDlgTopology, CDialog)
CDlgTopology::CDlgTopology(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgTopology::IDD, pParent)
{
}

CDlgTopology::~CDlgTopology()
{
}

HBRUSH CDlgTopology::OnCtlColor(CDC* pDC,CWnd* wnd, UINT nCtlColor) 
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

void CDlgTopology::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(CDlgTopology, CDialog)
	ON_WM_CTLCOLOR()
	ON_BN_CLICKED(IDOK, OnBnClickedOk)
	ON_CBN_SELCHANGE(IDC_CMB_TOPOLOGY, OnCbnSelchangeCmbTopology)
END_MESSAGE_MAP()


// CDlgTopology message handlers

BOOL CDlgTopology::OnInitDialog()
{
	CDialog::OnInitDialog();

	LOGFONT lf;
	GetFont()->GetLogFont(&lf);
	lf.lfWeight = FW_BOLD;
	m_bold.CreateFontIndirect(&lf);
	GetDlgItem(IDC_ST_HEAD)->SetFont(&m_bold);
	
	std::vector<int> ids;
	std::vector<std::string> names;
	CComboBox* cmbTopology = (CComboBox*)GetDlgItem(IDC_CMB_TOPOLOGY);
	::GetTopologies(ids,names);
	int selected=-1;
	for(int i=0;i<(int)ids.size();i++)
	{
		cmbTopology->AddString(names[i].c_str());
		cmbTopology->SetItemData(i,ids[i]);
		if(ids[i]==m_data.topology_type)
			selected = i;
	}
	cmbTopology->SetCurSel(selected);
	CRect rect;
	CRect r;
	GetClientRect(r);
	rect.left = r.left+20;
	rect.right = r.right-20;
	GetDlgItem(IDC_ST_EDIT)->GetWindowRect(r);
	ScreenToClient(r);
	rect.top = r.bottom+10;
	GetDlgItem(IDC_ST_DELIM)->GetWindowRect(r);
	ScreenToClient(r);
	rect.bottom = r.top-10;
	m_param.Create(WS_CHILD|WS_VISIBLE|WS_BORDER,rect,this,0);
	m_param.SetParam(m_data.topology_type,m_data.param);
	return TRUE;  // return TRUE unless you set the focus to a control
	// EXCEPTION: OCX Property Pages should return FALSE
}


void CDlgTopology::OnBnClickedOk()
{
	CComboBox* cmbTopology = (CComboBox*)GetDlgItem(IDC_CMB_TOPOLOGY);
	m_data.topology_type = (int)cmbTopology->GetItemData(cmbTopology->GetCurSel());
	m_param.m_param->GetValues(m_data.param);
	OnOK();
}

BOOL CTopologyPropList::ValidateItemData(CBCGPProp* prop)
{
	std::string n(prop->GetName());
	bstr_t b;
	
	CString s;
	prop->m_pWndInPlace->GetWindowText(s);
	std::string v(s);
	
	if(m_param->SetValue(n,v))
		return TRUE;
	return FALSE;
}

void CTopologyPropList::SetParam(int type,ITransputerParam::Dictionary& dict)
{
	delete m_param;
	m_param=0;
	ITransputer* model = CreateTransputerObj((TOPOLOGY_TYPE)type);
	if(!model)
		model = CreateTransputerObj(SIMPLE_TOPOLOGY);
	m_param = model->CreateTransputerParam();
	delete model;
	m_param->SetValues(dict);
	RemoveAll();
	for(int i=0;i<(int)m_param->GetCount();i++)
	{
		std::string n,v;
		m_param->GetName(i,n);
		m_param->GetValue(i,v);
		AddProperty(new CBCGPProp(CString(n.c_str()),v.c_str()));	
	}
}

CTopologyPropList::~CTopologyPropList()
{
	delete m_param;
}

CTopologyPropList::CTopologyPropList():m_param(NULL)
{

}
void CDlgTopology::OnCbnSelchangeCmbTopology()
{
	CComboBox* cmbTopology = (CComboBox*)GetDlgItem(IDC_CMB_TOPOLOGY);
	int topology_type = (int)cmbTopology->GetItemData(cmbTopology->GetCurSel());
	m_param.SetParam(topology_type,m_data.param);	
}
