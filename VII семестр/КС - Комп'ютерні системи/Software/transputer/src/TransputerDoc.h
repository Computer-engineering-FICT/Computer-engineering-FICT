// TransputerDoc.h : interface of the CTransputerDoc class
//
#include "TransputerModel.h"

#pragma once

class CTransputerDoc : public CDocument
{
protected: // create from serialization only
	CTransputerDoc();
	DECLARE_DYNCREATE(CTransputerDoc)

// Attributes
public:

// Operations
public:

// Overrides
	public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);

// Implementation
public:
	virtual ~CTransputerDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif
	bool CanModify();
	int AddProcess(CString& name,int priority,int proc_num);
protected:
	ITransputerParam* m_param;
	TransputerModel m_model;	
	int m_scale;
// Generated message map functions
protected:
	DECLARE_MESSAGE_MAP()
public:
	CString GetNewProcessName(void);
	int GetProcessCount(void);
	CString GetProcessName(int id);
	void DeleteRows(std::vector<int>& rows);
	BOOL SetProcessName(int id, LPCTSTR name);
	CString GetNewChanelName(void);
	TransputerModel* GetTransputerModel(void);
	int GetProcessPriority(int id);
	int GetProcNumber(int id);
	void SetProcessPriority(int id, int priority);
	void SetProcNumber(int id, int num);
	int AddChanel(CString& name, CString& proc1, CString& proc2);
	CString GetChanelName(int id);
	CString GetChanelProc1(int id);
	CString GetChanelProc2(int id);
	void SetProc1Name(int id, CString& name);
	void SetProc2Name(int id, CString& name);
	int GetProcessID(CString& name);
	int GetChanelCount(void);
	void DeleteChanels(std::vector<int>& rows);
	BOOL SetChanelName(int row, CString& name);
	int GetProgramLineCount(CString& process);
protected:
	bool ProgramChanelName(CString& prev, CString& current);
public:
	void InsertProgramLine(CString& process,int row);
	void DeleteProgramLines(CString& process, std::vector<int>& lines);
	int GetProgramExecution(CString& process, int row);
	int GetProgramTransmition(CString& process, int row);
	CString GetProgramChanel(CString& process, int row);
	void SetProgramExecution(CString& process, int row, int time);
	void SetProgramTransmition(CString& process, int row, int time);
	void SetProgramChanel(CString& process, int row, CString& chanel);
	bool GetProgramDirection(CString& process, int row);
	void SetProgramDirection(CString& process, int row,bool direction);
	afx_msg void OnDebugClock();
	bool VerifyModel();
	BOOL IsProcessActive(int id);
	BOOL IsProcessReady(int id);
	BOOL IsProcessWaiting(int id);
	BOOL IsProcessTransmiting(int id);
	BOOL IsProcessWriting(int id);
	BOOL IsProcessReading(int id);
	BOOL IsProcessFinished(int id);
	int GetProcessActiveBlock(int id);
	int GetProcessBlockTimeLeft(int id);
	afx_msg void OnDebugStop();
	CString GetActive(int id);
	CString GetMemoryState(int proc_num);
	CString GetHighQueue(int proc_num);
	CString GetLowQueue(int proc_num);
	CString GetWaitingQueue(int proc_num);
	CString GetLinkState(int proc1, int proc2, bool first);
	afx_msg void OnDebugPause();
	afx_msg void OnDebugRun();
	CString GetTickCount(bool force = false);
	int GetScale();
	void SetScale(int scale);
	ITransputerParam* GetTopologyParam(void);
	void SetTopologyParam(int type,ITransputerParam::Dictionary& dict);
	CString GetRoute(int row);
	bool SetRoute(int row, CString& text);
	void ClearAllRoutes(void);
	void DoDefaultRouting(void);
	afx_msg void OnDebugNext();
	int GetTransmitionSource(int process);
	int GetTransmitionDestination(int process);
	virtual void OnCloseDocument();
};
