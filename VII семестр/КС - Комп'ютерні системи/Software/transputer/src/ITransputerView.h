#pragma once
#include "TransputerModel.h"

class ITransputerView
{
public:
	virtual void Draw(CDC* pDC)=0;
	virtual void SetScale(int scale)=0;
	virtual CSize GetPlotSize()=0;
};

class SimpleTransputerView:public ITransputerView
{
protected:
	CDC* m_dc;
	int m_scale;
	CFont m_font,m_boldfont;
	TransputerModel* m_model;
	CString GetMemoryState(int proc);
	CString GetLinkState(int proc1,int proc2,bool right);
	CString GetActive(int proc);
	CString GetLowQueue(int proc);
	CString GetHighQueue(int proc);
	CString GetWaitingQueue(int proc);
	virtual bool GetLinkTextOffset(CPoint& p,bool& right,int proc1,int proc2);
	virtual bool GetTransputerOffset(CPoint& p,int proc);
	virtual void DrawLink(int proc1,int proc2);
	virtual void DrawTransputer(int i);	
	virtual void DrawLinkText(int proc1,int proc2);
	void Scale(CPoint& p);
	void GetRightTextOffset(CPoint& p,bool& right,int proc);
	void GetLeftTextOffset(CPoint& p,bool& right,int proc);
	void GetTopTextOffset(CPoint& p,bool& right,int proc);
	void GetBottomTextOffset(CPoint& p,bool& right,int proc);
public:
	virtual void Draw(CDC* pDC);
	virtual void SetScale(int scale);
	virtual CSize GetPlotSize();
	SimpleTransputerView(TransputerModel* model);
	virtual ~SimpleTransputerView(void);
};

class CircleTransputerView:public SimpleTransputerView
{
protected:
	virtual bool GetLinkTextOffset(CPoint& p,bool& right,int proc1,int proc2);
	virtual bool GetTransputerOffset(CPoint& p,int proc);
	virtual void DrawLink(int proc1,int proc2);
public:
	virtual CSize GetPlotSize();
	CircleTransputerView(TransputerModel* model);
};

class TorTransputerView:public SimpleTransputerView
{
protected:
	virtual bool GetLinkTextOffset(CPoint& p,bool& right,int proc1,int proc2);
	virtual bool GetTransputerOffset(CPoint& p,int proc);
	virtual void DrawLink(int proc1,int proc2);
public:
	virtual CSize GetPlotSize();
	TorTransputerView(TransputerModel* model);
};

class StarTransputerView:public SimpleTransputerView
{
protected:
	virtual bool GetLinkTextOffset(CPoint& p,bool& right,int proc1,int proc2);
	virtual bool GetTransputerOffset(CPoint& p,int proc);
	virtual void DrawLink(int proc1,int proc2);
public:
	virtual CSize GetPlotSize();
	StarTransputerView(TransputerModel* model);
};
