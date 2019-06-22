#include "StdAfx.h"
#include ".\global.h"
#include "RegPath.h"
#include "direct.h"

Global::Global(void)
{
	char* dir = _getcwd(NULL,0);
	m_curdir=dir;
	free(dir);
}

NotifyManager* Global::GetNotifyManager()
{
	if(!m_notify_manager)
		m_notify_manager = new NotifyManager();
	return m_notify_manager;
}

Global::~Global(void)
{
	if(m_notify_manager&&!m_notify_manager->IsEmpty())
	{
		TRACE("Some notification handlers havn't been released!!!\n");
		std::vector<int> events;
		m_notify_manager->GetAllEvents(events);
		for(int i=0;i<(int)events.size();i++)
		{
			CString s;
			s.Format("%d ",events[i]);
			TRACE(s);
		}
		TRACE("\n");
	}
	delete m_notify_manager;
	delete m_registry;
}

CString Global::GetWorkDir()
{
	return m_curdir;
}

CBCGPRegistry* Global::GetRegistry(CString section)
{
	delete m_registry;
	m_registry = new CBCGPRegistry(false,false);
	m_registry->CreateKey(::BCGPGetRegPath(section,NULL));
	return m_registry;
}

NotifyManager* Global::m_notify_manager=NULL;
CBCGPRegistry* Global::m_registry=NULL;
CString Global::m_curdir="";

Global global;