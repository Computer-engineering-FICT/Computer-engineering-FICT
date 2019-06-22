/*
#pragma once
#include <vector>
#include <hash_map>
#include "Grid/GridCtrl.h"

class CEditCell : public CGridCellBase
{
    friend class CEditListCtrl;
    DECLARE_DYNAMIC(CEditCell)

// Construction/Destruction
public:
    CEditCell();
    virtual ~CEditCell();

// Attributes
public:
	virtual void SetRowCol(int row,int col){m_row=row;m_col=col;}
	virtual void SetText(LPCTSTR  szText ){ASSERT(FALSE);}
    virtual void SetImage(int  nImage ){ASSERT(FALSE);}
    virtual void SetData(LPARAM  lParam ){ASSERT(FALSE);}
    virtual void SetState(DWORD nState);
    virtual void SetFormat(DWORD nFormat ){ASSERT(FALSE);}
    virtual void SetTextClr(COLORREF  clr ){}
    virtual void SetBackClr(COLORREF  clr ){}
    virtual void SetFont(const LOGFONT*  plf ){ASSERT(FALSE);}
    virtual void SetMargin( UINT  nMargin ){ASSERT(FALSE);}
    virtual void SetGrid(CGridCtrl*  pGrid ){ASSERT(FALSE);}
    virtual void SetCoords( int  nRow , int  nCol ){}

    virtual LPCTSTR    GetText()const;
    virtual LPCTSTR    GetTipText()const;
    virtual int        GetImage()const;
    virtual LPARAM     GetData()const{ASSERT(FALSE); return NULL;}
    virtual DWORD      GetState()const;
    virtual DWORD      GetFormat()const;
    virtual COLORREF   GetTextClr()const;
    virtual COLORREF   GetBackClr()const;
    virtual LOGFONT  * GetFont()const;
    virtual CFont    * GetFontObject()const;
    virtual CGridCtrl* GetGrid()const;
    virtual CWnd     * GetEditWnd()const{ASSERT(FALSE); return NULL;}
    virtual UINT       GetMargin()const;

    virtual CGridCellBase* GetDefaultCell()const;

    virtual BOOL IsDefaultFont()const{ASSERT(FALSE); return NULL;}
    virtual BOOL IsEditing()const;
    virtual BOOL IsFocused()const;
    virtual BOOL IsFixed()const;
    virtual BOOL IsFixedCol()const;
    virtual BOOL IsFixedRow()const;
    virtual BOOL IsSelected()const;
    virtual BOOL IsReadOnly()const{ASSERT(FALSE);return NULL;}
    virtual BOOL IsModified()const{ASSERT(FALSE);return NULL;}
	virtual BOOL IsDropHighlighted();
public:
    virtual void operator=(const CEditCell& cell);
public:
    virtual void Reset();

    virtual BOOL Draw(CDC* pDC, int nRow, int nCol, CRect rect, BOOL bEraseBkgnd = TRUE);
    virtual BOOL GetTextRect( LPRECT pRect);    // i/o:  i=dims of cell rect; o=dims of text rect
    virtual BOOL GetTipTextRect( LPRECT pRect) { return GetTextRect( pRect); }  // may override for btns, etc.
    virtual CSize GetTextExtent(LPCTSTR str, CDC* pDC = NULL);
    virtual CSize GetCellExtent(CDC* pDC);
    virtual BOOL Edit( int  nRow , int  nCol , CRect  rect , CPoint  point , 
                       UINT  nID , UINT  nChar ) { ASSERT( FALSE); return FALSE;}
	virtual BOOL ValidateEdit(LPCTSTR str);
    virtual void EndEdit() {}
    virtual BOOL PrintCell(CDC* pDC, int nRow, int nCol, CRect rect);
protected:
    virtual void OnEndEdit();
    virtual void OnMouseEnter();
    virtual void OnMouseOver();
    virtual void OnMouseLeave();
    virtual void OnClick( CPoint PointCellRelative);
    virtual void OnClickDown( CPoint PointCellRelative);
    virtual void OnRClick( CPoint PointCellRelative);
    virtual void OnDblClick( CPoint PointCellRelative);
    virtual BOOL OnSetCursor();
protected:
	int m_row,m_col;
	CEditListCtrl* m_grid;
};

class CEditListCtrl :
	public CGridCtrl
{
public:	
	struct IDataModel:public IClone
	{
		virtual void GetText(CString& text,int row,int col)=0;
		virtual void SetText(CString& text,int row,int col)=0;
		virtual void Init(CEditListCtrl* parent)=0;
	};
	CEditListCtrl(IDataModel* data);
	void SetBehaviour(IDataModel* data);
	virtual ~CEditListCtrl(void);
	virtual int Create(DWORD dwStyle,const RECT& rect,CWnd* parent,UINT id);
	virtual CGridCellBase* GetCell(int nRow, int nCol) const;
	virtual void SetCellState(int row,int col,DWORD state);
	virtual DWORD GetCellState(int row,int col);
	virtual IDataModel* GetModel();
protected:
	CEditCell m_cell;
	typedef stdext::hash_map<unsigned long long,unsigned> CellStateMap;
	CellStateMap m_states;
	IDataModel* m_data;
	void OnDataModelChange();
	void Load();
public:
	DECLARE_MESSAGE_MAP()
	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
	afx_msg void OnSysColorChange();
    afx_msg void OnSettingChange(UINT uFlags, LPCTSTR lpszSection);
	afx_msg void OnDestroy();
};

*/