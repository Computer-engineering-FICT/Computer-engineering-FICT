#pragma once
#include "c:\program files\bcgsoft\bcgcontrolbarpro\bcgcbpro\bcgpdockingcontrolbar.h"

class CDockinglBar :
	public CBCGPDockingControlBar
{
protected:
	CWnd* m_wnd;
public:
	CDockinglBar(CWnd* wnd);
	virtual ~CDockinglBar(void);
	DECLARE_MESSAGE_MAP()

};
