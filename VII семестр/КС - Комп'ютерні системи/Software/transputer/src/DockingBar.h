#pragma once
#include "c:\program files\bcgsoft\bcgcontrolbarpro\bcgcbpro\bcgpdockingcontrolbar.h"

class CDockingBar :
	public CBCGPDockingControlBar
{
protected:
	CWnd* m_wnd;
public:
	CDockingBar();
	CDockingBar(CWnd* wnd);
	~CDockingBar(void);
	void AttachClient(CWnd* wnd);
	DECLARE_MESSAGE_MAP()
	afx_msg void OnSize(UINT nType, int cx, int cy);
};
