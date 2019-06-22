#include "StdAfx.h"
#include ".\graphobj.h"

#define WIDTH 200
#define HEIGHT 450
#define MARGIN 50
#define DISTANCE 100

CTransputerObj::CTransputerObj(CTransputerDoc* doc):m_scale(100),m_cnt(2),m_doc(doc)
{
	m_font.CreatePointFont(100,"Times New Roman");
	LOGFONT lf;
	m_font.GetLogFont(&lf);
	lf.lfWeight = FW_BOLD;
	m_boldfont.CreateFontIndirect(&lf);
}

CTransputerObj::~CTransputerObj(void)
{
}

CRect CTransputerObj::GetRect(int id)
{
	if(id==0)
		return CRect((MARGIN*m_scale)/100,(MARGIN*m_scale)/100,((MARGIN+WIDTH)*m_scale)/100,((MARGIN+HEIGHT)*m_scale)/100);
	if(id==1)
		return CRect(((MARGIN+WIDTH+DISTANCE)*m_scale)/100,(MARGIN*m_scale)/100,((MARGIN+2*WIDTH+DISTANCE)*m_scale)/100,((MARGIN+HEIGHT)*m_scale)/100);
	return CRect(0,0,0,0);
}

void CTransputerObj::Draw(CDC* dc)
{
	CString str;
	CBrush brush(RGB(245,242,225));
	CPen frame(PS_SOLID,1,RGB(172,168,153));
	int dc_id = dc->SaveDC();
	dc->SetTextColor(0);
	dc->SetBkMode(TRANSPARENT);
	dc->SelectObject(m_font);
	CRect r0 = GetRect(0);
	CRect r1 = GetRect(1);
	r0.left = r0.right-1;
	r0.right = r1.left+1;
	r0.top = (r0.bottom-r0.top-4)/2+r0.top;
	r0.bottom = r0.top+4;
	dc->SelectObject(frame);
	dc->SelectObject(brush);
	dc->Rectangle(r0);
	r0.top = r0.top - 15;
	r0.bottom = r0.top + 15;
	r0.right-=20;
	r0.left+=5;
	str = m_doc->GetLinkState(0,1,true);
	dc->DrawText(str,r0,DT_VCENTER|DT_SINGLELINE|DT_END_ELLIPSIS);
	r0.top+=19;
	r0.bottom = r0.top + 15;
	r0.right+=15;
	r0.left+=15;
	str = m_doc->GetLinkState(0,1,false);
	dc->DrawText(str,r0,DT_RIGHT|DT_VCENTER|DT_SINGLELINE|DT_END_ELLIPSIS);

	dc->RestoreDC(dc_id);
	for(int i=0;i<m_cnt;i++)
		Draw(dc,i);
}

void CTransputerObj::Draw(CDC* dc,int id)
{
	if(id < 0 || id > m_cnt)
		return;
	CRect r = GetRect(id);
	CPen frame(PS_SOLID,1,RGB(172,168,153));
	CBrush brush(RGB(245,242,225));
	CBrush wbrush(RGB(255,255,255));
	int dc_id = dc->SaveDC();
	dc->SelectObject(frame);
	dc->SelectObject(brush);
	dc->Rectangle(r);
	CRect rect(r);
	rect.bottom = rect.top + 30;
	CString str;
	str.Format("%d",id);
	dc->SelectObject(m_boldfont);
	dc->SetBkMode(TRANSPARENT);
	dc->DrawText(str,&rect,DT_VCENTER|DT_CENTER|DT_SINGLELINE);
	
	rect.top = r.top+30;
	rect.bottom = rect.top+20;
	rect.left = r.left + 10;
	rect.right = rect.left + 50;
	dc->SelectObject(m_font);
	dc->SelectObject(wbrush);
	str = "Active";
	dc->DrawText(str,&rect,DT_VCENTER|DT_SINGLELINE);
	rect.left = rect.right;
	rect.right = r.right - 20;
	dc->Rectangle(rect);
	str = m_doc->GetActive(id);
	dc->DrawText(str,&rect,DT_VCENTER|DT_SINGLELINE|DT_CENTER);

	rect.top = rect.top+30;
	rect.bottom = rect.top+20;
	rect.left = r.left + 10;
	rect.right = rect.left + 50;
	str = "Memory";
	dc->DrawText(str,&rect,DT_VCENTER|DT_SINGLELINE);
	rect.left = rect.right;
	rect.right = r.right - 20;
	dc->Rectangle(rect);
	str = m_doc->GetMemoryState(id);
	dc->DrawText(str,&rect,DT_VCENTER|DT_SINGLELINE|DT_CENTER);

	rect.top = rect.top+30;
	rect.bottom = rect.top+20;
	rect.left = r.left + 10;
	rect.right = r.right - 20;
	str = "High priority queue";
	dc->DrawText(str,&rect,DT_VCENTER|DT_SINGLELINE);
	int hgt = (r.bottom - rect.top - 20)/3;
	rect.bottom = hgt + rect.top;
	rect.top = rect.top+20;
	rect.left = r.left+30;
	rect.right = r.right - 20;
	dc->Rectangle(rect);
	str = m_doc->GetHighQueue(id);
	rect.DeflateRect(5,5);
	dc->DrawText(str,&rect,DT_WORDBREAK);
	rect.InflateRect(5,5);

	rect.top =rect.bottom+5;
	rect.bottom = rect.top+20;
	rect.left = r.left + 10;
	rect.right = r.right - 20;
	str = "Low priority queue";
	dc->DrawText(str,&rect,DT_VCENTER|DT_SINGLELINE);
	rect.bottom = hgt + rect.top;
	rect.top = rect.top+20;
	rect.left = r.left+30;
	rect.right = r.right - 20;
	dc->Rectangle(rect);
	str = m_doc->GetLowQueue(id);
	rect.DeflateRect(5,5);
	dc->DrawText(str,&rect,DT_WORDBREAK);
	rect.InflateRect(5,5);

	rect.top =rect.bottom+5;
	rect.bottom = rect.top+20;
	rect.left = r.left + 10;
	rect.right = r.right - 20;
	str = "Waiting for I/O";
	dc->DrawText(str,&rect,DT_VCENTER|DT_SINGLELINE);
	rect.bottom = hgt + rect.top;
	rect.top = rect.top+20;
	rect.left = r.left+30;
	rect.right = r.right - 20;
	dc->Rectangle(rect);
	str = m_doc->GetWaitingQueue(id);
	rect.DeflateRect(5,5);
	dc->DrawText(str,&rect,DT_WORDBREAK);
	rect.InflateRect(5,5);

	dc->RestoreDC(dc_id);
}

CSize CTransputerObj::GetPlotSize()
{
	CSize s;
	s.cx = MARGIN*2+DISTANCE+2*WIDTH;
	s.cy = 2*MARGIN+HEIGHT;
	s.cx *= m_scale; s.cx /= 100;
	s.cy *= m_scale; s.cy /= 100;
	return s;
}
