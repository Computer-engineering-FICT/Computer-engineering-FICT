#pragma once
#include "Grid/GridCtrl.h"
#include "TransputerDoc.h"
#include "Global.h"
#include "Grid/InplaceList.h"
#include "resource.h"
struct ProcessDataSource:public CGridCtrl::DefDataModel
{
	CTransputerDoc* m_doc;
	ProcessDataSource(CTransputerDoc* doc):m_doc(doc)
	{
		Global::GetNotifyManager()->Register(
			Global::ON_PROCESS_COUNT_CHANGE
			,Delegate(this,(Delegate::FUNC)OnChangeRowCount));
	}
	virtual ~ProcessDataSource()
	{
		Global::GetNotifyManager()->Release(
			Global::ON_PROCESS_COUNT_CHANGE
			,Delegate(this,(Delegate::FUNC)OnChangeRowCount));
	}
	virtual IClone* Clone()
	{
		ProcessDataSource* res = new ProcessDataSource(m_doc);
		res->m_grid = m_grid;
		return res;
	}
	int OnChangeRowCount(void*)
	{
		if(!m_doc)
			return 0;
		m_grid->SetRowCount(m_doc->GetProcessCount()+1);
		return 0;
	}
	virtual void InsertRow()
	{
		m_grid->GetParent()->SendMessage(WM_COMMAND,ID_PROCESS_ADD,0);
	}
	virtual void DeleteRow()
	{
		m_grid->GetParent()->SendMessage(WM_COMMAND,ID_PROCESS_DELETE,0);
	}
	virtual void GetText(CString& text,int row,int col)
	{
		if(col==0)
		{
			text="";
			return;
		}
		if(row==0)
		{
			switch(col)
			{
			case 1: text="Name";break;
			case 2: text="Priority";break;
			case 3: text="Transputer";break;
			}
			return;
		}
		row--;
		if(m_doc->GetProcessCount()<=row)
		{
//			ASSERT(FALSE);
			return;
		}
		switch(col)
		{
		case 1:text = m_doc->GetProcessName(row);break;
		case 2:text = m_doc->GetProcessPriority(row)?"1 - High":"0 - Low";break;
		case 3:text.Format("%d",m_doc->GetProcNumber(row));break;
		}
	}
	virtual void SetText(CString& text,int row,int col)
	{
		if(row>m_doc->GetProcessCount())
			return;
		row--;
		switch(col)
		{
		case 1:
			if(text.IsEmpty())
				return;
			if(!m_doc->SetProcessName(row,text))
			{
				CString s;
				s.Format("Process with name '%s' name already exist.",text);
				AfxMessageBox(s,MB_OK,0);
			}
			return;			
		case 2:
			if(text=="1 - High")m_doc->SetProcessPriority(row,1);
			if(text=="0 - Low")m_doc->SetProcessPriority(row,0);
			return;
		case 3:
			{
				char c;int n;
				if(sscanf(text.GetString(),"%d%c",&n,&c)!=1)
					return;
				m_doc->SetProcNumber(row,n);
				return;
			}
		}

	}
	virtual BOOL ValidateEdit(LPCTSTR str,int row,int col)
	{
		return true;
	}
	virtual void Init(CGridCtrl* parent)
	{
		DefDataModel::Init(parent);
		m_grid->SetFixedColumnCount(1);
		m_grid->SetColumnCount(4);
		m_grid->SetColumnWidth(0,10);
		m_grid->SetRowCount(0);
		m_grid->SetFixedRowCount(1);
		OnChangeRowCount(NULL);
	}
	virtual BOOL Edit(int nRow,int nCol,CRect& rect,CPoint& point,unsigned char nChar)
	{
		if ( m_edit_cell!=CCellID() )
		{      
			return CGridCtrl::DefDataModel::Edit(nRow,nCol,rect,point,nChar);
		}  
		else  
		{   	
			if(nCol!=2)
			{
				return CGridCtrl::DefDataModel::Edit(nRow,nCol,rect,point,nChar);
			}
			m_edit_cell = CCellID(nRow,nCol);	
			// InPlaceEdit auto-deletes itself
			CGridCtrl* pGrid = GetGrid();
			CString s;
			GetText(s,nRow,nCol);
			CStringArray arr;
			arr.SetSize(2);
			arr[0]="1 - High";arr[1]="0 - Low";
			m_pEditWnd = new CInPlaceList(pGrid, rect, CBS_SORT|CBS_DROPDOWNLIST, IDC_INPLACE_CONTROL, nRow, nCol, arr,s, nChar);
		}
		return TRUE;
	}
};


struct ChanelDataSource:public CGridCtrl::DefDataModel
{
	CTransputerDoc* m_doc;
	ChanelDataSource(CTransputerDoc* doc):m_doc(doc)
	{
		Global::GetNotifyManager()->Register(
			Global::ON_CHANEL_COUNT_CHANGE
			,Delegate(this,(Delegate::FUNC)OnChangeRowCount));
	}
	virtual ~ChanelDataSource()
	{
		Global::GetNotifyManager()->Release(
			Global::ON_CHANEL_COUNT_CHANGE
			,Delegate(this,(Delegate::FUNC)OnChangeRowCount));
	}
	virtual IClone* Clone()
	{
		ChanelDataSource* res = new ChanelDataSource(m_doc);
		res->m_grid = m_grid;
		return res;
	}
	int OnChangeRowCount(void*)
	{
		if(!m_doc)
			return 0;
		m_grid->SetRowCount(m_doc->GetChanelCount()+1);
		return 0;
	}
	virtual void InsertRow()
	{
		m_grid->GetParent()->SendMessage(WM_COMMAND,ID_CHANEL_ADD,0);
	}
	virtual void DeleteRow()
	{
		m_grid->GetParent()->SendMessage(WM_COMMAND,ID_CHANEL_DELETE,0);
	}
	virtual void GetText(CString& text,int row,int col)
	{
		if(col==0)
		{
			text="";
			return;
		}
		if(row==0)
		{
			switch(col)
			{
			case 1: text="Name";break;
			case 2: text="Process 1";break;
			case 3: text="Process 2";break;
			case 4: text="Route";break;
			}
			return;
		}
		row--;
		if(m_doc->GetChanelCount()<=row)
		{
//			ASSERT(FALSE);
			return;
		}
		switch(col)
		{
		case 1:text = m_doc->GetChanelName(row);break;
		case 2:text = m_doc->GetChanelProc1(row);break;
		case 3:text = m_doc->GetChanelProc2(row);break;
		case 4:text=m_doc->GetRoute(row);break;
		}
	}
	virtual void SetText(CString& text,int row,int col)
	{
		if(row>m_doc->GetChanelCount())
			return;
		row--;
		switch(col)
		{
		case 1:
			if(text.IsEmpty())
				return;
			if(!m_doc->SetChanelName(row,text))
			{
				CString s;
				s.Format("Process with name '%s' name already exist.",text);
				AfxMessageBox(s,MB_OK,0);
			}
			return;			
		case 2:
				m_doc->SetProc1Name(row,text);
			return;
		case 3:
				m_doc->SetProc2Name(row,text);
				return;
		case 4:
			{
				if(!m_doc->SetRoute(row,text))
				{
					CString s;
					s.Format("Bad route.",text);
					AfxMessageBox(s,MB_OK,0);
				}
				return;
			}
		}

	}
	virtual BOOL ValidateEdit(LPCTSTR str,int row,int col)
	{
		return true;
	}
	virtual void Init(CGridCtrl* parent)
	{
		DefDataModel::Init(parent);
		m_grid->SetFixedColumnCount(1);
		m_grid->SetColumnCount(5);
		m_grid->SetColumnWidth(0,10);
		m_grid->SetRowCount(0);
		m_grid->SetFixedRowCount(1);
		OnChangeRowCount(NULL);
	}
	virtual BOOL Edit(int nRow,int nCol,CRect& rect,CPoint& point,unsigned char nChar)
	{
		if ( m_edit_cell!=CCellID() )
		{      
			return CGridCtrl::DefDataModel::Edit(nRow,nCol,rect,point,nChar);
		}  
		else  
		{   	
			if(nCol==1||nCol==4)
			{
				return CGridCtrl::DefDataModel::Edit(nRow,nCol,rect,point,nChar);
			}
			m_edit_cell = CCellID(nRow,nCol);	
			// InPlaceEdit auto-deletes itself
			CGridCtrl* pGrid = GetGrid();
			CString s;
			GetText(s,nRow,nCol);
			CStringArray arr;
			arr.SetSize(m_doc->GetProcessCount());
			for(int i=0;i<arr.GetSize();i++)
				arr[i]=m_doc->GetProcessName(i);
			m_pEditWnd = new CInPlaceList(pGrid, rect, CBS_SORT|CBS_DROPDOWNLIST, IDC_INPLACE_CONTROL, nRow, nCol, arr,s, nChar);
		}
		return TRUE;
	}
};

struct ProgramDataSource:public CGridCtrl::DefDataModel
{
	CTransputerDoc* m_doc;
	CString m_process;
	ProgramDataSource(CTransputerDoc* doc,CString process):m_doc(doc),m_process(process)
	{
		Global::GetNotifyManager()->Register(
			Global::ON_PROGRAM_LINE_COUNT_CHANGE
			,Delegate(this,(Delegate::FUNC)OnChangeRowCount));
	}
	virtual ~ProgramDataSource()
	{
		Global::GetNotifyManager()->Release(
			Global::ON_PROGRAM_LINE_COUNT_CHANGE
			,Delegate(this,(Delegate::FUNC)OnChangeRowCount));
	}
	virtual IClone* Clone()
	{
		ProgramDataSource* res = new ProgramDataSource(m_doc,m_process);
		res->m_grid = m_grid;
		return res;
	}
	int OnChangeRowCount(void*)
	{
		m_grid->SetRowCount(m_doc->GetProgramLineCount(m_process)+1);
		return 0;
	}
	virtual void InsertRow()
	{
		m_grid->GetParent()->SendMessage(WM_COMMAND,ID_PROGRAM_ADD,0);
	}
	virtual void DeleteRow()
	{
		m_grid->GetParent()->SendMessage(WM_COMMAND,ID_PROGRAM_DELETE,0);
	}
	virtual void GetText(CString& text,int row,int col)
	{
		if(col==0)
		{
			text="";
			return;
		}
		if(row==0)
		{
			switch(col)
			{
			case 1: text="Block";break;
			case 2: text="Execution";break;
			case 3: text="Transmition";break;
			case 4: text="Direction";break;
			case 5: text="Chanel";break;
			}
			return;
		}
		row--;
		if(m_doc->GetProgramLineCount(m_process)<=row)
		{
//			ASSERT(FALSE);
			return;
		}
		switch(col)
		{
		case 1:text.Format("%d",row);break;
		case 2:text.Format("%d",m_doc->GetProgramExecution(m_process,row));break;
		case 3:text.Format("%d",m_doc->GetProgramTransmition(m_process,row));break;
		case 4:if(m_doc->GetProgramTransmition(m_process,row))text = m_doc->GetProgramDirection(m_process,row)?"out":"in";break;
		case 5:text = m_doc->GetProgramChanel(m_process,row);break;
		}
	}
	virtual void SetText(CString& text,int row,int col)
	{
		if(row>m_doc->GetProgramLineCount(m_process))
			return;
		row--;
		switch(col)
		{
		case 2:
		case 3:
			{
				if(text.IsEmpty())
					return;
				int n;char c;
				if(sscanf(text,"%d%c",&n,&c)!=1)
					return;
				if(col==2)
					m_doc->SetProgramExecution(m_process,row,n);
				else
					m_doc->SetProgramTransmition(m_process,row,n);
				return;			
			}
		case 4: m_doc->SetProgramDirection(m_process,row,text=="out");return;
		case 5:	m_doc->SetProgramChanel(m_process,row,text);return;
		}

	}
	virtual BOOL ValidateEdit(LPCTSTR str,int row,int col)
	{
		return true;
	}
	virtual void Init(CGridCtrl* parent)
	{
		DefDataModel::Init(parent);
		m_grid->SetFixedColumnCount(1);
		m_grid->SetColumnCount(6);
		m_grid->SetColumnWidth(0,10);
		m_grid->SetRowCount(0);
		m_grid->SetFixedRowCount(1);
		OnChangeRowCount(NULL);
	}
	virtual BOOL Edit(int nRow,int nCol,CRect& rect,CPoint& point,unsigned char nChar)
	{
		if(nCol<2)
			return FALSE;
		if ( m_edit_cell!=CCellID() )
		{      
			return CGridCtrl::DefDataModel::Edit(nRow,nCol,rect,point,nChar);
		}  
		else  
		{   	
			if(nCol!=4 && nCol != 5)
			{
				return CGridCtrl::DefDataModel::Edit(nRow,nCol,rect,point,nChar);
			}
			m_edit_cell = CCellID(nRow,nCol);	
			// InPlaceEdit auto-deletes itself
			CGridCtrl* pGrid = GetGrid();
			CString s;
			GetText(s,nRow,nCol);
			CStringArray arr;
			if(nCol == 5)
			{
				for(int i=0;i<m_doc->GetChanelCount();i++)
				{
					if(m_doc->GetChanelProc1(i)==m_process || m_doc->GetChanelProc2(i)==m_process)
						arr.Add(m_doc->GetChanelName(i));
				}
			}
			else
			{
				arr.Add("in");
				arr.Add("out");
			}
			m_pEditWnd = new CInPlaceList(pGrid, rect, CBS_SORT|CBS_DROPDOWNLIST, IDC_INPLACE_CONTROL, nRow, nCol, arr,s, nChar);
		}
		return TRUE;
	}
};

struct StateDataSource:public CGridCtrl::DefDataModel
{
	CTransputerDoc* m_doc;
	StateDataSource(CTransputerDoc* doc):m_doc(doc)
	{
		Global::GetNotifyManager()->Register(Global::ON_PROCESS_COUNT_CHANGE,Delegate(this,(Delegate::FUNC)OnChangeRowCount));
		Global::GetNotifyManager()->Register(Global::ON_DOCUMENT_CHANGE,Delegate(this,(Delegate::FUNC)OnChangeRowCount));
	}
	virtual ~StateDataSource()
	{
		Global::GetNotifyManager()->Release(Global::ON_PROCESS_COUNT_CHANGE,Delegate(this,(Delegate::FUNC)OnChangeRowCount));
		Global::GetNotifyManager()->Release(Global::ON_DOCUMENT_CHANGE,Delegate(this,(Delegate::FUNC)OnChangeRowCount));
	}
	virtual IClone* Clone()
	{
		StateDataSource* res = new StateDataSource(m_doc);
		res->m_grid = m_grid;
		return res;
	}
	int OnChangeRowCount(void*)
	{
		if(!m_doc)
			return 0;
		m_grid->SetRowCount(m_doc->GetProcessCount()+1);
		return 0;
	}
	virtual void GetText(CString& text,int row,int col)
	{
		if(col==0)
		{
			text="";
			return;
		}
		if(row==0)
		{
			switch(col)
			{
			case 1: text="Name";break;
			case 2: text="Processor";break;
			case 3: text="State";break;
			case 4: text="Block";break;
			case 5: text="Time left";break;
			case 6: text="Source";break;
			case 7: text="Destination";break;
			}
			return;
		}
		row--;
		if(m_doc->GetProcessCount()>=row)
		{
			switch(col)
			{
			case 1:text = m_doc->GetProcessName(row);break;
			case 2:text.Format("%d",m_doc->GetProcNumber(row));break;
			case 3:
				if(m_doc->IsProcessActive(row))text="active";
				else if(m_doc->IsProcessFinished(row))text="finished";
				else if(m_doc->IsProcessReady(row))text="ready";
				else if(m_doc->IsProcessWaiting(row))text="waiting";
				else if(m_doc->IsProcessWriting(row))text="writing";
				else if(m_doc->IsProcessReading(row))text="reading";break;		
			case 4:
				{
					int n = m_doc->GetProcessActiveBlock(row);
					if(n!=-1)
						text.Format("%d",n);
					break;
				}
			case 5:
				{ 
					int n = m_doc->GetProcessBlockTimeLeft(row);
					if(n!=-1)
						text.Format("%d",n);
					break;
				}
			case 6:
				{
					int n = m_doc->GetTransmitionSource(row);
					if(n!=-1)
						text.Format("%d",n);
					break;
				}
			case 7:
				{
					int n = m_doc->GetTransmitionDestination(row);
					if(n!=-1)
						text.Format("%d",n);
					break;
				}
			return;
			}
		}
	}
	virtual void Init(CGridCtrl* parent)
	{
		DefDataModel::Init(parent);
		m_grid->SetFixedColumnCount(1);
		m_grid->SetColumnCount(8);
		m_grid->SetColumnWidth(0,10);
		m_grid->SetFixedRowCount(1);
		OnChangeRowCount(NULL);
	}
	virtual BOOL Edit(int nRow,int nCol,CRect& rect,CPoint& point,unsigned char nChar)
	{
		return FALSE;
	}
};

