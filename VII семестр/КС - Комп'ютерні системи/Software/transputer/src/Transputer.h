#pragma once
#include "resource.h"

class CTransputerApp : public CWinApp,public CBCGPWorkspace
{
public:
	CTransputerApp();
	virtual void PreLoadState ();
public:
	virtual BOOL InitInstance();
	virtual int ExitInstance();
	afx_msg void OnAppAbout();
	DECLARE_MESSAGE_MAP()
};

extern CTransputerApp theApp;