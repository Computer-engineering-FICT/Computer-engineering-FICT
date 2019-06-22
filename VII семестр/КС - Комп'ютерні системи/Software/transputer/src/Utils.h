#pragma once
#include <hash_map>
#include <vector>

struct IClone
{
	virtual IClone* Clone()=0;
	virtual ~IClone(){};
};

class Delegate
{
public:
	typedef int (Delegate::*FUNC)(void*);
protected:
	void* m_obj;
	FUNC m_func;
public:

	Delegate(void* obj,FUNC func);
	int Call(void* p);
	bool operator==(const Delegate& rhs);
};

class NotifyManager
{
	typedef stdext::hash_map<int,std::vector<Delegate> > DelegateMap;
	DelegateMap m_map;
public:
	void Register(int event_id,Delegate& delegate);
	void Release(int event_id,Delegate& delegate);
	int Raise(int event_id,void* p);
	void GetAllEvents(std::vector<int>& events);
	bool IsEmpty();
};