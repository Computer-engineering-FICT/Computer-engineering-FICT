#pragma once
#include "CellRange.h"
#include "GridCell.h"
#include <afxtempl.h>
#include "../utils.h"

#define GRIDCTRL_CLASSNAME    _T("MFCGridCtrl")  // Window class name
#define IDC_INPLACE_CONTROL   8                  // ID of inplace edit controls

#include "TitleTip.h"
#include "GridDropTarget.h"
#include <afxole.h>

// Handy functions
#define IsSHIFTpressed() ( (GetKeyState(VK_SHIFT) & (1 << (sizeof(SHORT)*8-1))) != 0   )
#define IsCTRLpressed()  ( (GetKeyState(VK_CONTROL) & (1 << (sizeof(SHORT)*8-1))) != 0 )
// Backwards compatibility for pre 2.20 grid versions
#define DDX_GridControl(pDX, nIDC, rControl)  DDX_Control(pDX, nIDC, rControl)     


///////////////////////////////////////////////////////////////////////////////////
// Structures
///////////////////////////////////////////////////////////////////////////////////

// This structure sent to Grid's parent in a WM_NOTIFY message
typedef struct tagNM_GRIDVIEW {
    NMHDR hdr;
    int   iRow;
    int   iColumn;
} NM_GRIDVIEW;

// This is sent to the Grid from child in-place edit controls
typedef struct tagGV_DISPINFO {
    NMHDR   hdr;
    GV_ITEM item;
} GV_DISPINFO;

// This is sent to the Grid from child in-place edit controls
typedef struct tagGV_CACHEHINT {
    NMHDR      hdr;
    CCellRange range;
} GV_CACHEHINT;

///////////////////////////////////////////////////////////////////////////////////
// Defines
///////////////////////////////////////////////////////////////////////////////////

// Grid line/scrollbar selection
#define GVL_NONE                0L      // Neither
#define GVL_HORZ                1L      // Horizontal line or scrollbar
#define GVL_VERT                2L      // Vertical line or scrollbar
#define GVL_BOTH                3L      // Both

// Autosizing option
#define GVS_DEFAULT             0
#define GVS_HEADER              1       // Size using column fixed cells data only
#define GVS_DATA                2       // Size using column non-fixed cells data only
#define GVS_BOTH                3       // Size using column fixed and non-fixed

// Cell Searching options
#define GVNI_FOCUSED            0x0001
#define GVNI_SELECTED           0x0002
#define GVNI_DROPHILITED        0x0004
#define GVNI_READONLY           0x0008
#define GVNI_FIXED              0x0010
#define GVNI_MODIFIED           0x0020

#define GVNI_ABOVE              LVNI_ABOVE
#define GVNI_BELOW              LVNI_BELOW
#define GVNI_TOLEFT             LVNI_TOLEFT
#define GVNI_TORIGHT            LVNI_TORIGHT
#define GVNI_ALL                (LVNI_BELOW|LVNI_TORIGHT|LVNI_TOLEFT)
#define GVNI_AREA               (LVNI_BELOW|LVNI_TORIGHT)

// Hit test values (not yet implemented)
#define GVHT_DATA               0x0000
#define GVHT_TOPLEFT            0x0001
#define GVHT_COLHDR             0x0002
#define GVHT_ROWHDR             0x0004
#define GVHT_COLSIZER           0x0008
#define GVHT_ROWSIZER           0x0010
#define GVHT_LEFT               0x0020
#define GVHT_RIGHT              0x0040
#define GVHT_ABOVE              0x0080
#define GVHT_BELOW              0x0100

// Messages sent to the grid's parent (More will be added in future)
#define GVN_BEGINDRAG           LVN_BEGINDRAG        // LVN_FIRST-9
#define GVN_BEGINLABELEDIT      LVN_BEGINLABELEDIT   // LVN_FIRST-5
#define GVN_BEGINRDRAG          LVN_BEGINRDRAG
#define GVN_COLUMNCLICK         LVN_COLUMNCLICK
#define GVN_DELETEITEM          LVN_DELETEITEM
#define GVN_ENDLABELEDIT        LVN_ENDLABELEDIT     // LVN_FIRST-6
#define GVN_SELCHANGING         LVN_ITEMCHANGING
#define GVN_SELCHANGED          LVN_ITEMCHANGED
#define GVN_GETDISPINFO         LVN_GETDISPINFO 
#define GVN_ODCACHEHINT         LVN_ODCACHEHINT 

class CGridCtrl;

/////////////////////////////////////////////////////////////////////////////
// CGridCtrl window

class CGridCtrl : public CWnd
{
    DECLARE_DYNCREATE(CGridCtrl)
    friend class CGridCell;
    friend class CGridCellBase;
// Construction
public:
	struct IDataModel:IClone
	{
		virtual void GetText(CString& text,int row,int col)=0;
		virtual void GetTipText(CString& text,int row,int col)=0;
		virtual void SetText(CString& text,int row,int col)=0;
		virtual void Init(CGridCtrl* parent)=0;
		virtual CWnd* GetEditCtrl(int row,int col)=0;
		virtual CGridCtrl* GetGrid()=0;
		virtual int Compare(CCellID& l,CCellID& r)=0;
		virtual void SwapRows(int l,int r)=0;
		virtual int GetImage(int row,int col)=0;
		virtual int GetFormat(int row,int col)=0;
		virtual void OnDblClick(int l,int r)=0;
		virtual void OnClickDown(CPoint& point,int l,int r)=0;
		virtual void OnClick(CPoint& point,int l,int r)=0;
		virtual void OnRClick(CPoint& point,int l,int r)=0;
		virtual BOOL Edit(int nRow,int nCol,CRect& rect,CPoint& point,unsigned char nChar)=0;
		virtual void EndEdit()=0;
		virtual void OnEndEdit(int row,int col,LPCTSTR str)=0;
		virtual BOOL ValidateEdit(LPCTSTR str,int row,int col)=0;
		virtual BOOL GetTextRect(LPRECT pRect,int row,int col)=0;
		virtual BOOL GetTipTextRect(LPRECT pRect,int row,int col)=0;
		virtual BOOL OnInsertRow(int nRow)=0;
		virtual BOOL OnDeleteRow(int nRow)=0;
		virtual BOOL IsEditing(int row,int col)=0;
		virtual void InsertRow()=0;
		virtual void DeleteRow()=0;
		virtual ~IDataModel(){};
	};
	struct IDrawModel:IClone
	{
		enum OBJECT{FIXED_CELL,FIXED_ROW,FIXED_COL,CELL,GRID,TITLETIP};
		enum TYPE{FACE,BACK};
		enum STATE{NORMAL,SELECTED};
		virtual void Init(IDataModel* model)=0;
		virtual COLORREF GetColor(OBJECT obj,TYPE type,STATE state)=0;
		virtual unsigned GetDefRowHeight()=0;
		virtual unsigned GetDefColWidth()=0;
		virtual BOOL Draw(CDC* pDC,int row,int col,CRect& rect, BOOL bEraseBckgnd)=0;
		virtual BOOL OnSetCursor(int row,int col)=0;
		virtual CFont* GetFontObject()=0;
		virtual COLORREF GetBackClr(int row,int col)=0;
		virtual COLORREF GetFaceClr(int row,int col)=0;
		virtual LOGFONT* GetFont(int row,int col)=0;
		virtual CSize GetCellExtent(CDC* pDC,int row,int col)=0;
		virtual CSize GetTextExtent(CDC* pDC,LPCTSTR str,int row,int col)=0;
		virtual void OnMouseOver(int row,int col)=0;
		virtual CSize GetMargin(int row,int col)=0;
	};
	struct DefDataModel:IDataModel
	{
		CWnd* m_pEditWnd;
		CGridCtrl* m_grid;
		CCellID m_edit_cell;
		DefDataModel();
		virtual IClone* Clone();
		virtual void GetText(CString& text,int row,int col);
		virtual void GetTipText(CString& text,int row,int col);
		virtual void SetText(CString& text,int row,int col);
		virtual void Init(CGridCtrl* parent);
		virtual CWnd* GetEditCtrl(int row,int col);
		virtual CGridCtrl* GetGrid();
		virtual int Compare(CCellID& l,CCellID& r);
		virtual void SwapRows(int l,int r);
		virtual int GetImage(int row,int col);
		virtual int GetFormat(int row,int col);
		virtual void OnDblClick(int l,int r);
		virtual void OnClickDown(CPoint& point,int l,int r);
		virtual void OnClick(CPoint& point,int l,int r);
		virtual void OnRClick(CPoint& point,int l,int r);
		virtual BOOL Edit(int nRow,int nCol,CRect& rect,CPoint& point,unsigned char nChar);
		virtual void EndEdit();
		virtual void OnEndEdit(int row,int col,LPCTSTR str);
		virtual BOOL ValidateEdit(LPCTSTR str,int row,int col);
		virtual BOOL GetTextRect(LPRECT pRect,int row,int col);
		virtual BOOL GetTipTextRect(LPRECT pRect,int row,int col);
		virtual BOOL OnInsertRow(int nRow);
		virtual BOOL OnDeleteRow(int nRow);
		virtual BOOL IsEditing(int row,int col);
		virtual void InsertRow();
		virtual void DeleteRow();
		virtual ~DefDataModel();
	};
	struct DefDrawModel:IDrawModel
	{
		IDataModel* m_datamodel;
		CFont m_font;
		LOGFONT log_font;
		DefDrawModel();
		virtual IClone* Clone();
		virtual void Init(IDataModel* model);
		virtual COLORREF GetColor(OBJECT obj,TYPE type,STATE state);
		virtual unsigned GetDefRowHeight();
		virtual unsigned GetDefColWidth();
		virtual BOOL Draw(CDC* pDC,int row,int col,CRect& rect, BOOL bEraseBckgnd);
		virtual BOOL OnSetCursor(int row,int col);
		virtual CFont* GetFontObject();
		virtual COLORREF GetBackClr(int row,int col);
		virtual COLORREF GetFaceClr(int row,int col);
		virtual LOGFONT* GetFont(int row,int col);
		virtual CSize GetCellExtent(CDC* pDC,int row,int col);
		virtual CSize GetTextExtent(CDC* pDC,LPCTSTR str,int row,int col);
		virtual void OnMouseOver(int row,int col);
		virtual CGridCtrl* GetGrid();
		virtual CSize GetMargin(int row,int col);
	};
	CGridCtrl(int nRows = 0, int nCols = 0, int nFixedRows = 0, int nFixedCols = 0);
    BOOL Create(const RECT& rect, CWnd* parent, UINT nID,
                DWORD dwStyle = WS_CHILD | WS_BORDER | WS_TABSTOP | WS_VISIBLE);
///////////////////////////////////////////////////////////////////////////////////
// Attributes
///////////////////////////////////////////////////////////////////////////////////
public:
    int  GetRowCount() const                    { return m_nRows; }
    int  GetColumnCount() const                 { return m_nCols; }
    int  GetFixedRowCount() const               { return m_nFixedRows; }
    int  GetFixedColumnCount() const            { return m_nFixedCols; }
    BOOL SetRowCount(int nRows);
    BOOL SetColumnCount(int nCols);
    BOOL SetFixedRowCount(int nFixedRows = 1);
    BOOL SetFixedColumnCount(int nFixedCols = 1);

	void SetDataModel(IDataModel* model);	//model object will be cloned
	void SetDrawModel(IDrawModel* model);	//model object will be cloned
	IDataModel* GetDataModel();	

    int  GetRowHeight(int nRow) const;
    BOOL SetRowHeight(int row, int height);
    int  GetColumnWidth(int nCol) const;
    BOOL SetColumnWidth(int col, int width);

    BOOL GetCellOrigin(int nRow, int nCol, LPPOINT p);
    BOOL GetCellOrigin(const CCellID& cell, LPPOINT p);
    BOOL GetCellRect(int nRow, int nCol, LPRECT pRect);
    BOOL GetCellRect(const CCellID& cell, LPRECT pRect);

    BOOL GetTextRect(const CCellID& cell, LPRECT pRect);
    BOOL GetTextRect(int nRow, int nCol, LPRECT pRect);

    CCellID GetCellFromPt(CPoint point, BOOL bAllowFixedCellCheck = TRUE);

    int  GetFixedRowHeight() const;
    int  GetFixedColumnWidth() const;
    long GetVirtualWidth() const;
    long GetVirtualHeight() const;

    CSize GetTextExtent(int nRow, int nCol, LPCTSTR str);
    // EFW - Get extent of current text in cell
    inline CSize GetCellTextExtent(int nRow, int nCol)  { return GetTextExtent(nRow, nCol, GetItemText(nRow,nCol)); }

    // ***************************************************************************** //

    int GetSelectedCount() const                  { return (int)m_SelectedCellMap.GetCount(); }

    CCellID SetFocusCell(CCellID cell);
    CCellID SetFocusCell(int nRow, int nCol);
    CCellID GetFocusCell() const                  { return m_idCurrentCell;           }

    void SetImageList(CImageList* pList)          { m_pImageList = pList;             }
    CImageList* GetImageList() const              { return m_pImageList;              }

    void SetGridLines(int nWhichLines = GVL_BOTH);
    int  GetGridLines() const                     { return m_nGridLines;              }
    void SetEditable(BOOL bEditable = TRUE)       { m_bEditable = bEditable;          }
    BOOL IsEditable() const                       { return m_bEditable;               }
    void SetListMode(BOOL bEnableListMode = TRUE);
    BOOL GetListMode() const                      { return m_bListMode;               }
    void SetSingleRowSelection(BOOL bSing = TRUE) { m_bSingleRowSelection = bSing;    }
    BOOL GetSingleRowSelection()                  { return m_bSingleRowSelection & m_bListMode; }
    void SetSingleColSelection(BOOL bSing = TRUE) { m_bSingleColSelection = bSing;    }
    BOOL GetSingleColSelection()                  { return m_bSingleColSelection;     }
    void EnableSelection(BOOL bEnable = TRUE)     { ResetSelectedRange(); m_bEnableSelection = bEnable; ResetSelectedRange(); }
    BOOL IsSelectable() const                     { return m_bEnableSelection;        }
    void SetFixedColumnSelection(BOOL bSelect)    { m_bFixedColumnSelection = bSelect;}
    BOOL GetFixedColumnSelection()                { return m_bFixedColumnSelection;   }
    void SetFixedRowSelection(BOOL bSelect)       { m_bFixedRowSelection = bSelect;   }
    BOOL GetFixedRowSelection()                   { return m_bFixedRowSelection;      }
    void EnableDragAndDrop(BOOL bAllow = TRUE)    { m_bAllowDragAndDrop = bAllow;     }
    BOOL GetDragAndDrop() const                   { return m_bAllowDragAndDrop;       }
    void SetRowResize(BOOL bResize = TRUE)        { m_bAllowRowResize = bResize;      }
    BOOL GetRowResize() const                     { return m_bAllowRowResize;         }
    void SetColumnResize(BOOL bResize = TRUE)     { m_bAllowColumnResize = bResize;   }
    BOOL GetColumnResize() const                  { return m_bAllowColumnResize;      }
    void SetHeaderSort(BOOL bSortOnClick = TRUE)  { m_bSortOnClick = bSortOnClick;    }
    BOOL GetHeaderSort() const                    { return m_bSortOnClick;            }
    void SetHandleTabKey(BOOL bHandleTab = TRUE)  { m_bHandleTabKey = bHandleTab;     }
    BOOL GetHandleTabKey() const                  { return m_bHandleTabKey;           }
    void SetDoubleBuffering(BOOL bBuffer = TRUE)  { m_bDoubleBuffer = bBuffer;        }
    BOOL GetDoubleBuffering() const               { return m_bDoubleBuffer;           }
    void EnableTitleTips(BOOL bEnable = TRUE)     { m_bTitleTips = bEnable;           }
    BOOL GetTitleTips()                           { return m_bTitleTips;              }
    void SetSortColumn(int nCol);
    int  GetSortColumn() const                    { return m_nSortColumn;             }
    void SetSortAscending(BOOL bAscending)        { m_bAscending = bAscending;        }
    BOOL GetSortAscending() const                 { return m_bAscending;              }
    void SetTrackFocusCell(BOOL bTrack)           { m_bTrackFocusCell = bTrack;       }
    BOOL GetTrackFocusCell()                      { return m_bTrackFocusCell;         }
    void SetFrameFocusCell(BOOL bFrame)           { m_bFrameFocus = bFrame;           }
    BOOL GetFrameFocusCell()                      { return m_bFrameFocus;             }
    void SetAutoSizeStyle(int nStyle = GVS_BOTH)  { m_nAutoSizeColumnStyle = nStyle;  }
    int  GetAutoSizeStyle()                       { return m_nAutoSizeColumnStyle; }

    void EnableHiddenColUnhide(BOOL bEnable = TRUE){ m_bHiddenColUnhide = bEnable;    }
    BOOL GetHiddenColUnhide()                     { return m_bHiddenColUnhide;        }
    void EnableHiddenRowUnhide(BOOL bEnable = TRUE){ m_bHiddenRowUnhide = bEnable;    }
    BOOL GetHiddenRowUnhide()                     { return m_bHiddenRowUnhide;        }

    void EnableColumnHide(BOOL bEnable = TRUE)    { m_bAllowColHide = bEnable;        }
    BOOL GetColumnHide()                          { return m_bAllowColHide;           }
    void EnableRowHide(BOOL bEnable = TRUE)       { m_bAllowRowHide = bEnable;        }
    BOOL GetRowHide()                             { return m_bAllowRowHide;           }

///////////////////////////////////////////////////////////////////////////////////
// default Grid cells. Use these for setting default values such as colors and fonts
///////////////////////////////////////////////////////////////////////////////////
public:
//    CGridCellBase* GetDefaultCell(BOOL bFixedRow, BOOL bFixedCol) const;

///////////////////////////////////////////////////////////////////////////////////
// Grid cell Attributes
///////////////////////////////////////////////////////////////////////////////////
public:
//    virtual CGridCellBase* GetCell(int nRow, int nCol) const;   // Get the actual cell!
    void SetModified(BOOL bModified = TRUE, int nRow = -1, int nCol = -1);
    BOOL GetModified(int nRow = -1, int nCol = -1);
    BOOL IsCellFixed(int nRow, int nCol);
    BOOL   GetItem(GV_ITEM* pItem);
    BOOL   SetItemText(int nRow, int nCol, LPCTSTR str);
    // The following was virtual. If you want to override, use 
    //  CGridCellBase-derived class's GetText() to accomplish same thing
    CString GetItemText(int nRow, int nCol) const;
    // EFW - 06/13/99 - Added to support printf-style formatting codes.
    // Also supports use with a string resource ID
    BOOL   SetItemTextFmt(int nRow, int nCol, LPCTSTR szFmt, ...);
    BOOL   SetItemTextFmtID(int nRow, int nCol, UINT nID, ...);
    int    GetItemImage(int nRow, int nCol) const;
    BOOL   SetItemState(int nRow, int nCol, UINT state);
    UINT   GetItemState(int nRow, int nCol) const;
    UINT   GetItemFormat(int nRow, int nCol) const;
    COLORREF GetItemBkColour(int nRow, int nCol) const;
    COLORREF GetItemFgColour(int nRow, int nCol) const;
    const LOGFONT* GetItemFont(int nRow, int nCol);
    BOOL IsItemEditing(int nRow, int nCol);

public:
    int  InsertColumn(LPCTSTR strHeading, UINT nFormat = DT_CENTER|DT_VCENTER|DT_SINGLELINE,
                      int nColumn = -1);
    int  InsertRow(LPCTSTR strHeading, int nRow = -1);
    BOOL DeleteColumn(int nColumn);
    BOOL DeleteRow(int nRow);
    BOOL DeleteNonFixedRows();
    BOOL DeleteAllItems();

	void ClearCells(CCellRange Selection);

    BOOL AutoSizeRow(int nRow, BOOL bResetScroll = TRUE);
    BOOL AutoSizeColumn(int nCol, UINT nAutoSizeStyle = GVS_DEFAULT, BOOL bResetScroll = TRUE);
    void AutoSizeRows();
    void AutoSizeColumns(UINT nAutoSizeStyle = GVS_DEFAULT);
    void AutoSize(UINT nAutoSizeStyle = GVS_DEFAULT);
    void ExpandColumnsToFit(BOOL bExpandFixed = TRUE);
    void ExpandLastColumn();
    void ExpandRowsToFit(BOOL bExpandFixed = TRUE);
    void ExpandToFit(BOOL bExpandFixed = TRUE);

    void Refresh();
    void AutoFill();   // Fill grid with blank cells

    void EnsureVisible(CCellID &cell)       { EnsureVisible(cell.row, cell.col); }
    void EnsureVisible(int nRow, int nCol);
    BOOL IsCellVisible(int nRow, int nCol);
    BOOL IsCellVisible(CCellID cell);
    BOOL IsCellEditable(int nRow, int nCol) const;
    BOOL IsCellEditable(CCellID &cell) const;
    BOOL IsCellSelected(int nRow, int nCol) const;
    BOOL IsCellSelected(CCellID &cell) const;

    // SetRedraw stops/starts redraws on things like changing the # rows/columns
    // and autosizing, but not for user-intervention such as resizes
    void SetRedraw(BOOL bAllowDraw, BOOL bResetScrollBars = FALSE);
    BOOL RedrawCell(int nRow, int nCol, CDC* pDC = NULL);
    BOOL RedrawCell(const CCellID& cell, CDC* pDC = NULL);
    BOOL RedrawRow(int row);
    BOOL RedrawColumn(int col);
    BOOL Save(LPCTSTR filename, TCHAR chSeparator = _T(','));
    BOOL Load(LPCTSTR filename, TCHAR chSeparator = _T(','));
 public:
    CCellRange GetCellRange() const;
    CCellRange GetSelectedCellRange() const;
    void SetSelectedRange(const CCellRange& Range, BOOL bForceRepaint = FALSE, BOOL bSelectCells = TRUE);
    void SetSelectedRange(int nMinRow, int nMinCol, int nMaxRow, int nMaxCol,
                          BOOL bForceRepaint = FALSE, BOOL bSelectCells = TRUE);
    BOOL IsValid(int nRow, int nCol) const;
    BOOL IsValid(const CCellID& cell) const;
    BOOL IsValid(const CCellRange& range) const;

///////////////////////////////////////////////////////////////////////////////////
// Clipboard, drag and drop, and cut n' paste operations
///////////////////////////////////////////////////////////////////////////////////
    virtual void CutSelectedText();
    virtual COleDataSource* CopyTextFromGrid();
    virtual BOOL PasteTextToGrid(CCellID cell, COleDataObject* pDataObject, BOOL bSelectPastedCells=TRUE);

 public:
    virtual void OnBeginDrag();
    virtual DROPEFFECT OnDragEnter(COleDataObject* pDataObject, DWORD dwKeyState, CPoint point);
    virtual DROPEFFECT OnDragOver(COleDataObject* pDataObject, DWORD dwKeyState, CPoint point);
    virtual void OnDragLeave();
    virtual BOOL OnDrop(COleDataObject* pDataObject, DROPEFFECT dropEffect, CPoint point);
    virtual void OnEditCut();
    virtual void OnEditCopy();
    virtual void OnEditPaste();
    virtual void OnEditSelectAll();

///////////////////////////////////////////////////////////////////////////////////
// Misc.
///////////////////////////////////////////////////////////////////////////////////
public:
    CCellID GetNextItem(CCellID& cell, int nFlags) const;

	BOOL SortItems(int nCol, BOOL bAscending, LPARAM data = 0);

public:
    virtual ~CGridCtrl();

protected:
    BOOL RegisterWindowClass();
    BOOL Initialise();

    BOOL InvalidateCellRect(const int row, const int col);
    BOOL InvalidateCellRect(const CCellID& cell);
    BOOL InvalidateCellRect(const CCellRange& cellRange);
    void EraseBkgnd(CDC* pDC);

    BOOL GetCellRangeRect(const CCellRange& cellRange, LPRECT lpRect);

    BOOL SetCell(int nRow, int nCol, CGridCellBase* pCell);

    int  SetMouseMode(int nMode) { int nOldMode = m_MouseMode; m_MouseMode = nMode; return nOldMode; }
    int  GetMouseMode() const    { return m_MouseMode; }

    BOOL MouseOverRowResizeArea(CPoint& point);
    BOOL MouseOverColumnResizeArea(CPoint& point);

    CCellID GetTopleftNonFixedCell(BOOL bForceRecalculation = FALSE);
    CCellRange GetUnobstructedNonFixedCellRange(BOOL bForceRecalculation = FALSE);
    CCellRange GetVisibleNonFixedCellRange(LPRECT pRect = NULL, BOOL bForceRecalculation = FALSE);

    BOOL IsVisibleVScroll() { return ( (m_nBarState & GVL_VERT) > 0); } 
    BOOL IsVisibleHScroll() { return ( (m_nBarState & GVL_HORZ) > 0); }
    void ResetSelectedRange();
    void ResetScrollBars();
    void EnableScrollBars(int nBar, BOOL bEnable = TRUE);
    int  GetScrollPos32(int nBar, BOOL bGetTrackPos = FALSE);
    BOOL SetScrollPos32(int nBar, int nPos, BOOL bRedraw = TRUE);

    BOOL SortItems(int nCol, BOOL bAscending, LPARAM data,
                   int low, int high);

    CPoint GetPointClicked(int nRow, int nCol, const CPoint& point);

	void ValidateAndModifyCellContents(int nRow, int nCol, LPCTSTR strText);

// Overrrides
    // ClassWizard generated virtual function overrides
    //{{AFX_VIRTUAL(CGridCtrl)
    protected:
    virtual void PreSubclassWindow();
    //}}AFX_VIRTUAL

protected:

    virtual CImageList* CreateDragImage(CPoint *pHotSpot);    // no longer necessary
    // Mouse Clicks
    virtual void  OnFixedColumnClick(CCellID& cell);
    virtual void  OnFixedRowClick(CCellID& cell);
    // Editing
    virtual void  OnEditCell(int nRow, int nCol, CPoint point, UINT nChar);
    virtual void  OnEndEditCell(int nRow, int nCol, CString str);
	virtual BOOL  ValidateEdit(int nRow, int nCol, LPCTSTR str);
    virtual void  EndEditing();
    // Drawing
    virtual void  OnDraw(CDC* pDC);
protected:
    // General attributes  
    int         m_nGridLines;
    BOOL        m_bEditable;
    BOOL        m_bModified;
    BOOL        m_bAllowDragAndDrop;
    BOOL        m_bListMode;
    BOOL        m_bSingleRowSelection;
    BOOL        m_bSingleColSelection;
    BOOL        m_bAllowDraw;
    BOOL        m_bEnableSelection;
    BOOL        m_bFixedRowSelection, m_bFixedColumnSelection;
    BOOL        m_bSortOnClick;
    BOOL        m_bHandleTabKey;
    BOOL        m_bDoubleBuffer;
    BOOL        m_bTitleTips;
    int         m_nBarState;
    BOOL        m_bWysiwygPrinting;
    BOOL        m_bHiddenColUnhide, m_bHiddenRowUnhide;
    BOOL        m_bAllowColHide, m_bAllowRowHide;
    BOOL        m_bAutoSizeSkipColHdr;
    BOOL        m_bTrackFocusCell;
    BOOL        m_bFrameFocus;
    UINT        m_nAutoSizeColumnStyle;

    // Cell size details
    int         m_nRows, m_nFixedRows, m_nCols, m_nFixedCols;
    CUIntArray  m_arRowHeights, m_arColWidths;
    int         m_nVScrollMax, m_nHScrollMax;

    // Fonts and images
    CFont       m_PrinterFont;  // for the printer
    CImageList* m_pImageList;

    // Mouse operations such as cell selection
    int         m_MouseMode;
    BOOL        m_bLMouseButtonDown, m_bRMouseButtonDown;
    CPoint      m_LeftClickDownPoint, m_LastMousePoint;
    CCellID     m_LeftClickDownCell, m_SelectionStartCell;
    CCellID     m_idCurrentCell, m_idTopLeftCell;
    int         m_nTimerID;
    int         m_nTimerInterval;
    int         m_nResizeCaptureRange;
    BOOL        m_bAllowRowResize, m_bAllowColumnResize;
    int         m_nRowsPerWheelNotch;
    CMap<DWORD,DWORD, CCellID, CCellID&> m_SelectedCellMap, m_PrevSelectedCellMap;

    CTitleTip   m_TitleTip;             // Title tips for cells
    // Drag and drop
    CCellID     m_LastDragOverCell;
    CGridDropTarget m_DropTarget;       // OLE Drop target for the grid

    // Printing information
    CSize       m_CharSize;
    int         m_nPageHeight;
    CSize       m_LogicalPageSize,      // Page size in gridctrl units.
                m_PaperSize;            // Page size in device units.
    // additional properties to support Wysiwyg printing
    int         m_nPageWidth;
    int         m_nPrintColumn;
    int         m_nCurrPrintRow;
    int         m_nNumPages;
    int         m_nPageMultiplier;

    // sorting
    int          m_bAscending;
    int          m_nSortColumn;
	PFNLVCOMPARE m_pfnCompare;

    // EFW - Added to support shaded/unshaded printout.  If true, colored
    // cells will print as-is.  If false, all text prints as black on white.
    BOOL        m_bShadedPrintOut;
	BOOL        m_bAutoSaveState;

    // EFW - Added support for user-definable margins.  Top and bottom are in 
    // lines.  Left, right, and gap are in characters (avg width is used).
    int         m_nHeaderHeight, m_nFooterHeight, m_nLeftMargin,
                m_nRightMargin, m_nTopMargin, m_nBottomMargin, m_nGap;
	IDataModel* m_datamodel;
	IDrawModel* m_drawmodel;
protected:
    void SelectAllCells();
    void SelectColumns(CCellID currentCell, BOOL bForceRedraw=FALSE, BOOL bSelectCells=TRUE);
    void SelectRows(CCellID currentCell, BOOL bForceRedraw=FALSE, BOOL bSelectCells=TRUE);
    void SelectCells(CCellID currentCell, BOOL bForceRedraw=FALSE, BOOL bSelectCells=TRUE);
    void OnSelecting(const CCellID& currentCell);

    // Generated message map functions
    //{{AFX_MSG(CGridCtrl)
    afx_msg void OnPaint();
    afx_msg void OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar);
    afx_msg void OnVScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar);
    afx_msg void OnSize(UINT nType, int cx, int cy);
    afx_msg void OnLButtonUp(UINT nFlags, CPoint point);
    afx_msg void OnLButtonDown(UINT nFlags, CPoint point);
    afx_msg void OnMouseMove(UINT nFlags, CPoint point);
    afx_msg void OnTimer(UINT nIDEvent);
    afx_msg UINT OnGetDlgCode();
    afx_msg void OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);
	afx_msg void OnKeyUp(UINT nChar, UINT nRepCnt, UINT nFlags);
    afx_msg void OnChar(UINT nChar, UINT nRepCnt, UINT nFlags);
    afx_msg void OnLButtonDblClk(UINT nFlags, CPoint point);
    afx_msg BOOL OnEraseBkgnd(CDC* pDC);
    afx_msg void OnSysKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);
    afx_msg void OnUpdateEditSelectAll(CCmdUI* pCmdUI);
    //}}AFX_MSG
    afx_msg BOOL OnSetCursor(CWnd* pWnd, UINT nHitTest, UINT message);
    afx_msg void OnRButtonDown(UINT nFlags, CPoint point);
    afx_msg void OnRButtonUp(UINT nFlags, CPoint point);    // EFW - Added
    afx_msg void OnCaptureChanged(CWnd *pWnd);
    afx_msg void OnUpdateEditCopy(CCmdUI* pCmdUI);
    afx_msg void OnUpdateEditCut(CCmdUI* pCmdUI);
    afx_msg void OnUpdateEditPaste(CCmdUI* pCmdUI);
    afx_msg void OnSettingChange(UINT uFlags, LPCTSTR lpszSection);
    afx_msg BOOL OnMouseWheel(UINT nFlags, short zDelta, CPoint pt);
    afx_msg LRESULT OnSetFont(WPARAM hFont, LPARAM lParam);
    afx_msg LRESULT OnGetFont(WPARAM hFont, LPARAM lParam);
    afx_msg LRESULT OnImeChar(WPARAM wCharCode, LPARAM lParam);
    afx_msg void OnEndInPlaceEdit(NMHDR* pNMHDR, LRESULT* pResult);
    DECLARE_MESSAGE_MAP()
    enum eMouseModes { MOUSE_NOTHING, MOUSE_SELECT_ALL, MOUSE_SELECT_COL, MOUSE_SELECT_ROW,
                       MOUSE_SELECT_CELLS, MOUSE_SCROLLING_CELLS,
                       MOUSE_OVER_ROW_DIVIDE, MOUSE_SIZING_ROW,
                       MOUSE_OVER_COL_DIVIDE, MOUSE_SIZING_COL,
                       MOUSE_PREPARE_EDIT,
                       MOUSE_PREPARE_DRAG, MOUSE_DRAGGING
    };
public:
	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
	void LoadFromReg(char* path=NULL);
	void SaveToReg(char* path=NULL);
	afx_msg void OnDestroy();
	afx_msg void OnKillFocus(CWnd* pNewWnd);
	afx_msg void OnSetFocus(CWnd* pOldWnd);
};

