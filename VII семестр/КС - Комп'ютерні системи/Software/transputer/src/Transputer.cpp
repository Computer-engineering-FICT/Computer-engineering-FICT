#include "stdafx.h"
#include "Transputer.h"
#include "MainFrm.h"
#include "TransputerDoc.h"
#include "TransputerView.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

BEGIN_MESSAGE_MAP(CTransputerApp, CWinApp)
	ON_COMMAND(ID_APP_ABOUT, OnAppAbout)
	ON_COMMAND(ID_FILE_NEW, CWinApp::OnFileNew)
	ON_COMMAND(ID_FILE_OPEN, CWinApp::OnFileOpen)
END_MESSAGE_MAP()

CTransputerApp::CTransputerApp() :
	CBCGPWorkspace (TRUE /* m_bResourceSmartUpdate */)
{
}

CTransputerApp theApp;

BOOL CTransputerApp::InitInstance()
{
	//_CrtSetBreakAlloc(12049);
	InitCommonControls();
	CWinApp::InitInstance();
	SetRegistryKey(_T("Transputer Model Application"));
	LoadStdProfileSettings(4);
	SetRegistryBase (_T("Settings"));
//	InitSkinManager ();
	CBCGPVisualManager::SetDefaultManager (RUNTIME_CLASS (CBCGPVisualManager2003));
	CSingleDocTemplate* pDocTemplate;
	pDocTemplate = new CSingleDocTemplate(
		IDR_MAINFRAME,
		RUNTIME_CLASS(CTransputerDoc),
		RUNTIME_CLASS(CMainFrame),       
		RUNTIME_CLASS(CTransputerView));
	AddDocTemplate(pDocTemplate);

	EnableShellOpen();
	RegisterShellFileTypes(TRUE);

	CCommandLineInfo cmdInfo;
	ParseCommandLine(cmdInfo);
	if (!ProcessShellCommand(cmdInfo))
		return FALSE;
	m_pMainWnd->ShowWindow(SW_SHOW);
	m_pMainWnd->UpdateWindow();
	return TRUE;
}

int CTransputerApp::ExitInstance() 
{
	BCGCBProCleanUp();
	return CWinApp::ExitInstance();
}

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();
	enum { IDD = IDD_ABOUTBOX };
	CBCGPURLLinkButton m_btnURL;
protected:
	virtual void DoDataExchange(CDataExchange* pDX);
protected:
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{

}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_COMPANY_URL, m_btnURL);
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
END_MESSAGE_MAP()

void CTransputerApp::OnAppAbout()
{
	CAboutDlg aboutDlg;
	aboutDlg.DoModal();
}

void CTransputerApp::PreLoadState ()
{
}