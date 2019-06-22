#pragma once
#include <hash_set>
#include <vector>
#include <string>

class Transputer;

class LinkManager;

class ITopology
{
public:
	virtual int Count()=0;
	virtual int Width()=0;
	virtual int Height()=0;
	virtual bool HasLink(int p1,int p2)=0;
	virtual bool IsLinkVirtual()=0;
	virtual int GetLinkID(int p1,int p2)=0;
	virtual int GetLinkCount()=0;
	virtual int GetNextLink(int p1,int p2)=0;
};

class ITransputerParam
{
public:
	typedef std::vector<std::pair<std::string,std::string> > Dictionary;
	virtual int GetCount()=0;
	virtual bool GetValue(const std::string& name,std::string& value)=0;
	virtual bool GetValue(int num,std::string& value)=0;
	virtual bool GetName(int num,std::string& value)=0;
	virtual bool SetValue(const std::string& name,std::string& value)=0;
	virtual bool SetValue(int num,std::string& value)=0;
	virtual void SetValues(Dictionary& params)=0;
	virtual void GetValues(Dictionary& params)=0;
	virtual int GetTopology()=0;
	virtual ~ITransputerParam(){};
};

class TransputerModel
{
	friend Transputer;
	friend LinkManager;
public:
	HWND m_handle;
	HANDLE m_mutex;
	enum NOTIFICATION{ON_PROCESS_CHANGE=1,ON_PROCESS_COUNT_CHANGE=2,ON_CHANEL_CHANGE=4,ON_CHANEL_COUNT_CAHANGE=8,ON_PROGRAM_CHANGE=0x10,ON_PROGRAM_LINES_CHANGE=0x20};
	struct EventFinished{};
	struct EventDeadlock{};
	struct ProgramLine
	{
		ProgramLine():execution(0),transmition(0),direction(0){}
		int execution;
		int transmition;
		bool direction;
		std::string chanel;
	};
	struct Process
	{
		std::string name;
		int priority;
        int proc_number;
		std::vector<ProgramLine> m_program;
		bool operator<(const Process& rhs);
		int cur_block;
		int exec_left,trans_left;
		bool is_writing;
		int way_point;
	};
	struct Chanel
	{
		std::string name;
		std::string proc1;
		std::string proc2;
		std::vector<int>route;
		bool operator<(const Chanel& rhs);
	};
	TransputerModel();
	~TransputerModel(void);
	int AddProcess(Process& process);
	bool DeleteProcess(std::string& name);
	int GetProcessCount();
	Process& GetProcess(int i);
protected:
	int m_max_clocks;
	stdext::hash_set<std::string> m_proc_names;
	std::vector<Process> m_processes;
	stdext::hash_set<std::string> m_chanel_names;
	std::vector<Chanel> m_chanels;
	std::vector<Transputer>m_processors;
	bool m_loaded,m_running;
	LinkManager* m_linkmanager;
	std::string VerifyChanel(int chanel_id);
	int m_clocks;
	ITopology* m_topology;
public:
	int GetClocks();
	void SetTopology(ITopology* topology){delete m_topology;m_topology=topology;}
	std::string GetNewProcessName(void);
	bool SetProcessName(int id, std::string& name);
	std::string GetNewChanelName(void);
	int AddChanel(Chanel& chanel);
	Chanel& GetChanel(int id);
	int GetProcessID(std::string& name);
	bool DeleteChanel(std::string& name);
	int GetChanelCount(void);
	bool SetChanelName(int id,std::string& name);
	bool DeleteProgramLine(std::string& process, int line);
	bool InsertProgramLine(std::string& process, int line);
	bool IsLoaded();
	void Load();
	void Stop();
	bool Verify(std::vector<std::string>& errors,std::vector<std::string>& warnings);
	int GetChanelID(std::string& name);
	int GetProcessorCount();
	bool Clock();
	void Clear(void);
	bool IsProcessActive(int id);
	bool IsProcessReady(int id);
	bool IsProcessWaiting(int id);
	bool IsProcessTransmiting(int id);
	bool IsProcessWriting(int id);
	bool IsProcessReading(int id);
	bool IsProcessFinished(int id);
	int GetProcessActiveBlock(int id);
	int GetProcessBlockTimeLeft(int id);
	int GetActiveProces(int proc_num);
	bool CanQueryState();
	int GetActiveChanel(int p1, int p2);
	int GetHalfActiveChanel(int p1, int p2,int& activeproc);
	void GetHighQueue(std::vector<int>& process, int proc_num);
	void GetLowQueue(std::vector<int>& process, int proc_num);
	void GetWaitingQueue(std::vector<int>& process, int proc_num);
	static UINT Start(LPVOID p);
	static UINT Step(LPVOID p);
	void Run();
	void DoStep();
	void Pause(void);
	ITopology* GetTopology(void);
	void GetLink(TransputerModel::Chanel& chanel, int& p1, int& p2);
	void GetFirstLink(TransputerModel::Chanel& chanel, int& p1, int& p2,int activeprocess);
	bool VerifyRoute(int chanel);
	void DoRouting(int chanel);
};

class LinkManager
{
public:
	LinkManager(TransputerModel* parent):m_parent(parent){};
	bool Shedule(int process);
	std::vector<int> m_chanels;
	std::vector<int> m_ready;
	std::vector<int> m_active;
	std::vector<int> m_halfactive;
	TransputerModel* m_parent;
	bool Clock();
	void GetLink(TransputerModel::Chanel& chanel,int& p1,int& p2);
	int GetLink(TransputerModel::Chanel& chanel);
	int GetFirstLink(int chanel,int process);
	void GetFirstLink(int chanel,int& proc1,int& proc2,int process);
};

class Transputer
{
public:
	Transputer(TransputerModel* parent);
	std::vector<TransputerModel::Process*> m_processes;
	int m_id;
	bool Clock();
	TransputerModel* m_parent;
	bool m_has_event,m_finished;
	int m_active;
	std::vector<int> m_highready;
	std::vector<int> m_lowready;
	std::vector<int> m_waiting;
	std::vector<int> m_all;
	bool Shedule(int proc_id);
	void PostClock(void);
};
