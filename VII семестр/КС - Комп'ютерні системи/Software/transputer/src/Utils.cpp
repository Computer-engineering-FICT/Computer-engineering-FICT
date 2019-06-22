#include "stdafx.h"
#include "utils.h"

Delegate::Delegate(void* obj,FUNC func):m_obj(obj),m_func(func)
{

}

int Delegate::Call(void* p)
{
	return (((Delegate*)m_obj)->*m_func)(p);
}

void NotifyManager::Register(int event_id,Delegate& delegate)
{
	m_map[event_id].push_back(delegate);
}

int NotifyManager::Raise(int event_id,void* p)
{
	DelegateMap::iterator it = m_map.find(event_id);
	if(it==m_map.end())
		return 0;
	for(int i=0;i<(int)it->second.size();i++)
	{
		int res = it->second[i].Call(p);
		if(res)
			return res;
	}
	return 0;
}

void NotifyManager::Release(int event_id,Delegate& delegate)
{
	DelegateMap::iterator it = m_map.find(event_id);
	if(it==m_map.end())
		return;
	for(int i=(int)it->second.size()-1;i>=0;i--)
	{
		if(it->second[i]==delegate)
			it->second.erase(it->second.begin()+i);
	}
	if(it->second.size()==0)
		m_map.erase(it);
}

bool Delegate::operator==(const Delegate& rhs)
{
	return m_obj==rhs.m_obj&&m_func==rhs.m_func;
}

bool NotifyManager::IsEmpty()
{
	return m_map.size()==0?true:false;
}

void NotifyManager::GetAllEvents(std::vector<int>& events)
{
	for(DelegateMap::iterator it = m_map.begin();it!=m_map.end();it++)
	{
		events.push_back(it->first);
	}
}