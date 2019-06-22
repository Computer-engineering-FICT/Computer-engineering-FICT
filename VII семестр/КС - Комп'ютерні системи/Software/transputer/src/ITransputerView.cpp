#include "StdAfx.h"
#include ".\itransputerview.h"

#define TRANSPUTER_WIDTH 600
#define TRANSPUTER_HEIGHT 800
#define MARGIN_Y 50
#define MARGIN_X 50
#define LINE_STEP 15

SimpleTransputerView::SimpleTransputerView(TransputerModel* model):m_model(model)
{
	m_font.CreatePointFont(100,"Times New Roman");
	LOGFONT lf;
	m_font.GetLogFont(&lf);
	lf.lfWeight = FW_BOLD;
	m_boldfont.CreateFontIndirect(&lf);
}

SimpleTransputerView::~SimpleTransputerView(void)
{
}

CString SimpleTransputerView::GetMemoryState(int proc)
{
	if(!m_model->CanQueryState())
		return CString();
	int activeproc=-1;
	int phis1=-1,phis2=-1;
	int ch = m_model->GetActiveChanel(proc,proc);
	if(ch==-1)
	{
		ch = m_model->GetHalfActiveChanel(proc,proc,activeproc);
		if(ch==-1)
			return CString();
		m_model->GetFirstLink(m_model->GetChanel(ch),phis1,phis2,activeproc);
	}
	if(ch==-1)
		return CString();
	CString s="";
	int proc1 = m_model->GetProcessID(m_model->GetChanel(ch).proc1);
	int proc2 = m_model->GetProcessID(m_model->GetChanel(ch).proc2);
	if(m_model->IsProcessTransmiting(proc1))
	{
		s+=(m_model->GetProcess(proc1).name+" ").c_str();
		s+=m_model->IsProcessReading(proc1)?"? ":"! ";
	}
	if(m_model->IsProcessTransmiting(proc2))
	{
		s+=m_model->IsProcessReading(proc2)?"? ":"! ";
		s+=(m_model->GetProcess(proc2).name+" ").c_str();	
	}
	return s;
}

CString SimpleTransputerView::GetLinkState(int proc1,int proc2,bool right)
{
	if(!m_model->CanQueryState())
		return CString();
	int ch = m_model->GetActiveChanel(proc1,proc2);
	int activeproc=-1;
	int phis1=-1,phis2=-1;
	if(ch==-1)
	{
		ch = m_model->GetHalfActiveChanel(proc1,proc2,activeproc);
		if(ch==-1)
			return CString();
		m_model->GetFirstLink(m_model->GetChanel(ch),phis1,phis2,activeproc);
	}
	if(ch==-1)
		return CString();
	int p1 = m_model->GetProcessID(m_model->GetChanel(ch).proc1);
	int p2 = m_model->GetProcessID(m_model->GetChanel(ch).proc2);
	if(phis1==-1)
		m_model->GetLink(m_model->GetChanel(ch),phis1,phis2);
	if(phis1!=proc1)
	{
		int t = proc1;
		proc1 = proc2;
		proc2 = t;
		p1 = p2;
	}
	if(phis1 != proc1 || phis2 != proc2)
		return CString();
	if(activeproc!=p1&&activeproc!=-1)
		return CString();		
	CString s = m_model->GetProcess(p1).name.c_str();
	if(!right)
		s+= m_model->IsProcessReading(p1)?" ?":" !";
	else
		s = (m_model->IsProcessReading(p1)?"? ":"! ") + s;
	return s;
}

CString SimpleTransputerView::GetActive(int proc)
{
	if(!m_model->CanQueryState())
		return "";
	int id = m_model->GetActiveProces(proc);
	if(id==-1)
		return "";
	return m_model->GetProcess(id).name.c_str();
}

CString SimpleTransputerView::GetWaitingQueue(int proc)
{
	if(!m_model->CanQueryState())
		return "";
	std::vector<int> v;
	m_model->GetWaitingQueue(v,proc);
	CString s;
	for(int i=0;i<(int)v.size();i++)
	{
		if(i)
			s+="; ";
		s+=m_model->GetProcess(v[i]).name.c_str();
	}
	return s;
}

CString SimpleTransputerView::GetLowQueue(int proc)
{
	if(!m_model->CanQueryState())
		return "";
	std::vector<int> v;
	m_model->GetLowQueue(v,proc);
	CString s;
	for(int i=0;i<(int)v.size();i++)
	{
		if(i)
			s+="; ";
		s+=m_model->GetProcess(v[i]).name.c_str();
	}
	return s;
}

CString SimpleTransputerView::GetHighQueue(int proc)
{
	if(!m_model->CanQueryState())
		return "";
	std::vector<int> v;
	m_model->GetHighQueue(v,proc);
	CString s;
	for(int i=0;i<(int)v.size();i++)
	{
		if(i)
			s+="; ";
		s+=m_model->GetProcess(v[i]).name.c_str();
	}
	return s;
}

void SimpleTransputerView::GetRightTextOffset(CPoint& p,bool& right,int proc)
{
	GetTransputerOffset(p,proc);
	p.Offset(TRANSPUTER_WIDTH,TRANSPUTER_HEIGHT/2);
	Scale(p);
	p.x+=3;
	p.y-=LINE_STEP+5;
	right=false;
}

void SimpleTransputerView::GetLeftTextOffset(CPoint& p,bool& right,int proc)
{
	GetTransputerOffset(p,proc);
	p.Offset(0,TRANSPUTER_HEIGHT/2);
	Scale(p);
	p.x-=3;
	p.y+=LINE_STEP-5;
	right=true;
}

void SimpleTransputerView::GetTopTextOffset(CPoint& p,bool& right,int proc)
{
	GetTransputerOffset(p,proc);
	p.Offset(TRANSPUTER_WIDTH/2,0);
	Scale(p);
	p.x+=3;
	p.y-=LINE_STEP+5;
	right=false;
}

void SimpleTransputerView::GetBottomTextOffset(CPoint& p,bool& right,int proc)
{
	GetTransputerOffset(p,proc);
	p.Offset(TRANSPUTER_WIDTH/2,TRANSPUTER_HEIGHT);
	Scale(p);
	p.x-=3;
	p.y+=5;
	right=true;
}

bool SimpleTransputerView::GetLinkTextOffset(CPoint& p,bool& right,int proc1,int proc2)
{
	if(proc1==0&&proc2==1)
	{
		GetRightTextOffset(p,right,proc1);
		return true;
	}
	if(proc1==1&&proc2==0)
	{
		GetLeftTextOffset(p,right,proc1);
		return true;
	}
	return false;	
}

bool SimpleTransputerView::GetTransputerOffset(CPoint& p,int proc)
{
	switch(proc)
	{
	case 0:
		p.x=0;
		p.y=0;
		return true;
	case 1:
		p.x=TRANSPUTER_WIDTH+TRANSPUTER_WIDTH/2;
		p.y=0;
		return true;
	}
	return false;
}


void SimpleTransputerView::DrawLink(int proc1,int proc2)
{
	int dc_id = m_dc->SaveDC();
	if(proc1==0&&proc2==1)
	{
		CPen frame(PS_SOLID,3,RGB(172,168,153));
		m_dc->SelectObject(frame);
		CPoint p;
		GetTransputerOffset(p,0);
		p.Offset(TRANSPUTER_WIDTH,TRANSPUTER_HEIGHT/2);
		Scale(p);
		m_dc->MoveTo(p);
		GetTransputerOffset(p,1);
		p.Offset(0,TRANSPUTER_HEIGHT/2);
		Scale(p);
		m_dc->LineTo(p);		
	}
	m_dc->RestoreDC(dc_id);
}

void SimpleTransputerView::DrawTransputer(int id)
{
	CPoint offset;
	if(!GetTransputerOffset(offset,id))
		return;
	CRect r(offset,CSize(TRANSPUTER_WIDTH,TRANSPUTER_HEIGHT));
	r = r.MulDiv(m_scale,100);
	r.OffsetRect(MARGIN_X,MARGIN_Y);
	CPen frame(PS_SOLID,1,RGB(172,168,153));
	CBrush brush(RGB(245,242,225));
	CBrush wbrush(RGB(255,255,255));
	int dc_id = m_dc->SaveDC();
	m_dc->SelectObject(frame);
	m_dc->SelectObject(brush);
	m_dc->Rectangle(r);

	if(m_scale<5)
	{
		m_dc->RestoreDC(dc_id);
		return;
	}
	CRect rect(r);
	rect.bottom = rect.top + 30;
	CString str;
	str.Format("%d",id);
	m_dc->SelectObject(m_boldfont);
	m_dc->SetBkMode(TRANSPARENT);
	m_dc->DrawText(str,&rect,DT_VCENTER|DT_CENTER|DT_SINGLELINE);
	
	if(m_scale<20)
	{
		m_dc->RestoreDC(dc_id);
		return;
	}
	rect.top = r.top+30;
	rect.bottom = rect.top+20;
	rect.left = r.left + 10;
	rect.right = rect.left + 50;
	m_dc->SelectObject(m_font);
	m_dc->SelectObject(wbrush);
	str = "Active";
	m_dc->DrawText(str,&rect,DT_VCENTER|DT_SINGLELINE);
	rect.left = rect.right;
	rect.right = r.right - 20;
	m_dc->Rectangle(rect);
	str = GetActive(id);
	m_dc->DrawText(str,&rect,DT_VCENTER|DT_SINGLELINE|DT_CENTER|DT_END_ELLIPSIS);

	rect.top = rect.top+30;
	rect.bottom = rect.top+20;
	rect.left = r.left + 10;
	rect.right = rect.left + 50;
	str = "Memory";
	m_dc->DrawText(str,&rect,DT_VCENTER|DT_SINGLELINE);
	rect.left = rect.right;
	rect.right = r.right - 20;
	m_dc->Rectangle(rect);
	str = GetMemoryState(id);
	m_dc->DrawText(str,&rect,DT_VCENTER|DT_SINGLELINE|DT_CENTER|DT_END_ELLIPSIS);

	if(m_scale<30)
	{
		m_dc->RestoreDC(dc_id);
		return;
	}

	rect.top = rect.top+30;
	rect.bottom = rect.top+20;
	rect.left = r.left + 10;
	rect.right = r.right - 20;
	str = "High priority queue";
	m_dc->DrawText(str,&rect,DT_VCENTER|DT_SINGLELINE);
	int hgt = (r.bottom - rect.top - 20)/3;
	rect.bottom = hgt + rect.top;
	rect.top = rect.top+20;
	rect.left = r.left+30;
	rect.right = r.right - 20;
	m_dc->Rectangle(rect);
	str = GetHighQueue(id);
	rect.DeflateRect(5,5);
	m_dc->DrawText(str,&rect,DT_WORDBREAK);
	rect.InflateRect(5,5);

	rect.top =rect.bottom+5;
	rect.bottom = rect.top+20;
	rect.left = r.left + 10;
	rect.right = r.right - 20;
	str = "Low priority queue";
	m_dc->DrawText(str,&rect,DT_VCENTER|DT_SINGLELINE);
	rect.bottom = hgt + rect.top;
	rect.top = rect.top+20;
	rect.left = r.left+30;
	rect.right = r.right - 20;
	m_dc->Rectangle(rect);
	str = GetLowQueue(id);
	rect.DeflateRect(5,5);
	m_dc->DrawText(str,&rect,DT_WORDBREAK);
	rect.InflateRect(5,5);

	rect.top =rect.bottom+5;
	rect.bottom = rect.top+20;
	rect.left = r.left + 10;
	rect.right = r.right - 20;
	str = "Waiting for I/O";
	m_dc->DrawText(str,&rect,DT_VCENTER|DT_SINGLELINE);
	rect.bottom = hgt + rect.top;
	rect.top = rect.top+20;
	rect.left = r.left+30;
	rect.right = r.right - 20;
	m_dc->Rectangle(rect);
	str = GetWaitingQueue(id);
	rect.DeflateRect(5,5);
	m_dc->DrawText(str,&rect,DT_WORDBREAK);
	rect.InflateRect(5,5);

	m_dc->RestoreDC(dc_id);	
}

void SimpleTransputerView::DrawLinkText(int proc1,int proc2)
{
	if(m_scale<30)
		return;
	CPoint p1,p2;

	bool right;
	if(!GetLinkTextOffset(p1,right,proc1,proc2))
		return;
	p2=p1;
	int off = TRANSPUTER_WIDTH*m_scale/100;
	off*=40;off/=100;
	if(right)
		p1.x-=off;
	else
		p2.x+=off;
	p2.y+=LINE_STEP;
	CRect rect(p1,p2);
	CString str = GetLinkState(proc1,proc2,right);
	if(str.IsEmpty())
		return;
	int dc_id = m_dc->SaveDC();
	m_dc->SelectObject(m_font);
	m_dc->SetBkMode(TRANSPARENT);
	m_dc->DrawText(str,&rect,DT_SINGLELINE|DT_END_ELLIPSIS|(right?DT_RIGHT:DT_LEFT));
	m_dc->RestoreDC(dc_id);
}

void SimpleTransputerView::Draw(CDC* pDC)
{
	m_dc = pDC;
	for(int i=0;i<m_model->GetProcessorCount();i++)
		for(int j=0;j<m_model->GetProcessorCount();j++)
		{
			if(i==j)
				continue;
			DrawLinkText(i,j);
		}
	for(int i=0;i<m_model->GetProcessorCount();i++)
		for(int j=i+1;j<m_model->GetProcessorCount();j++)
			DrawLink(i,j);
	for(int i=0;i<m_model->GetProcessorCount();i++)
	{
		DrawTransputer(i);
	}
}

void SimpleTransputerView::SetScale(int scale)
{
	m_scale=scale;
}

CSize SimpleTransputerView::GetPlotSize()
{
	CPoint sz(2*TRANSPUTER_WIDTH+TRANSPUTER_WIDTH/2,TRANSPUTER_HEIGHT);
	Scale(sz);
	sz.Offset(MARGIN_X,MARGIN_Y);
	return sz;
}

void SimpleTransputerView::Scale(CPoint& p)
{
	p.x*=m_scale;
	p.y*=m_scale;
	p.x/=100;
	p.y/=100;
	p.x+=MARGIN_X;
	p.y+=MARGIN_Y;
}

CircleTransputerView::CircleTransputerView(TransputerModel* model):SimpleTransputerView(model)
{
}

bool CircleTransputerView::GetLinkTextOffset(CPoint& p,bool& right,int proc1,int proc2)
{
	int w = (m_model->GetProcessorCount()+1)/2;
	if(proc1+1==proc2 || proc1==m_model->GetProcessorCount()-1&&proc2==0)
	{
		if(proc1<w)
		{
			GetRightTextOffset(p,right,proc1);
			return true;
		}
		else
		{
			GetLeftTextOffset(p,right,proc1);
			return true;
		}
	}
	if(proc2+1==proc1 || proc2==m_model->GetProcessorCount()-1&&proc1==0)
	{
		if(proc1>=w)
		{
			GetRightTextOffset(p,right,proc1);
			return true;
		}
		else
		{
			GetLeftTextOffset(p,right,proc1);
			return true;
		}
	}
	return false;	
}

bool CircleTransputerView::GetTransputerOffset(CPoint& p,int proc)
{
	int x,y;
	if(proc<0||proc>=m_model->GetProcessorCount())
		return false;
	int w = (m_model->GetProcessorCount()+1)/2;
	if(proc<w)
	{
		y=0;
		x=proc;
	}
	else
	{
		y=1;
		x=m_model->GetProcessorCount()-proc-1;
	}
	p.x = (TRANSPUTER_WIDTH+TRANSPUTER_WIDTH/2)*x+TRANSPUTER_WIDTH/2;
	p.y = (TRANSPUTER_HEIGHT+TRANSPUTER_WIDTH/2)*y;
	return true;
}

void CircleTransputerView::DrawLink(int proc1,int proc2)
{
	int dc_id = m_dc->SaveDC();
	int w = (m_model->GetProcessorCount()+1)/2;
	if(proc1==0&&proc2==m_model->GetProcessorCount()-1 || proc1==w-1&&proc2==w)
	{
		int off;
		if(!proc1)
			off = -TRANSPUTER_WIDTH/2;
		else
			off = TRANSPUTER_WIDTH+TRANSPUTER_WIDTH/2;
		CPen frame(PS_SOLID,3,RGB(172,168,153));
		m_dc->SelectObject(frame);
		CPoint p,op,p1;
		GetTransputerOffset(op,proc1);
		op.Offset(0,TRANSPUTER_HEIGHT/2);
		p=op;
		Scale(p);
		m_dc->MoveTo(p);
		op.Offset(off,0);
		p=op;
		Scale(p);
		m_dc->LineTo(p);
		GetTransputerOffset(p1,proc2);
		p1.Offset(0,TRANSPUTER_HEIGHT/2);
		op.y=p1.y;
		p =op;
		Scale(p);
		m_dc->LineTo(p);
		GetTransputerOffset(op,proc2);
		op.Offset(0,TRANSPUTER_HEIGHT/2);
		p=op;
		Scale(p);
		m_dc->LineTo(p);
	}
	else if(proc1==proc2-1)
	{
		CPen frame(PS_SOLID,3,RGB(172,168,153));
		m_dc->SelectObject(frame);
		CPoint p;
		int pr1=proc1,pr2=proc2;
		if(proc1>=w)
		{
			pr1 = proc2;
			pr2 = proc1;
		}
		GetTransputerOffset(p,pr1);
		p.Offset(TRANSPUTER_WIDTH,TRANSPUTER_HEIGHT/2);
		Scale(p);
		m_dc->MoveTo(p);
		GetTransputerOffset(p,pr2);
		p.Offset(0,TRANSPUTER_HEIGHT/2);
		Scale(p);
		m_dc->LineTo(p);
	}
	m_dc->RestoreDC(dc_id);	
}

CSize CircleTransputerView::GetPlotSize()
{
	int w = (m_model->GetProcessorCount()+1)/2;
	CPoint sz(TRANSPUTER_WIDTH*w+TRANSPUTER_WIDTH*(w+1)/2,TRANSPUTER_HEIGHT*2+TRANSPUTER_WIDTH/2);
	Scale(sz);
	sz.Offset(MARGIN_X,MARGIN_Y);
	return sz;
}

TorTransputerView::TorTransputerView(TransputerModel* model):SimpleTransputerView(model)
{
}

bool TorTransputerView::GetLinkTextOffset(CPoint& p,bool& right,int proc1,int proc2)
{
	int w = m_model->GetTopology()->Width();
	int h = m_model->GetTopology()->Height();
	int x1 = proc1%w,x2=proc2%w;
	int y1 = proc1/w,y2=proc2/w;
	if(y1==y2)
	{
		if(x1+1==x2 || x1==w-1&&x2==0)
		{
			GetRightTextOffset(p,right,proc1);
			return true;
		}
		if(x2+1==x1 || x2==w-1&&x1==0)
		{
			GetLeftTextOffset(p,right,proc1);
			return true;
		}
	}
	if(x1==x2)
	{
		if(y1+1==y2 || y1==h-1&&y2==0)
		{
			GetBottomTextOffset(p,right,proc1);
			return true;
		}
		if(y2+1==y1 || y2==h-1&&y1==0)
		{
			GetTopTextOffset(p,right,proc1);
			return true;
		}
	}
	return false;
}

bool TorTransputerView::GetTransputerOffset(CPoint& p,int proc)
{
	int w = m_model->GetTopology()->Width();
	int h = m_model->GetTopology()->Height();
	int x = proc%w;
	int y = proc/w;
	p.x = (TRANSPUTER_WIDTH+TRANSPUTER_WIDTH/2)*x+TRANSPUTER_WIDTH/2;
	p.y = (TRANSPUTER_HEIGHT+TRANSPUTER_WIDTH/2)*y+TRANSPUTER_WIDTH/2;
	return true;
}

void TorTransputerView::DrawLink(int proc1,int proc2)
{
	int w = m_model->GetTopology()->Width();
	int h = m_model->GetTopology()->Height();
	int dc_id = m_dc->SaveDC();
	if(proc2%w==0&&proc1==proc2-1)
	{
	}
	else if(proc1+1==proc2)
	{
		CPen frame(PS_SOLID,3,RGB(172,168,153));
		m_dc->SelectObject(frame);
		CPoint p;
		GetTransputerOffset(p,proc1);
		p.Offset(TRANSPUTER_WIDTH,TRANSPUTER_HEIGHT/2);
		Scale(p);
		m_dc->MoveTo(p);
		GetTransputerOffset(p,proc2);
		p.Offset(0,TRANSPUTER_HEIGHT/2);
		Scale(p);
		m_dc->LineTo(p);
	}
	else if(proc1+w==proc2)
	{
		CPen frame(PS_SOLID,3,RGB(172,168,153));
		m_dc->SelectObject(frame);
		CPoint p;
		GetTransputerOffset(p,proc1);
		p.Offset(TRANSPUTER_WIDTH/2,TRANSPUTER_HEIGHT);
		Scale(p);
		m_dc->MoveTo(p);
		GetTransputerOffset(p,proc2);
		p.Offset(TRANSPUTER_WIDTH/2,0);
		Scale(p);
		m_dc->LineTo(p);
	}
	else if(proc1%w==0&&proc2==proc1+w-1)
	{
		CPen frame(PS_SOLID,3,RGB(172,168,153));
		m_dc->SelectObject(frame);
		CPoint p,op,p1;
		GetTransputerOffset(op,proc1);
		op.Offset(0,TRANSPUTER_HEIGHT/2);
		p=op;
		Scale(p);
		m_dc->MoveTo(p);
		op.Offset(-TRANSPUTER_WIDTH/2,0);
		p=op;
		Scale(p);
		m_dc->LineTo(p);
		op.Offset(0,TRANSPUTER_HEIGHT/2+TRANSPUTER_WIDTH/4);
		p =op;
		Scale(p);
		m_dc->LineTo(p);
		GetTransputerOffset(op,proc2);
		op.Offset(TRANSPUTER_WIDTH+TRANSPUTER_WIDTH/2,TRANSPUTER_HEIGHT/2+TRANSPUTER_HEIGHT/2+TRANSPUTER_WIDTH/4);
		p=op;
		Scale(p);
		m_dc->LineTo(p);
		op.Offset(0,-TRANSPUTER_HEIGHT/2-TRANSPUTER_WIDTH/4);
		p=op;
		Scale(p);
		m_dc->LineTo(p);
		op.Offset(-TRANSPUTER_WIDTH/2,0);
		p=op;
		Scale(p);
		m_dc->LineTo(p);
	}
	else if(proc1+w*(h-1)==proc2)
	{
		CPen frame(PS_SOLID,3,RGB(172,168,153));
		m_dc->SelectObject(frame);
		CPoint p,op,p1;
		GetTransputerOffset(op,proc1);
		op.Offset(TRANSPUTER_WIDTH/2,0);
		p=op;
		Scale(p);
		m_dc->MoveTo(p);
		op.Offset(0,-TRANSPUTER_WIDTH/2);
		p=op;
		Scale(p);
		m_dc->LineTo(p);
		op.Offset(TRANSPUTER_WIDTH/2+TRANSPUTER_WIDTH/4,0);
		p =op;
		Scale(p);
		m_dc->LineTo(p);
		GetTransputerOffset(op,proc2);
		op.Offset(TRANSPUTER_WIDTH+TRANSPUTER_WIDTH/4,TRANSPUTER_HEIGHT+TRANSPUTER_WIDTH/2);
		p=op;
		Scale(p);
		m_dc->LineTo(p);
		op.Offset(-TRANSPUTER_WIDTH/2-TRANSPUTER_WIDTH/4,0);
		p=op;
		Scale(p);
		m_dc->LineTo(p);
		op.Offset(0,-TRANSPUTER_WIDTH/2);
		p=op;
		Scale(p);
		m_dc->LineTo(p);
	}
	m_dc->RestoreDC(dc_id);	
}

CSize TorTransputerView::GetPlotSize()
{
	int w = m_model->GetTopology()->Width();
	int h = m_model->GetTopology()->Height();
	CPoint sz(TRANSPUTER_WIDTH*w+TRANSPUTER_WIDTH*(w+1)/2,TRANSPUTER_HEIGHT*h+TRANSPUTER_WIDTH*(h+1)/2);
	Scale(sz);
	sz.Offset(MARGIN_X,MARGIN_Y);
	return sz;
}

StarTransputerView::StarTransputerView(TransputerModel* model):SimpleTransputerView(model)
{
}

bool StarTransputerView::GetLinkTextOffset(CPoint& p,bool& right,int proc1,int proc2)
{
	int w = (m_model->GetProcessorCount()+1)/2;
	if(proc1+1==proc2 || proc1==m_model->GetProcessorCount()-1&&proc2==0)
	{
		if(proc1<w)
		{
			GetRightTextOffset(p,right,proc1);
			return true;
		}
		else
		{
			GetLeftTextOffset(p,right,proc1);
			return true;
		}
	}
	if(proc2+1==proc1 || proc2==m_model->GetProcessorCount()-1&&proc1==0)
	{
		if(proc1>=w)
		{
			GetRightTextOffset(p,right,proc1);
			return true;
		}
		else
		{
			GetLeftTextOffset(p,right,proc1);
			return true;
		}
	}
	if(proc1<w)
	{
		GetBottomTextOffset(p,right,proc1);
		return true;
	}
	if(proc1>=w)
	{
		GetTopTextOffset(p,right,proc1);
		return true;
	}
	return false;
}

bool StarTransputerView::GetTransputerOffset(CPoint& p,int proc)
{
	int x,y;
	if(proc<0||proc>=m_model->GetProcessorCount())
		return false;
	int w = (m_model->GetProcessorCount()+1)/2;
	if(proc<w)
	{
		y=0;
		x=proc;
	}
	else
	{
		y=1;
		x=m_model->GetProcessorCount()-proc-1;
	}
	p.x = (TRANSPUTER_WIDTH+TRANSPUTER_WIDTH/2)*x+TRANSPUTER_WIDTH/2;
	p.y = (TRANSPUTER_HEIGHT+TRANSPUTER_WIDTH)*y;
	return true;
}

void StarTransputerView::DrawLink(int proc1,int proc2)
{
	int dc_id = m_dc->SaveDC();
	int w = (m_model->GetProcessorCount()+1)/2;
	if(proc1+1==proc2 || proc1==0&&proc2==m_model->GetProcessorCount()-1)
	{
		int pr = proc1;
		if(proc1==0&&proc2==m_model->GetProcessorCount()-1)
			pr = proc2;		
		CPen frame(PS_SOLID,3,RGB(172,168,153));
		m_dc->SelectObject(frame);
		CPoint p;
		if(pr<w)
		{
			GetTransputerOffset(p,pr);
			p.Offset(TRANSPUTER_WIDTH/2,TRANSPUTER_HEIGHT);
			Scale(p);
			m_dc->MoveTo(p);
			GetTransputerOffset(p,pr);
			p.Offset(TRANSPUTER_WIDTH/2,TRANSPUTER_HEIGHT+TRANSPUTER_WIDTH/4);
			Scale(p);
			m_dc->LineTo(p);
		}
		else
		{
			GetTransputerOffset(p,pr);
			p.Offset(TRANSPUTER_WIDTH/2,0);
			Scale(p);
			m_dc->MoveTo(p);
			GetTransputerOffset(p,pr);
			p.Offset(TRANSPUTER_WIDTH/2,-TRANSPUTER_WIDTH/4);
			Scale(p);
			m_dc->LineTo(p);
		}
		p = GetPlotSize();
		p.x/=2;
		p.y/=2;
		m_dc->LineTo(p);
	}
	if(proc1==m_model->GetProcessorCount()-2&&proc2==m_model->GetProcessorCount()-1)
	{
		CPen frame(PS_SOLID,3,RGB(172,168,153));
		CBrush wbrush(0xffffff);
		m_dc->SelectObject(frame);
		m_dc->SelectObject(wbrush);
		CPoint p;
		p = GetPlotSize();
		p.x/=2;
		p.y/=2;
		CPoint off(TRANSPUTER_WIDTH/3,TRANSPUTER_WIDTH/3);
		Scale(off);
		off.Offset(-MARGIN_X,-MARGIN_Y);
		CPoint p1 = p; p1.Offset(-off);
		CPoint p2 = p; p2.Offset(off);
		m_dc->Ellipse(CRect(p1,p2));
	}
	if(proc1==0&&proc2==m_model->GetProcessorCount()-1 || proc1==w-1&&proc2==w)
	{
		int off;
		if(!proc1)
			off = -TRANSPUTER_WIDTH/2;
		else
			off = TRANSPUTER_WIDTH+TRANSPUTER_WIDTH/2;
		CPen frame(PS_SOLID,3,RGB(172,168,153));
		m_dc->SelectObject(frame);
		CPoint p,op,p1;
		GetTransputerOffset(op,proc1);
		op.Offset(0,TRANSPUTER_HEIGHT/2);
		p=op;
		Scale(p);
		m_dc->MoveTo(p);
		op.Offset(off,0);
		p=op;
		Scale(p);
		m_dc->LineTo(p);
		GetTransputerOffset(p1,proc2);
		p1.Offset(0,TRANSPUTER_HEIGHT/2);
		op.y=p1.y;
		p =op;
		Scale(p);
		m_dc->LineTo(p);
		GetTransputerOffset(op,proc2);
		op.Offset(0,TRANSPUTER_HEIGHT/2);
		p=op;
		Scale(p);
		m_dc->LineTo(p);
	}
	else if(proc1+1==proc2)
	{
		CPen frame(PS_SOLID,3,RGB(172,168,153));
		m_dc->SelectObject(frame);
		CPoint p;
		int pr1=proc1,pr2=proc2;
		if(proc1>=w)
		{
			pr1 = proc2;
			pr2 = proc1;
		}
		GetTransputerOffset(p,pr1);
		p.Offset(TRANSPUTER_WIDTH,TRANSPUTER_HEIGHT/2);
		Scale(p);
		m_dc->MoveTo(p);
		GetTransputerOffset(p,pr2);
		p.Offset(0,TRANSPUTER_HEIGHT/2);
		Scale(p);
		m_dc->LineTo(p);
	}
	m_dc->RestoreDC(dc_id);	
}

CSize StarTransputerView::GetPlotSize()
{
	int w = (m_model->GetProcessorCount()+1)/2;
	CPoint sz(TRANSPUTER_WIDTH*w+TRANSPUTER_WIDTH*(w+1)/2,TRANSPUTER_HEIGHT*2+TRANSPUTER_WIDTH);
	Scale(sz);
	sz.Offset(MARGIN_X,MARGIN_Y);
	return sz;
}

