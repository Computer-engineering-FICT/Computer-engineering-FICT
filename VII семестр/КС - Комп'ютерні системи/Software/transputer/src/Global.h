#pragma once
#include "Utils.h"
#include "BCGPRegistry.h"

class Global
{
	static NotifyManager* m_notify_manager;
	static CBCGPRegistry* m_registry;
	static CString m_curdir;
public:
	enum NOTIFICATIONS
	{
		ON_DOCUMENT_CHANGE
		,ON_PROCESS_COUNT_CHANGE
		,ON_PROCESS_CHANGE
		,ON_CHANEL_COUNT_CHANGE
		,ON_CHANEL_CHANGE
		,ON_PROGRAM_LINE_COUNT_CHANGE
		,ON_PROGRAM_CHANGE
		,ON_SIMULATION_STATE_CHANGED
	};
	static NotifyManager* GetNotifyManager();
	static CBCGPRegistry* GetRegistry(CString section);
	static CString GetWorkDir();
	Global(void);
	~Global(void);
};
