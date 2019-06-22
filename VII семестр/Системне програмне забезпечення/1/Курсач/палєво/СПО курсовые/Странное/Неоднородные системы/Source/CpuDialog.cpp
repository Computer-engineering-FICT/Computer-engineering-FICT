// CpuDialog.cpp : implementation file
//

#include "stdafx.h"
#include "Kurs.h"
#include "CpuDialog.h"
#include <malloc.h>
#include <stdio.h>

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CCpuDialog dialog


CCpuDialog::CCpuDialog(CWnd* pParent /*=NULL*/)
	: CDialog(CCpuDialog::IDD, pParent)
{
	//{{AFX_DATA_INIT(CCpuDialog)
	//}}AFX_DATA_INIT
	Cpu=NULL;
	nCpu=0;
}


void CCpuDialog::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CCpuDialog)
	DDX_Control(pDX, IDOK, m_bok);
	DDX_Control(pDX, IDC_BUTTON1, m_bset);
	DDX_Control(pDX, IDC_SPIN1, m_spin);
	DDX_Control(pDX, IDC_EDIT2, m_kCpu);
	DDX_Control(pDX, IDC_EDIT1, m_nCpu);
	DDX_Control(pDX, IDC_LIST1, m_listCpu);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CCpuDialog, CDialog)
	//{{AFX_MSG_MAP(CCpuDialog)
	ON_LBN_SELCHANGE(IDC_LIST1, OnSelchangeList1)
	ON_EN_UPDATE(IDC_EDIT1, OnUpdateEdit1)
	ON_BN_CLICKED(IDC_BUTTON1, OnButton1)
	ON_EN_SETFOCUS(IDC_EDIT2, OnSetfocusEdit2)
	ON_EN_KILLFOCUS(IDC_EDIT2, OnKillfocusEdit2)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CCpuDialog message handlers

void CCpuDialog::AddCpu(float k)
{
	float *temp;
	temp = (float *) malloc(nCpu*sizeof(float));
	for(int i=0;i<nCpu;i++)
		temp[i]=Cpu[i];
	Cpu = (float *) realloc(Cpu,(nCpu++)*sizeof(float));
	for(i=0;i<nCpu-1;i++)
		Cpu[i]=temp[i];
	Cpu[nCpu-1]=k;
	free(temp);
}

BOOL CCpuDialog::PreCreateWindow(CREATESTRUCT& cs) 
{
	return CDialog::PreCreateWindow(cs);
}

void CCpuDialog::FillList()
{
	m_listCpu.ResetContent();
	int d,s;
	char c[10],c1[10];
	for(int i=0;i<nCpu;i++)
	{
		CString k("Процессор ");
		_itoa(i+1,c,10);
		k=k+c;
		sprintf(c1,"%.3f",Cpu[i]);
		k=k+":  "+c1;
		m_listCpu.AddString(LPCTSTR(k));
	}
}

void CCpuDialog::OnSelchangeList1() 
{
	for(int i=0;i<m_listCpu.GetCount();i++)
		if(m_listCpu.GetSel(i))
		{
			char c1[10];
			sprintf(c1,"%.3f",Cpu[i]);
			m_kCpu.SetWindowText(c1);
			break;
		}
		
}

int CCpuDialog::DoModal() 
{
	
	return CDialog::DoModal();
}

BOOL CCpuDialog::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	m_spin.SetBuddy(&m_nCpu);
	m_spin.SetRange(1,99);
	char c[10];
	_itoa(nCpu,c,10);
	m_nCpu.SetWindowText(c);

	float *temp=NULL;
	temp = (float *) malloc(sizeof(float)*nCpu);
	for(int i=0;i<nCpu;i++)
		temp[i]=Cpu[i];
	Cpu = (float *) realloc(Cpu,nCpu*sizeof(float));
	for(i=0;i<nCpu;i++)
		Cpu[i]=temp[i];
	free(temp);

	FillList();	

	
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CCpuDialog::OnUpdateEdit1() 
{
	int num;
	char c[10];
	m_nCpu.GetWindowText(c,9);
	num=atoi(c);
	if(nCpu<num)
	{
		float *temp;
		temp=(float *) malloc(nCpu*sizeof(float));
		for(int i=0;i<nCpu;i++)
			temp[i]=Cpu[i];
		Cpu = (float *) realloc(Cpu,(num)*sizeof(float));
		for(i=0;i<nCpu;i++)
			Cpu[i]=temp[i];
		free(temp);
		for(i=nCpu;i<num;i++)
			Cpu[i]=1.00;
		nCpu=num;
	}
	else if(nCpu>num)
	{
		Cpu = (float *) realloc(Cpu,(num)*sizeof(float));
		nCpu=num;
	}
	FillList();
	m_listCpu.Invalidate();
		
}

void CCpuDialog::OnButton1() 
{
	float k;
	char c[10];
	m_kCpu.GetWindowText(c,9);
	k=atof(c);
	int i;
	for(i=0;i<m_listCpu.GetCount();i++)
		if(m_listCpu.GetSel(i))
		{
			Cpu[i]=k;
			break;
		}
	FillList();
	m_listCpu.Invalidate();
}

CCpuDialog::~CCpuDialog()
{
	free(Cpu);
	Cpu=NULL;
}

void CCpuDialog::OnSetfocusEdit2() 
{
	UINT style=m_bset.GetButtonStyle();
	m_bset.SetButtonStyle(style|BS_DEFPUSHBUTTON);
	style=m_bok.GetButtonStyle();
	m_bok.SetButtonStyle(style&(!BS_DEFPUSHBUTTON));
}

void CCpuDialog::OnKillfocusEdit2() 
{
	UINT style=m_bok.GetButtonStyle();
	m_bok.SetButtonStyle(style|BS_DEFPUSHBUTTON);
	style=m_bset.GetButtonStyle();
	m_bset.SetButtonStyle(style&(!BS_DEFPUSHBUTTON));
}

void CCpuDialog::CopyCpu(float * c, int nc)
{
	free(Cpu);
	Cpu = (float *) malloc(sizeof(float)*nc);
	for(int i=0;i<nc;i++)
		Cpu[i]=c[i];
	nCpu=nc;
}
