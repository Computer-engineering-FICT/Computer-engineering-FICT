// TransputerView.h : interface of the CTransputerView class
//


#pragma once


class CTransputerView : public CScrollView
{
protected: // create from serialization only
	CTransputerView();
	DECLARE_DYNCREATE(CTransputerView)

// Attributes
public:
	CTransputerDoc* GetDocument() const;

// Operations
public:

// Overrides
	public:
	virtual void OnDraw(CDC* pDC);  // overridden to draw this view
virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
protected:

// Implementation
public:
	virtual ~CTransputerView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	afx_msg void OnFilePrintPreview();
	DECLARE_MESSAGE_MAP()
public:
	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
	int OnChange(void* p);
	afx_msg BOOL OnEraseBkgnd(CDC* pDC);
};

#ifndef _DEBUG  // debug version in TransputerView.cpp
inline CTransputerDoc* CTransputerView::GetDocument() const
   { return reinterpret_cast<CTransputerDoc*>(m_pDocument); }
#endif

