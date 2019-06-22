#include "StdAfx.h"
#include ".\dockingbar.h"

BEGIN_MESSAGE_MAP(CDockingBar, CBCGPDockingControlBar)
	ON_WM_SIZE()
END_MESSAGE_MAP()

CDockingBar::CDockingBar(void):m_wnd(NULL)
{
}

CDockingBar::CDockingBar(CWnd* wnd):m_wnd(wnd)
{
}

CDockingBar::~CDockingBar(void)
{
}

void CDockingBar::OnSize(UINT nType, int cx, int cy)
{
	CBCGPDockingControlBar::OnSize(nType, cx, cy);
	if(!m_wnd)
		return;
	m_wnd->SetWindowPos(NULL,-1,-1,cx,cy,SWP_NOMOVE|SWP_NOZORDER);
}

void CDockingBar::AttachClient(CWnd* wnd)
{
	m_wnd = wnd;
}