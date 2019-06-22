#pragma once
#include "c:\program files\bcgsoft\bcgcontrolbarpro\bcgcbpro\bcgptoolbar.h"

class CDefToolBar :
	public CBCGPToolBar
{
public:
	CDefToolBar(void);
	virtual ~CDefToolBar(void);
	virtual void OnUpdateCmdUI(CFrameWnd* /*pTarget*/, BOOL bDisableIfNoHndler)	
	{		
		CBCGPToolBar::OnUpdateCmdUI ((CFrameWnd*) GetOwner (), bDisableIfNoHndler);
	}

	virtual BOOL AllowShowOnList () const		{	return FALSE;	}
};
