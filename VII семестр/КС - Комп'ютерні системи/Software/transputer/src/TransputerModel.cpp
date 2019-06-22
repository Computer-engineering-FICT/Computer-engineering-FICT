#include "StdAfx.h"
#include ".\transputermodel.h"
#include <algorithm>
#include "resource.h"
TransputerModel::TransputerModel(void):m_loaded(false),m_running(false),m_topology(0)
{
	m_linkmanager = new LinkManager(this);
	m_mutex = ::CreateMutex(0,0,0);
}

TransputerModel::~TransputerModel(void)
{
	delete m_linkmanager;
	delete m_topology;
	::CloseHandle(m_mutex);
}

bool TransputerModel::DeleteProcess(std::string& name)
{
	if(m_proc_names.find(name)==m_proc_names.end())
		return false;
	m_proc_names.erase(name);
	Process process;
	process.name = name;
	std::vector<Process>::iterator it = std::lower_bound(m_processes.begin()
		,m_processes.end(),process);
	m_processes.erase(it);
	return true;
}

int TransputerModel::AddProcess(Process& process)
{
	if(m_proc_names.find(process.name)!=m_proc_names.end())
		return -1;
	std::vector<Process>::iterator it = std::lower_bound(m_processes.begin()
		,m_processes.end(),process);
	int id = (int)std::distance(m_processes.begin(),it);
	m_processes.insert(it,process);
	m_proc_names.insert(process.name);
	return id;
}

bool TransputerModel::Process::operator<(const Process& rhs)
{
	return name<rhs.name;
}

bool TransputerModel::Chanel::operator<(const Chanel& rhs)
{
	return name<rhs.name;
}

int TransputerModel::GetProcessCount()
{
	return (int)m_processes.size();
}

TransputerModel::Process& TransputerModel::GetProcess(int i)
{
	static Process process;
	if(i>=(int)m_processes.size())
		return process;
	return m_processes[i];
}


std::string TransputerModel::GetNewProcessName(void)
{
	CString def="NewProcess%d";
	CString name;
	for(int i=1;;i++)
	{
		name.Format(def,i);
		std::string res = name.GetString();
		if(m_proc_names.find(res)==m_proc_names.end())
			return res;
	}
}

bool TransputerModel::SetProcessName(int id, std::string& name)
{
	if(m_proc_names.find(name)!=m_proc_names.end())
    	return false;
	Process process = m_processes[id];
	DeleteProcess(process.name);
	process.name = name;
	AddProcess(process);
	return true;
}

std::string TransputerModel::GetNewChanelName(void)
{
	CString def="NewChanel%d";
	CString name;
	for(int i=1;;i++)
	{
		name.Format(def,i);
		std::string res = name.GetString();
		if(m_chanel_names.find(res)==m_chanel_names.end())
			return res;
	}
}

int TransputerModel::AddChanel(TransputerModel::Chanel& chanel)
{
	if(m_chanel_names.find(chanel.name)!=m_chanel_names.end())
		return -1;
	std::vector<Chanel>::iterator it = std::lower_bound(m_chanels.begin()
		,m_chanels.end(),chanel);
	int id = (int)std::distance(m_chanels.begin(),it);
	m_chanels.insert(it,chanel);
	m_chanel_names.insert(chanel.name);
	return id;
}

TransputerModel::Chanel& TransputerModel::GetChanel(int id)
{
	static Chanel chanel;
	if(id>=(int)m_chanels.size())
		return chanel;
	return m_chanels[id];
}

int TransputerModel::GetProcessID(std::string& name)
{
	Process process;
	process.name = name;
	std::vector<Process>::iterator it = std::lower_bound(m_processes.begin()
		,m_processes.end(),process);
	if(it==m_processes.end())
		return -1;
	if(it->name!=name)
		return -1;
	return (int)std::distance(m_processes.begin(),it);
}

int TransputerModel::GetChanelID(std::string& name)
{
	Chanel chanel;
	chanel.name = name;
	std::vector<Chanel>::iterator it = std::lower_bound(m_chanels.begin()
		,m_chanels.end(),chanel);
	if(it==m_chanels.end())
		return -1;
	if(it->name!=name)
		return -1;
	return (int)std::distance(m_chanels.begin(),it);
}

bool TransputerModel::DeleteChanel(std::string& name)
{
	if(m_chanel_names.find(name)==m_chanel_names.end())
		return false;
	m_chanel_names.erase(name);
	Chanel chanel;
	chanel.name = name;
	std::vector<Chanel>::iterator it = std::lower_bound(m_chanels.begin()
		,m_chanels.end(),chanel);
	m_chanels.erase(it);
	return true;	
}

int TransputerModel::GetChanelCount(void)
{
	return (int)m_chanels.size();
}

bool TransputerModel::SetChanelName(int row,std::string& name)
{
	if(m_chanel_names.find(name)!=m_chanel_names.end())
    	return false;
	Chanel chanel = m_chanels[row];
	DeleteChanel(chanel.name);
	chanel.name = name;
	AddChanel(chanel);
	return true;
}

bool TransputerModel::DeleteProgramLine(std::string& process, int line)
{
	int id = GetProcessID(process);
	if(id==-1)
		return false;
	m_processes[id].m_program.erase(m_processes[id].m_program.begin()+line);
	return true;
}

bool TransputerModel::InsertProgramLine(std::string& process, int line)
{
	int id = GetProcessID(process);
	if(id==-1)
		return false;
	m_processes[id].m_program.insert(m_processes[id].m_program.begin()+line,ProgramLine());
	return true;
}

bool TransputerModel::IsLoaded()
{
	return m_loaded;
}

bool TransputerModel::CanQueryState()
{
	return m_loaded&&!m_running;
}

int TransputerModel::GetProcessorCount()
{
	return m_topology->Count();
}

void TransputerModel::Load()
{
	if(!Verify(std::vector<std::string>(),std::vector<std::string>()))
		return;
	m_processors = std::vector<Transputer>(GetProcessorCount(),Transputer(this));
	for(int i=0;i<(int)m_processors.size();i++)
		m_processors[i].m_id = i;
	m_linkmanager->m_chanels = std::vector<int>(GetChanelCount(), -1);
	m_linkmanager->m_ready.clear();
	m_linkmanager->m_active = std::vector<int>(m_topology->GetLinkCount(),-1);
	m_linkmanager->m_halfactive = std::vector<int>(m_topology->GetLinkCount(),-1);
	m_max_clocks = 0;
	for(int i=0;i<(int)m_processes.size();i++)
	{
		for(int j=0;j<(int)m_processes[i].m_program.size();j++)
		{
			m_max_clocks+=m_processes[i].m_program[j].execution;
			m_max_clocks+=m_processes[i].m_program[j].transmition*m_topology->Count();
		}
		m_processes[i].cur_block=0;
		m_processes[i].exec_left=m_processes[i].m_program.size()?m_processes[i].m_program[0].execution:0;
		m_processes[i].trans_left=m_processes[i].m_program.size()?m_processes[i].m_program[0].transmition:0;
		m_processes[i].way_point=0;
		m_processes[i].is_writing=m_processes[i].m_program.size()?m_processes[i].m_program[0].direction:0;;
		m_processors[m_processes[i].proc_number].Shedule(i);
		m_processors[m_processes[i].proc_number].m_all.push_back(i);
	}
	m_loaded = true;
	m_clocks = 0;
	Clock();
	m_clocks = 0;
}

bool TransputerModel::Verify(std::vector<std::string>& errors,std::vector<std::string>& warnings)
{
	for(int i=0;i<(int)m_chanels.size();i++)
	{
		if(m_chanels[i].proc1 == m_chanels[i].proc2)
		{
			CString s; s.Format("Chanel '%s' must lay between two diferent processes.",m_chanels[i].name.c_str());
			errors.push_back(std::string(s));
		}
	}
	for(int i=0;i<(int)m_processes.size();i++)
	{
		if(m_processes[i].proc_number >= GetProcessorCount())
		{
			CString s; s.Format("Not valid processor number for process '%s'",m_processes[i].name.c_str());
			errors.push_back(std::string(s));
		}
		for(int j=0;j<(int)m_processes[i].m_program.size();j++)
		{
			ProgramLine& pl = m_processes[i].m_program[j];
			if(pl.transmition>0 && pl.chanel.empty())
			{
				CString s; s.Format("Chanel not selected for block %d of process '%s' program.",j,m_processes[i].name.c_str());
				errors.push_back(std::string(s));
			}
			if(!pl.transmition && !pl.execution)
			{
				CString s; s.Format("Empty block %d of process '%s' program.",j,m_processes[i].name.c_str());
				errors.push_back(std::string(s));
			}
		}
	}

	std::vector<bool> used(m_chanels.size(),false);
	for(int i=0;i<(int)m_processes.size();i++)
	{
		for(int j=0;j<(int)m_processes[i].m_program.size();j++)
		{
			ProgramLine& pl = m_processes[i].m_program[j];
			int id = GetChanelID(pl.chanel);
			if(id ==-1)
			{
				if(!pl.transmition)
					continue;
				CString s; s.Format("Not existed chanel '%s' selected for block %d of process '%s' program.",pl.chanel.c_str(),j,m_processes[i].name.c_str());
				errors.push_back(std::string(s));
			}
			else
				used[id]=true;
		}
	}

	for(int i=0;i<(int)m_chanels.size();i++)
	{
		if(!used[i])
			continue;
		std::string msg = VerifyChanel(i);
		if(msg.size())
			errors.push_back(msg);		
	}
	bool empty_program = true;
	for(int i=0;i<(int)m_processes.size();i++)
	{
		if(!m_processes[i].m_program.size())
		{
			CString s; s.Format("Process '%s' has no program",m_processes[i].name.c_str());
			warnings.push_back(std::string(s));
		}
		else
			empty_program = false;
	}

	if(empty_program)
	{
		CString s; s.Format("There are no program to execute");
		errors.push_back(std::string(s));
	}

	for(int i=0;i<(int)used.size();i++)
	{
		if(!used[i])
		{
			CString s; s.Format("Chanels '%s' not used",m_chanels[i].name.c_str());
			warnings.push_back(std::string(s));
		}
	}

	return errors.size()==0;
}

std::string TransputerModel::VerifyChanel(int id)
{
	std::vector<TransputerModel::ProgramLine>& prog1 = m_processes[GetProcessID(m_chanels[id].proc1)].m_program;
	std::vector<TransputerModel::ProgramLine>& prog2 = m_processes[GetProcessID(m_chanels[id].proc2)].m_program;

	int i=-1,j=-1;
	int op1=0,op2=0;
	for(;;)
	{
		for(;;)
		{
			i++;
			if(i>=(int)prog1.size())
			{
				op1=0;
				break;
			}
			if(prog1[i].chanel == m_chanels[id].name && prog1[i].transmition)
			{
				op1=prog1[i].direction?prog1[i].transmition:-prog1[i].transmition;
				break;
			}
		}
		for(;;)
		{
			j++;
			if(j>=(int)prog2.size())
			{
				op2=0;
				break;
			}
			if(prog2[j].chanel==m_chanels[id].name && prog2[j].transmition)
			{
				op2=prog2[j].direction?prog2[j].transmition:-prog2[j].transmition;
				break;
			}
		}
		if(op1!=-op2)
		{
			if(op1)
			{
				CString s; s.Format("Process '%s' in block %d %s chanel '%s' but another process doesn't have coresponding operation",m_chanels[id].proc1.c_str(),i,op1<0?"reads from":"writes to",m_chanels[id].name.c_str());
				return s.GetString();
			}
			if(op2)
			{
				CString s; s.Format("Process '%s' in block %d %s chanel '%s' but another process doesn't have coresponding operation",m_chanels[id].proc2.c_str(),j,op2<0?"reads from":"writes to",m_chanels[id].name.c_str());
				return s.GetString();
			}
		}
		if(!op1)
			break;
	}
	int p1 = m_processes[GetProcessID(m_chanels[id].proc1)].proc_number;
	int p2 = m_processes[GetProcessID(m_chanels[id].proc2)].proc_number;
	std::vector<int>& v = m_chanels[id].route;
	for(int i=0;i<(int)v.size();i++)
	{
		if(v[i]<0||v[i]>=GetProcessorCount())
		{
			CString s; s.Format("Route of '%s' chanel lays through not existed processor.",m_chanels[id].name.c_str());
			return s.GetString();
		}
		if(v[i]==p1 || v[i]==p2)
		{
			CString s; s.Format("Route of '%s' chanel shouldn't include endpoint.",m_chanels[id].name.c_str());
			return s.GetString();
		}
	}
	for(int i=0;i<(int)v.size();i++)
		for(int j=i+1;j<(int)v.size();j++)
		{
			if(v[i]==v[j])
			{
				CString s; s.Format("Route of '%s' chanel includes same process twice ore more.",m_chanels[id].name.c_str());
				return s.GetString();
			}
		}
	for(int pos = p1,i=0;i<(int)v.size()+1;i++)
	{
		if(!m_topology->HasLink(pos,v.size()==i?p2:v[i]))
		{
			CString s; s.Format("Route of '%s' chanel contains link beetween two unconnected processors.",m_chanels[id].name.c_str());
			return s.GetString();
		}
		pos = v.size()==i?p2:v[i];
	}
	return std::string();
}

void TransputerModel::Stop()
{
	Pause();
	m_loaded = false;
}

bool TransputerModel::Clock()
{
	if(!m_loaded)
		return false;
	bool res = false;
	m_clocks ++;
	int i=0;
	for(i=0;i<(int)m_processors.size();i++)
	{
		try 
		{
			res |= m_processors[i].Clock();
		}
		catch(TransputerModel::EventFinished)
		{
		}
	}
	res |= m_linkmanager->Clock();
	for(i=0;i<(int)m_processors.size();i++)
	{
		m_processors[i].PostClock();
	}
	for(i=0;i<(int)m_processors.size();i++)
		if(!m_processors[i].m_finished)
			break;
	if(i==(int)m_processors.size())
	{
		m_loaded = false;
		throw TransputerModel::EventFinished();
	}

	if(m_clocks>m_max_clocks)
		throw TransputerModel::EventDeadlock();
	return res;
}

Transputer::Transputer(TransputerModel* parent):m_parent(parent),m_has_event(0),m_finished(0),m_active(-1)
{

}

bool Transputer::Shedule(int proc_id)
{
	for(int i=0;i<(int)m_waiting.size();i++)
	{
		if(m_waiting[i]==proc_id)
		{
			m_waiting.erase(m_waiting.begin()+i);
			break;
		}
	}
	for(;!m_parent->m_processes[proc_id].exec_left;)
	{
		if(m_parent->m_processes[proc_id].m_program.size()==m_parent->m_processes[proc_id].cur_block)
		{
			int i;
			for(i=0;i<(int)m_all.size();i++)
				if(!m_parent->IsProcessFinished(m_all[i]))
					break;
			if(i==(int)m_all.size())
			{
				m_finished = true;
			}
			return false;
		}
		if(m_parent->m_linkmanager->Shedule(proc_id))
		{
			m_waiting.push_back(proc_id);
			return true;
		}
	}
	if(m_parent->m_processes[proc_id].priority)
		m_highready.push_back(proc_id);
	else
		m_lowready.push_back(proc_id);
	return true;
}

bool Transputer::Clock()
{
	if(m_finished)
		return false;
	bool res = false;
	if(m_active!=-1)
	{
		m_parent->m_processes[m_active].exec_left--;
		if(!m_parent->m_processes[m_active].exec_left)
		{
			Shedule(m_active);
			m_active =-1;
			res = true;
		}
	}
	if(m_active==-1)
	{
		if(m_highready.size())
		{
			m_active = m_highready.front();
			if(m_highready.size()==1)
				m_highready.pop_back();
			else
				m_highready.erase(m_highready.begin());			
		}	
		else if (m_lowready.size())
		{
			m_active = m_lowready.front();
			if(m_lowready.size()==1)
				m_lowready.pop_back();
			else
				m_lowready.erase(m_lowready.begin());			
		}
		else if(!m_waiting.size())
		{
			int i;
			for(i=0;i<(int)m_all.size();i++)
				if(!m_parent->IsProcessFinished(m_all[i]))
					break;
			if(i==(int)m_all.size())
			{
				m_finished = true;
				throw TransputerModel::EventFinished();
			}
		}
	}
	return res;
}

bool LinkManager::Shedule(int proc_id)
{
	TransputerModel::Process& process = m_parent->m_processes[proc_id];
	if(process.trans_left==0)
	{
		process.cur_block++;
		if(process.cur_block == process.m_program.size())
			return false;
		process.exec_left = process.m_program[process.cur_block].execution;
		process.trans_left = process.m_program[process.cur_block].transmition;
		process.way_point = 0;
		process.is_writing = process.m_program[process.cur_block].direction;
		return false;
	}
	int chanel = m_parent->GetChanelID(process.m_program[process.cur_block].chanel);
	if(m_chanels[chanel]==-1)
	{
		m_chanels[chanel]=proc_id;
		if(!m_parent->GetTopology()->IsLinkVirtual())
			m_ready.push_back(chanel);
		return true;
	}
	m_chanels[chanel]=-1;
	if(m_parent->GetTopology()->IsLinkVirtual())
		m_ready.push_back(chanel);
	return true;
}

int LinkManager::GetLink(TransputerModel::Chanel& chanel)
{
	int p1,p2;
	GetLink(chanel,p1,p2);
	if(p1==-1)
		return -1;
	return m_parent->GetTopology()->GetLinkID(p1,p2);
}

void LinkManager::GetLink(TransputerModel::Chanel& chanel,int& p1,int& p2)
{
	TransputerModel::Process& proc1 = m_parent->m_processes[m_parent->GetProcessID(chanel.proc1)];
	TransputerModel::Process& proc2 = m_parent->m_processes[m_parent->GetProcessID(chanel.proc2)];
	if(proc1.exec_left!=0)
		return;
	if(proc2.exec_left!=0)
		return;
	if(proc1.is_writing)
	{
		if(proc1.way_point==0)
		{
			p1 = proc1.proc_number;
		}
		else if(proc1.way_point>(int)chanel.route.size())
		{
			p1 = -1;
			p2 = -1;
			return;
		}
		else
		{
			p1 = chanel.route[proc1.way_point-1];
		}
		if(proc1.way_point>=(int)chanel.route.size())
			p2 = proc2.proc_number;
		else
			p2 = chanel.route[proc1.way_point];
	}
	else
	{
		if(proc2.way_point==0)
		{
			p2 = proc2.proc_number;
		}
		else if(proc2.way_point>(int)chanel.route.size())
		{
			p1 = -1;
			p2 = -1;
			return;
		}
		else
		{
			p2 = chanel.route[chanel.route.size() - proc2.way_point];
		}
		if(proc2.way_point>=(int)chanel.route.size())
			p1 = proc1.proc_number;
		else
			p1 = chanel.route[chanel.route.size() - proc2.way_point-1];
	}
}
int LinkManager::GetFirstLink(int chanel,int process)
{
	int p1,p2;
	GetFirstLink(chanel,p1,p2,process);
	return m_parent->GetTopology()->GetLinkID(p1,p2);
}
void LinkManager::GetFirstLink(int chanel,int& proc1,int& proc2,int process)
{
	int p1 = m_parent->GetProcessID(m_parent->m_chanels[chanel].proc1);
	int p2 = m_parent->GetProcessID(m_parent->m_chanels[chanel].proc2);
	if(m_parent->m_processes[process].exec_left!=0)
		return;
	bool is_beg = m_parent->m_processes[process].is_writing&&process==p1||
		!m_parent->m_processes[process].is_writing&&process==p2;
	if(is_beg)
	{
		proc1 = m_parent->m_processes[p1].proc_number;
		proc2 = m_parent->m_chanels[chanel].route.size()?
		m_parent->m_chanels[chanel].route[0]:m_parent->m_processes[p2].proc_number;
	}
	else
	{
		proc2 = m_parent->m_processes[p2].proc_number;
		proc1 = m_parent->m_chanels[chanel].route.size()?
		m_parent->m_chanels[chanel].route.back():m_parent->m_processes[p1].proc_number;
	}
}

bool LinkManager::Clock()
{
	bool res=false;
	for(int i=0;i<(int)m_active.size();i++)
	{
		if(m_active[i]==-1)
			continue;
		if(m_chanels[m_active[i]]!=-1)
			continue;
		TransputerModel::Chanel& chanel = m_parent->m_chanels[m_active[i]];
		int proc_id1 = m_parent->GetProcessID(chanel.proc1);
		int proc_id2 = m_parent->GetProcessID(chanel.proc2);
		TransputerModel::Process& proc1 = m_parent->m_processes[proc_id1];
		TransputerModel::Process& proc2 = m_parent->m_processes[proc_id2];
		proc1.trans_left--;
		proc2.trans_left--;
		if(proc1.trans_left!=proc2.trans_left)
			AfxThrowUserException();
		if(proc1.trans_left)
			continue;

		TransputerModel::Process& process = proc1.is_writing?proc1:proc2;
		process.way_point++;
		if(GetLink(chanel)!=-1)
		{
			m_ready.push_back(m_active[i]);
			proc1.trans_left = proc1.m_program[proc1.cur_block].transmition;
			proc2.trans_left = proc2.m_program[proc2.cur_block].transmition;
			m_active[i]=-1;
			continue;
		}
		res = true;
		m_active[i]=-1;
		m_parent->m_processors[proc1.proc_number].Shedule(proc_id1);
		m_parent->m_processors[proc2.proc_number].Shedule(proc_id2);
	}
	for(int i=0;i<(int)m_ready.size();i++)
	{
		TransputerModel::Chanel& chanel = m_parent->m_chanels[m_ready[i]];
		int proc_id1 = m_parent->GetProcessID(chanel.proc1);
		int proc_id2 = m_parent->GetProcessID(chanel.proc2);
		TransputerModel::Process& proc1 = m_parent->m_processes[proc_id1];
		TransputerModel::Process& proc2 = m_parent->m_processes[proc_id2];
		int link = -1;
		if(m_chanels[m_ready[i]]!=-1)
			link = GetFirstLink(m_ready[i],m_chanels[m_ready[i]]);
		else
			link = GetLink(chanel);
		if(m_active[link]==-1)
		{
			if(m_chanels[m_ready[i]]!=-1)
			{
				if(m_halfactive[link]!=-1)
					continue;
				m_halfactive[link]=m_ready[i];
				std::vector<int>& v1 = m_parent->m_processors[m_parent->m_processes[ m_chanels[ m_ready[i] ] ].proc_number ].m_waiting;
				v1 = std::vector<int>(v1.begin(),std::remove(v1.begin(),v1.end(),m_chanels[m_ready[i]]));
				continue;
			}
			if(m_halfactive[link]!=-1&&m_halfactive[link]!=m_ready[i])
				continue;
			m_active[link] = m_ready[i];
			m_halfactive[link] = -1;
			if(m_ready.size()==1)
				m_ready.pop_back();
			else
				m_ready.erase(m_ready.begin()+i);
			std::vector<int>& v1 = m_parent->m_processors[proc1.proc_number].m_waiting;
			v1 = std::vector<int>(v1.begin(),std::remove(v1.begin(),v1.end(),proc_id1));
			std::vector<int>& v2 = m_parent->m_processors[proc2.proc_number].m_waiting;
			v2 = std::vector<int>(v2.begin(),std::remove(v2.begin(),v2.end(),proc_id2));
		}
	}
	return res;
}
void TransputerModel::Clear(void)
{
	m_proc_names.clear();
	m_processes.clear();
	m_processors.clear();
	m_chanel_names.clear();
	m_chanels.clear();
}

bool TransputerModel::IsProcessActive(int id)
{
	return m_processors[m_processes[id].proc_number].m_active==id;
}

bool TransputerModel::IsProcessReady(int id)
{
	Transputer& proc = m_processors[m_processes[id].proc_number];
	if(m_processes[id].priority)
	{
		for(int i=0;i<(int)proc.m_highready.size();i++)
		{
			if(proc.m_highready[i]==id)
				return true;
		}
	}
	else
	{
		for(int i=0;i<(int)proc.m_lowready.size();i++)
		{
			if(proc.m_lowready[i]==id)
				return true;
		}
	}
	return false;
}

bool TransputerModel::IsProcessWaiting(int id)
{
	Transputer& proc = m_processors[m_processes[id].proc_number];
	for(int i=0;i<(int)proc.m_waiting.size();i++)
	{
		if(proc.m_waiting[i]==id)
			return true;
	}
	return false;
}

bool TransputerModel::IsProcessTransmiting(int id)
{
	for(int i=0;i<(int)m_linkmanager->m_active.size();i++)
	{
		int chanel = m_linkmanager->m_active[i];
		if(chanel==-1)
		{
			chanel = m_linkmanager->m_halfactive[i];
			if(chanel==-1)
				continue;
			if(m_linkmanager->m_chanels[chanel]==id)
				return true;
			continue;
		}
		if(m_chanels[chanel].proc1==m_processes[id].name)
			return true;
		if(m_chanels[chanel].proc2==m_processes[id].name)
			return true;
	}
	return false;
}

bool TransputerModel::IsProcessWriting(int id)
{
	if(IsProcessFinished(id))
		return false;
	if(!m_processes[id].m_program[m_processes[id].cur_block].direction)
		return false;
	return IsProcessTransmiting(id);
}

bool TransputerModel::IsProcessReading(int id)
{
	if(IsProcessFinished(id))
		return false;
	if(m_processes[id].m_program[m_processes[id].cur_block].direction)
		return false;
	return IsProcessTransmiting(id);
}

bool TransputerModel::IsProcessFinished(int id)
{
	return m_processes[id].cur_block==(int)m_processes[id].m_program.size();
}

int TransputerModel::GetProcessActiveBlock(int id)
{
	return m_processes[id].cur_block==(int)m_processes[id].m_program.size()?-1:m_processes[id].cur_block;
}

int TransputerModel::GetProcessBlockTimeLeft(int id)
{
	if(m_processes[id].cur_block==(int)m_processes[id].m_program.size())
		return -1;
	if(IsProcessWaiting(id)||IsProcessReady(id)||IsProcessActive(id))
		return m_processes[id].exec_left;
	else
		return m_processes[id].trans_left;
}
int TransputerModel::GetActiveProces(int proc_num)
{
	return m_processors[proc_num].m_active;
}

int TransputerModel::GetActiveChanel(int p1, int p2)
{
	int id = m_topology->GetLinkID(p1,p2);
	return m_linkmanager->m_active[id];
}

int TransputerModel::GetHalfActiveChanel(int p1, int p2,int& activeproc)
{
	int id = m_topology->GetLinkID(p1,p2);
	int ch = m_linkmanager->m_halfactive[id];
	if(ch==-1)
		return ch;
	activeproc = m_linkmanager->m_chanels[ch];
	return ch;
}

void TransputerModel::GetHighQueue(std::vector<int>& process, int proc_num)
{
	process = m_processors[proc_num].m_highready;
}

void TransputerModel::GetLowQueue(std::vector<int>& process, int proc_num)
{
	process = m_processors[proc_num].m_lowready;
}

void TransputerModel::GetWaitingQueue(std::vector<int>& process, int proc_num)
{
	process = m_processors[proc_num].m_waiting;
}

void TransputerModel::Run()
{
	m_running = true;
	for(;;)
	{
		Clock();
		if(!m_running)
		{
			ReleaseMutex(m_mutex);
			return;
		}
	}
}

UINT TransputerModel::Start(LPVOID p)
{
	TransputerModel* m = (TransputerModel*)p;
	try{
		m->Run();
		::WaitForSingleObject(m->m_mutex,INFINITE);
	}
	catch(TransputerModel::EventFinished)
	{
		m->m_running = false;
		::PostMessage(m->m_handle,WM_COMMAND,ID_FINISHED,NULL);
		m->m_loaded = false;
	}
	catch(TransputerModel::EventDeadlock)
	{
		m->m_running = false;
		::PostMessage(m->m_handle,WM_COMMAND,ID_DEADLOCK,NULL);
	}
	return 0;
}

UINT TransputerModel::Step(LPVOID p)
{
	TransputerModel* m = (TransputerModel*)p;
	try{
		m->DoStep();
	}
	catch(TransputerModel::EventFinished)
	{
		m->m_running = false;
		::PostMessage(m->m_handle,WM_COMMAND,ID_FINISHED,NULL);
		m->m_loaded = false;
	}
	catch(TransputerModel::EventDeadlock)
	{
		m->m_running = false;
		::PostMessage(m->m_handle,WM_COMMAND,ID_DEADLOCK,NULL);
	}
	::PostMessage(m->m_handle,WM_COMMAND,ID_STEP_DONE,NULL);
	return 0;
}

void TransputerModel::DoStep()
{
	m_running = true;
	for(;;)
	{
		if(Clock()||!m_running)
		{
			ReleaseMutex(m_mutex);
			m_running = false;
			return;
		}
	}
}

void TransputerModel::Pause(void)
{
	if(!m_running)
		return;
	m_running = false;
	::WaitForSingleObject(m_mutex,INFINITE);
	ReleaseMutex(m_mutex);
}

int TransputerModel::GetClocks()
{
	return m_clocks;
}


ITopology* TransputerModel::GetTopology(void)
{
	return m_topology;
}

void TransputerModel::GetLink(TransputerModel::Chanel& chanel, int& p1, int& p2)
{
	m_linkmanager->GetLink(chanel,p1,p2);
}

void TransputerModel::GetFirstLink(TransputerModel::Chanel& chanel, int& p1, int& p2,int activeprocess)
{
	m_linkmanager->GetFirstLink(GetChanelID(chanel.name),p1,p2,activeprocess);
}

bool TransputerModel::VerifyRoute(int chanel)
{
	int p1 = m_processes[GetProcessID(m_chanels[chanel].proc1)].proc_number;
	int p2 = m_processes[GetProcessID(m_chanels[chanel].proc2)].proc_number;
	if(p1<0||p1>=GetProcessorCount())
		return true;
	if(p2<0||p2>=GetProcessorCount())
		return true;
	std::vector<int>& v = m_chanels[chanel].route;
	for(int i=0;i<(int)v.size();i++)
	{
		if(v[i]<0||v[i]>=GetProcessorCount())
			return false;
		if(v[i]==p1 || v[i]==p2)
			return false;
	}
	for(int i=0;i<(int)v.size();i++)
		for(int j=i+1;j<(int)v.size();j++)
		{
			if(v[i]==v[j])
				return false;
		}
	for(int pos = p1,i=0;i<(int)v.size()+1;i++)
	{
		if(!m_topology->HasLink(pos,v.size()==i?p2:v[i]))
			return false;
		pos = v.size()==i?p2:v[i];
	}
	return true;
}

void TransputerModel::DoRouting(int chanel)
{
	int p1 = m_processes[GetProcessID(m_chanels[chanel].proc1)].proc_number;
	int p2 = m_processes[GetProcessID(m_chanels[chanel].proc2)].proc_number;
	std::vector<int> v;
	for(;p1!=p2;)
	{
		p1 = m_topology->GetNextLink(p1,p2);
		if(p1==p2)
			break;
		v.push_back(p1);
	}
	m_chanels[chanel].route = v;
}

void Transputer::PostClock(void)
{
	if(m_finished)
		return;
	if(m_active==-1)
	{
		if(m_highready.size())
		{
			m_active = m_highready.front();
			if(m_highready.size()==1)
				m_highready.pop_back();
			else
				m_highready.erase(m_highready.begin());			
		}	
		else if (m_lowready.size())
		{
			m_active = m_lowready.front();
			if(m_lowready.size()==1)
				m_lowready.pop_back();
			else
				m_lowready.erase(m_lowready.begin());			
		}
	}
}
