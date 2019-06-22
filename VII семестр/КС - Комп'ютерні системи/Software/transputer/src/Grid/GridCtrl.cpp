#include "stdafx.h"
#include "MemDC.h"
#include "GridCtrl.h"
#include "RegPath.h"
#include "InPlaceEdit.h"

// OLE stuff for clipboard operations
#include <afxadv.h>            // For CSharedFile
#include <afxconv.h>           // For LPTSTR -> LPSTR macros
#include ".\gridctrl.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

IMPLEMENT_DYNCREATE(CGridCtrl, CWnd)

UINT GetMouseScrollLines()
{
    int nScrollLines = 3;            // reasonable default

    OSVERSIONINFO VersionInfo;
    VersionInfo.dwOSVersionInfoSize = sizeof(OSVERSIONINFO);
    if (!GetVersionEx(&VersionInfo) || 
        (VersionInfo.dwPlatformId == VER_PLATFORM_WIN32_WINDOWS && VersionInfo.dwMinorVersion == 0))
    {
        HKEY hKey;
        if (RegOpenKeyEx(HKEY_CURRENT_USER,  _T("Control Panel\\Desktop"),
            0, KEY_QUERY_VALUE, &hKey) == ERROR_SUCCESS)
        {
            TCHAR szData[128];
            DWORD dwKeyDataType;
            DWORD dwDataBufSize = sizeof(szData);
            
            if (RegQueryValueEx(hKey, _T("WheelScrollLines"), NULL, &dwKeyDataType,
                (LPBYTE) &szData, &dwDataBufSize) == ERROR_SUCCESS)
            {
                nScrollLines = _tcstoul(szData, NULL, 10);
            }
            RegCloseKey(hKey);
        }
    }
    // win98 or greater
    else
           SystemParametersInfo (SPI_GETWHEELSCROLLLINES, 0, &nScrollLines, 0);
    return nScrollLines;
}

CGridCtrl::CGridCtrl(int nRows, int nCols, int nFixedRows, int nFixedCols):m_datamodel(new DefDataModel()),m_drawmodel(new DefDrawModel())
{
    RegisterWindowClass();

    _AFX_THREAD_STATE* pState = AfxGetThreadState();
    if (!pState->m_bNeedTerm && !AfxOleInit())
        AfxMessageBox(_T("OLE initialization failed. Make sure that the OLE libraries are the correct version"));

    m_nRows               = 0;
    m_nCols               = 0;
    m_nFixedRows          = 0;
    m_nFixedCols          = 0;

    m_nVScrollMax         = 0;          // Scroll position
    m_nHScrollMax         = 0;
    m_nRowsPerWheelNotch  = GetMouseScrollLines(); // Get the number of lines
                                                   // per mouse wheel notch to scroll
    m_nBarState           = GVL_NONE;
    m_MouseMode           = MOUSE_NOTHING;
    m_nGridLines          = GVL_BOTH;
    m_bEditable           = TRUE;
    m_bListMode           = TRUE;
    m_bSingleRowSelection = FALSE;
    m_bSingleColSelection = FALSE;
    m_bLMouseButtonDown   = FALSE;
    m_bRMouseButtonDown   = FALSE;
    m_bAllowDraw          = TRUE;       // allow draw updates
    m_bEnableSelection    = TRUE;
    m_bFixedColumnSelection = FALSE;
    m_bFixedRowSelection  = TRUE;
    m_bAllowRowResize     = FALSE;
    m_bAllowColumnResize  = TRUE;
    m_bSortOnClick        = FALSE;      // Sort on header row click
    m_bHandleTabKey       = TRUE;
    m_bDoubleBuffer       = TRUE;       // Use double buffering to avoid flicker?
    m_bTitleTips          = TRUE;       // show cell title tips
    m_bWysiwygPrinting    = FALSE;      // use size-to-width printing
    m_bHiddenColUnhide    = TRUE;       // 0-width columns can be expanded via mouse
    m_bHiddenRowUnhide    = TRUE;       // 0-Height rows can be expanded via mouse
    m_bAutoSaveState      = TRUE;       // Auto save state to registry

    m_bAllowColHide       = FALSE;       // Columns can be contracted to 0-width via mouse
    m_bAllowRowHide       = FALSE;       // Rows can be contracted to 0-height via mouse

    m_bAscending          = TRUE;       // sorting stuff
    m_nSortColumn         = -1;
	m_pfnCompare		  = NULL;

    m_nAutoSizeColumnStyle = GVS_BOTH;  // Autosize grid using header and data info

    m_nTimerID            = 0;          // For drag-selection
    m_nTimerInterval      = 25;         // (in milliseconds)
    m_nResizeCaptureRange = 3;          // When resizing columns/row, the cursor has to be
                                        // within +/-3 pixels of the dividing line for
                                        // resizing to be possible
    m_pImageList          = NULL;       // Images in the grid
    m_bAllowDragAndDrop   = FALSE;      // for drag and drop - EFW - off by default
    m_bTrackFocusCell     = FALSE;       // Track Focus cell?
    m_bFrameFocus         = TRUE;       // Frame the selected cell?

    SetRowCount(nRows);
    SetColumnCount(nCols);
    SetFixedRowCount(nFixedRows);
    SetFixedColumnCount(nFixedCols);
    // set initial selection range (ie. none)
    m_SelectedCellMap.RemoveAll();
    m_PrevSelectedCellMap.RemoveAll();
}

CGridCtrl::~CGridCtrl()
{
    DeleteAllItems();

    if (m_bTitleTips && ::IsWindow(m_TitleTip.GetSafeHwnd())) 
        m_TitleTip.DestroyWindow();

    DestroyWindow();

    COleDataSource *pSource = COleDataSource::GetClipboardOwner();
    if(pSource)
        COleDataSource::FlushClipboard();
	delete m_drawmodel;
	delete m_datamodel;
}

// Register the window class if it has not already been registered.
BOOL CGridCtrl::RegisterWindowClass()
{
    WNDCLASS wndcls;
    HINSTANCE hInst = AfxGetResourceHandle();

    if (!(::GetClassInfo(hInst, GRIDCTRL_CLASSNAME, &wndcls)))
    {
        // otherwise we need to register a new class
        wndcls.style            = CS_DBLCLKS | CS_HREDRAW | CS_VREDRAW;
        wndcls.lpfnWndProc      = ::DefWindowProc;
        wndcls.cbClsExtra       = wndcls.cbWndExtra = 0;
        wndcls.hInstance        = hInst;
        wndcls.hIcon            = NULL;
        wndcls.hCursor          = AfxGetApp()->LoadStandardCursor(IDC_ARROW);
        wndcls.hbrBackground    = (HBRUSH) (COLOR_3DFACE + 1);
        wndcls.lpszMenuName     = NULL;
        wndcls.lpszClassName    = GRIDCTRL_CLASSNAME;

        if (!AfxRegisterClass(&wndcls))
        {
            AfxThrowResourceException();
            return FALSE;
        }
    }
    return TRUE;
}

BOOL CGridCtrl::Initialise()
{
    // Stop re-entry problems
    static BOOL bInProcedure = FALSE;
    if (bInProcedure)
        return FALSE;
    bInProcedure = TRUE;
    m_TitleTip.SetParentWnd(this);

    if (::IsWindow(m_hWnd))
        ModifyStyleEx(0, WS_EX_CLIENTEDGE);

	// Kludge: Make sure the client edge shows
	// This is so horrible it makes my eyes water.
	CRect rect;
	GetWindowRect(rect);
	CWnd* pParent = GetParent();
	if (pParent != NULL)
		pParent->ScreenToClient(rect);
	rect.InflateRect(1,1);	MoveWindow(rect);
	rect.DeflateRect(1,1);  MoveWindow(rect);
 
    bInProcedure = FALSE;
    return TRUE;
}

// creates the control - use like any other window create control
BOOL CGridCtrl::Create(const RECT& rect, CWnd* pParentWnd, UINT nID, DWORD dwStyle)
{
    ASSERT(pParentWnd->GetSafeHwnd());

    TRY
    {
        m_arRowHeights.SetSize(m_nRows);    // initialize row heights
        m_arColWidths.SetSize(m_nCols);     // initialize column widths
    }
    CATCH (CMemoryException, e)
    {
        e->ReportError();
        return FALSE;
    }
    END_CATCH

    int i;
    for (i = 0; i < m_nRows; i++)
        m_arRowHeights[i] = m_drawmodel->GetDefRowHeight();
    for (i = 0; i < m_nCols; i++)
        m_arColWidths[i] = m_drawmodel->GetDefColWidth();

	if (!CWnd::Create(GRIDCTRL_CLASSNAME, NULL, dwStyle, rect, pParentWnd, nID))
        return FALSE;
    return TRUE;
}

void CGridCtrl::PreSubclassWindow()
{
    CWnd::PreSubclassWindow();
    Initialise();
}

BEGIN_MESSAGE_MAP(CGridCtrl, CWnd)
//EFW - Added ON_WM_RBUTTONUP
//{{AFX_MSG_MAP(CGridCtrl)
    ON_WM_PAINT()
    ON_WM_HSCROLL()
    ON_WM_VSCROLL()
    ON_WM_SIZE()
    ON_WM_LBUTTONUP()
    ON_WM_LBUTTONDOWN()
    ON_WM_MOUSEMOVE()
    ON_WM_TIMER()
    ON_WM_GETDLGCODE()
    ON_WM_KEYDOWN()
    ON_WM_CHAR()
    ON_WM_LBUTTONDBLCLK()
    ON_WM_ERASEBKGND()
    ON_UPDATE_COMMAND_UI(ID_EDIT_SELECT_ALL, OnUpdateEditSelectAll)
    ON_COMMAND(ID_EDIT_SELECT_ALL, OnEditSelectAll)
    ON_WM_SYSKEYDOWN()
//}}AFX_MSG_MAP
    ON_WM_SETCURSOR()
    ON_WM_RBUTTONUP()
    ON_WM_CAPTURECHANGED()
    ON_COMMAND(ID_EDIT_COPY, OnEditCopy)
    ON_UPDATE_COMMAND_UI(ID_EDIT_COPY, OnUpdateEditCopy)
    ON_COMMAND(ID_EDIT_CUT, OnEditCut)
    ON_UPDATE_COMMAND_UI(ID_EDIT_CUT, OnUpdateEditCut)
    ON_COMMAND(ID_EDIT_PASTE, OnEditPaste)
    ON_UPDATE_COMMAND_UI(ID_EDIT_PASTE, OnUpdateEditPaste)
    ON_WM_SETTINGCHANGE()
    ON_WM_MOUSEWHEEL()
    ON_MESSAGE(WM_SETFONT, OnSetFont)
    ON_MESSAGE(WM_GETFONT, OnGetFont)
    ON_MESSAGE(WM_IME_CHAR, OnImeChar)
    ON_NOTIFY(GVN_ENDLABELEDIT, IDC_INPLACE_CONTROL, OnEndInPlaceEdit)
	ON_WM_CREATE()
	ON_WM_DESTROY()
	ON_WM_KILLFOCUS()
	ON_WM_SETFOCUS()
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// CGridCtrl message handlers

void CGridCtrl::OnPaint()
{
    CPaintDC dc(this);      // device context for painting

    if (m_bDoubleBuffer)    // Use a memory DC to remove flicker
    {
        CMemDC MemDC(&dc);
        OnDraw(&MemDC);
    }
    else                    // Draw raw - this helps in debugging vis problems.
        OnDraw(&dc);
}

BOOL CGridCtrl::OnEraseBkgnd(CDC* /*pDC*/)
{
    return TRUE;    // Don't erase the background.
}

// Custom background erasure. This gets called from within the OnDraw function,
// since we will (most likely) be using a memory DC to stop flicker. If we just
// erase the background normally through OnEraseBkgnd, and didn't fill the memDC's
// selected bitmap with colour, then all sorts of vis problems would occur
void CGridCtrl::EraseBkgnd(CDC* pDC)
{
    CRect  VisRect, ClipRect, rect;
	CBrush FixedRowColBack(m_drawmodel->GetColor(IDrawModel::FIXED_CELL,IDrawModel::BACK,IDrawModel::NORMAL)),
           FixedRowBack(m_drawmodel->GetColor(IDrawModel::FIXED_ROW,IDrawModel::BACK,IDrawModel::NORMAL)),
           FixedColBack(m_drawmodel->GetColor(IDrawModel::FIXED_COL,IDrawModel::BACK,IDrawModel::NORMAL)),
           TextBack(m_drawmodel->GetColor(IDrawModel::CELL,IDrawModel::BACK,IDrawModel::NORMAL));
    CBrush Back(m_drawmodel->GetColor(IDrawModel::GRID,IDrawModel::BACK,IDrawModel::NORMAL)); 
    //CBrush Back(GetTextBkColor());

    if (pDC->GetClipBox(ClipRect) == ERROR)
        return;
    GetVisibleNonFixedCellRange(VisRect);

    int nFixedColumnWidth = GetFixedColumnWidth();
    int nFixedRowHeight = GetFixedRowHeight();

    // Draw Fixed row/column background
    if (ClipRect.left < nFixedColumnWidth && ClipRect.top < nFixedRowHeight)
        pDC->FillRect(CRect(ClipRect.left, ClipRect.top, 
                      nFixedColumnWidth, nFixedRowHeight),
                      &FixedRowColBack);

    // Draw Fixed columns background
    if (ClipRect.left < nFixedColumnWidth && ClipRect.top < VisRect.bottom)
        pDC->FillRect(CRect(ClipRect.left, ClipRect.top, 
                      nFixedColumnWidth, VisRect.bottom),
                      &FixedColBack);
        
    // Draw Fixed rows background
    if (ClipRect.top < nFixedRowHeight && 
        ClipRect.right > nFixedColumnWidth && ClipRect.left < VisRect.right)
        pDC->FillRect(CRect(nFixedColumnWidth-1, ClipRect.top,
                      VisRect.right, nFixedRowHeight),
                      &FixedRowBack);

    // Draw non-fixed cell background
    if (rect.IntersectRect(VisRect, ClipRect)) 
    {
        CRect CellRect(max(nFixedColumnWidth, rect.left), 
                       max(nFixedRowHeight, rect.top),
                       rect.right, rect.bottom);
        pDC->FillRect(CellRect, &TextBack);
    }

    // Draw right hand side of window outside grid
    if (VisRect.right < ClipRect.right) 
        pDC->FillRect(CRect(VisRect.right, ClipRect.top, 
                      ClipRect.right, ClipRect.bottom),
                      &Back);

    // Draw bottom of window below grid
    if (VisRect.bottom < ClipRect.bottom && ClipRect.left < VisRect.right) 
        pDC->FillRect(CRect(ClipRect.left, VisRect.bottom,
                      VisRect.right, ClipRect.bottom),
                      &Back);
}

void CGridCtrl::OnSize(UINT nType, int cx, int cy)
{  
    static BOOL bAlreadyInsideThisProcedure = FALSE;
    if (bAlreadyInsideThisProcedure)
        return;

    if (!::IsWindow(m_hWnd))
        return;

    // Start re-entry blocking
    bAlreadyInsideThisProcedure = TRUE;

    EndEditing();        // destroy any InPlaceEdit's
    CWnd::OnSize(nType, cx, cy);
    ResetScrollBars();

    // End re-entry blocking
    bAlreadyInsideThisProcedure = FALSE;
}

UINT CGridCtrl::OnGetDlgCode()
{
    UINT nCode = DLGC_WANTARROWS | DLGC_WANTCHARS; // DLGC_WANTALLKEYS; //

    if (m_bHandleTabKey && !IsCTRLpressed())
        nCode |= DLGC_WANTTAB;

    return nCode;
}

void CGridCtrl::OnCaptureChanged(CWnd *pWnd)
{
    if (pWnd->GetSafeHwnd() == GetSafeHwnd())
        return;

    // kill timer if active
    if (m_nTimerID != 0)
    {
        KillTimer(m_nTimerID);
        m_nTimerID = 0;
    }

    // Kill drag and drop if active
    if (m_MouseMode == MOUSE_DRAGGING)
        m_MouseMode = MOUSE_NOTHING;
}

void CGridCtrl::OnSettingChange(UINT uFlags, LPCTSTR lpszSection)
{
    CWnd::OnSettingChange(uFlags, lpszSection);

    m_nRowsPerWheelNotch = GetMouseScrollLines(); // Get the number of lines
}
// For drag-selection. Scrolls hidden cells into view
// TODO: decrease timer interval over time to speed up selection over time
void CGridCtrl::OnTimer(UINT nIDEvent)
{
    ASSERT(nIDEvent == WM_LBUTTONDOWN);
    if (nIDEvent != WM_LBUTTONDOWN)
        return;

    CPoint pt, origPt;

    if (m_MouseMode == MOUSE_NOTHING)
        return;
    origPt = GetMessagePos();
    if (!GetCursorPos(&origPt))
        return;

	ScreenToClient(&origPt);

    CRect rect;
    GetClientRect(rect);

    int nFixedRowHeight = GetFixedRowHeight();
    int nFixedColWidth = GetFixedColumnWidth();

    pt = origPt;
    if (pt.y > rect.bottom)
    {
        //SendMessage(WM_VSCROLL, SB_LINEDOWN, 0);
        SendMessage(WM_KEYDOWN, VK_DOWN, 0);

        if (pt.x < rect.left)
            pt.x = rect.left;
        if (pt.x > rect.right)
            pt.x = rect.right;
        pt.y = rect.bottom;
        OnSelecting(GetCellFromPt(pt));
    }
    else if (pt.y < nFixedRowHeight)
    {
        //SendMessage(WM_VSCROLL, SB_LINEUP, 0);
        SendMessage(WM_KEYDOWN, VK_UP, 0);

        if (pt.x < rect.left)
            pt.x = rect.left;
        if (pt.x > rect.right)
            pt.x = rect.right;
        pt.y = nFixedRowHeight + 1;
        OnSelecting(GetCellFromPt(pt));
    }

    pt = origPt;
    if (pt.x > rect.right)
    {
        // SendMessage(WM_HSCROLL, SB_LINERIGHT, 0);
        SendMessage(WM_KEYDOWN, VK_RIGHT, 0);

        if (pt.y < rect.top)
            pt.y = rect.top;
        if (pt.y > rect.bottom)
            pt.y = rect.bottom;
        pt.x = rect.right;
        OnSelecting(GetCellFromPt(pt));
    }
    else if (pt.x < nFixedColWidth)
    {
        //SendMessage(WM_HSCROLL, SB_LINELEFT, 0);
        SendMessage(WM_KEYDOWN, VK_LEFT, 0);

        if (pt.y < rect.top)
            pt.y = rect.top;
        if (pt.y > rect.bottom)
            pt.y = rect.bottom;
        pt.x = nFixedColWidth + 1;
        OnSelecting(GetCellFromPt(pt));
    }
}

// move about with keyboard
void CGridCtrl::OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags)
{
    if (nChar == VK_INSERT)
    {
		if(m_bListMode)
		{
			m_datamodel->InsertRow();
			return;
		}
    }
    if (nChar == VK_DELETE)
    {
		if(m_bListMode)
		{
			m_datamodel->DeleteRow();
			return;
		}
    }

	if (!IsValid(m_idCurrentCell))
    {
        CWnd::OnKeyDown(nChar, nRepCnt, nFlags);
        return;
    }

    CCellID next = m_idCurrentCell;
    BOOL bChangeLine = FALSE;
	BOOL bHorzScrollAction = FALSE;
	BOOL bVertScrollAction = FALSE;

    if (IsCTRLpressed())
    {
        switch (nChar)
        {
        case 'A':
            OnEditSelectAll();
            break;
        case 'X':
            OnEditCut();
            break;
        case VK_INSERT:
        case 'C':
            OnEditCopy();
            break;
        case 'V':
            OnEditPaste();
            break;
        }
    }

    if (IsSHIFTpressed() &&(nChar == VK_INSERT))
        OnEditPaste();

    if (IsSHIFTpressed() &&(nChar == VK_DELETE))
        OnEditCut();


	BOOL bFoundVisible;
    int iOrig;

    if (nChar == VK_INSERT)
    {
		if(m_bListMode)
			m_datamodel->InsertRow();
    }
	else if (nChar == VK_RETURN)
	{
		OnEditCell(m_idCurrentCell.row, m_idCurrentCell.col, CPoint( -1, -1), VK_RETURN);
	}
    else if (nChar == VK_DELETE)
    {
		if(m_bListMode)
			m_datamodel->DeleteRow();
		else
			CutSelectedText();
    }
    else if (nChar == VK_DOWN)
    {
        // don't let user go to a hidden row
        bFoundVisible = FALSE;
        iOrig = next.row;
        next.row++;
        while( next.row < GetRowCount())
        {
            if( GetRowHeight( next.row) > 0)
            {
                bFoundVisible = TRUE;
                break;
            }
            next.row++;
        }
        if( !bFoundVisible)
            next.row = iOrig;
    }
    else if (nChar == VK_UP)
    {
        // don't let user go to a hidden row
        bFoundVisible = FALSE;
        iOrig = next.row;
        next.row--;
        while( next.row >= m_nFixedRows)
        {
            if( GetRowHeight( next.row) > 0)
            {
                bFoundVisible = TRUE;
                break;
            }
            next.row--;
        }
        if( !bFoundVisible)
            next.row = iOrig;
    }
    else if (nChar == VK_RIGHT || (nChar == VK_TAB && !IsSHIFTpressed()) )
    {
        // don't let user go to a hidden column
        bFoundVisible = FALSE;
        iOrig = next.col;
        next.col++;

        if (nChar == VK_TAB)
        {
			// If we're at the end of a row, go down a row till we find a non-hidden row
            if (next.col == (GetColumnCount()) && next.row < (GetRowCount() - 1))
            {
				next.row++;
				while( next.row < GetRowCount())
				{
					if( GetRowHeight(next.row) > 0)
					{
						bFoundVisible = TRUE;
						break;
					}
					next.row++; 
				}

                next.col = m_nFixedCols;	// Place focus on first non-fixed column
                bChangeLine = TRUE;
            }
            else
                CWnd::OnKeyDown(nChar, nRepCnt, nFlags);
        }

		// We're on a non-hidden row, so look across for the next non-hidden column
        while( next.col < GetColumnCount())
        {
            if( GetColumnWidth( next.col) > 0)
            {
                bFoundVisible = TRUE;
                break;
            }
            next.col++;
        }

		// If nothing worked then don't bother
        if( !bFoundVisible)
            next.col = iOrig;
    }
    else if (nChar == VK_LEFT || (nChar == VK_TAB && IsSHIFTpressed()) )
    {
        // don't let user go to a hidden column
        bFoundVisible = FALSE;
        iOrig = next.col;
        next.col--;

        if (nChar == VK_TAB)
        {
            if (next.col == (GetFixedColumnCount()-1) && next.row > GetFixedRowCount())
            {
                next.row--;
				while( next.row > GetFixedRowCount())
				{
					if( GetRowHeight(next.row) > 0)
					{
						bFoundVisible = TRUE;
						break;
					}
					next.row--; 
				}

                next.col = GetColumnCount() - 1; 
                bChangeLine = TRUE;
            }
            else
                CWnd::OnKeyDown(nChar, nRepCnt, nFlags);
        }

        while( next.col >= m_nFixedCols)
        {
            if( GetColumnWidth( next.col) > 0)
            {
                bFoundVisible = TRUE;
                break;
            }
            next.col--;
        }
        if( !bFoundVisible)
            next.col = iOrig;
    }
    else if (nChar == VK_NEXT)
    {
        CCellID idOldTopLeft = GetTopleftNonFixedCell();
        SendMessage(WM_VSCROLL, SB_PAGEDOWN, 0);
		bVertScrollAction = TRUE;
        CCellID idNewTopLeft = GetTopleftNonFixedCell();

        int increment = idNewTopLeft.row - idOldTopLeft.row;
        if (increment)
        {
            next.row += increment;
            if (next.row >(GetRowCount() - 1))
                next.row = GetRowCount() - 1;
        }
        else
            next.row = GetRowCount() - 1;
    }
    else if (nChar == VK_PRIOR)
    {
        CCellID idOldTopLeft = GetTopleftNonFixedCell();
        SendMessage(WM_VSCROLL, SB_PAGEUP, 0);
		bVertScrollAction = TRUE;
        CCellID idNewTopLeft = GetTopleftNonFixedCell();
            
        int increment = idNewTopLeft.row - idOldTopLeft.row;
        if (increment) 
        {
            next.row += increment;
            if (next.row < m_nFixedRows) 
                next.row = m_nFixedRows;
        }
        else
            next.row = m_nFixedRows;
    }
    else if (nChar == VK_HOME)
    {
        // Home and Ctrl-Home work more like Excel
        //  and don't let user go to a hidden cell
        if (IsCTRLpressed())
        {
            SendMessage(WM_VSCROLL, SB_TOP, 0);
            SendMessage(WM_HSCROLL, SB_LEFT, 0);
			bVertScrollAction = TRUE;
			bHorzScrollAction = TRUE;
            next.row = m_nFixedRows;
            next.col = m_nFixedCols;
        }
        else
        {
            SendMessage(WM_HSCROLL, SB_LEFT, 0);
 			bHorzScrollAction = TRUE;
            next.col = m_nFixedCols;
        }
        // adjust column to avoid hidden columns and rows
        while( next.col < GetColumnCount() - 1)
        {
            if( GetColumnWidth( next.col) > 0)
                break;
            next.col++;
        }
        while( next.row < GetRowCount() - 1)
        {
            if( GetRowHeight( next.row) > 0)
                break;
            next.row++;
        }
    }
    else if (nChar == VK_END)
    {
        // End and Ctrl-End work more like Excel
        //  and don't let user go to a hidden cell
        if (IsCTRLpressed())
        {
            SendMessage(WM_VSCROLL, SB_BOTTOM, 0);
            SendMessage(WM_HSCROLL, SB_RIGHT, 0);
			bHorzScrollAction = TRUE;
			bVertScrollAction = TRUE;
            next.row = GetRowCount() - 1;
            next.col = GetColumnCount() - 1;
        }
        else
        {
            SendMessage(WM_HSCROLL, SB_RIGHT, 0);
			bHorzScrollAction = TRUE;
            next.col = GetColumnCount() - 1;
        }
        // adjust column to avoid hidden columns and rows
        while( next.col > m_nFixedCols + 1)
        {
            if( GetColumnWidth( next.col) > 0)
                break;
            next.col--;
        }
        while( next.row > m_nFixedRows + 1)
        {
            if( GetRowHeight( next.row) > 0)
                break;
            next.row--;
        }
    }
    else if (nChar == VK_F2)
    {
        OnEditCell(m_idCurrentCell.row, m_idCurrentCell.col, CPoint( -1, -1), VK_LBUTTON);
    }
    else
    {
        CWnd::OnKeyDown(nChar, nRepCnt, nFlags);
        return;
    }

    if (next != m_idCurrentCell)
    {
        // While moving with the Cursorkeys the current ROW/CELL will get selected
        // OR Selection will get expanded when SHIFT is pressed
        // Cut n paste from OnLButtonDown - Franco Bez
        // Added check for NULL mouse mode - Chris Maunder.
        if (m_MouseMode == MOUSE_NOTHING)
        {
            m_PrevSelectedCellMap.RemoveAll();
            m_MouseMode = m_bListMode? MOUSE_SELECT_ROW : MOUSE_SELECT_CELLS;
            if (!IsSHIFTpressed() || nChar == VK_TAB)
                m_SelectionStartCell = next;

			// Notify parent that selection is changing - Arthur Westerman/Scot Brennecke 
			OnSelecting(next);
            m_MouseMode = MOUSE_NOTHING;
        }

        SetFocusCell(next);

        if (!IsCellVisible(next))
        {

            switch (nChar)
            {
            case VK_RIGHT:  
                SendMessage(WM_HSCROLL, SB_LINERIGHT, 0); 
				bHorzScrollAction = TRUE;
                break;
                
            case VK_LEFT:   
                SendMessage(WM_HSCROLL, SB_LINELEFT, 0);  
				bHorzScrollAction = TRUE;
                break;
                
            case VK_DOWN:   
                SendMessage(WM_VSCROLL, SB_LINEDOWN, 0);  
				bVertScrollAction = TRUE;
                break;
                
            case VK_UP:     
                SendMessage(WM_VSCROLL, SB_LINEUP, 0);    
				bVertScrollAction = TRUE;
                break;                
                
            case VK_TAB:    
                if (IsSHIFTpressed())
                {
                    if (bChangeLine) 
                    {
                        SendMessage(WM_VSCROLL, SB_LINEUP, 0);
						bVertScrollAction = TRUE;
                        SetScrollPos32(SB_HORZ, m_nHScrollMax);
                        break;
                    }
                    else 
					{
                        SendMessage(WM_HSCROLL, SB_LINELEFT, 0);
						bHorzScrollAction = TRUE;
					}
                }
                else
                {
                    if (bChangeLine) 
                    {
                        SendMessage(WM_VSCROLL, SB_LINEDOWN, 0);
						bVertScrollAction = TRUE;
                        SetScrollPos32(SB_HORZ, 0);
                        break;
                    }
                    else 
					{
						SendMessage(WM_HSCROLL, SB_LINERIGHT, 0);
						bHorzScrollAction = TRUE;
					}
                }
                break;
            }
            EnsureVisible(next); // Make sure cell is visible
            Invalidate();
        }
        EnsureVisible(next); // Make sure cell is visible

		if (bHorzScrollAction)
			SendMessage(WM_HSCROLL, SB_ENDSCROLL, 0);
		if (bVertScrollAction)
			SendMessage(WM_VSCROLL, SB_ENDSCROLL, 0);
    }
}

void CGridCtrl::OnKeyUp(UINT nChar, UINT nRepCnt, UINT nFlags)
{
    CWnd::OnKeyUp(nChar, nRepCnt, nFlags);
}

void CGridCtrl::OnSysKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags)
{
    m_TitleTip.Hide();  // hide any titletips

    CWnd::OnSysKeyDown(nChar, nRepCnt, nFlags);
}

// Instant editing of cells when keys are pressed
void CGridCtrl::OnChar(UINT nChar, UINT nRepCnt, UINT nFlags)
{
    // EFW - BUG FIX
    if (!IsCTRLpressed() && m_MouseMode == MOUSE_NOTHING && nChar != VK_ESCAPE)
    {
        if (!m_bHandleTabKey || (m_bHandleTabKey && nChar != VK_TAB))
            OnEditCell(m_idCurrentCell.row, m_idCurrentCell.col, CPoint( -1, -1), nChar);
    }

    CWnd::OnChar(nChar, nRepCnt, nFlags);
}

// Added by KiteFly
LRESULT CGridCtrl::OnImeChar(WPARAM wCharCode, LPARAM)
{
    // EFW - BUG FIX
    if (!IsCTRLpressed() && m_MouseMode == MOUSE_NOTHING && wCharCode != VK_ESCAPE) 
        OnEditCell(m_idCurrentCell.row, m_idCurrentCell.col, CPoint( -1, -1),(int) wCharCode);
    return 0;
}

// Callback from any CInPlaceEdits that ended. This just calls OnEndEditCell,
// refreshes the edited cell and moves onto next cell if the return character
// from the edit says we should.
void CGridCtrl::OnEndInPlaceEdit(NMHDR* pNMHDR, LRESULT* pResult)
{
    GV_DISPINFO *pgvDispInfo = (GV_DISPINFO *)pNMHDR;
    GV_ITEM     *pgvItem = &pgvDispInfo->item;

    // In case OnEndInPlaceEdit called as window is being destroyed
    if (!IsWindow(GetSafeHwnd()))
        return;

    OnEndEditCell(pgvItem->row, pgvItem->col, pgvItem->strText);
    //InvalidateCellRect(CCellID(pgvItem->row, pgvItem->col));

    switch (pgvItem->lParam)
    {
    case VK_TAB:
    case VK_DOWN:
    case VK_UP:
    case VK_RIGHT:
    case VK_LEFT:
    case VK_NEXT:
    case VK_PRIOR:
    case VK_HOME:
    case VK_END:
        OnKeyDown((UINT)pgvItem->lParam, 0, 0);
        OnEditCell(m_idCurrentCell.row, m_idCurrentCell.col, CPoint( -1, -1),(UINT) pgvItem->lParam);
    }

    *pResult = 0;
}

// Handle horz scrollbar notifications
void CGridCtrl::OnHScroll(UINT nSBCode, UINT /*nPos*/, CScrollBar* /*pScrollBar*/)
{
    EndEditing();

    m_TitleTip.Hide();  // hide any titletips

    int scrollPos = GetScrollPos32(SB_HORZ);

    CCellID idTopLeft = GetTopleftNonFixedCell();

    CRect rect;
    GetClientRect(rect);

    switch (nSBCode)
    {
    case SB_LINERIGHT:
        if (scrollPos < m_nHScrollMax)
        {
            // may have contiguous hidden columns.  Blow by them
            while (idTopLeft.col < (GetColumnCount()-1)
                    && GetColumnWidth( idTopLeft.col) < 1 )
            {
                idTopLeft.col++;
            }
            int xScroll = GetColumnWidth(idTopLeft.col);
            SetScrollPos32(SB_HORZ, scrollPos + xScroll);
            if (GetScrollPos32(SB_HORZ) == scrollPos)
                break;          // didn't work

            rect.left = GetFixedColumnWidth();
            //rect.left = GetFixedColumnWidth() + xScroll;
            //ScrollWindow(-xScroll, 0, rect);
            //rect.left = rect.right - xScroll;
            InvalidateRect(rect);
        }
        break;

    case SB_LINELEFT:
        if (scrollPos > 0 && idTopLeft.col > GetFixedColumnCount())
        {
            int iColToUse = idTopLeft.col-1;
            // may have contiguous hidden columns.  Blow by them
            while(  iColToUse > GetFixedColumnCount()
                    && GetColumnWidth( iColToUse) < 1 )
            {
                iColToUse--;
            }

            int xScroll = GetColumnWidth(iColToUse);
            SetScrollPos32(SB_HORZ, max(0, scrollPos - xScroll));
            rect.left = GetFixedColumnWidth();
            //ScrollWindow(xScroll, 0, rect);
            //rect.right = rect.left + xScroll;
            InvalidateRect(rect);
        }
        break;

    case SB_PAGERIGHT:
        if (scrollPos < m_nHScrollMax)
        {
            rect.left = GetFixedColumnWidth();
            int offset = rect.Width();
            int pos = min(m_nHScrollMax, scrollPos + offset);
            SetScrollPos32(SB_HORZ, pos);
            rect.left = GetFixedColumnWidth();
            InvalidateRect(rect);
        }
        break;
        
    case SB_PAGELEFT:
        if (scrollPos > 0)
        {
            rect.left = GetFixedColumnWidth();
            int offset = -rect.Width();
            int pos = max(0, scrollPos + offset);
            SetScrollPos32(SB_HORZ, pos);
            rect.left = GetFixedColumnWidth();
            InvalidateRect(rect);
        }
        break;
        
    case SB_THUMBPOSITION:
    case SB_THUMBTRACK:
        {
            SetScrollPos32(SB_HORZ, GetScrollPos32(SB_HORZ, TRUE));
            m_idTopLeftCell.row = -1;
            CCellID idNewTopLeft = GetTopleftNonFixedCell();
            if (idNewTopLeft != idTopLeft)
            {
                rect.left = GetFixedColumnWidth();
                InvalidateRect(rect);
            }
        }
        break;
        
    case SB_LEFT:
        if (scrollPos > 0)
        {
            SetScrollPos32(SB_HORZ, 0);
            Invalidate();
        }
        break;
        
    case SB_RIGHT:
        if (scrollPos < m_nHScrollMax)
        {
            SetScrollPos32(SB_HORZ, m_nHScrollMax);
            Invalidate();
        }
        break;
        
        
    default: 
        break;
    }
}

// Handle vert scrollbar notifications
void CGridCtrl::OnVScroll(UINT nSBCode, UINT /*nPos*/, CScrollBar* /*pScrollBar*/)
{
    EndEditing();

    m_TitleTip.Hide();  // hide any titletips

    // Get the scroll position ourselves to ensure we get a 32 bit value
    int scrollPos = GetScrollPos32(SB_VERT);

    CCellID idTopLeft = GetTopleftNonFixedCell();

    CRect rect;
    GetClientRect(rect);

    switch (nSBCode)
    {
    case SB_LINEDOWN:
        if (scrollPos < m_nVScrollMax)
        {
            // may have contiguous hidden rows.  Blow by them
            while(  idTopLeft.row < (GetRowCount()-1)
                    && GetRowHeight( idTopLeft.row) < 1 )
            {
                idTopLeft.row++;
            }

            int yScroll = GetRowHeight(idTopLeft.row);
            SetScrollPos32(SB_VERT, scrollPos + yScroll);
            if (GetScrollPos32(SB_VERT) == scrollPos)
                break;          // didn't work

            rect.top = GetFixedRowHeight();
            //rect.top = GetFixedRowHeight() + yScroll;
            //ScrollWindow(0, -yScroll, rect);
            //rect.top = rect.bottom - yScroll;
            InvalidateRect(rect);
        }
        break;
        
    case SB_LINEUP:
        if (scrollPos > 0 && idTopLeft.row > GetFixedRowCount())
        {
            int iRowToUse = idTopLeft.row-1;
            // may have contiguous hidden rows.  Blow by them
            while(  iRowToUse > GetFixedRowCount()
                    && GetRowHeight( iRowToUse) < 1 )
            {
                iRowToUse--;
            }

            int yScroll = GetRowHeight( iRowToUse);
            SetScrollPos32(SB_VERT, max(0, scrollPos - yScroll));
            rect.top = GetFixedRowHeight();
            //ScrollWindow(0, yScroll, rect);
            //rect.bottom = rect.top + yScroll;
            InvalidateRect(rect);
        }
        break;
        
    case SB_PAGEDOWN:
        if (scrollPos < m_nVScrollMax)
        {
            rect.top = GetFixedRowHeight();
            scrollPos = min(m_nVScrollMax, scrollPos + rect.Height());
            SetScrollPos32(SB_VERT, scrollPos);
            rect.top = GetFixedRowHeight();
            InvalidateRect(rect);
        }
        break;
        
    case SB_PAGEUP:
        if (scrollPos > 0)
        {
            rect.top = GetFixedRowHeight();
            int offset = -rect.Height();
            int pos = max(0, scrollPos + offset);
            SetScrollPos32(SB_VERT, pos);
            rect.top = GetFixedRowHeight();
            InvalidateRect(rect);
        }
        break;
        
    case SB_THUMBPOSITION:
    case SB_THUMBTRACK:
        {
            SetScrollPos32(SB_VERT, GetScrollPos32(SB_VERT, TRUE));
            m_idTopLeftCell.row = -1;
            CCellID idNewTopLeft = GetTopleftNonFixedCell();
            if (idNewTopLeft != idTopLeft)
            {
                rect.top = GetFixedRowHeight();
                InvalidateRect(rect);
            }
        }
        break;
        
    case SB_TOP:
        if (scrollPos > 0)
        {
            SetScrollPos32(SB_VERT, 0);
            Invalidate();
        }
        break;
        
    case SB_BOTTOM:
        if (scrollPos < m_nVScrollMax)
        {
            SetScrollPos32(SB_VERT, m_nVScrollMax);
            Invalidate();
        }
        
    default: 
        break;
    }
}

/////////////////////////////////////////////////////////////////////////////
// CGridCtrl implementation functions

void CGridCtrl::OnDraw(CDC* pDC)
{
    if (!m_bAllowDraw)
        return;
    CRect clipRect;
    if (pDC->GetClipBox(&clipRect) == ERROR)
        return;

    EraseBkgnd(pDC);            // OnEraseBkgnd does nothing, so erase bkgnd here.
    // This necessary since we may be using a Memory DC.
#ifdef _DEBUG
	LARGE_INTEGER iStartCount;
	QueryPerformanceCounter(&iStartCount);
#endif

    CRect rect;
    int row, col;

    int nFixedRowHeight = GetFixedRowHeight();
    int nFixedColWidth  = GetFixedColumnWidth();

    CCellID idTopLeft = GetTopleftNonFixedCell();
    int minVisibleRow = idTopLeft.row,
        minVisibleCol = idTopLeft.col;

    CRect VisRect;
    CCellRange VisCellRange = GetVisibleNonFixedCellRange(VisRect);
    int maxVisibleRow = VisCellRange.GetMaxRow(),
        maxVisibleCol = VisCellRange.GetMaxCol();

    // draw top-left cells 0..m_nFixedRows-1, 0..m_nFixedCols-1
    rect.bottom = -1;
    for (row = 0; row < m_nFixedRows; row++)
    {
        if (GetRowHeight(row) <= 0) continue;

        rect.top = rect.bottom+1;
        rect.bottom = rect.top + GetRowHeight(row)-1;
        rect.right = -1;
        for (col = 0; col < m_nFixedCols; col++)
        {
            if (GetColumnWidth(col) <= 0) continue;

            rect.left = rect.right+1;
            rect.right = rect.left + GetColumnWidth(col)-1;

            m_drawmodel->Draw(pDC, row, col, rect, FALSE);
        }
    }

    // draw fixed column cells:  m_nFixedRows..n, 0..m_nFixedCols-1
    rect.bottom = nFixedRowHeight-1;
    for (row = minVisibleRow; row <= maxVisibleRow; row++)
    {
        if (GetRowHeight(row) <= 0) continue;

        rect.top = rect.bottom+1;
        rect.bottom = rect.top + GetRowHeight(row)-1;

        // rect.bottom = bottom pixel of previous row
        if (rect.top > clipRect.bottom)
            break;                // Gone past cliprect
        if (rect.bottom < clipRect.top)
            continue;             // Reached cliprect yet?

        rect.right = -1;
        for (col = 0; col < m_nFixedCols; col++)
        {
            if (GetColumnWidth(col) <= 0) continue;

            rect.left = rect.right+1;
            rect.right = rect.left + GetColumnWidth(col)-1;

            if (rect.left > clipRect.right)
                break;            // gone past cliprect
            if (rect.right < clipRect.left)
                continue;         // Reached cliprect yet?

            m_drawmodel->Draw(pDC, row, col, rect, FALSE);
        }
    }

    // draw fixed row cells  0..m_nFixedRows, m_nFixedCols..n
    rect.bottom = -1;
    for (row = 0; row < m_nFixedRows; row++)
    {
        if (GetRowHeight(row) <= 0) continue;

        rect.top = rect.bottom+1;
        rect.bottom = rect.top + GetRowHeight(row)-1;

        // rect.bottom = bottom pixel of previous row
        if (rect.top > clipRect.bottom)
            break;                // Gone past cliprect
        if (rect.bottom < clipRect.top)
            continue;             // Reached cliprect yet?

        rect.right = nFixedColWidth-1;
        for (col = minVisibleCol; col <= maxVisibleCol; col++)
        {
            if (GetColumnWidth(col) <= 0) continue;

            rect.left = rect.right+1;
            rect.right = rect.left + GetColumnWidth(col)-1;

            if (rect.left > clipRect.right)
                break;        // gone past cliprect
            if (rect.right < clipRect.left)
                continue;     // Reached cliprect yet?

            m_drawmodel->Draw(pDC, row, col, rect, FALSE);
		}
    }

    // draw rest of non-fixed cells
    rect.bottom = nFixedRowHeight-1;
    for (row = minVisibleRow; row <= maxVisibleRow; row++)
    {
        if (GetRowHeight(row) <= 0) continue;

        rect.top = rect.bottom+1;
        rect.bottom = rect.top + GetRowHeight(row)-1;

        // rect.bottom = bottom pixel of previous row
        if (rect.top > clipRect.bottom)
            break;                // Gone past cliprect
        if (rect.bottom < clipRect.top)
            continue;             // Reached cliprect yet?

        rect.right = nFixedColWidth-1;
        for (col = minVisibleCol; col <= maxVisibleCol; col++)
        {
            if (GetColumnWidth(col) <= 0) continue;

            rect.left = rect.right+1;
            rect.right = rect.left + GetColumnWidth(col)-1;

            if (rect.left > clipRect.right)
                break;        // gone past cliprect
            if (rect.right < clipRect.left)
                continue;     // Reached cliprect yet?

            m_drawmodel->Draw(pDC, row, col, rect, FALSE);
		}
    }


    CPen pen;
	pen.CreatePen(PS_SOLID, 0, m_drawmodel->GetColor(IDrawModel::GRID,IDrawModel::FACE,IDrawModel::NORMAL));
    pDC->SelectObject(&pen);

    // draw vertical lines (drawn at ends of cells)
    if (m_nGridLines == GVL_BOTH || m_nGridLines == GVL_VERT)
    {
        int x = nFixedColWidth;
        for (col = minVisibleCol; col <= maxVisibleCol; col++)
        {
            if (GetColumnWidth(col) <= 0) continue;

            x += GetColumnWidth(col);
            pDC->MoveTo(x-1, nFixedRowHeight);
            pDC->LineTo(x-1, VisRect.bottom);
        }
    }

    // draw horizontal lines (drawn at bottom of each cell)
    if (m_nGridLines == GVL_BOTH || m_nGridLines == GVL_HORZ)
    {
        int y = nFixedRowHeight;
        for (row = minVisibleRow; row <= maxVisibleRow; row++)
        {
            if (GetRowHeight(row) <= 0) continue;

            y += GetRowHeight(row);
            pDC->MoveTo(nFixedColWidth, y-1);
            pDC->LineTo(VisRect.right,  y-1);
        }
    }

    pDC->SelectStockObject(NULL_PEN);

#ifdef _DEBUG
	LARGE_INTEGER iEndCount;
	QueryPerformanceCounter(&iEndCount);
	TRACE1("Draw counter ticks: %d\n", iEndCount.LowPart-iStartCount.LowPart);
#endif

}

////////////////////////////////////////////////////////////////////////////////////////
// CGridCtrl Cell selection stuff

// Is a given cell designation valid (ie within the bounds of our number
// of columns/rows)?
BOOL CGridCtrl::IsValid(int nRow, int nCol) const
{
    return (nRow >= 0 && nRow < m_nRows && nCol >= 0 && nCol < m_nCols);
}

BOOL CGridCtrl::IsValid(const CCellID& cell) const
{
    return IsValid(cell.row, cell.col);
}

// Is a given cell range valid (ie within the bounds of our number
// of columns/rows)?
BOOL CGridCtrl::IsValid(const CCellRange& range) const
{
    return (range.GetMinRow() >= 0 && range.GetMinCol() >= 0 &&
        range.GetMaxRow() >= 0 && range.GetMaxCol() >= 0 &&
        range.GetMaxRow() < m_nRows && range.GetMaxCol() < m_nCols &&
        range.GetMinRow() <= range.GetMaxRow() && range.GetMinCol() <= range.GetMaxCol());
}

// Enables/Disables redraw for certain operations like columns auto-sizing etc,
// but not for user caused things such as selection changes.
void CGridCtrl::SetRedraw(BOOL bAllowDraw, BOOL bResetScrollBars /* = FALSE */)
{
//    TRACE(_T("%s: Setting redraw to %s\n"),
//             GetRuntimeClass()->m_lpszClassName, bAllowDraw? _T("TRUE") : _T("FALSE"));

    if (bAllowDraw && !m_bAllowDraw)
    {
        m_bAllowDraw = TRUE;
        Refresh();
    }

    m_bAllowDraw = bAllowDraw;
    if (bResetScrollBars)
        ResetScrollBars();
}

// Forces a redraw of a cell immediately (using a direct DC construction,
// or the supplied dc)
BOOL CGridCtrl::RedrawCell(const CCellID& cell, CDC* pDC /* = NULL */)
{
    return RedrawCell(cell.row, cell.col, pDC);
}

BOOL CGridCtrl::RedrawCell(int nRow, int nCol, CDC* pDC /* = NULL */)
{
    BOOL bResult = TRUE;
    BOOL bMustReleaseDC = FALSE;

    if (!m_bAllowDraw || !IsCellVisible(nRow, nCol))
        return FALSE;

    CRect rect;
    if (!GetCellRect(nRow, nCol, rect))
        return FALSE;

    if (!pDC)
    {
        pDC = GetDC();
        if (pDC)
            bMustReleaseDC = TRUE;
    }

    if (pDC)
    {
        // Redraw cells directly
        if (nRow < m_nFixedRows || nCol < m_nFixedCols)
        {
			bResult = m_drawmodel->Draw(pDC, nRow, nCol, rect, TRUE);
        }
        else
        {
			bResult = m_drawmodel->Draw(pDC, nRow, nCol, rect, TRUE);
            // Since we have erased the background, we will need to redraw the gridlines
            CPen pen;
			pen.CreatePen(PS_SOLID, 0, m_drawmodel->GetColor(IDrawModel::GRID,IDrawModel::FACE,IDrawModel::NORMAL));

            CPen* pOldPen = (CPen*) pDC->SelectObject(&pen);
            if (m_nGridLines == GVL_BOTH || m_nGridLines == GVL_HORZ)
            {
                pDC->MoveTo(rect.left,    rect.bottom);
                pDC->LineTo(rect.right + 1, rect.bottom);
            }
            if (m_nGridLines == GVL_BOTH || m_nGridLines == GVL_VERT)
            {
                pDC->MoveTo(rect.right, rect.top);
                pDC->LineTo(rect.right, rect.bottom + 1);
            }
            pDC->SelectObject(pOldPen);
        }
    } else
        InvalidateRect(rect, TRUE);     // Could not get a DC - invalidate it anyway
    // and hope that OnPaint manages to get one

    if (bMustReleaseDC)
        ReleaseDC(pDC);

    return bResult;
}

// redraw a complete row
BOOL CGridCtrl::RedrawRow(int row)
{
    BOOL bResult = TRUE;

    CDC* pDC = GetDC();
    for (int col = 0; col < GetColumnCount(); col++)
        bResult = RedrawCell(row, col, pDC) && bResult;
    if (pDC)
        ReleaseDC(pDC);

    return bResult;
}

// redraw a complete column
BOOL CGridCtrl::RedrawColumn(int col)
{
    BOOL bResult = TRUE;

    CDC* pDC = GetDC();
    for (int row = 0; row < GetRowCount(); row++)
        bResult = RedrawCell(row, col, pDC) && bResult;
    if (pDC)
        ReleaseDC(pDC);

    return bResult;
}


// Sets the currently selected cell, returning the previous current cell
CCellID CGridCtrl::SetFocusCell(int nRow, int nCol)
{
    return SetFocusCell(CCellID(nRow, nCol));
}

CCellID CGridCtrl::SetFocusCell(CCellID cell)
{
    if (cell == m_idCurrentCell)
        return m_idCurrentCell;

    CCellID idPrev = m_idCurrentCell;

    // EFW - Bug Fix - Force focus to be in a non-fixed cell
    if (cell.row != -1 && cell.row < GetFixedRowCount())
        cell.row = GetFixedRowCount();
    if (cell.col != -1 && cell.col < GetFixedColumnCount())
        cell.col = GetFixedColumnCount();

    m_idCurrentCell = cell;

    if (IsValid(idPrev))
    {
        SetItemState(idPrev.row, idPrev.col,
            GetItemState(idPrev.row, idPrev.col) & ~GVIS_FOCUSED);
        RedrawCell(idPrev); // comment to reduce flicker

        if (GetTrackFocusCell() && idPrev.col != m_idCurrentCell.col)
            for (int row = 0; row < m_nFixedRows; row++)
                RedrawCell(row, idPrev.col);
        if (GetTrackFocusCell() && idPrev.row != m_idCurrentCell.row)
            for (int col = 0; col < m_nFixedCols; col++)
                RedrawCell(idPrev.row, col);
    }

    if (IsValid(m_idCurrentCell))
    {
        SetItemState(m_idCurrentCell.row, m_idCurrentCell.col,
            GetItemState(m_idCurrentCell.row, m_idCurrentCell.col) | GVIS_FOCUSED);

        RedrawCell(m_idCurrentCell); // comment to reduce flicker

        if (GetTrackFocusCell() && idPrev.col != m_idCurrentCell.col)
            for (int row = 0; row < m_nFixedRows; row++)
                RedrawCell(row, m_idCurrentCell.col);
        if (GetTrackFocusCell() && idPrev.row != m_idCurrentCell.row)
            for (int col = 0; col < m_nFixedCols; col++)
                RedrawCell(m_idCurrentCell.row, col);

        // EFW - New addition.  If in list mode, make sure the selected
        // row highlight follows the cursor.
        // Removed by C Maunder 27 May
        //if (m_bListMode)
        //{
        //    m_PrevSelectedCellMap.RemoveAll();
        //    m_MouseMode = MOUSE_SELECT_ROW;
        //    OnSelecting(m_idCurrentCell);

            // Leave this off so that you can still drag the highlight around
            // without selecting rows.
            // m_MouseMode = MOUSE_NOTHING;
        //}

	}

    return idPrev;
}

// Sets the range of currently selected cells
void CGridCtrl::SetSelectedRange(const CCellRange& Range,
                                 BOOL bForceRepaint /* = FALSE */, BOOL bSelectCells/*=TRUE*/)
{
    SetSelectedRange(Range.GetMinRow(), Range.GetMinCol(),
                     Range.GetMaxRow(), Range.GetMaxCol(),
                     bForceRepaint, bSelectCells);
}

void CGridCtrl::SetSelectedRange(int nMinRow, int nMinCol, int nMaxRow, int nMaxCol,
                                 BOOL bForceRepaint /* = FALSE */, BOOL bSelectCells/*=TRUE*/)
{
    if (!m_bEnableSelection)
        return;

	CWaitCursor wait; // Thomas Haase 

    CDC* pDC = NULL;
    if (bForceRepaint)
        pDC = GetDC();

	// Only redraw visible cells
    CCellRange VisCellRange;
	if (IsWindow(GetSafeHwnd()))
		VisCellRange = GetVisibleNonFixedCellRange();
   
    // EFW - Bug fix - Don't allow selection of fixed rows
    if(nMinRow >= 0 && nMinRow < GetFixedRowCount())
        nMinRow = GetFixedRowCount();
    if(nMaxRow >= 0 && nMaxRow < GetFixedRowCount())
        nMaxRow = GetFixedRowCount();
    if(nMinCol >= 0 && nMinCol < GetFixedColumnCount())
        nMinCol = GetFixedColumnCount();
    if(nMaxCol >= 0 && nMaxCol < GetFixedColumnCount())
        nMaxCol = GetFixedColumnCount();

    // If we are selecting cells, then first clear out the list of currently selected cells, then
    if (bSelectCells)
    {
        POSITION pos;

        // Unselect all previously selected cells
        for (pos = m_SelectedCellMap.GetStartPosition(); pos != NULL; )
        {
            DWORD key;
            CCellID cell;
            m_SelectedCellMap.GetNextAssoc(pos, key, (CCellID&)cell);

            // Reset the selection flag on the cell
            if (IsValid(cell))
            {
                // This will remove the cell from the m_SelectedCellMap map
                SetItemState(cell.row, cell.col,
                    GetItemState(cell.row, cell.col) & ~GVIS_SELECTED);

                // If this is to be reselected, continue on past the redraw
                if (nMinRow <= cell.row && cell.row <= nMaxRow &&
                    nMinCol <= cell.col && cell.col <= nMaxCol)
                    continue;

				if ( VisCellRange.IsValid() && VisCellRange.InRange( cell ) )
				{
					if (bForceRepaint && pDC)                    // Redraw NOW
						RedrawCell(cell.row, cell.col, pDC);
					else
						InvalidateCellRect(cell);                // Redraw at leisure
				}
            }
            else
            {
                m_SelectedCellMap.RemoveKey( key);  // if it's not valid, get rid of it!
            }
        }

        // if we are selecting cells, and there are previous selected cells to be retained 
        // (eg Ctrl is being held down) then copy them to the newly created list, and mark 
        // all these cells as selected
        // Note that if we are list mode, single row selection, then we won't be adding 
        // the previous cells. Only the current row of cells will be added (see below)
        if (!GetSingleRowSelection() &&
            nMinRow >= 0 && nMinCol >= 0 && nMaxRow >= 0 && nMaxCol >= 0)
        {
            for (pos = m_PrevSelectedCellMap.GetStartPosition(); pos != NULL; /* nothing */)
            {
                DWORD key;
                CCellID cell;
                m_PrevSelectedCellMap.GetNextAssoc(pos, key, (CCellID&)cell);

                if (!IsValid(cell))
                    continue;

                int nState = GetItemState(cell.row, cell.col);

                // Set state as Selected. This will add the cell to m_SelectedCellMap
                SetItemState(cell.row, cell.col, nState | GVIS_SELECTED);

				if ( VisCellRange.IsValid() && VisCellRange.InRange( cell ) )
				{
					// Redraw (immediately or at leisure)
					if (bForceRepaint && pDC)
					    RedrawCell(cell.row, cell.col, pDC);
					else
					    InvalidateCellRect(cell);
				}
            }
        }
    }

    // Now select/deselect all cells in the cell range specified. If selecting, and the cell 
    // has already been marked as selected (above) then ignore it. If we are deselecting and
    // the cell isn't selected, then ignore
    if (nMinRow >= 0 && nMinCol >= 0 && nMaxRow >= 0 && nMaxCol >= 0 &&
        nMaxRow < m_nRows && nMaxCol < m_nCols &&
        nMinRow <= nMaxRow && nMinCol <= nMaxCol)
    {
        for (int row = nMinRow; row <= nMaxRow; row++)
            for (int col = nMinCol; col <= nMaxCol; col++)
            {
                BOOL bCellSelected = IsCellSelected(row, col);
                if (bSelectCells == bCellSelected)
                    continue;    // Already selected or deselected - ignore

                // Set the selected state. This will add/remove the cell to m_SelectedCellMap
                if (bSelectCells)
                    SetItemState(row, col, GetItemState(row, col) | GVIS_SELECTED);
                else
                    SetItemState(row, col, GetItemState(row, col) & ~GVIS_SELECTED);

				if ( VisCellRange.IsValid() && VisCellRange.InRange(row, col) )
				{
	                // Redraw (immediately or at leisure)
	                if (bForceRepaint && pDC)
	                    RedrawCell(row, col, pDC);
	                else
	                    InvalidateCellRect(row, col);
				}
            }
    }
    //    TRACE(_T("%d cells selected.\n"), m_SelectedCellMap.GetCount());

    if (pDC != NULL)
        ReleaseDC(pDC);
}

// selects all cells
void CGridCtrl::SelectAllCells()
{
    if (!m_bEnableSelection)
        return;

    SetSelectedRange(m_nFixedRows, m_nFixedCols, GetRowCount()-1, GetColumnCount()-1);
}

// selects columns
void CGridCtrl::SelectColumns(CCellID currentCell, 
                              BOOL bForceRedraw /*=FALSE*/, BOOL bSelectCells /*=TRUE*/)
{
    if (!m_bEnableSelection)
        return;

    //if (currentCell.col == m_idCurrentCell.col) return;
    if (currentCell.col < m_nFixedCols)
        return;
    if (!IsValid(currentCell))
        return;

    if (GetSingleColSelection())
        SetSelectedRange(GetFixedRowCount(), currentCell.col,
                         GetRowCount()-1,    currentCell.col,
                         bForceRedraw, bSelectCells);
    else
        SetSelectedRange(GetFixedRowCount(),
                         min(m_SelectionStartCell.col, currentCell.col),
                         GetRowCount()-1,
                         max(m_SelectionStartCell.col, currentCell.col),
                         bForceRedraw, bSelectCells);
}

// selects rows
void CGridCtrl::SelectRows(CCellID currentCell, 
                           BOOL bForceRedraw /*=FALSE*/, BOOL bSelectCells /*=TRUE*/)
{
    if (!m_bEnableSelection)
        return;

    //if (currentCell.row; == m_idCurrentCell.row) return;
    if (currentCell.row < m_nFixedRows)
        return;
    if (!IsValid(currentCell))
        return;

    if (GetSingleRowSelection())
        SetSelectedRange(currentCell.row, GetFixedColumnCount(),
                         currentCell.row, GetColumnCount()-1, 
                         bForceRedraw, bSelectCells);
    else
        SetSelectedRange(min(m_SelectionStartCell.row, currentCell.row),
                         GetFixedColumnCount(),
                         max(m_SelectionStartCell.row, currentCell.row),
                         GetColumnCount()-1,
                         bForceRedraw, bSelectCells);
}

// selects cells
void CGridCtrl::SelectCells(CCellID currentCell, 
                            BOOL bForceRedraw /*=FALSE*/, BOOL bSelectCells /*=TRUE*/)
{
    if (!m_bEnableSelection)
        return;

    int row = currentCell.row;
    int col = currentCell.col;
    if (row < m_nFixedRows || col < m_nFixedCols)
        return;
    if (!IsValid(currentCell))
        return;

    // Prevent unnecessary redraws
    //if (currentCell == m_LeftClickDownCell)  return;
    //else if (currentCell == m_idCurrentCell) return;

    SetSelectedRange(min(m_SelectionStartCell.row, row),
                     min(m_SelectionStartCell.col, col),
                     max(m_SelectionStartCell.row, row),
                     max(m_SelectionStartCell.col, col),
                     bForceRedraw, bSelectCells);
}

// Called when mouse/keyboard selection is a-happening.
void CGridCtrl::OnSelecting(const CCellID& currentCell)
{
    if (!m_bEnableSelection)
        return;

    switch (m_MouseMode)
    {
    case MOUSE_SELECT_ALL:
        SelectAllCells();
        break;
    case MOUSE_SELECT_COL:
        SelectColumns(currentCell, FALSE);
        break;
    case MOUSE_SELECT_ROW:
        SelectRows(currentCell, FALSE);
        break;
    case MOUSE_SELECT_CELLS:
        SelectCells(currentCell, FALSE);
        break;
    }

    // EFW - Bug fix [REMOVED CJM: this will cause infinite loop in list mode]
    // SetFocusCell(max(currentCell.row, m_nFixedRows), max(currentCell.col, m_nFixedCols));
}

void CGridCtrl::ValidateAndModifyCellContents(int nRow, int nCol, LPCTSTR strText)
{
    if (!IsCellEditable(nRow, nCol))
        return;

    CString strCurrentText = GetItemText(nRow, nCol);
    if (strCurrentText != strText)
    {
		SetItemText(nRow, nCol, strText);
		if (ValidateEdit(nRow, nCol, strText))
        {
			SetModified(TRUE, nRow, nCol);
            RedrawCell(nRow, nCol);
        }
        else
        {
			SetItemText(nRow, nCol, strCurrentText);
		}
    }
}

void CGridCtrl::ClearCells(CCellRange Selection)
{
    for (int row = Selection.GetMinRow(); row <= Selection.GetMaxRow(); row++)
    {
        for (int col = Selection.GetMinCol(); col <= Selection.GetMaxCol(); col++)
        {
            // don't clear hidden cells
            if ( m_arRowHeights[row] > 0 && m_arColWidths[col] > 0 )
            {
                ValidateAndModifyCellContents(row, col, _T(""));
            }
		}
	}
    Refresh();
}


////////////////////////////////////////////////////////////////////////////////////////
// Clipboard functions

// Deletes the contents from the selected cells
void CGridCtrl::CutSelectedText()
{
    if (!IsEditable())
        return;

    for (POSITION pos = m_SelectedCellMap.GetStartPosition(); pos != NULL; )
    {
		DWORD key;
        CCellID cell;
        m_SelectedCellMap.GetNextAssoc(pos, key, (CCellID&)cell);
        ValidateAndModifyCellContents(cell.row, cell.col, _T(""));
    }
}

// Copies text from the selected cells to the clipboard
COleDataSource* CGridCtrl::CopyTextFromGrid()
{
    USES_CONVERSION;

    CCellRange Selection = GetSelectedCellRange();
    if (!IsValid(Selection))
        return NULL;

    // Write to shared file (REMEBER: CF_TEXT is ANSI, not UNICODE, so we need to convert)
    CSharedFile sf(GMEM_MOVEABLE | GMEM_DDESHARE | GMEM_ZEROINIT);

    // Get a tab delimited string to copy to cache
    CString str;
    for (int row = Selection.GetMinRow(); row <= Selection.GetMaxRow(); row++)
    {
        // don't copy hidden cells
        if( m_arRowHeights[row] <= 0 )
            continue;

        str.Empty();
        for (int col = Selection.GetMinCol(); col <= Selection.GetMaxCol(); col++)
        {
            // don't copy hidden cells
            if( m_arColWidths[col] <= 0 )
                continue;

			if (Selection.InRange(row,col))
            {
                // if (!pCell->GetText())
                //    str += _T(" ");
                // else 
                str += GetItemText(row,col);
            }
            if (col != Selection.GetMaxCol()) 
                str += _T("\t");
        }

        if (row != Selection.GetMaxRow()) 
            str += _T("\r\n");
        
        sf.Write(T2A(str.GetBuffer(1)), str.GetLength());
        str.ReleaseBuffer();
    }
    
    char c = '\0';
    sf.Write(&c, 1);

    DWORD dwLen = (DWORD) sf.GetLength();
    HGLOBAL hMem = sf.Detach();
    if (!hMem)
        return NULL;

    hMem = ::GlobalReAlloc(hMem, dwLen, GMEM_MOVEABLE | GMEM_DDESHARE | GMEM_ZEROINIT);
    if (!hMem)
        return NULL;

    // Cache data
    COleDataSource* pSource = new COleDataSource();
    pSource->CacheGlobalData(CF_TEXT, hMem);

    return pSource;
}

// Pastes text from the clipboard to the selected cells
BOOL CGridCtrl::PasteTextToGrid(CCellID cell, COleDataObject* pDataObject, 
								BOOL bSelectPastedCells /*=TRUE*/)
{
    if (!IsValid(cell) || !IsCellEditable(cell) || !pDataObject->IsDataAvailable(CF_TEXT))
        return FALSE;

    // Get the text from the COleDataObject
    HGLOBAL hmem = pDataObject->GetGlobalData(CF_TEXT);
    CMemFile sf((BYTE*) ::GlobalLock(hmem), (UINT)::GlobalSize(hmem));

    // CF_TEXT is ANSI text, so we need to allocate a char* buffer
    // to hold this.
    LPTSTR szBuffer = new TCHAR[::GlobalSize(hmem)];
    if (!szBuffer)
        return FALSE;

    sf.Read(szBuffer, (UINT)::GlobalSize(hmem));
    ::GlobalUnlock(hmem);

    // Now store in generic TCHAR form so we no longer have to deal with
    // ANSI/UNICODE problems
    CString strText = szBuffer;
    delete szBuffer;

    // Parse text data and set in cells...
    strText.LockBuffer();
    CString strLine = strText;
    int nLine = 0;

    // Find the end of the first line
	CCellRange PasteRange(cell.row, cell.col,-1,-1);
    int nIndex;
    do
    {
        int nColumn = 0;
        nIndex = strLine.Find(_T("\n"));

        // Store the remaining chars after the newline
        CString strNext = (nIndex < 0)? _T("")  : strLine.Mid(nIndex + 1);

        // Remove all chars after the newline
        if (nIndex >= 0)
            strLine = strLine.Left(nIndex);

        int nLineIndex = strLine.FindOneOf(_T("\t,"));
        CString strCellText = (nLineIndex >= 0)? strLine.Left(nLineIndex) : strLine;

        // skip hidden rows
        int iRowVis = cell.row + nLine;
        while( iRowVis < GetRowCount())
        {
            if( GetRowHeight( iRowVis) > 0)
                break;
            nLine++;
            iRowVis++;
        }

        while (!strLine.IsEmpty())
        {
            // skip hidden columns
            int iColVis = cell.col + nColumn;
            while( iColVis < GetColumnCount())
            {
                if( GetColumnWidth( iColVis) > 0)
                    break;
                nColumn++;
                iColVis++;
            }

            CCellID TargetCell(iRowVis, iColVis);
            if (IsValid(TargetCell))
            {
                strCellText.TrimLeft();
                strCellText.TrimRight();

                ValidateAndModifyCellContents(TargetCell.row, TargetCell.col, strCellText);

                // Make sure cell is not selected to avoid data loss
                SetItemState(TargetCell.row, TargetCell.col,
                    GetItemState(TargetCell.row, TargetCell.col) & ~GVIS_SELECTED);

				if (iRowVis > PasteRange.GetMaxRow()) PasteRange.SetMaxRow(iRowVis);
				if (iColVis > PasteRange.GetMaxCol()) PasteRange.SetMaxCol(iColVis);
            }

            strLine = (nLineIndex >= 0)? strLine.Mid(nLineIndex + 1) : _T("");
            nLineIndex = strLine.FindOneOf(_T("\t,"));
            strCellText = (nLineIndex >= 0)? strLine.Left(nLineIndex) : strLine;

            nColumn++;
        }

        strLine = strNext;
        nLine++;
    } while (nIndex >= 0);

    strText.UnlockBuffer();

	if (bSelectPastedCells)
		SetSelectedRange(PasteRange, TRUE);
	else
	{
		ResetSelectedRange();
		Refresh();
	}

    return TRUE;
}
// Start drag n drop
void CGridCtrl::OnBeginDrag()
{
    if (!m_bAllowDragAndDrop)
        return;

    COleDataSource* pSource = CopyTextFromGrid();
    if (pSource)
    {
        m_MouseMode = MOUSE_DRAGGING;
        m_bLMouseButtonDown = FALSE;

        DROPEFFECT dropEffect = pSource->DoDragDrop(DROPEFFECT_COPY | DROPEFFECT_MOVE);

        if (dropEffect & DROPEFFECT_MOVE)
            CutSelectedText();

        if (pSource)
            delete pSource;    // Did not pass source to clipboard, so must delete
    }
}

// Handle drag over grid
DROPEFFECT CGridCtrl::OnDragOver(COleDataObject* pDataObject, DWORD dwKeyState,
                                 CPoint point)
{
    // Any text data available for us?
    if (!m_bAllowDragAndDrop || !IsEditable() || !pDataObject->IsDataAvailable(CF_TEXT))
        return DROPEFFECT_NONE;

    // Find which cell we are over and drop-highlight it
    CCellID cell = GetCellFromPt(point, FALSE);

    // If not valid, set the previously drop-highlighted cell as no longer drop-highlighted
    if (!IsValid(cell))
    {
        OnDragLeave();
        m_LastDragOverCell = CCellID(-1,-1);
        return DROPEFFECT_NONE;
    }

    if (!IsCellEditable(cell))
        return DROPEFFECT_NONE;

    // Have we moved over a different cell than last time?
    if (cell != m_LastDragOverCell)
    {
        // Set the previously drop-highlighted cell as no longer drop-highlighted
        if (IsValid(m_LastDragOverCell))
        {
            UINT nState = GetItemState(m_LastDragOverCell.row, m_LastDragOverCell.col);
            SetItemState(m_LastDragOverCell.row, m_LastDragOverCell.col,
                nState & ~GVIS_DROPHILITED);
            RedrawCell(m_LastDragOverCell);
        }

        m_LastDragOverCell = cell;

        // Set the new cell as drop-highlighted
        if (IsValid(m_LastDragOverCell))
        {
            UINT nState = GetItemState(m_LastDragOverCell.row, m_LastDragOverCell.col);
            SetItemState(m_LastDragOverCell.row, m_LastDragOverCell.col,
                nState | GVIS_DROPHILITED);
            RedrawCell(m_LastDragOverCell);
        }
    }

    // Return an appropraite value of DROPEFFECT so mouse cursor is set properly
    if (dwKeyState & MK_CONTROL)
        return DROPEFFECT_COPY;
    else
        return DROPEFFECT_MOVE;
}

// Something has just been dragged onto the grid
DROPEFFECT CGridCtrl::OnDragEnter(COleDataObject* pDataObject, DWORD dwKeyState,
                                  CPoint point)
{
    // Any text data available for us?
    if (!m_bAllowDragAndDrop || !pDataObject->IsDataAvailable(CF_TEXT))
        return DROPEFFECT_NONE;

    // Find which cell we are over and drop-highlight it
    m_LastDragOverCell = GetCellFromPt(point, FALSE);
    if (!IsValid(m_LastDragOverCell))
        return DROPEFFECT_NONE;

    if (!IsCellEditable(m_LastDragOverCell))
        return DROPEFFECT_NONE;

    if (IsValid(m_LastDragOverCell))
    {
        UINT nState = GetItemState(m_LastDragOverCell.row, m_LastDragOverCell.col);
        SetItemState(m_LastDragOverCell.row, m_LastDragOverCell.col,
            nState | GVIS_DROPHILITED);
        RedrawCell(m_LastDragOverCell);
    }

    // Return an appropraite value of DROPEFFECT so mouse cursor is set properly
    if (dwKeyState & MK_CONTROL)
        return DROPEFFECT_COPY;
    else
        return DROPEFFECT_MOVE;
}

// Something has just been dragged away from the grid
void CGridCtrl::OnDragLeave()
{
    // Set the previously drop-highlighted cell as no longer drop-highlighted
    if (IsValid(m_LastDragOverCell))
    {
        UINT nState = GetItemState(m_LastDragOverCell.row, m_LastDragOverCell.col);
        SetItemState(m_LastDragOverCell.row, m_LastDragOverCell.col,
            nState & ~GVIS_DROPHILITED);
        RedrawCell(m_LastDragOverCell);
    }
}

// Something has just been dropped onto the grid
BOOL CGridCtrl::OnDrop(COleDataObject* pDataObject, DROPEFFECT /*dropEffect*/,
                       CPoint /* point */)
{
    m_MouseMode = MOUSE_NOTHING;
    
    if (!m_bAllowDragAndDrop || !IsCellEditable(m_LastDragOverCell))
        return FALSE;

    OnDragLeave();

    return PasteTextToGrid(m_LastDragOverCell, pDataObject, FALSE);
}

void CGridCtrl::OnEditCut()
{
    if (!IsEditable())
        return;

    COleDataSource* pSource = CopyTextFromGrid();
    if (!pSource)
        return;

    pSource->SetClipboard();
    CutSelectedText();
}

void CGridCtrl::OnEditCopy()
{
    COleDataSource* pSource = CopyTextFromGrid();
    if (!pSource)
        return;

    pSource->SetClipboard();
}

void CGridCtrl::OnEditPaste()
{
    if (!IsEditable())
        return;

	CCellRange cellRange = GetSelectedCellRange();

	// Get the top-left selected cell, or the Focus cell, or the topleft (non-fixed) cell
	CCellID cell;
	if (cellRange.IsValid())
	{
		cell.row = cellRange.GetMinRow();
		cell.col = cellRange.GetMinCol();
	}
	else
	{
		cell = GetFocusCell();
		if (!IsValid(cell))
			cell = GetTopleftNonFixedCell();
		if (!IsValid(cell))
			return;
	}

	// If a cell is being edited, then call it's edit window paste function.
    if ( IsItemEditing(cell.row, cell.col) )
    {
		CWnd* pEditWnd = m_datamodel->GetEditCtrl(cell.row,cell.col);
		pEditWnd->SendMessage(WM_COMMAND,ID_EDIT_PASTE,0);
		return;
    }

    // Attach a COleDataObject to the clipboard and paste the data to the grid
    COleDataObject obj;
    if (obj.AttachClipboard())
        PasteTextToGrid(cell, &obj);
}

void CGridCtrl::OnEditSelectAll()
{
    SelectAllCells();
}

#ifndef GRIDCONTROL_NO_CLIPBOARD
void CGridCtrl::OnUpdateEditCopy(CCmdUI* pCmdUI)
{
	pCmdUI->Enable(GetSelectedCount() > 0); // - Thomas Haase 
    //CCellRange Selection = GetSelectedCellRange();
    //pCmdUI->Enable(Selection.Count() && IsValid(Selection));
}

void CGridCtrl::OnUpdateEditCut(CCmdUI* pCmdUI)
{
	pCmdUI->Enable(IsEditable() && GetSelectedCount() > 0); // - Thomas Haase 
    //CCellRange Selection = GetSelectedCellRange();
    //pCmdUI->Enable(IsEditable() && Selection.Count() && IsValid(Selection));
}

void CGridCtrl::OnUpdateEditPaste(CCmdUI* pCmdUI)
{
    CCellID cell = GetFocusCell();

    BOOL bCanPaste = IsValid(cell) && IsCellEditable(cell) &&
        ::IsClipboardFormatAvailable(CF_TEXT);

    pCmdUI->Enable(bCanPaste);
}
#endif

void CGridCtrl::OnUpdateEditSelectAll(CCmdUI* pCmdUI)
{
    pCmdUI->Enable(m_bEnableSelection);
}

////////////////////////////////////////////////////////////////////////////////////////
// hittest-like functions

// TRUE if the mouse is over a row resize area
BOOL CGridCtrl::MouseOverRowResizeArea(CPoint& point)
{
    if (point.x >= GetFixedColumnWidth())
        return FALSE;

    CCellID idCurrentCell = GetCellFromPt(point);
    CPoint start;
    if (!GetCellOrigin(idCurrentCell, &start))
        return FALSE;

    int endy = start.y + GetRowHeight(idCurrentCell.row);

    if ((point.y - start.y < m_nResizeCaptureRange && idCurrentCell.row > GetFixedRowCount()) ||
        endy - point.y < m_nResizeCaptureRange && idCurrentCell.row >= GetFixedRowCount())
    {
        return TRUE;
    }
    else
        return FALSE;
}

// TRUE if the mouse is over a column resize area. point is in Client coords
BOOL CGridCtrl::MouseOverColumnResizeArea(CPoint& point)
{
    if (point.y >= GetFixedRowHeight())
        return FALSE;

    CCellID idCurrentCell = GetCellFromPt(point);
    CPoint start;
    if (!GetCellOrigin(idCurrentCell, &start))
        return FALSE;

    int endx = start.x + GetColumnWidth(idCurrentCell.col);

	if ((point.x - start.x < m_nResizeCaptureRange && idCurrentCell.col > GetFixedColumnCount()) ||
        endx - point.x < m_nResizeCaptureRange && idCurrentCell.col >= GetFixedColumnCount() )
    {
        return TRUE;
    }
    else
        return FALSE;
}

// Get cell from point.
// point - client coordinates
// bAllowFixedCellCheck - if TRUE then fixed cells are checked
CCellID CGridCtrl::GetCellFromPt(CPoint point, BOOL bAllowFixedCellCheck /*=TRUE*/)
{
    CCellID cellID; // return value

    CCellID idTopLeft = GetTopleftNonFixedCell();
	if (!bAllowFixedCellCheck && !IsValid(idTopLeft))
		return cellID;

    // calculate column index
    int fixedColWidth = GetFixedColumnWidth();

    if (point.x < 0 || (!bAllowFixedCellCheck && point.x < fixedColWidth)) // not in window
        cellID.col = -1;
    else if (point.x < fixedColWidth) // in fixed col
    {
        int xpos = 0;
        int col = 0;
        while (col < m_nFixedCols)
        {
            xpos += GetColumnWidth(col);
            if (xpos > point.x)
                break;
			col++;
        }
        cellID.col = col;
    }
    else    // in non-fixed col
    {
        int xpos = fixedColWidth;
		int col = idTopLeft.col; //m_nFixedCols;
        while ( col < GetColumnCount())
        {
            xpos += GetColumnWidth(col);
            if (xpos > point.x)
                break;
			col++;
        }

        if (col >= GetColumnCount())
            cellID.col = -1;
        else
            cellID.col = col;
    }

    // calculate row index
    int fixedRowHeight = GetFixedRowHeight();
    if (point.y < 0 || (!bAllowFixedCellCheck && point.y < fixedRowHeight)) // not in window
        cellID.row = -1;
    else if (point.y < fixedRowHeight) // in fixed col
    {
        int ypos = 0;
        int row = 0;
        while (row < m_nFixedRows) 
        {
            ypos += GetRowHeight(row);
            if (ypos > point.y)
                break;
			row++;
        }
        cellID.row = row;
    }
    else
    {
        int ypos = fixedRowHeight;
		int row = idTopLeft.row; //m_nFixedRows;
        while ( row < GetRowCount() )
        {
            ypos += GetRowHeight(row);
            if (ypos > point.y)
                break;
			row++;
        }

        if (row >= GetRowCount())
            cellID.row = -1;
        else
            cellID.row = row;
    }

    return cellID;
}

////////////////////////////////////////////////////////////////////////////////
// CGridCtrl cellrange functions

// Gets the first non-fixed cell ID
CCellID CGridCtrl::GetTopleftNonFixedCell(BOOL bForceRecalculation /*=FALSE*/)
{
    // Used cached value if possible
    if (m_idTopLeftCell.IsValid() && !bForceRecalculation)
        return m_idTopLeftCell;

    int nVertScroll = GetScrollPos(SB_VERT), 
        nHorzScroll = GetScrollPos(SB_HORZ);

    m_idTopLeftCell.col = m_nFixedCols;
    int nRight = 0;
    while (nRight < nHorzScroll && m_idTopLeftCell.col < (GetColumnCount()-1))
        nRight += GetColumnWidth(m_idTopLeftCell.col++);

    m_idTopLeftCell.row = m_nFixedRows;
    int nTop = 0;
    while (nTop < nVertScroll && m_idTopLeftCell.row < (GetRowCount()-1))
        nTop += GetRowHeight(m_idTopLeftCell.row++);

    //TRACE2("TopLeft cell is row %d, col %d\n",m_idTopLeftCell.row, m_idTopLeftCell.col);
    return m_idTopLeftCell;
}

// This gets even partially visible cells
CCellRange CGridCtrl::GetVisibleNonFixedCellRange(LPRECT pRect /*=NULL*/, 
                                                  BOOL bForceRecalculation /*=FALSE*/)
{
    CRect rect;
    GetClientRect(rect);

    CCellID idTopLeft = GetTopleftNonFixedCell(bForceRecalculation);

    // calc bottom
    int bottom = GetFixedRowHeight();
    for (int i = idTopLeft.row; i < GetRowCount(); i++)
    {
        bottom += GetRowHeight(i);
        if (bottom >= rect.bottom)
        {
            bottom = rect.bottom;
            break;
        }
    }
    int maxVisibleRow = min(i, GetRowCount() - 1);

    // calc right
    int right = GetFixedColumnWidth();
    for (i = idTopLeft.col; i < GetColumnCount(); i++)
    {
        right += GetColumnWidth(i);
        if (right >= rect.right)
        {
            right = rect.right;
            break;
        }
    }
    int maxVisibleCol = min(i, GetColumnCount() - 1);
    if (pRect)
    {
        pRect->left = pRect->top = 0;
        pRect->right = right;
        pRect->bottom = bottom;
    }

    return CCellRange(idTopLeft.row, idTopLeft.col, maxVisibleRow, maxVisibleCol);
}

// used by ResetScrollBars() - This gets only fully visible cells
CCellRange CGridCtrl::GetUnobstructedNonFixedCellRange(BOOL bForceRecalculation /*=FALSE*/)
{
    CRect rect;
    GetClientRect(rect);

    CCellID idTopLeft = GetTopleftNonFixedCell(bForceRecalculation);

    // calc bottom
    int bottom = GetFixedRowHeight();
    for (int i = idTopLeft.row; i < GetRowCount(); i++)
    {
        bottom += GetRowHeight(i);
        if (bottom >= rect.bottom)
            break;
    }
    int maxVisibleRow = min(i, GetRowCount() - 1);
    if (maxVisibleRow > 0 && bottom > rect.bottom)
        maxVisibleRow--;

    // calc right
    int right = GetFixedColumnWidth();
    for (i = idTopLeft.col; i < GetColumnCount(); i++)
    {
        right += GetColumnWidth(i);
        if (right >= rect.right)
            break;
    }
    int maxVisibleCol = min(i, GetColumnCount() - 1);
    if (maxVisibleCol > 0 && right > rect.right)
        maxVisibleCol--;


    return CCellRange(idTopLeft.row, idTopLeft.col, maxVisibleRow, maxVisibleCol);
}

// Returns the minimum bounding range of the current selection
// If no selection, then the returned CCellRange will be invalid
CCellRange CGridCtrl::GetSelectedCellRange() const
{
    CCellRange Selection(GetRowCount(), GetColumnCount(), -1,-1);

    for (POSITION pos = m_SelectedCellMap.GetStartPosition(); pos != NULL; )
    {
        DWORD key;
        CCellID cell;
        m_SelectedCellMap.GetNextAssoc(pos, key, (CCellID&)cell);

        Selection.SetMinRow( min(Selection.GetMinRow(), cell.row) );
        Selection.SetMinCol( min(Selection.GetMinCol(), cell.col) );
        Selection.SetMaxRow( max(Selection.GetMaxRow(), cell.row) );
        Selection.SetMaxCol( max(Selection.GetMaxCol(), cell.col) );
    }

    return Selection;
}

// Returns ALL the cells in the grid
CCellRange CGridCtrl::GetCellRange() const
{
    return CCellRange(0, 0, GetRowCount() - 1, GetColumnCount() - 1);
}

// Resets the selected cell range to the empty set.
void CGridCtrl::ResetSelectedRange()
{
    m_PrevSelectedCellMap.RemoveAll();
    SetSelectedRange(-1,-1,-1,-1);
    SetFocusCell(-1,-1);
}

// Get/Set scroll position using 32 bit functions
int CGridCtrl::GetScrollPos32(int nBar, BOOL bGetTrackPos /* = FALSE */)
{
    SCROLLINFO si;
    si.cbSize = sizeof(SCROLLINFO);

    if (bGetTrackPos)
    {
        if (GetScrollInfo(nBar, &si, SIF_TRACKPOS))
            return si.nTrackPos;
    }
    else
    {
        if (GetScrollInfo(nBar, &si, SIF_POS))
            return si.nPos;
    }

    return 0;
}

BOOL CGridCtrl::SetScrollPos32(int nBar, int nPos, BOOL bRedraw /* = TRUE */)
{
    m_idTopLeftCell.row = -1;

    SCROLLINFO si;
    si.cbSize = sizeof(SCROLLINFO);
    si.fMask  = SIF_POS;
    si.nPos   = nPos;
    return SetScrollInfo(nBar, &si, bRedraw);
}

void CGridCtrl::EnableScrollBars(int nBar, BOOL bEnable /*=TRUE*/)
{
    if (bEnable)
    {
        if (!IsVisibleHScroll() && (nBar == SB_HORZ || nBar == SB_BOTH))
        {
            m_nBarState |= GVL_HORZ;
            CWnd::EnableScrollBarCtrl(SB_HORZ, bEnable);
        }
        
        if (!IsVisibleVScroll() && (nBar == SB_VERT || nBar == SB_BOTH))
        {
            m_nBarState |= GVL_VERT;
            CWnd::EnableScrollBarCtrl(SB_VERT, bEnable);
        }
    }
    else
    {
        if ( IsVisibleHScroll() && (nBar == SB_HORZ || nBar == SB_BOTH))
        {
            m_nBarState &= ~GVL_HORZ; 
            CWnd::EnableScrollBarCtrl(SB_HORZ, bEnable);
        }
        
        if ( IsVisibleVScroll() && (nBar == SB_VERT || nBar == SB_BOTH))
        {
            m_nBarState &= ~GVL_VERT;
            CWnd::EnableScrollBarCtrl(SB_VERT, bEnable);
        }
    }
}

// If resizing or cell counts/sizes change, call this - it'll fix up the scroll bars
void CGridCtrl::ResetScrollBars()
{
    // Force a refresh. 
    m_idTopLeftCell.row = -1;

    if (!m_bAllowDraw || !::IsWindow(GetSafeHwnd())) 
        return;
    
    CRect rect;
    
    // This would have caused OnSize event - Brian 
    //EnableScrollBars(SB_BOTH, FALSE); 
    
    GetClientRect(rect);
    
    if (rect.left == rect.right || rect.top == rect.bottom)
        return;
    
    if (IsVisibleVScroll())
        rect.right += GetSystemMetrics(SM_CXVSCROLL) + GetSystemMetrics(SM_CXBORDER);
    
    if (IsVisibleHScroll())
        rect.bottom += GetSystemMetrics(SM_CYHSCROLL) + GetSystemMetrics(SM_CYBORDER);
    
    rect.left += GetFixedColumnWidth();
    rect.top += GetFixedRowHeight();
    
    
    if (rect.left >= rect.right || rect.top >= rect.bottom)
    {
        EnableScrollBarCtrl(SB_BOTH, FALSE);
        return;
    }
    
    CRect VisibleRect(GetFixedColumnWidth(), GetFixedRowHeight(), 
		              rect.right, rect.bottom);
    CRect VirtualRect(GetFixedColumnWidth(), GetFixedRowHeight(),
		              GetVirtualWidth(), GetVirtualHeight());
    
    // Removed to fix single row scrollbar problem (Pontus Goffe)
    // CCellRange visibleCells = GetUnobstructedNonFixedCellRange();
    // if (!IsValid(visibleCells)) return;
        
    //TRACE(_T("Visible: %d x %d, Virtual %d x %d.  H %d, V %d\n"), 
    //      VisibleRect.Width(), VisibleRect.Height(),
    //      VirtualRect.Width(), VirtualRect.Height(),
    //      IsVisibleHScroll(), IsVisibleVScroll());

    // If vertical scroll bar, horizontal space is reduced
    if (VisibleRect.Height() < VirtualRect.Height())
        VisibleRect.right -= ::GetSystemMetrics(SM_CXVSCROLL);
    // If horz scroll bar, vert space is reduced
    if (VisibleRect.Width() < VirtualRect.Width())
        VisibleRect.bottom -= ::GetSystemMetrics(SM_CYHSCROLL);
    
    // Recheck vertical scroll bar
    //if (VisibleRect.Height() < VirtualRect.Height())
    // VisibleRect.right -= ::GetSystemMetrics(SM_CXVSCROLL);
    
    if (VisibleRect.Height() < VirtualRect.Height())
    {
        EnableScrollBars(SB_VERT, TRUE); 
        m_nVScrollMax = VirtualRect.Height() - 1;
    }
    else
    {
        EnableScrollBars(SB_VERT, FALSE); 
        m_nVScrollMax = 0;
    }

    if (VisibleRect.Width() < VirtualRect.Width())
    {
        EnableScrollBars(SB_HORZ, TRUE); 
        m_nHScrollMax = VirtualRect.Width() - 1;
    }
    else
    {
        EnableScrollBars(SB_HORZ, FALSE); 
        m_nHScrollMax = 0;
    }

    ASSERT(m_nVScrollMax < INT_MAX && m_nHScrollMax < INT_MAX); // This should be fine

    /* Old code - CJM
    SCROLLINFO si;
    si.cbSize = sizeof(SCROLLINFO);
    si.fMask = SIF_PAGE;
    si.nPage = (m_nHScrollMax>0)? VisibleRect.Width() : 0;
    SetScrollInfo(SB_HORZ, &si, FALSE); 
    si.nPage = (m_nVScrollMax>0)? VisibleRect.Height() : 0;
    SetScrollInfo(SB_VERT, &si, FALSE);

    SetScrollRange(SB_VERT, 0, m_nVScrollMax, TRUE);
    SetScrollRange(SB_HORZ, 0, m_nHScrollMax, TRUE);
    */

    // New code - Paul Runstedler 
    SCROLLINFO si;
    si.cbSize = sizeof(SCROLLINFO);
    si.fMask = SIF_PAGE | SIF_RANGE;
    si.nPage = (m_nHScrollMax>0)? VisibleRect.Width() : 0;
    si.nMin = 0;
    si.nMax = m_nHScrollMax;
    SetScrollInfo(SB_HORZ, &si, TRUE);

    si.fMask |= SIF_DISABLENOSCROLL;
    si.nPage = (m_nVScrollMax>0)? VisibleRect.Height() : 0;
    si.nMin = 0;
    si.nMax = m_nVScrollMax;
    SetScrollInfo(SB_VERT, &si, TRUE);
}

////////////////////////////////////////////////////////////////////////////////////
// Row/Column position functions

// returns the top left point of the cell. Returns FALSE if cell not visible.
BOOL CGridCtrl::GetCellOrigin(int nRow, int nCol, LPPOINT p)
{
    int i;

    if (!IsValid(nRow, nCol))
        return FALSE;

    CCellID idTopLeft;
    if (nCol >= m_nFixedCols || nRow >= m_nFixedRows)
        idTopLeft = GetTopleftNonFixedCell();

    if ((nRow >= m_nFixedRows && nRow < idTopLeft.row) ||
        (nCol>= m_nFixedCols && nCol < idTopLeft.col))
        return FALSE;

    p->x = 0;
    if (nCol < m_nFixedCols)                      // is a fixed column
        for (i = 0; i < nCol; i++)
            p->x += GetColumnWidth(i);
        else 
        {                                        // is a scrollable data column
            for (i = 0; i < m_nFixedCols; i++)
                p->x += GetColumnWidth(i);
            for (i = idTopLeft.col; i < nCol; i++)
                p->x += GetColumnWidth(i);
        }
        
        p->y = 0;
        if (nRow < m_nFixedRows)                      // is a fixed row
            for (i = 0; i < nRow; i++)
                p->y += GetRowHeight(i);
            else 
            {                                        // is a scrollable data row
                for (i = 0; i < m_nFixedRows; i++)
                    p->y += GetRowHeight(i);
                for (i = idTopLeft.row; i < nRow; i++)
                    p->y += GetRowHeight(i);
            }
            
            return TRUE;
}

BOOL CGridCtrl::GetCellOrigin(const CCellID& cell, LPPOINT p)
{
    return GetCellOrigin(cell.row, cell.col, p);
}

// Returns the bounding box of the cell
BOOL CGridCtrl::GetCellRect(const CCellID& cell, LPRECT pRect)
{
    return GetCellRect(cell.row, cell.col, pRect);
}

BOOL CGridCtrl::GetCellRect(int nRow, int nCol, LPRECT pRect)
{
    CPoint CellOrigin;
    if (!GetCellOrigin(nRow, nCol, &CellOrigin))
        return FALSE;

    pRect->left   = CellOrigin.x;
    pRect->top    = CellOrigin.y;
    pRect->right  = CellOrigin.x + GetColumnWidth(nCol)-1;
    pRect->bottom = CellOrigin.y + GetRowHeight(nRow)-1;

    //TRACE("Row %d, col %d: L %d, T %d, W %d, H %d:  %d,%d - %d,%d\n",
    //      nRow,nCol, CellOrigin.x, CellOrigin.y, GetColumnWidth(nCol), GetRowHeight(nRow),
    //      pRect->left, pRect->top, pRect->right, pRect->bottom);

    return TRUE;
}

BOOL CGridCtrl::GetTextRect(const CCellID& cell, LPRECT pRect)
{
    return GetTextRect(cell.row, cell.col, pRect);
}

BOOL CGridCtrl::GetTextRect(int nRow, int nCol, LPRECT pRect)
{
    if( !GetCellRect( nRow, nCol, pRect) )
        return FALSE;

    return m_datamodel->GetTextRect(pRect,nRow,nCol);
}

// Returns the bounding box of a range of cells
BOOL CGridCtrl::GetCellRangeRect(const CCellRange& cellRange, LPRECT lpRect)
{
    CPoint MinOrigin,MaxOrigin;

    if (!GetCellOrigin(cellRange.GetMinRow(), cellRange.GetMinCol(), &MinOrigin))
        return FALSE;
    if (!GetCellOrigin(cellRange.GetMaxRow(), cellRange.GetMaxCol(), &MaxOrigin))
        return FALSE;

    lpRect->left   = MinOrigin.x;
    lpRect->top    = MinOrigin.y;
    lpRect->right  = MaxOrigin.x + GetColumnWidth(cellRange.GetMaxCol()) - 1;
    lpRect->bottom = MaxOrigin.y + GetRowHeight(cellRange.GetMaxRow()) - 1;

    return TRUE;
}

////////////////////////////////////////////////////////////////////////////////////
// Grid attribute functions

LRESULT CGridCtrl::OnSetFont(WPARAM hFont, LPARAM /*lParam */)
{
    LRESULT result = Default();

    // Get the logical font
    LOGFONT lf;
    if (!GetObject((HFONT) hFont, sizeof(LOGFONT), &lf))
        return result;

    Refresh();
    return result;
}

LRESULT CGridCtrl::OnGetFont(WPARAM /*wParam*/, LPARAM /*lParam*/)
{
    //LOGFONT    lf;
    //m_cellDefault.GetFontObject()->GetLogFont(&lf);
    return (LRESULT) m_drawmodel->GetFontObject()->GetSafeHandle();
}

BOOL CGridCtrl::OnSetCursor(CWnd* pWnd, UINT nHitTest, UINT message)
{
    if (nHitTest == HTCLIENT)
    {
        switch (m_MouseMode)
        {
        case MOUSE_OVER_COL_DIVIDE:
            SetCursor(AfxGetApp()->LoadStandardCursor(IDC_SIZEWE));
            break;
        case MOUSE_OVER_ROW_DIVIDE:
            SetCursor(AfxGetApp()->LoadStandardCursor(IDC_SIZENS));
            break;
        case MOUSE_DRAGGING:
            break;
        default:
            CPoint pt(GetMessagePos());
            ScreenToClient(&pt);
            CCellID cell = GetCellFromPt(pt);
            if (IsValid(cell))
            {
				return m_drawmodel->OnSetCursor(cell.row,cell.col);
            }
            SetCursor(AfxGetApp()->LoadStandardCursor(IDC_ARROW));
        }
        return TRUE;
    }

    return CWnd::OnSetCursor(pWnd, nHitTest, message);
}
////////////////////////////////////////////////////////////////////////////////////
// Row/Column count functions

BOOL CGridCtrl::SetFixedRowCount(int nFixedRows)
{
    if (m_nFixedRows == nFixedRows)
        return TRUE;

    ASSERT(nFixedRows >= 0);

    ResetSelectedRange();

    // Force recalculation
    m_idTopLeftCell.col = -1;

    if (nFixedRows > GetRowCount())
        if (!SetRowCount(nFixedRows))
            return FALSE;
        
        if (m_idCurrentCell.row < nFixedRows)
            SetFocusCell(-1, - 1);
        
        m_nFixedRows = nFixedRows;
        
        Refresh();
        
        return TRUE;
}

BOOL CGridCtrl::SetFixedColumnCount(int nFixedCols)
{
    if (m_nFixedCols == nFixedCols)
        return TRUE;

    ASSERT(nFixedCols >= 0);

    if (nFixedCols > GetColumnCount())
        if (!SetColumnCount(nFixedCols))
            return FALSE;

    if (m_idCurrentCell.col < nFixedCols)
        SetFocusCell(-1, - 1);

    ResetSelectedRange();

    // Force recalculation
    m_idTopLeftCell.col = -1;
       
    m_nFixedCols = nFixedCols;
        
    Refresh();
        
    return TRUE;
}

BOOL CGridCtrl::SetRowCount(int nRows)
{
    BOOL bResult = TRUE;

    ASSERT(nRows >= 0);
    if (nRows == GetRowCount())
        return bResult;

    // Force recalculation
    m_idTopLeftCell.col = -1;

    if (nRows < m_nFixedRows)
        m_nFixedRows = nRows;

    if (m_idCurrentCell.row >= nRows)
        SetFocusCell(-1, - 1);

    int addedRows = nRows - GetRowCount();

    // If we are about to lose rows, then we need to delete the GridCell objects
    // in each column within each row
    if (addedRows < 0)
    {
        m_nRows = nRows;
    }
    
    TRY
    {
     m_arRowHeights.SetSize(nRows);
     if (addedRows > 0)
     {
     // initialize row heights and data
		int startRow = nRows - addedRows;
		for (int row = startRow; row < nRows; row++)
        {
            m_arRowHeights[row] = m_drawmodel->GetDefRowHeight();
        }
     }
	}
    CATCH (CMemoryException, e)
    {
        e->ReportError();
        bResult = FALSE;
    }
    END_CATCH

	m_nRows = nRows;
    SetModified();
    ResetScrollBars();
    Refresh();

    return bResult;
}

BOOL CGridCtrl::SetColumnCount(int nCols)
{
    BOOL bResult = TRUE;

    ASSERT(nCols >= 0);

    if (nCols == GetColumnCount())
        return bResult;

    // Force recalculation
    m_idTopLeftCell.col = -1;

    if (nCols < m_nFixedCols)
        m_nFixedCols = nCols;

    if (m_idCurrentCell.col >= nCols)
        SetFocusCell(-1, - 1);

    int addedCols = nCols - GetColumnCount();

    TRY 
    {
        // Change the number of columns.
        m_arColWidths.SetSize(nCols);
    
        // If we have just added columns, we need to construct new elements for each cell
        // and set the default column width
        if (addedCols > 0)
        {
            // initialized column widths
            int startCol = nCols - addedCols;
            for (int col = startCol; col < nCols; col++)
                m_arColWidths[col] = m_drawmodel->GetDefColWidth();       
		}
        // else    // check for selected cell ranges
        //    ResetSelectedRange();
    }
    CATCH (CMemoryException, e)
    {
        e->ReportError();
        bResult = FALSE;
    }
    END_CATCH

    m_nCols = nCols;

    SetModified();
    ResetScrollBars();
    Refresh();

    return bResult;
}

// Insert a column at a given position, or add to end of columns (if nColumn = -1)
int CGridCtrl::InsertColumn(LPCTSTR strHeading,
                            UINT nFormat /* = DT_CENTER|DT_VCENTER|DT_SINGLELINE */,
                            int nColumn  /* = -1 */)
{
    if (nColumn >= 0 && nColumn < m_nFixedCols)
    {

        // TODO: Fix it so column insertion works for in the fixed column area
        ASSERT(FALSE);
        return -1;
    }

    // If the insertion is for a specific column, check it's within range.
    if (nColumn >= 0 && nColumn > GetColumnCount())
        return -1;

    // Force recalculation
    m_idTopLeftCell.col = -1;

    ResetSelectedRange();

    // Gotta be able to at least _see_ some of the column.
    if (m_nRows < 1)
        SetRowCount(1);

    // Allow the user to insert after the last of the columns, but process it as a
    // "-1" column, meaning it gets flaged as being the last column, and not a regular
    // "insert" routine.
    if (nColumn == GetColumnCount())
        nColumn = -1;

    TRY
    {
        if (nColumn < 0)
        {
            nColumn = m_nCols;
            m_arColWidths.Add(0);
        } 
        else
        {
            m_arColWidths.InsertAt(nColumn, (UINT)0);
        }
    }
    CATCH (CMemoryException, e)
    {
        e->ReportError();
        return -1;
    }
    END_CATCH

    m_nCols++;
    
    // Initialise column data
    SetItemText(0, nColumn, strHeading);
    
    // initialized column width
    m_arColWidths[nColumn] = GetTextExtent(0, nColumn, strHeading).cx;
    
    if (m_idCurrentCell.col != -1 && nColumn < m_idCurrentCell.col)
        m_idCurrentCell.col++;
    
    ResetScrollBars();

    SetModified();
    
    return nColumn;
}

// Insert a row at a given position, or add to end of rows (if nRow = -1)
int CGridCtrl::InsertRow(LPCTSTR strHeading, int nRow /* = -1 */)
{
    if (nRow >= 0 && nRow < m_nFixedRows)
    {
        // TODO: Fix it so column insertion works for in the fixed row area
        ASSERT(FALSE);
        return -1;
    }
	if(!m_datamodel->OnInsertRow(nRow))
		return false;

    // If the insertion is for a specific row, check it's within range.
    if (nRow >= 0 && nRow >= GetRowCount())
        return -1;

    // Force recalculation
    m_idTopLeftCell.col = -1;

    ResetSelectedRange();

    // Gotta be able to at least _see_ some of the row.
    if (m_nCols < 1)
        SetColumnCount(1);

    TRY
    {
        // Adding a row to the bottom
        if (nRow < 0)
        {
            nRow = m_nRows;
            m_arRowHeights.Add(0);
        }
        else
        {
            m_arRowHeights.InsertAt(nRow, (UINT)0);
        }
    }
    CATCH (CMemoryException, e)
    {
        e->ReportError();
        return -1;
    }
    END_CATCH

    m_nRows++;

    // Set row title
    SetItemText(nRow, 0, strHeading);

    // initialized row height
    if (strHeading && strHeading[0])
        m_arRowHeights[nRow] = GetTextExtent(nRow, 0, strHeading).cy;
    else
		m_arRowHeights[nRow] = m_drawmodel->GetDefRowHeight();

    if (m_idCurrentCell.row != -1 && nRow < m_idCurrentCell.row)
        m_idCurrentCell.row++;

    ResetScrollBars();

    SetModified();

    return nRow;
}

BOOL CGridCtrl::DeleteColumn(int nColumn)
{
    if (nColumn < 0 || nColumn >= GetColumnCount())
        return FALSE;

    ResetSelectedRange();

    m_arColWidths.RemoveAt(nColumn);
    m_nCols--;
    if (nColumn < m_nFixedCols)
        m_nFixedCols--;
    
    if (nColumn == m_idCurrentCell.col)
        m_idCurrentCell.row = m_idCurrentCell.col = -1;
    else if (nColumn < m_idCurrentCell.col)
        m_idCurrentCell.col--;
    
    ResetScrollBars();

    SetModified();

    return TRUE;
}

BOOL CGridCtrl::DeleteRow(int nRow)
{
    if (nRow < 0 || nRow >= GetRowCount())
        return FALSE;
	if(!m_datamodel->OnDeleteRow(nRow))
		return FALSE;
    ResetSelectedRange();

    m_arRowHeights.RemoveAt(nRow);

    m_nRows--;
    if (nRow < m_nFixedRows)
        m_nFixedRows--;
    
    if (nRow == m_idCurrentCell.row)
        m_idCurrentCell.row = m_idCurrentCell.col = -1;
    else if (nRow < m_idCurrentCell.row)
        m_idCurrentCell.row--;
    
    ResetScrollBars();

    SetModified();
    
    return TRUE;
}

// Handy function that removes all non-fixed rows
BOOL CGridCtrl::DeleteNonFixedRows()
{
    ResetSelectedRange();

    int nFixed = GetFixedRowCount();
    int nCount = GetRowCount();

    // Delete all data rows
    for (int nRow = nCount; nRow >= nFixed; nRow--)
        DeleteRow(nRow);

    return TRUE;
}

// Removes all rows, columns and data from the grid.
BOOL CGridCtrl::DeleteAllItems()
{
    ResetSelectedRange();

    m_arColWidths.RemoveAll();
    m_arRowHeights.RemoveAll();

    // Delete all cells in the grid

    m_idCurrentCell.row = m_idCurrentCell.col = -1;
    m_nRows = m_nFixedRows = m_nCols = m_nFixedCols = 0;

    ResetScrollBars();

    SetModified();

    return TRUE;
}

void CGridCtrl::AutoFill()
{
    if (!::IsWindow(m_hWnd))
        return;

    CRect rect;
    GetClientRect(rect);

    SetColumnCount(rect.Width() / m_drawmodel->GetDefColWidth() + 1);
    SetRowCount(rect.Height() / m_drawmodel->GetDefRowHeight() + 1);
    SetFixedRowCount(1);
    SetFixedColumnCount(1);
    ExpandToFit();
}

/////////////////////////////////////////////////////////////////////////////
// CGridCtrl data functions

// Set CListCtrl::GetNextItem for details
CCellID CGridCtrl::GetNextItem(CCellID& cell, int nFlags) const
{
    if ((nFlags & GVNI_ALL) == GVNI_ALL)
    {    // GVNI_ALL Search whole Grid beginning from cell
        //          First row (cell.row) -- ONLY Columns to the right of cell
        //          following rows       -- ALL  Columns
        int row = cell.row , col = cell.col + 1;
        if (row <= 0)
            row = GetFixedRowCount();
        for (; row < GetRowCount(); row++)
        {
            if (col <= 0)
                col = GetFixedColumnCount();
            for (; col < GetColumnCount(); col++)
            {
                int nState = GetItemState(row, col);
                if ((nFlags & GVNI_DROPHILITED && nState & GVIS_DROPHILITED) || 
                    (nFlags & GVNI_FOCUSED     && nState & GVIS_FOCUSED)     ||
                    (nFlags & GVNI_SELECTED    && nState & GVIS_SELECTED)    ||
                    (nFlags & GVNI_READONLY    && nState & GVIS_READONLY)    ||
                    (nFlags & GVNI_FIXED       && nState & GVIS_FIXED)       ||
                    (nFlags & GVNI_MODIFIED    && nState & GVIS_MODIFIED))
                    return CCellID(row, col);
            }
            // go to First Column
            col = GetFixedColumnCount();
        }
    }
    else if ((nFlags & GVNI_BELOW) == GVNI_BELOW && 
             (nFlags & GVNI_TORIGHT) == GVNI_TORIGHT)
    {   // GVNI_AREA Search Grid beginning from cell to Lower-Right of Grid
        //           Only rows starting with  cell.row and below
        //           All rows   -- ONLY Columns to the right of cell
        int row = cell.row;
        if (row <= 0)
            row = GetFixedRowCount();
        for (; row < GetRowCount(); row++)
        {
            int col = cell.col + 1;
            if (col <= 0)
                col = GetFixedColumnCount();
            for (; col < GetColumnCount(); col++) 
            {
                int nState = GetItemState(row, col);
                if ((nFlags & GVNI_DROPHILITED && nState & GVIS_DROPHILITED) || 
                    (nFlags & GVNI_FOCUSED     && nState & GVIS_FOCUSED)     ||
                    (nFlags & GVNI_SELECTED    && nState & GVIS_SELECTED)    ||
                    (nFlags & GVNI_READONLY    && nState & GVIS_READONLY)    ||
                    (nFlags & GVNI_FIXED       && nState & GVIS_FIXED)       ||
                    (nFlags & GVNI_MODIFIED    && nState & GVIS_MODIFIED))
                    return CCellID(row, col);
            }
        }
    }
    else if ((nFlags & GVNI_ABOVE) == GVNI_ABOVE) 
    {
        for (int row = cell.row - 1; row >= GetFixedRowCount(); row--) 
        {
            int nState = GetItemState(row, cell.col);
            if ((nFlags & GVNI_DROPHILITED && nState & GVIS_DROPHILITED) || 
                (nFlags & GVNI_FOCUSED     && nState & GVIS_FOCUSED)     ||
                (nFlags & GVNI_SELECTED    && nState & GVIS_SELECTED)    ||
                (nFlags & GVNI_READONLY    && nState & GVIS_READONLY)    ||
                (nFlags & GVNI_FIXED       && nState & GVIS_FIXED)       ||
                (nFlags & GVNI_MODIFIED    && nState & GVIS_MODIFIED))
                return CCellID(row, cell.col);
        }
    }
    else if ((nFlags & GVNI_BELOW) == GVNI_BELOW)
    {
        for (int row = cell.row + 1; row < GetRowCount(); row++) 
        {
            int nState = GetItemState(row, cell.col);
            if ((nFlags & GVNI_DROPHILITED && nState & GVIS_DROPHILITED) || 
                (nFlags & GVNI_FOCUSED     && nState & GVIS_FOCUSED)     ||
                (nFlags & GVNI_SELECTED    && nState & GVIS_SELECTED)    ||
                (nFlags & GVNI_READONLY    && nState & GVIS_READONLY)    ||
                (nFlags & GVNI_FIXED       && nState & GVIS_FIXED)       ||
                (nFlags & GVNI_MODIFIED    && nState & GVIS_MODIFIED))
                return CCellID(row, cell.col);
        }
    } 
    else if ((nFlags & GVNI_TOLEFT) == GVNI_TOLEFT)
    {
        for (int col = cell.col - 1; col >= GetFixedColumnCount(); col--) 
        {
            int nState = GetItemState(cell.row, col);
            if ((nFlags & GVNI_DROPHILITED && nState & GVIS_DROPHILITED) || 
                (nFlags & GVNI_FOCUSED     && nState & GVIS_FOCUSED)     ||
                (nFlags & GVNI_SELECTED    && nState & GVIS_SELECTED)    ||
                (nFlags & GVNI_READONLY    && nState & GVIS_READONLY)    ||
                (nFlags & GVNI_FIXED       && nState & GVIS_FIXED)       ||
                (nFlags & GVNI_MODIFIED    && nState & GVIS_MODIFIED))
                return CCellID(cell.row, col);
        }
    }
    else if ((nFlags & GVNI_TORIGHT) == GVNI_TORIGHT)
    {
        for (int col = cell.col + 1; col < GetColumnCount(); col++) 
        {
            int nState = GetItemState(cell.row, col);
            if ((nFlags & GVNI_DROPHILITED && nState & GVIS_DROPHILITED) || 
                (nFlags & GVNI_FOCUSED     && nState & GVIS_FOCUSED)     ||
                (nFlags & GVNI_SELECTED    && nState & GVIS_SELECTED)    ||
                (nFlags & GVNI_READONLY    && nState & GVIS_READONLY)    ||
                (nFlags & GVNI_FIXED       && nState & GVIS_FIXED)       ||
                (nFlags & GVNI_MODIFIED    && nState & GVIS_MODIFIED))
                return CCellID(cell.row, col);
        }
    }
    
    return CCellID(-1, -1);
}

// Sorts on a given column using the cell text and using the specified comparison
// function
BOOL CGridCtrl::SortItems(int nCol, BOOL bAscending, LPARAM data /* = 0 */)
{
    SetSortColumn(nCol);
    SetSortAscending(bAscending);
    ResetSelectedRange();
    SetFocusCell(-1, - 1);

    return SortItems(nCol, bAscending, data, GetFixedRowCount(), -1);
}

// private recursive sort implementation
BOOL CGridCtrl::SortItems(int nCol, BOOL bAscending, LPARAM data,
                          int low, int high)
{
    if (nCol >= GetColumnCount())
        return FALSE;

    if (high == -1)
        high = GetRowCount() - 1;

    int lo = low;
    int hi = high;
    
    if (hi <= lo)
        return FALSE;
    
    //LPARAM midItem = GetItemData((lo + hi)/2, nCol);
//	LPARAM pMidCell = (LPARAM) GetCell((lo + hi)/2, nCol);
	CCellID mid_cell = CCellID((lo + hi)/2, nCol);
    
    // loop through the list until indices cross
    while (lo <= hi)
    {
        // Find the first element that is greater than or equal to the partition 
        // element starting from the left Index.
        if (bAscending)
            while (lo < high  && m_datamodel->Compare(CCellID(lo,nCol),mid_cell) < 0)
                ++lo;
        else
            while (lo < high && m_datamodel->Compare(CCellID(lo,nCol),mid_cell) > 0)
				++lo;
                
		// Find an element that is smaller than or equal to  the partition 
		// element starting from the right Index.
		if (bAscending)
			while (hi > low && m_datamodel->Compare(CCellID(hi,nCol),mid_cell) > 0)
				--hi;
		else
			while (hi > low && m_datamodel->Compare(CCellID(hi,nCol),mid_cell) < 0)
				--hi;
                        
        // If the indexes have not crossed, swap if the items are not equal
        if (lo <= hi)
        {
			// swap only if the items are not equal
            if (m_datamodel->Compare(CCellID(lo,nCol),CCellID(hi,nCol)) != 0)
            {
				m_datamodel->SwapRows(lo,hi);
				UINT nRowHeight = m_arRowHeights[lo];
                m_arRowHeights[lo] = m_arRowHeights[hi];
                m_arRowHeights[hi] = nRowHeight;
            }
                            
            ++lo;
            --hi;
         }
    }
    
    // If the right index has not reached the left side of array
    // must now sort the left partition.
    if (low < hi)
        SortItems(nCol, bAscending, data, low, hi);
    
    // If the left index has not reached the right side of array
    // must now sort the right partition.
    if (lo < high)
        SortItems(nCol, bAscending, data, lo, high);
    
    return TRUE;
}

BOOL CGridCtrl::GetItem(GV_ITEM* pItem)
{
    if (!pItem)
        return FALSE;

    if (pItem->mask & GVIF_TEXT)
        pItem->strText = GetItemText(pItem->row, pItem->col);
/*    if (pItem->mask & GVIF_PARAM)
        pItem->lParam  = pCell->GetData();;
    if (pItem->mask & GVIF_IMAGE)
        pItem->iImage  = pCell->GetImage();
    if (pItem->mask & GVIF_STATE)
        pItem->nState  = pCell->GetState();
    if (pItem->mask & GVIF_FORMAT)
        pItem->nFormat = pCell->GetFormat();
    if (pItem->mask & GVIF_BKCLR)
        pItem->crBkClr = pCell->GetBackClr();
    if (pItem->mask & GVIF_FGCLR)
        pItem->crFgClr = pCell->GetTextClr();
    if (pItem->mask & GVIF_FONT)
        memcpy(&(pItem->lfFont), pCell->GetFont(), sizeof(LOGFONT));
    if( pItem->mask & GVIF_MARGIN)
        pItem->nMargin = pCell->GetMargin();
*/
    return TRUE;
}

BOOL CGridCtrl::SetItemText(int nRow, int nCol, LPCTSTR str)
{
	m_datamodel->SetText(CString(str),nRow,nCol);
    SetModified(TRUE, nRow, nCol);
    return TRUE;
}

BOOL CGridCtrl::SetItemTextFmt(int nRow, int nCol, LPCTSTR szFmt, ...)
{
    CString strText;

    va_list argptr;

    // Format the message text
    va_start(argptr, szFmt);
    strText.FormatV(szFmt, argptr);
    va_end(argptr);

    SetItemText(nRow,nCol,strText);

    SetModified(TRUE, nRow, nCol);
    return TRUE;
}

BOOL CGridCtrl::SetItemTextFmtID(int nRow, int nCol, UINT nID, ...)
{

    CString strFmt, strText;
    va_list argptr;

    // Format the message text
    va_start(argptr, nID);
    VERIFY(strFmt.LoadString(nID));
    strText.FormatV(strFmt, argptr);
    va_end(argptr);

    SetItemText(nRow,nCol,strText);

    SetModified(TRUE, nRow, nCol);
    return TRUE;
}

int CGridCtrl::GetItemImage(int nRow, int nCol) const
{
    return m_datamodel->GetImage(nRow,nCol);
}

BOOL CGridCtrl::SetItemState(int nRow, int nCol, UINT state)
{
    BOOL bSelected = IsCellSelected(nRow, nCol);

    // If the cell is being unselected, remove it from the selected list
    if (bSelected && !(state & GVIS_SELECTED))
    {
        CCellID cell;
        DWORD key = MAKELONG(nRow, nCol);

        if (m_SelectedCellMap.Lookup(key, (CCellID&)cell))
            m_SelectedCellMap.RemoveKey(key);
    }

    // If cell is being selected, add it to the list of selected cells
    else if (!bSelected && (state & GVIS_SELECTED))
    {
        CCellID cell(nRow, nCol);
        m_SelectedCellMap.SetAt(MAKELONG(nRow, nCol), cell);
    }

    return TRUE;
}

UINT CGridCtrl::GetItemState(int nRow, int nCol) const
{
	DWORD result=0;
	if(m_SelectedCellMap.Lookup(MAKELONG(nRow,nCol),CCellID()))
		result|=GVIS_SELECTED;
	if(GetFocusCell()==CCellID(nRow,nCol))
		result|=GVIS_FOCUSED;
	return result;
}


UINT CGridCtrl::GetItemFormat(int nRow, int nCol) const
{
    return m_datamodel->GetFormat(nRow,nCol);
}

COLORREF CGridCtrl::GetItemBkColour(int nRow, int nCol) const
{
    return m_drawmodel->GetBackClr(nRow,nCol);
}

COLORREF CGridCtrl::GetItemFgColour(int nRow, int nCol) const
{
    return m_drawmodel->GetFaceClr(nRow,nCol);
}

const LOGFONT* CGridCtrl::GetItemFont(int nRow, int nCol)
{
    return m_drawmodel->GetFont(nRow,nCol);
}

BOOL CGridCtrl::IsItemEditing(int nRow, int nCol)
{
/*    CGridCellBase* pCell = GetCell(nRow, nCol);
    ASSERT(pCell);
    if (!pCell)
        return FALSE;

    return pCell->IsEditing();
*/
	return false;
}

////////////////////////////////////////////////////////////////////////////////////
// Row/Column size functions

long CGridCtrl::GetVirtualWidth() const
{
    long lVirtualWidth = 0;
    int iColCount = GetColumnCount();
    for (int i = 0; i < iColCount; i++)
        lVirtualWidth += m_arColWidths[i];

    return lVirtualWidth;
}

long CGridCtrl::GetVirtualHeight() const
{
    long lVirtualHeight = 0;
    int iRowCount = GetRowCount();
    for (int i = 0; i < iRowCount; i++)
        lVirtualHeight += m_arRowHeights[i];

    return lVirtualHeight;
}

int CGridCtrl::GetRowHeight(int nRow) const
{
//    ASSERT(nRow >= 0 && nRow < m_nRows);
    if (nRow < 0 || nRow >= m_nRows)
        return -1;

    return m_arRowHeights[nRow];
}

int CGridCtrl::GetColumnWidth(int nCol) const
{
    ASSERT(nCol >= 0 && nCol < m_nCols);
    if (nCol < 0 || nCol >= m_nCols)
        return -1;

    return m_arColWidths[nCol];
}

BOOL CGridCtrl::SetRowHeight(int nRow, int height)
{
    ASSERT(nRow >= 0 && nRow < m_nRows && height >= 0);
    if (nRow < 0 || nRow >= m_nRows || height < 0)
        return FALSE;

    m_arRowHeights[nRow] = height;
    ResetScrollBars();

    return TRUE;
}

BOOL CGridCtrl::SetColumnWidth(int nCol, int width)
{
    ASSERT(nCol >= 0 && nCol < m_nCols && width >= 0);
    if (nCol < 0 || nCol >= m_nCols || width < 0)
        return FALSE;

    m_arColWidths[nCol] = width;
    ResetScrollBars();

    return TRUE;
}

int CGridCtrl::GetFixedRowHeight() const
{
    int nHeight = 0;
    for (int i = 0; i < m_nFixedRows; i++)
        nHeight += GetRowHeight(i);

    return nHeight;
}

int CGridCtrl::GetFixedColumnWidth() const
{
    int nWidth = 0;
    for (int i = 0; i < m_nFixedCols; i++)
        nWidth += GetColumnWidth(i);

    return nWidth;
}

BOOL CGridCtrl::AutoSizeColumn(int nCol, UINT nAutoSizeStyle /*=GVS_DEFAULT*/, 
                               BOOL bResetScroll /*=TRUE*/)
{
    ASSERT(nCol >= 0 && nCol < m_nCols);
    if (nCol < 0 || nCol >= m_nCols)
        return FALSE;

    //  Skip hidden columns when autosizing
    if( GetColumnWidth( nCol) <=0 )
        return FALSE;

    CSize size;
    CDC* pDC = GetDC();
    if (!pDC)
        return FALSE;

    int nWidth = 0;

    ASSERT(GVS_DEFAULT <= nAutoSizeStyle && nAutoSizeStyle <= GVS_BOTH);
    if (nAutoSizeStyle == GVS_DEFAULT)
        nAutoSizeStyle = GetAutoSizeStyle();

    int nStartRow = (nAutoSizeStyle & GVS_HEADER)? 0 : GetFixedRowCount();
    int nEndRow   = (nAutoSizeStyle & GVS_DATA)? GetRowCount()-1 : GetFixedRowCount()-1;

    for (int nRow = nStartRow; nRow <= nEndRow; nRow++)
    {
        size = m_drawmodel->GetCellExtent(pDC,nRow,nCol);
        if (size.cx > nWidth)
            nWidth = size.cx;
    }

    m_arColWidths[nCol] = nWidth;

    ReleaseDC(pDC);
    if (bResetScroll)
        ResetScrollBars();

    return TRUE;
}

BOOL CGridCtrl::AutoSizeRow(int nRow, BOOL bResetScroll /*=TRUE*/)
{
    ASSERT(nRow >= 0 && nRow < m_nRows);
    if (nRow < 0 || nRow >= m_nRows)
        return FALSE;

    //  Skip hidden rows when autosizing
    if( GetRowHeight( nRow) <=0 )
        return FALSE;

    CSize size;
    CDC* pDC = GetDC();
    if (!pDC)
        return FALSE;

    int nHeight = 0;
    int nNumColumns = GetColumnCount();

    for (int nCol = 0; nCol < nNumColumns; nCol++)
    {
	    size = m_drawmodel->GetCellExtent(pDC,nRow,nCol);
        if (size.cy > nHeight)
            nHeight = size.cy;
    }
    m_arRowHeights[nRow] = nHeight;

    ReleaseDC(pDC);
    if (bResetScroll)
        ResetScrollBars();

    return TRUE;
}

void CGridCtrl::AutoSizeColumns(UINT nAutoSizeStyle /*=GVS_DEFAULT*/)
{
    int nNumColumns = GetColumnCount();
    for (int nCol = 0; nCol < nNumColumns; nCol++)
    {
        //  Skip hidden columns when autosizing
        if( GetColumnWidth( nCol) > 0 )
            AutoSizeColumn(nCol, nAutoSizeStyle, FALSE);
    }
    ResetScrollBars();
}

void CGridCtrl::AutoSizeRows()
{
    int nNumRows = GetRowCount();
    for (int nRow = 0; nRow < nNumRows; nRow++)
    {
        //  Skip hidden rows when autosizing
        if( GetRowHeight( nRow) > 0 )
            AutoSizeRow(nRow, FALSE);
    }
    ResetScrollBars();
}

// sizes all rows and columns
// faster than calling both AutoSizeColumns() and AutoSizeRows()
void CGridCtrl::AutoSize(UINT nAutoSizeStyle /*=GVS_DEFAULT*/)
{
    CDC* pDC = GetDC();
    if (!pDC)
        return;

    int nNumColumns = GetColumnCount();

    int nCol, nRow;

    ASSERT(GVS_DEFAULT <= nAutoSizeStyle && nAutoSizeStyle <= GVS_BOTH);
    if (nAutoSizeStyle == GVS_DEFAULT)
        nAutoSizeStyle = GetAutoSizeStyle();

    int nStartRow = (nAutoSizeStyle & GVS_HEADER)? 0 : GetFixedRowCount();
    int nEndRow   = (nAutoSizeStyle & GVS_DATA)? GetRowCount()-1 : GetFixedRowCount()-1;

    // Row initialisation - only work on rows whose height is > 0
    for (nRow = nStartRow; nRow <= nEndRow; nRow++)
    {
        if( GetRowHeight( nRow) > 0 )
            m_arRowHeights[nRow] = 1;
    }

    CSize size;
    for (nCol = 0; nCol < nNumColumns; nCol++)
    {
        //  Don't size hidden columns or rows
        if( GetColumnWidth( nCol) > 0 )
        {
            // Skip columns that are hidden, but now initialize
            m_arColWidths[nCol] = 0;
            for (nRow = nStartRow; nRow <= nEndRow; nRow++)
            {
                if( GetRowHeight( nRow) > 0 )
                {
                    size = m_drawmodel->GetCellExtent(pDC,nRow,nCol);
                    if (size.cx >(int) m_arColWidths[nCol])
                        m_arColWidths[nCol] = size.cx;
                    if (size.cy >(int) m_arRowHeights[nRow])
                        m_arRowHeights[nRow] = size.cy;
                }
            }
        }
    }

    ReleaseDC(pDC);

    ResetScrollBars();
    Refresh();
}

// Expands the columns to fit the screen space. If bExpandFixed is FALSE then fixed 
// columns will not be affected
void CGridCtrl::ExpandColumnsToFit(BOOL bExpandFixed /*=TRUE*/)
{
    if (bExpandFixed)
	{
		if (GetColumnCount() <= 0) return;
	} 
	else
	{
		if (GetColumnCount() <= GetFixedColumnCount()) return;
	}

    EnableScrollBars(SB_HORZ, FALSE);

    CRect rect;
    GetClientRect(rect);

    int nFirstColumn = (bExpandFixed)? 0 : GetFixedColumnCount();

    int nNumColumnsAffected = 0;
    for (int col = nFirstColumn; col < GetColumnCount(); col++)
    {
        if (m_arColWidths[col] > 0)
            nNumColumnsAffected++;
    }

    if (nNumColumnsAffected <= 0)
        return;

    long virtualWidth = GetVirtualWidth();
    int nDifference = rect.Width() -(int) virtualWidth;
    int nColumnAdjustment = nDifference / nNumColumnsAffected;

    for (col = nFirstColumn; col < GetColumnCount(); col++)
    {
        if (m_arColWidths[col] > 0)
            m_arColWidths[col] += nColumnAdjustment;    
    }

    if (nDifference > 0)
    {
        int leftOver = nDifference % nNumColumnsAffected;
        for (int nCount = 0, col = nFirstColumn; 
             (col < GetColumnCount()) && (nCount < leftOver); col++, nCount++)
        {
            if (m_arColWidths[col] > 0)
                m_arColWidths[col] += 1;
        }
    }
    else 
    {
        int leftOver = (-nDifference) % nNumColumnsAffected;
        for (int nCount = 0, col = nFirstColumn; 
             (col < GetColumnCount()) && (nCount < leftOver); col++, nCount++)
        {
            if (m_arColWidths[col] > 0)
                m_arColWidths[col] -= 1;
        }
    }

    Refresh();

    ResetScrollBars();
}

void CGridCtrl::ExpandLastColumn()
{
    if (GetColumnCount() <= 0)
        return;

    // Search for last non-hidden column
    int nLastColumn = GetColumnCount()-1;
    while (m_arColWidths[nLastColumn] <= 0)
        nLastColumn--;

    if (nLastColumn <= 0)
        return;

    EnableScrollBars(SB_HORZ, FALSE);

    CRect rect;
    GetClientRect(rect);

    long virtualWidth = GetVirtualWidth();
    int nDifference = rect.Width() -(int) virtualWidth;

    if (nDifference > 0)
    {
        //if (GetVirtualHeight() > rect.Height())
        //    nDifference -= GetSystemMetrics(SM_CXVSCROLL);

        m_arColWidths[ nLastColumn ] += nDifference;
        Refresh();
    }

    ResetScrollBars();
}

// Expands the rows to fit the screen space. If bExpandFixed is FALSE then fixed 
// rows will not be affected
void CGridCtrl::ExpandRowsToFit(BOOL bExpandFixed /*=TRUE*/)
{
    if (bExpandFixed)
	{
		if (GetRowCount() <= 0) return;
	} 
	else
	{
		if (GetRowCount() <= GetFixedRowCount()) return;
	}

    EnableScrollBars(SB_VERT, FALSE); 

    CRect rect;
    GetClientRect(rect);
    
    int nFirstRow = (bExpandFixed)? 0 : GetFixedRowCount();

    int nNumRowsAffected = 0;
    for (int row = nFirstRow; row < GetRowCount(); row++)
    {
        if (m_arRowHeights[row] > 0)
            nNumRowsAffected++;
    }

    if (nNumRowsAffected <= 0)
        return;

    long virtualHeight = GetVirtualHeight();
    int nDifference = rect.Height() -(int) virtualHeight;
    int nRowAdjustment = nDifference / nNumRowsAffected;
    
    for (row = nFirstRow; row < GetRowCount(); row++)
    {
        if (m_arRowHeights[row] > 0)
            m_arRowHeights[row] += nRowAdjustment;    
    }
    
    if (nDifference > 0)
    {
        int leftOver = nDifference % nNumRowsAffected;
        for (int nCount = 0, row = nFirstRow; 
             (row < GetRowCount()) && (nCount < leftOver); row++, nCount++)
        {
            if (m_arRowHeights[row] > 0)
                m_arRowHeights[row] += 1;
        }
    } 
    else 
    {
        int leftOver = (-nDifference) % nNumRowsAffected;
        for (int nCount = 0, row = nFirstRow; 
             (row < GetRowCount()) && (nCount < leftOver); row++, nCount++)
        {
            if (m_arRowHeights[row] > 0)
                m_arRowHeights[row] -= 1;
        }
    }

    Refresh();

    ResetScrollBars();
}

// Expands the cells to fit the screen space. If bExpandFixed is FALSE then fixed 
// cells  will not be affected
void CGridCtrl::ExpandToFit(BOOL bExpandFixed /*=TRUE*/)
{
    ExpandColumnsToFit(bExpandFixed);   // This will remove any existing horz scrollbar
    ExpandRowsToFit(bExpandFixed);      // This will remove any existing vert scrollbar
    ExpandColumnsToFit(bExpandFixed);   // Just in case the first adjustment was with a vert
                                        // scrollbar in place
    Refresh();
}

/////////////////////////////////////////////////////////////////////////////////////
// Attributes

void CGridCtrl::SetGridLines(int nWhichLines /*=GVL_BOTH*/) 
{
    m_nGridLines = nWhichLines;
    Refresh();
}

void CGridCtrl::SetListMode(BOOL bEnableListMode /*=TRUE*/)
{
    ResetSelectedRange();
    SetSortColumn(-1);
    m_bListMode = bEnableListMode;
    SetFixedRowSelection(FALSE);
    Refresh();
}

void CGridCtrl::SetSortColumn(int nCol)
{
    if (m_nSortColumn >= 0)
        InvalidateCellRect(0, m_nSortColumn);
    m_nSortColumn = nCol;
    if (nCol >= 0)
        InvalidateCellRect(0, nCol);
}

BOOL CGridCtrl::IsCellFixed(int nRow, int nCol)
{
    return (nRow < GetFixedRowCount() || nCol < GetFixedColumnCount());
}

void CGridCtrl::SetModified(BOOL bModified /*=TRUE*/, int nRow /*=-1*/, int nCol /*=-1*/)
{
    // Cannot guarantee sorting anymore...
    if (nCol < 0 || nCol == GetSortColumn())
        SetSortColumn(-1);

    if (nRow >= 0 && nCol >= 0)
    {
        if (bModified)
        {
            SetItemState(nRow, nCol, GetItemState(nRow, nCol) | GVIS_MODIFIED);
            m_bModified = TRUE;
        }
        else
            SetItemState(nRow, nCol, GetItemState(nRow, nCol) & ~GVIS_MODIFIED);
    }
    else
        m_bModified = bModified;

    if (!m_bModified)
    {
        for (int row = 0; row < GetRowCount(); row++)
            for (int col = 0; col < GetColumnCount(); col++)
                SetItemState(row, col, GetItemState(row, col) & ~GVIS_MODIFIED);
    }
}

BOOL CGridCtrl::GetModified(int nRow /*=-1*/, int nCol /*=-1*/)
{
    if (nRow >= 0 && nCol >= 0)
        return ( (GetItemState(nRow, nCol) & GVIS_MODIFIED) == GVIS_MODIFIED );
    else
        return m_bModified;
}

/////////////////////////////////////////////////////////////////////////////////////
// GridCtrl cell visibility tests and invalidation/redraw functions

void CGridCtrl::Refresh()
{
    if (GetSafeHwnd() && m_bAllowDraw)
        Invalidate();
}

// EnsureVisible supplied by Roelf Werkman
void CGridCtrl::EnsureVisible(int nRow, int nCol)
{
    if (!m_bAllowDraw)
        return;

    CRect rectWindow;
    /*
    // set the scroll to the approximate position of row (Nigel Page-Jones)
    int nPos = (int)((float)nRow / GetRowCount() * 1000);
    float fPos = (float)nPos / 1000;
    SCROLLINFO scrollInfo;
    GetScrollInfo(SB_VERT, &scrollInfo);
    scrollInfo.nPos = (int)(scrollInfo.nMax * fPos);
    SetScrollInfo(SB_VERT, &scrollInfo, FALSE);
    
    GetClientRect(rectWindow);

    // redraw cells    if necessary (Nigel Page-Jones)
    CCellID idTopLeft = GetTopleftNonFixedCell(FALSE);
    CCellID idNewTopLeft = GetTopleftNonFixedCell(TRUE);
    if (idNewTopLeft != idTopLeft)
    {
        rectWindow.top = GetFixedRowHeight();
        InvalidateRect(rectWindow);
    }
    */

    // We are going to send some scroll messages, which will steal the focus 
    // from it's rightful owner. Squirrel it away ourselves so we can give
    // it back. (Damir)
    CWnd* pFocusWnd = GetFocus();

    CCellRange VisibleCells = GetVisibleNonFixedCellRange();

    int right = nCol - VisibleCells.GetMaxCol();
    int left  = VisibleCells.GetMinCol() - nCol;
    int down  = nRow - VisibleCells.GetMaxRow();
    int up    = VisibleCells.GetMinRow() - nRow;

    int iColumnStart;
    int iRowStart;

    iColumnStart = VisibleCells.GetMaxCol() + 1;
    while( right > 0 )
    {
        if( GetColumnWidth( iColumnStart ) > 0 )
            SendMessage( WM_HSCROLL, SB_LINERIGHT, 0 );

        right--;
        iColumnStart++;
    }

    iColumnStart = VisibleCells.GetMinCol() - 1;
    while( left > 0 )
    {
        if( GetColumnWidth( iColumnStart ) > 0 )
            SendMessage( WM_HSCROLL, SB_LINELEFT, 0 );
        left--;
        iColumnStart--;
    }

    iRowStart = VisibleCells.GetMaxRow() + 1;
    while( down > 0 )
    {
        if( GetRowHeight( iRowStart ) > 0 )
            SendMessage( WM_VSCROLL, SB_LINEDOWN, 0 );
        down--;
        iRowStart++;
    }

    iRowStart = VisibleCells.GetMinRow() - 1;
    while( up > 0 )
    {
        if( GetRowHeight( iRowStart ) > 0 )
            SendMessage( WM_VSCROLL, SB_LINEUP, 0 );
        up--;
        iRowStart--;
    }

    // Move one more if we only see a snall bit of the cell
    CRect rectCell;
    if (!GetCellRect(nRow, nCol, rectCell))
    {
		if (pFocusWnd && ::IsWindow(pFocusWnd->GetSafeHwnd()))
			pFocusWnd->SetFocus(); 
        return;
    }

    GetClientRect(rectWindow);

    // The previous fix was fixed properly by Martin Richter 
    while (rectCell.right > rectWindow.right
        && rectCell.left > GetFixedColumnWidth()
        && IsVisibleHScroll() // Junlin Xu: added to prevent infinite loop
        )
    {
        SendMessage(WM_HSCROLL, SB_LINERIGHT, 0);
        if (!GetCellRect(nRow, nCol, rectCell))
        {
            pFocusWnd->SetFocus(); 
            return;
        }
    }

    while (rectCell.bottom > rectWindow.bottom
        && rectCell.top > GetFixedRowHeight()
        && IsVisibleVScroll() // Junlin Xu: added to prevent infinite loop
        )
    {
        SendMessage(WM_VSCROLL, SB_LINEDOWN, 0);
        if (!GetCellRect(nRow, nCol, rectCell))
        {
            pFocusWnd->SetFocus(); 
            return;
        }
    }

    // restore focus to whoever owned it
    pFocusWnd->SetFocus(); 
}

BOOL CGridCtrl::IsCellEditable(CCellID &cell) const
{
    return IsCellEditable(cell.row, cell.col);
}

BOOL CGridCtrl::IsCellEditable(int nRow, int nCol) const
{
    return IsEditable() && ((GetItemState(nRow, nCol) & GVIS_READONLY) != GVIS_READONLY);
}

BOOL CGridCtrl::IsCellSelected(CCellID &cell) const
{
    return IsCellSelected(cell.row, cell.col);
}

BOOL CGridCtrl::IsCellSelected(int nRow, int nCol) const
{
    if (!IsSelectable())
        return FALSE;
    CCellID cell;
    DWORD key = MAKELONG(nRow, nCol);
    return (m_SelectedCellMap.Lookup(key, (CCellID&)cell));       
}

BOOL CGridCtrl::IsCellVisible(CCellID cell) 
{
    return IsCellVisible(cell.row, cell.col);
}

BOOL CGridCtrl::IsCellVisible(int nRow, int nCol)
{
    if (!IsWindow(m_hWnd))
        return FALSE;

    int x, y;

    CCellID TopLeft;
    if (nCol >= GetFixedColumnCount() || nRow >= GetFixedRowCount())
    {
        TopLeft = GetTopleftNonFixedCell();
        if (nCol >= GetFixedColumnCount() && nCol < TopLeft.col)
            return FALSE;
        if (nRow >= GetFixedRowCount() && nRow < TopLeft.row)
            return FALSE;
    }
    
    CRect rect;
    GetClientRect(rect);
    if (nCol < GetFixedColumnCount())
    {
        x = 0;
        for (int i = 0; i <= nCol; i++) 
        {
            if (x >= rect.right)
                return FALSE;
            x += GetColumnWidth(i);    
        }
    } 
    else 
    {
        x = GetFixedColumnWidth();
        for (int i = TopLeft.col; i <= nCol; i++) 
        {
            if (x >= rect.right)
                return FALSE;
            x += GetColumnWidth(i);    
        }
    }
    
    if (nRow < GetFixedRowCount())
    {
        y = 0;
        for (int i = 0; i <= nRow; i++) 
        {
            if (y >= rect.bottom)
                return FALSE;
            y += GetRowHeight(i);    
        }
    } 
    else 
    {
        if (nRow < TopLeft.row)
            return FALSE;
        y = GetFixedRowHeight();
        for (int i = TopLeft.row; i <= nRow; i++) 
        {
            if (y >= rect.bottom)
                return FALSE;
            y += GetRowHeight(i);    
        }
    }
    
    return TRUE;
}

BOOL CGridCtrl::InvalidateCellRect(const CCellID& cell)
{
    return InvalidateCellRect(cell.row, cell.col);
}

BOOL CGridCtrl::InvalidateCellRect(const int row, const int col)
{
    if (!::IsWindow(GetSafeHwnd()) || !m_bAllowDraw)
        return FALSE;

    if (!IsValid(row, col))
        return FALSE;

    if (!IsCellVisible(row, col))
        return FALSE;

    CRect rect;
    if (!GetCellRect(row, col, rect))
        return FALSE;
    rect.right++;
    rect.bottom++;
    InvalidateRect(rect, TRUE);

    return TRUE;
}

BOOL CGridCtrl::InvalidateCellRect(const CCellRange& cellRange)
{
    ASSERT(IsValid(cellRange));
    if (!::IsWindow(GetSafeHwnd()) || !m_bAllowDraw)
        return FALSE;

    CCellRange visibleCellRange = GetVisibleNonFixedCellRange().Intersect(cellRange);

    CRect rect;
    if (!GetCellRangeRect(visibleCellRange, rect))
        return FALSE;

    rect.right++;
    rect.bottom++;
    InvalidateRect(rect, TRUE);

    return TRUE;
}

/////////////////////////////////////////////////////////////////////////////
// CGridCtrl Mouse stuff

// Handles mouse wheel notifications
// Note - if this doesn't work for win95 then use OnRegisteredMouseWheel instead
BOOL CGridCtrl::OnMouseWheel(UINT nFlags, short zDelta, CPoint pt)
{
    // A m_nRowsPerWheelNotch value less than 0 indicates that the mouse
    // wheel scrolls whole pages, not just lines.
    if (m_nRowsPerWheelNotch == -1)
    {
        int nPagesScrolled = zDelta / 120;

        if (nPagesScrolled > 0)
		{
            for (int i = 0; i < nPagesScrolled; i++)
			{
                PostMessage(WM_VSCROLL, SB_PAGEUP, 0);
			}
		}
        else
		{
            for (int i = 0; i > nPagesScrolled; i--)
			{
                PostMessage(WM_VSCROLL, SB_PAGEDOWN, 0);
			}
		}
    }
    else
    {
        int nRowsScrolled = m_nRowsPerWheelNotch * zDelta / 120;

        if (nRowsScrolled > 0)
		{
            for (int i = 0; i < nRowsScrolled; i++)
			{
                PostMessage(WM_VSCROLL, SB_LINEUP, 0);
			}
		}
        else
		{
            for (int i = 0; i > nRowsScrolled; i--)
			{
                PostMessage(WM_VSCROLL, SB_LINEDOWN, 0);
			}
		}
    }

    return CWnd::OnMouseWheel(nFlags, zDelta, pt);
}

void CGridCtrl::OnMouseMove(UINT /*nFlags*/, CPoint point)
{
    CRect rect;
    GetClientRect(rect);

    // If outside client area, return (unless we are drag n dropping)
    if (m_MouseMode != MOUSE_DRAGGING && !rect.PtInRect(point))
        return;
    // Sometimes a MOUSEMOVE message can come after the left buttons
    // has been let go, but before the BUTTONUP message hs been processed.
    // We'll keep track of mouse buttons manually to avoid this.
    // All bMouseButtonDown's have been replaced with the member m_bLMouseButtonDown
    // BOOL bMouseButtonDown = ((nFlags & MK_LBUTTON) == MK_LBUTTON);

    // If the left mouse button is up, then test to see if row/column sizing is imminent
    if (!m_bLMouseButtonDown ||
        (m_bLMouseButtonDown && m_MouseMode == MOUSE_NOTHING))
    {
        if (m_bAllowColumnResize && MouseOverColumnResizeArea(point))
        {
            if (m_MouseMode != MOUSE_OVER_COL_DIVIDE)
            {
                SetCursor(AfxGetApp()->LoadStandardCursor(IDC_SIZEWE));
                m_MouseMode = MOUSE_OVER_COL_DIVIDE;
            }
        }
        else if (m_bAllowRowResize && MouseOverRowResizeArea(point))
        {
            if (m_MouseMode != MOUSE_OVER_ROW_DIVIDE)
            {
                SetCursor(AfxGetApp()->LoadStandardCursor(IDC_SIZENS));
                m_MouseMode = MOUSE_OVER_ROW_DIVIDE;
            }
        }
        else if (m_MouseMode != MOUSE_NOTHING)
        {
            SetCursor(AfxGetApp()->LoadStandardCursor(IDC_ARROW));
            m_MouseMode = MOUSE_NOTHING;
        }

        if (m_MouseMode == MOUSE_NOTHING)
        {
            CCellID idCurrentCell = GetCellFromPt(point);
            if (m_bTitleTips)
            {
                // Let the cell know that a big fat cursor is currently hovering
                // over it.
                idCurrentCell = GetCellFromPt(point);
				m_drawmodel->OnMouseOver(idCurrentCell.row,idCurrentCell.col);
            }
            // Titletips anyone? anyone?
            if (m_bTitleTips)
            {
                CRect TextRect, CellRect;
				if (IsValid(idCurrentCell))
                {
					CString tip_text;
					m_datamodel->GetTipText(tip_text,idCurrentCell.row,idCurrentCell.col);
                    if (!m_bRMouseButtonDown
						&& tip_text.GetLength()
                        && !m_datamodel->IsEditing(idCurrentCell.row,idCurrentCell.col)
                        && GetCellRect( idCurrentCell.row, idCurrentCell.col, &TextRect)
                        && m_datamodel->GetTipTextRect( &TextRect,idCurrentCell.row, idCurrentCell.col)
                        && GetCellRect(idCurrentCell.row, idCurrentCell.col, CellRect) )
                    {
						TRACE0("Showing TitleTip\n");
						CString tipText;
						m_datamodel->GetTipText(tipText,idCurrentCell.row,idCurrentCell.col);
						m_TitleTip.Show(TextRect, tipText,  0, CellRect,
                                        m_drawmodel->GetFont(idCurrentCell.row,idCurrentCell.col),  
										m_drawmodel->GetColor(IDrawModel::TITLETIP,IDrawModel::FACE,IDrawModel::NORMAL),
										m_drawmodel->GetColor(IDrawModel::TITLETIP,IDrawModel::BACK,IDrawModel::NORMAL));
                    }
                }
            }
        }

        m_LastMousePoint = point;
        return;
    }

    if (!IsValid(m_LeftClickDownCell))
    {
        m_LastMousePoint = point;
        return;
    }

    // If the left mouse button is down, then process appropriately
    if (m_bLMouseButtonDown)
    {
        switch (m_MouseMode)
        {
        case MOUSE_SELECT_ALL:
            break;

        case MOUSE_SELECT_COL:
        case MOUSE_SELECT_ROW:
        case MOUSE_SELECT_CELLS:
            {
                CCellID idCurrentCell = GetCellFromPt(point);
                if (!IsValid(idCurrentCell))
                    return;

                if (idCurrentCell != GetFocusCell())
                {
                    OnSelecting(idCurrentCell);

                    // EFW - BUG FIX - Keep the appropriate cell row and/or
                    // column focused.  A fix in SetFocusCell() will place
                    // the cursor in a non-fixed cell as needed.
                    if((idCurrentCell.row >= m_nFixedRows &&
                      idCurrentCell.col >= m_nFixedCols) ||
                      m_MouseMode==MOUSE_SELECT_COL ||
                      m_MouseMode==MOUSE_SELECT_ROW)
                    {
                        SetFocusCell(idCurrentCell);
                    }
                }
                break;
            }

        case MOUSE_SIZING_COL:
            {
                CDC* pDC = GetDC();
                if (!pDC)
                    break;

                CRect oldInvertedRect(m_LastMousePoint.x, rect.top,
                    m_LastMousePoint.x + 2, rect.bottom);
                pDC->InvertRect(&oldInvertedRect);
                CRect newInvertedRect(point.x, rect.top, 
                    point.x + 2, rect.bottom);
                pDC->InvertRect(&newInvertedRect);
                ReleaseDC(pDC);
            }
            break;
            
        case MOUSE_SIZING_ROW:        
            {
                CDC* pDC = GetDC();
                if (!pDC)
                    break;
                
                CRect oldInvertedRect(rect.left, m_LastMousePoint.y,
                    rect.right, m_LastMousePoint.y + 2);
                pDC->InvertRect(&oldInvertedRect);
                CRect newInvertedRect(rect.left, point.y, 
                    rect.right, point.y + 2);
                pDC->InvertRect(&newInvertedRect);
                ReleaseDC(pDC);
            }
            break;
            
        case MOUSE_PREPARE_EDIT:
        case MOUSE_PREPARE_DRAG:
            m_MouseMode = MOUSE_PREPARE_DRAG;
            OnBeginDrag();    
            break;
        }    
    }

    m_LastMousePoint = point;
}

// Returns the point inside the cell that was clicked (coords relative to cell top left)
CPoint CGridCtrl::GetPointClicked(int nRow, int nCol, const CPoint& point)
{
    CPoint PointCellOrigin;
    if( !GetCellOrigin( nRow, nCol, &PointCellOrigin)  )
        return CPoint( 0, 0);

    CPoint PointClickedCellRelative( point);
    PointClickedCellRelative -= PointCellOrigin;
    return PointClickedCellRelative;
}

void CGridCtrl::OnLButtonDblClk(UINT nFlags, CPoint point)
{
    TRACE0("CGridCtrl::OnLButtonDblClk\n");

    CCellID cell = GetCellFromPt(point);
    if( !IsValid( cell) )
    {
        //ASSERT(FALSE);
        return;
    }

    if (m_MouseMode == MOUSE_OVER_COL_DIVIDE)
    {
        CPoint start;
        if (!GetCellOrigin(0, cell.col, &start))
            return;

        if (point.x - start.x < m_nResizeCaptureRange)     // Clicked right of border
            cell.col--;

        //  ignore columns that are hidden and look left towards first visible column
        BOOL bFoundVisible = FALSE;
        while( cell.col >= 0)
        {
            if( GetColumnWidth( cell.col) > 0)
            {
                bFoundVisible = TRUE;
                break;
            }
            cell.col--;
        }
        if( !bFoundVisible)
            return;

        AutoSizeColumn(cell.col, GetAutoSizeStyle());
        Invalidate();
    }
    else if (m_MouseMode == MOUSE_OVER_ROW_DIVIDE)
    {
        CPoint start;
        if (!GetCellOrigin(0, cell.col, &start))
            return;

        if (point.y - start.y < m_nResizeCaptureRange)     // Clicked below border
            cell.row--;

        //  ignore rows that are hidden and look up towards first visible row
        BOOL bFoundVisible = FALSE;
        while( cell.row >= 0)
        {
            if( GetRowHeight( cell.row) > 0)
            {
                bFoundVisible = TRUE;
                break;
            }
            cell.row--;
        }
        if( !bFoundVisible)
            return;

        AutoSizeRow(cell.row);
        Invalidate();
    }
    else if (m_MouseMode == MOUSE_NOTHING)
    {
        CPoint pointClickedRel;
        pointClickedRel = GetPointClicked( cell.row, cell.col, point);

        // Clicked in the text area? Only then will cell selection work
        BOOL bInTextArea = FALSE;
		CRect rectCell;
		if (GetTextRect(cell.row, cell.col,rectCell))
			bInTextArea = rectCell.PtInRect(point);

        if (cell.row >= m_nFixedRows && IsValid(m_LeftClickDownCell) && 
            cell.col >= m_nFixedCols && bInTextArea)
        {
            OnEditCell(cell.row, cell.col, pointClickedRel, VK_LBUTTON);
        }
        else if (m_bListMode)
        {
            if (!IsValid(cell))
                return;
            if (cell.row >= m_nFixedRows && cell.col >= m_nFixedCols && bInTextArea)
                OnEditCell(cell.row, cell.col, pointClickedRel, VK_LBUTTON);
        }

        if (IsValid(cell))
        {
	        m_datamodel->OnDblClick(cell.row,cell.col);
        }
    }

    CWnd::OnLButtonDblClk(nFlags, point);
}

void CGridCtrl::OnLButtonDown(UINT nFlags, CPoint point)
{
    // EFW - Bug Fix
    m_TitleTip.Hide();  // hide any titletips
    // TRACE0("CGridCtrl::OnLButtonDown\n");
    // CWnd::OnLButtonDown(nFlags, point);

    SetFocus();

    m_bLMouseButtonDown   = TRUE;
    m_LeftClickDownPoint = point;
    m_LeftClickDownCell  = GetCellFromPt(point);
    if (!IsValid(m_LeftClickDownCell))
        return;

    // If the SHIFT key is not down, then the start of the selection area should be the 
    // cell just clicked. Otherwise, keep the previous selection-start-cell so the user
    // can add to their previous cell selections in an intuitive way. If no selection-
    // start-cell has been specified, then set it's value here and now.
    if ((nFlags & MK_SHIFT) != MK_SHIFT)
        m_SelectionStartCell = m_LeftClickDownCell;
    else
    {
        if (!IsValid(m_SelectionStartCell))
            m_SelectionStartCell = m_idCurrentCell;
    }

    EndEditing();

    // tell the cell about it 
    m_datamodel->OnClickDown(GetPointClicked( m_LeftClickDownCell.row, m_LeftClickDownCell.col, point)
		,m_LeftClickDownCell.row, m_LeftClickDownCell.col);

    // Clicked in the text area? Only then will cell selection work
    BOOL bInTextArea = FALSE;
    CRect rectCell;
    if (GetCellRect(m_LeftClickDownCell.row, m_LeftClickDownCell.col, rectCell) &&
        m_datamodel->GetTextRect(rectCell,m_LeftClickDownCell.row,m_LeftClickDownCell.col))
    {
        bInTextArea = rectCell.PtInRect(point);
    }

    // If the user clicks on the current cell, then prepare to edit it.
    // (If the user moves the mouse, then dragging occurs)
    if (m_LeftClickDownCell == m_idCurrentCell && 
        !(nFlags & MK_CONTROL) && bInTextArea &&
        IsCellEditable(m_LeftClickDownCell))
    {
        m_MouseMode = MOUSE_PREPARE_EDIT;
        return;
    }
    // If the user clicks on a selected cell, then prepare to drag it.
    // (If the user moves the mouse, then dragging occurs)
    else if (IsCellSelected(m_LeftClickDownCell))
    {
        SetFocusCell(m_LeftClickDownCell.row, m_LeftClickDownCell.col);

        // If control is pressed then unselect the cell or row (depending on the list mode)
        if (nFlags & MK_CONTROL)
        {
            SetFocusCell(m_LeftClickDownCell);
            if (GetListMode())
                SelectRows(m_LeftClickDownCell, TRUE, FALSE);
            else
                SelectCells(m_LeftClickDownCell, TRUE, FALSE);
            return;
        }
        else if (m_bAllowDragAndDrop)
            m_MouseMode = MOUSE_PREPARE_DRAG;
    }
    else if (m_MouseMode != MOUSE_OVER_COL_DIVIDE &&
             m_MouseMode != MOUSE_OVER_ROW_DIVIDE)        
    {
		if (m_LeftClickDownCell.row >= GetFixedRowCount() && 
			m_LeftClickDownCell.col >= GetFixedColumnCount())
		{
            SetFocusCell(m_LeftClickDownCell.row, m_LeftClickDownCell.col);
		}
		else
			SetFocusCell(-1, -1);

		//Don't set focus on any cell if the user clicked on a fixed cell - David Pritchard
        //if (GetRowCount() > GetFixedRowCount() && 
        //    GetColumnCount() > GetFixedColumnCount())
        //    SetFocusCell(max(m_LeftClickDownCell.row, m_nFixedRows),
        //                 max(m_LeftClickDownCell.col, m_nFixedCols));
    }
    
    SetCapture();
    
    if (m_MouseMode == MOUSE_NOTHING)
    {
        if (m_bAllowColumnResize && MouseOverColumnResizeArea(point))
        {
            if (m_MouseMode != MOUSE_OVER_COL_DIVIDE)
            {
                SetCursor(AfxGetApp()->LoadStandardCursor(IDC_SIZEWE));
                m_MouseMode = MOUSE_OVER_COL_DIVIDE;
            }
        }
        else if (m_bAllowRowResize && MouseOverRowResizeArea(point))
        {
            if (m_MouseMode != MOUSE_OVER_ROW_DIVIDE)
            {
                SetCursor(AfxGetApp()->LoadStandardCursor(IDC_SIZENS));
                m_MouseMode = MOUSE_OVER_ROW_DIVIDE;
            }
        }
        // else if (m_MouseMode != MOUSE_NOTHING)
        //{
        //    SetCursor(AfxGetApp()->LoadStandardCursor(IDC_ARROW));
        //    m_MouseMode = MOUSE_NOTHING;
        //}
    }
    
    if (m_MouseMode == MOUSE_OVER_COL_DIVIDE) // sizing column
    {
        m_MouseMode = MOUSE_SIZING_COL;

        // Kludge for if we are over the last column...
        if (GetColumnWidth(GetColumnCount()-1) < m_nResizeCaptureRange)
        {
            CRect VisRect;
            GetVisibleNonFixedCellRange(VisRect);
            if (abs(point.x - VisRect.right) < m_nResizeCaptureRange)
                m_LeftClickDownCell.col = GetColumnCount()-1;
        }

        CPoint start;
        if (!GetCellOrigin(0, m_LeftClickDownCell.col, &start))
            return;

        if( !m_bHiddenColUnhide)
        {
            //  ignore columns that are hidden and look left towards first visible column
            BOOL bLookForVisible = TRUE;
            BOOL bIsCellRightBorder = point.x - start.x >= m_nResizeCaptureRange;

            if( bIsCellRightBorder
                && m_LeftClickDownCell.col + 1 >= GetColumnCount() )
            {
                // clicked on last column's right border

                // if last column is visible, don't do anything
                if( m_LeftClickDownCell.col >= 0)
                    bLookForVisible = FALSE;
            }

            if( bLookForVisible)
            {
                // clicked on column divider other than last right border
                BOOL bFoundVisible = FALSE;
                int iOffset = 1;

                if( bIsCellRightBorder)
                    iOffset = 0;

                while( m_LeftClickDownCell.col - iOffset >= 0)
                {
                    if( GetColumnWidth( m_LeftClickDownCell.col - iOffset) > 0)
                    {
                        bFoundVisible = TRUE;
                        break;
                    }
                    m_LeftClickDownCell.col--;
                }
                if( !bFoundVisible)
                    return;
            }
        }


        CRect rect;
        GetClientRect(rect);
        CRect invertedRect(point.x, rect.top, point.x + 2, rect.bottom);

        CDC* pDC = GetDC();
        if (pDC)
        {
            pDC->InvertRect(&invertedRect);
            ReleaseDC(pDC);
        }

        // If we clicked to the right of the colimn divide, then reset the click-down cell
        // as the cell to the left of the column divide - UNLESS we clicked on the last column
        // and the last column is teensy (kludge fix)
        if (point.x - start.x < m_nResizeCaptureRange)
        {
            if (m_LeftClickDownCell.col < GetColumnCount()-1 || 
                GetColumnWidth(GetColumnCount()-1) >= m_nResizeCaptureRange)
            {
                if (!GetCellOrigin(0, --m_LeftClickDownCell.col, &start))
                    return;
            }
        }

		// Allow a cell resize width no greater than that which can be viewed within
		// the grid itself
		int nMaxCellWidth = rect.Width()-GetFixedColumnWidth();
        rect.left  = start.x + 1;
		rect.right = rect.left + nMaxCellWidth;

        ClientToScreen(rect);
        ClipCursor(rect);
    }
    else if (m_MouseMode == MOUSE_OVER_ROW_DIVIDE) // sizing row
    {
        m_MouseMode = MOUSE_SIZING_ROW;

        // Kludge for if we are over the last column...
        if (GetRowHeight(GetRowCount()-1) < m_nResizeCaptureRange)
        {
            CRect VisRect;
            GetVisibleNonFixedCellRange(VisRect);
            if (abs(point.y - VisRect.bottom) < m_nResizeCaptureRange)
                m_LeftClickDownCell.row = GetRowCount()-1;
        }

        CPoint start;
        if (!GetCellOrigin(m_LeftClickDownCell, &start))
            return;

        if( !m_bHiddenRowUnhide)
        {
            //  ignore rows that are hidden and look up towards first visible row
            BOOL bLookForVisible = TRUE;
            BOOL bIsCellBottomBorder = point.y - start.y >= m_nResizeCaptureRange;

            if( bIsCellBottomBorder
                && m_LeftClickDownCell.row + 1 >= GetRowCount() )
            {
                // clicked on last row's bottom border

                // if last row is visible, don't do anything
                if( m_LeftClickDownCell.row >= 0)
                    bLookForVisible = FALSE;
            }

            if( bLookForVisible)
            {
                // clicked on row divider other than last bottom border
                BOOL bFoundVisible = FALSE;
                int iOffset = 1;

                if( bIsCellBottomBorder)
                    iOffset = 0;

                while( m_LeftClickDownCell.row - iOffset >= 0)
                {
                    if( GetRowHeight( m_LeftClickDownCell.row - iOffset) > 0)
                    {
                        bFoundVisible = TRUE;
                        break;
                    }
                    m_LeftClickDownCell.row--;
                }
                if( !bFoundVisible)
                    return;
            }
        }

        CRect rect;
        GetClientRect(rect);
        CRect invertedRect(rect.left, point.y, rect.right, point.y + 2);

        CDC* pDC = GetDC();
        if (pDC)
        {
            pDC->InvertRect(&invertedRect);
            ReleaseDC(pDC);
        }

        // If we clicked below the row divide, then reset the click-down cell
        // as the cell above the row divide - UNLESS we clicked on the last row
        // and the last row is teensy (kludge fix)
        if (point.y - start.y < m_nResizeCaptureRange)            // clicked below border
        {
            if (m_LeftClickDownCell.row < GetRowCount()-1 || 
                GetRowHeight(GetRowCount()-1) >= m_nResizeCaptureRange)
            {
                if (!GetCellOrigin(--m_LeftClickDownCell.row, 0, &start))
                    return;
            }
        }

		int nMaxCellHeight = rect.Height()-GetFixedRowHeight();
        rect.top = start.y + 1;
		rect.bottom = rect.top + nMaxCellHeight;

        ClientToScreen(rect);

        ClipCursor(rect);
    }
    else
    if (m_MouseMode != MOUSE_PREPARE_DRAG) // not sizing or editing -- selecting
    {

        // If Ctrl pressed, save the current cell selection. This will get added
        // to the new cell selection at the end of the cell selection process
        m_PrevSelectedCellMap.RemoveAll();
        if (nFlags & MK_CONTROL)
        {
            for (POSITION pos = m_SelectedCellMap.GetStartPosition(); pos != NULL; )
            {
                DWORD key;
                CCellID cell;
                m_SelectedCellMap.GetNextAssoc(pos, key, (CCellID&)cell);
                m_PrevSelectedCellMap.SetAt(key, cell);
            }
        }
        
        if (m_LeftClickDownCell.row < GetFixedRowCount())
            OnFixedRowClick(m_LeftClickDownCell);
        else if (m_LeftClickDownCell.col < GetFixedColumnCount())
            OnFixedColumnClick(m_LeftClickDownCell);
        else
        {
            m_MouseMode = m_bListMode? MOUSE_SELECT_ROW : MOUSE_SELECT_CELLS;
            OnSelecting(m_LeftClickDownCell);

            m_nTimerID = (int)SetTimer(WM_LBUTTONDOWN, m_nTimerInterval, 0);
        }
    }   
    m_LastMousePoint = point;
}

void CGridCtrl::OnLButtonUp(UINT nFlags, CPoint point)
{
    // TRACE0("CGridCtrl::OnLButtonUp\n");

    CWnd::OnLButtonUp(nFlags, point);

    m_bLMouseButtonDown = FALSE;

#ifndef _WIN32_WCE_NO_CURSOR
    ClipCursor(NULL);
#endif

    if (GetCapture()->GetSafeHwnd() == GetSafeHwnd())
    {
        ReleaseCapture();
        KillTimer(m_nTimerID);
        m_nTimerID = 0;
    }

    CPoint pointClickedRel;
    pointClickedRel = GetPointClicked( m_idCurrentCell.row, m_idCurrentCell.col, point);

    // m_MouseMode == MOUSE_PREPARE_EDIT only if user clicked down on current cell
    // and then didn't move mouse before clicking up (releasing button)
    if (m_MouseMode == MOUSE_PREPARE_EDIT)
    {
        OnEditCell(m_idCurrentCell.row, m_idCurrentCell.col, pointClickedRel, VK_LBUTTON);
    }
    // m_MouseMode == MOUSE_PREPARE_DRAG only if user clicked down on a selected cell
    // and then didn't move mouse before clicking up (releasing button)
    else if (m_MouseMode == MOUSE_PREPARE_DRAG) 
    {
        m_datamodel->OnClick( GetPointClicked( m_idCurrentCell.row, m_idCurrentCell.col, point)
			,m_idCurrentCell.row, m_idCurrentCell.col);
        ResetSelectedRange();
    }
    else if (m_MouseMode == MOUSE_SIZING_COL)
    {
        CRect rect;
        GetClientRect(rect);
        CRect invertedRect(m_LastMousePoint.x, rect.top, m_LastMousePoint.x + 2, rect.bottom);
        
        CDC* pDC = GetDC();
        if (pDC)
        {
            pDC->InvertRect(&invertedRect);
            ReleaseDC(pDC);
        }
        
        if (m_LeftClickDownPoint != point && (point.x != 0 || point.y != 0)) // 0 pt fix by email1@bierling.net
        {   
            CPoint start;
            if (!GetCellOrigin(m_LeftClickDownCell, &start))
                return;

            int nColumnWidth = max(point.x - start.x, m_bAllowColHide? 0 : 1);

            SetColumnWidth(m_LeftClickDownCell.col, nColumnWidth);
            ResetScrollBars();
            Invalidate();
        }
    }
    else if (m_MouseMode == MOUSE_SIZING_ROW)
    {
        CRect rect;
        GetClientRect(rect);
        CRect invertedRect(rect.left, m_LastMousePoint.y, rect.right, m_LastMousePoint.y + 2);

        CDC* pDC = GetDC();
        if (pDC)
        {
            pDC->InvertRect(&invertedRect);
            ReleaseDC(pDC);
        }
        
        if (m_LeftClickDownPoint != point  && (point.x != 0 || point.y != 0)) // 0 pt fix by email1@bierling.net
        {
            CPoint start;
            if (!GetCellOrigin(m_LeftClickDownCell, &start))
                return;
            
            int nRowHeight = max(point.y - start.y, m_bAllowRowHide? 0 : 1);

            SetRowHeight(m_LeftClickDownCell.row, nRowHeight);
            ResetScrollBars();
            Invalidate();
        }
    }
    else
    {
		m_datamodel->OnClick( GetPointClicked( m_idCurrentCell.row, m_idCurrentCell.col, point)
			,m_idCurrentCell.row, m_idCurrentCell.col);
    }
    
    m_MouseMode = MOUSE_NOTHING;
    
    SetCursor(AfxGetApp()->LoadStandardCursor(IDC_ARROW));   
    if (!IsValid(m_LeftClickDownCell))
        return;
    
    CWnd *pOwner = GetOwner();
    if (pOwner && IsWindow(pOwner->m_hWnd))
        pOwner->PostMessage(WM_COMMAND, MAKELONG(GetDlgCtrlID(), BN_CLICKED),
        (LPARAM) GetSafeHwnd());
}

#ifndef _WIN32_WCE
void CGridCtrl::OnRButtonDown(UINT nFlags, CPoint point)
{
    CWnd::OnRButtonDown(nFlags, point);
	m_bRMouseButtonDown = TRUE;

#ifdef GRIDCONTROL_USE_TITLETIPS
	TRACE0("Hiding TitleTip\n");
    m_TitleTip.Hide();  // hide any titletips
#endif
}

// EFW - Added to forward right click to parent so that a context
// menu can be shown without deriving a new grid class.
void CGridCtrl::OnRButtonUp(UINT nFlags, CPoint point)
{
    CWnd::OnRButtonUp(nFlags, point);

	m_bRMouseButtonDown = FALSE;

    CCellID FocusCell;
    FocusCell = GetCellFromPt(point);

    EndEditing();        // Auto-destroy any InPlaceEdit's

    // If not a valid cell, pass -1 for row and column
    if(IsValid(FocusCell))
    {
        SetFocusCell(-1,-1);
        SetFocusCell(max(FocusCell.row, m_nFixedRows),
            max(FocusCell.col, m_nFixedCols));

        // tell the cell about it
        m_datamodel->OnRClick( GetPointClicked( FocusCell.row, FocusCell.col, point),
			FocusCell.row, FocusCell.col);
    }
}
#endif


BOOL CGridCtrl::Save(LPCTSTR filename, TCHAR chSeparator/*=_T(',')*/)
{
    CStdioFile File;
    CFileException ex;
	CString strSeparator(chSeparator);

    if (!File.Open(filename, CFile::modeWrite | CFile::modeCreate| CFile::typeText, &ex))
    {
        ex.ReportError();
        return FALSE;
    }

    TRY
    {
        int nNumColumns = GetColumnCount();
        for (int i = 0; i < GetRowCount(); i++)
        {
            for (int j = 0; j < nNumColumns; j++)
            {
                File.WriteString(GetItemText(i,j));
                File.WriteString((j==(nNumColumns-1))? _T("\n"): strSeparator);
            }
        }

        File.Close();
    }

    CATCH (CFileException, e)
    {
        AfxMessageBox(_T("Unable to save grid list"));
        return FALSE;
    }
    END_CATCH

    return TRUE;
}

BOOL CGridCtrl::Load(LPCTSTR filename, TCHAR chSeparator/*=_T(',')*/)
{
    TCHAR *token, *end;
    TCHAR buffer[1024];
    CStdioFile File;
    CFileException ex;

    if (!File.Open(filename, CFile::modeRead | CFile::typeText))
    {
        ex.ReportError();
        return FALSE;
    }

    DeleteAllItems();

    TRY
    {
        // Read Header off file
        File.ReadString(buffer, 1024);

        // Get first token
        for (token=buffer, end=buffer;
             *end && (*end != chSeparator) && (*end != _T('\n')); 
             end++)
            ;

        if ((*end == _T('\0')) && (token == end))
            token = NULL;

        *end = _T('\0');

        while (token)
        {
            InsertColumn(token);

            // Get next token
            for (token=++end; *end && (*end != chSeparator) && (*end != _T('\n'));
               end++)
                ;

            if ((*end == _T('\0')) && (token == end))
                token = NULL;

            *end = _T('\0');
        }

        // Read in rest of data
        int nItem = 1;
        while (File.ReadString(buffer, 1024))
        {
            // Get first token
            for (token=buffer, end=buffer;
              *end && (*end != chSeparator) && (*end != _T('\n')); end++)
                ;

            if ((*end == _T('\0')) && (token == end))
                token = NULL;

            *end = _T('\0');

            int nSubItem = 0;
            while (token)
            {
                if (!nSubItem)
                    InsertRow(token);
                else
                    SetItemText(nItem, nSubItem, token);

                // Get next token
                for (token=++end; *end && (*end != chSeparator) && (*end != _T('\n'));
                  end++)
                    ;

                if ((*end == _T('\0')) && (token == end))
                    token = NULL;

                *end = _T('\0');

                nSubItem++;
            }
            nItem++;
        }

        AutoSizeColumns(GetAutoSizeStyle());
        File.Close();
    }

    CATCH (CFileException, e)
    {
        AfxMessageBox(_T("Unable to load grid data"));
        return FALSE;
    }
    END_CATCH

    return TRUE;
}
/////////////////////////////////////////////////////////////////////////////
// CGridCtrl overrideables

#ifndef GRIDCONTROL_NO_DRAGDROP
// This is no longer needed since I've changed to OLE drag and drop - but it's
// still cool code. :)
CImageList* CGridCtrl::CreateDragImage(CPoint *pHotSpot)
{
    CDC* pDC = GetDC();
    if (!pDC)
        return NULL;

    CRect rect;
    CCellID cell = GetFocusCell();
    if (!GetCellRect(cell.row, cell.col, rect))
        return NULL;
    
    // Translate coordinate system
    rect.BottomRight() = CPoint(rect.Width(), rect.Height());
    rect.TopLeft()     = CPoint(0, 0);
    *pHotSpot = rect.BottomRight(); 
    
    // Create a new imagelist (the caller of this function has responsibility
    // for deleting this list)
    CImageList* pList = new CImageList;
    if (!pList || !pList->Create(rect.Width(), rect.Height(), ILC_MASK, 1, 1))
    {    
        if (pList)
            delete pList;
        return NULL;
    }
    
    // Create mem DC and bitmap
    CDC MemDC;
    CBitmap bm;
    MemDC.CreateCompatibleDC(pDC);
    bm.CreateCompatibleBitmap(pDC, rect.Width(), rect.Height());
    CBitmap* pOldBitmap = MemDC.SelectObject(&bm);
    MemDC.SetWindowOrg(0, 0);
    
    // Draw cell onto bitmap in memDC
	m_drawmodel->Draw(&MemDC, cell.row, cell.col, rect, FALSE);
    
    // Clean up
    MemDC.SelectObject(pOldBitmap);
    ReleaseDC(pDC);
    
    // Add the bitmap we just drew to the image list.
	pList->Add(&bm, m_drawmodel->GetColor(IDrawModel::CELL,IDrawModel::BACK,IDrawModel::NORMAL));
    bm.DeleteObject();

    return pList;
}
#endif

void CGridCtrl::OnFixedRowClick(CCellID& cell)
{
    if (!IsValid(cell))
        return;

    if (GetHeaderSort())
    {
        CWaitCursor waiter;
        if (cell.col == GetSortColumn())
            SortItems(cell.col, !GetSortAscending());
        else
            SortItems(cell.col, TRUE);
        Invalidate();
    }

	// Did the user click on a fixed column cell (so the cell was within the overlap of
	// fixed row and column cells) - (fix by David Pritchard)
    if (GetFixedColumnSelection())
    {
        if (cell.col < GetFixedColumnCount())
        {
            m_MouseMode = MOUSE_SELECT_ALL;
            OnSelecting(cell);
        }
        else 
        {
            m_MouseMode = MOUSE_SELECT_COL;
            OnSelecting(cell);
        }
    }
}

void CGridCtrl::OnFixedColumnClick(CCellID& cell)
{
    if (!IsValid(cell))
        return;

//    if (m_bListMode && (GetItemState(cell.row, m_nFixedCols) & GVNI_SELECTED))
//    {
//        OnEditCell(cell.row, cell.col, VK_LBUTTON);
//        return;
//    }

	// Did the user click on a fixed row cell (so the cell was within the overlap of
	// fixed row and column cells) - (fix by David Pritchard)
    if (GetFixedRowSelection())
    {
        if (cell.row < GetFixedRowCount())
        {
            m_MouseMode = MOUSE_SELECT_ALL;
            OnSelecting(cell);
        }
        else
        {
            m_MouseMode = MOUSE_SELECT_ROW;
            OnSelecting(cell);
        }
    }
}

// Gets the extent of the text pointed to by str (no CDC needed)
// By default this uses the selected font (which is a bigger font)
CSize CGridCtrl::GetTextExtent(int nRow, int nCol, LPCTSTR str)
{
	CDC* pDC;
	return m_drawmodel->GetTextExtent(pDC=GetDC(),str,nRow,nCol);
	ReleaseDC(pDC);
}

// virtual
void CGridCtrl::OnEditCell(int nRow, int nCol, CPoint point, UINT nChar)
{
    m_TitleTip.Hide();  // hide any titletips
    // Can we do it?
    CCellID cell(nRow, nCol);
    if (!IsValid(cell) || !IsCellEditable(nRow, nCol))
        return;
    // Can we see what we are doing?
    EnsureVisible(nRow, nCol);
    if (!IsCellVisible(nRow, nCol))
        return;
    // Where, exactly, are we gonna do it??
    CRect rect;
    if (!GetCellRect(cell, rect))
        return;
    m_datamodel->Edit(nRow, nCol, rect, point, nChar);
}

// virtual
void CGridCtrl::EndEditing()
{
    CCellID cell = GetFocusCell();
    if (!IsValid(cell)) return;
    m_datamodel->EndEdit();
}

// virtual
void CGridCtrl::OnEndEditCell(int nRow, int nCol, CString str)
{
    CString strCurrentText = GetItemText(nRow, nCol);
    if (strCurrentText != str)
    {
        SetItemText(nRow, nCol, str);
        if (ValidateEdit(nRow, nCol, str))
        {
            SetModified(TRUE, nRow, nCol);
            RedrawCell(nRow, nCol);
        }
        else
        {
            SetItemText(nRow, nCol, strCurrentText);
        }
    }
    m_datamodel->OnEndEdit(nRow,nCol,str);
}

// If this returns FALSE then the editing isn't allowed
// virtual
BOOL CGridCtrl::ValidateEdit(int nRow, int nCol, LPCTSTR str)
{
    return m_datamodel->ValidateEdit(str,nRow,nCol);
}

// virtual
CString CGridCtrl::GetItemText(int nRow, int nCol) const
{
    if (nRow < 0 || nRow >= m_nRows || nCol < 0 || nCol >= m_nCols)
        return _T("");
	CString s;
    m_datamodel->GetText(s,nRow,nCol);
	return s;
}

CGridCtrl::DefDrawModel::DefDrawModel()
{
	m_font.Attach((HFONT)::GetStockObject(DEFAULT_GUI_FONT));
	m_font.GetLogFont(&log_font);
}

IClone* CGridCtrl::DefDrawModel::Clone()
{
	DefDrawModel* model=new DefDrawModel;
	model->m_datamodel = m_datamodel;
	return model;
}

void CGridCtrl::DefDrawModel::Init(IDataModel* model)
{
	m_datamodel=model;
}

COLORREF CGridCtrl::DefDrawModel::GetColor(OBJECT obj,TYPE type,STATE state)
{
	switch(obj)
	{
	case FIXED_CELL:
	case FIXED_ROW:
	case FIXED_COL:
		if(type==FACE) return globalData.clrBarText;
		else return globalData.clrBarFace;
	case CELL:
		if(state==NORMAL)
		{
			if(type==FACE) return globalData.clrWindowText;
			else return globalData.clrWindow;
		}
		else
		{
			if(type==FACE) return globalData.clrTextHilite;
			else return globalData.clrHilite;
		}
	case GRID:
		if(state==NORMAL)
		{
			if(type==FACE)
			{
				return RGB(192,192,192);
			}
		}
		else
		{
			if(type==FACE)
			{
				return RGB(0,0,0);
			}
		}
		return globalData.clrWindow;
	case TITLETIP:
		if(type==FACE) return globalData.clrWindowText;
		else return globalData.clrBtnLight;
	}
	return 0x0;
}

unsigned CGridCtrl::DefDrawModel::GetDefRowHeight()
{
	CDC* dc = GetGrid()->GetDC();
	CFont* old = dc->SelectObject(GetFontObject());
	CSize size = dc->GetTextExtent("XXXXXXXX",8);
	size.cx+=GetMargin(0,0).cx*2;size.cy+=GetMargin(0,0).cy*2;
    dc->SelectObject(old);    	
	GetGrid()->ReleaseDC(dc);
	return size.cy;
}

unsigned CGridCtrl::DefDrawModel::GetDefColWidth()
{
	CDC* dc = GetGrid()->GetDC();
	CFont* old = dc->SelectObject(GetFontObject());
	CSize size = dc->GetTextExtent("XXXXXXXX",8);
	size.cx+=GetMargin(0,0).cx*2;size.cy+=GetMargin(0,0).cy*2;
    dc->SelectObject(old);    	
	GetGrid()->ReleaseDC(dc);
	return size.cx;
}


BOOL CGridCtrl::DefDrawModel::OnSetCursor(int row,int col)
{
	::SetCursor(AfxGetApp()->LoadStandardCursor(IDC_ARROW));
	return TRUE;
}

CFont* CGridCtrl::DefDrawModel::GetFontObject()
{
	ASSERT(m_font.GetSafeHandle());
	return &m_font;
}

COLORREF CGridCtrl::DefDrawModel::GetBackClr(int row,int col)
{
	return 0xFF000000;
}

COLORREF CGridCtrl::DefDrawModel::GetFaceClr(int row,int col)
{
	return 0xFF000000;
}

LOGFONT* CGridCtrl::DefDrawModel::GetFont(int row,int col)
{	
	return &log_font;
}

CSize CGridCtrl::DefDrawModel::GetCellExtent(CDC* pDC,int row,int col)
{
	CString s;
	m_datamodel->GetText(s,row,col);
	CSize size = GetTextExtent(pDC,s,row,col);    
    CSize ImageSize(0,0);    
    
    int nImage = m_datamodel->GetImage(row,col);    
    if (nImage >= 0)    
    {        
        CGridCtrl* pGrid = GetGrid();        
        ASSERT(pGrid);        
        IMAGEINFO Info;        
        if (pGrid->GetImageList() && pGrid->GetImageList()->GetImageInfo(nImage, &Info))         
        {            
            ImageSize = CSize(Info.rcImage.right-Info.rcImage.left,                                 
                Info.rcImage.bottom-Info.rcImage.top);            
            if (size.cx > 2*(int)GetMargin (row,col).cx)                
                ImageSize.cx += GetMargin(row,col).cx;            
            ImageSize.cy += 2*(int)GetMargin (row,col).cy;        
        }    
    }    
    size.cx += ImageSize.cx + 1;    
    size.cy = max(size.cy, ImageSize.cy) + 1;    
    return size;	
}

CSize CGridCtrl::DefDrawModel::GetTextExtent(CDC* pDC,LPCTSTR szText,int row,int col)
{	
    CGridCtrl* pGrid = GetGrid();
    ASSERT(pGrid);

    BOOL bReleaseDC = FALSE;
    if (pDC == NULL || szText == NULL)
    {
        if (szText)
			pDC = pGrid->GetDC();
        if (pDC == NULL || szText == NULL) 
        {
			return CSize(GetDefColWidth(), GetDefRowHeight());
		}
        bReleaseDC = TRUE;
    }

    CFont *pOldFont = NULL,
          *pFont = GetFontObject();
    if (pFont)
        pOldFont = pDC->SelectObject(pFont);

    CSize size;
    int nFormat = m_datamodel->GetFormat(row,col);

    // If the cell is a multiline cell, then use the width of the cell
    // to get the height
    if ((nFormat & DT_WORDBREAK) && !(nFormat & DT_SINGLELINE))
    {
        CString str = szText;
        int nMaxWidth = 0;
        while (TRUE)
        {
            int nPos = str.Find(_T('\n'));
            CString TempStr = (nPos < 0)? str : str.Left(nPos);
            int nTempWidth = pDC->GetTextExtent(TempStr).cx;
            if (nTempWidth > nMaxWidth)
                nMaxWidth = nTempWidth;

            if (nPos < 0)
                break;
            str = str.Mid(nPos + 1);    // Bug fix by Thomas Steinborn
        }
        
        CRect rect;
        rect.SetRect(0,0, nMaxWidth+1, 0);
        pDC->DrawText(szText, -1, rect, nFormat | DT_CALCRECT);
        size = rect.Size();
    }
    else
        size = pDC->GetTextExtent(szText,(int)_tcslen(szText));

    // Removed by Yogurt
    //TEXTMETRIC tm;
    //pDC->GetTextMetrics(&tm);
    //size.cx += (tm.tmOverhang);

    if (pOldFont)
        pDC->SelectObject(pOldFont);
    
    size += CSize(2*GetMargin(row,col).cx, 2*GetMargin(row,col).cy);

    // Kludge for vertical text
    LOGFONT *pLF = GetFont(row,col);
    if (pLF->lfEscapement == 900 || pLF->lfEscapement == -900)
    {
        int nTemp = size.cx;
        size.cx = size.cy;
        size.cy = nTemp;
        size += CSize(0, 4*GetMargin(row,col).cy);
    }
    
    if (bReleaseDC)
        pGrid->ReleaseDC(pDC);

    return size;
}

void CGridCtrl::DefDrawModel::OnMouseOver(int row,int col)
{

}

CGridCtrl* CGridCtrl::DefDrawModel::GetGrid()
{
	return m_datamodel->GetGrid();
}

CSize CGridCtrl::DefDrawModel::GetMargin(int row,int col)
{
	return CSize(3,3);
}

BOOL CGridCtrl::DefDrawModel::Draw(CDC* pDC,int row,int col,CRect& rc, BOOL bEraseBckgnd)
{
	CRect rect= rc;
    CGridCtrl* pGrid = GetGrid();
    ASSERT(pGrid);
    if (!pGrid || !pDC)
        return FALSE;
    if( rect.Width() <= 0 || rect.Height() <= 0)
        return FALSE;
    int nSavedDC = pDC->SaveDC();
    pDC->SetBkMode(TRANSPARENT);
	BOOL bSelected = GetGrid()->GetItemState(row,col) & GVIS_SELECTED;
    COLORREF TextClr, TextBkClr;
    TextClr = (GetFaceClr(row,col) == CLR_DEFAULT)? GetColor(CELL,FACE,NORMAL) : GetFaceClr(row,col);
    if (GetBackClr(row,col) == CLR_DEFAULT)
        TextBkClr = GetColor(CELL,BACK,NORMAL);
    else
    {
        bEraseBckgnd = TRUE;
        TextBkClr = GetBackClr(row,col);
    }
	if ( GetGrid()->GetFocusCell()==CCellID(row,col) && ::GetFocus()==GetGrid()->GetSafeHwnd())
    {
		if(bSelected)
        {
            TextBkClr = GetColor(CELL,BACK,SELECTED);
            TextClr = GetColor(CELL,FACE,SELECTED);
            bEraseBckgnd = TRUE;
        }

        rect.right++; rect.bottom++;    // FillRect doesn't draw RHS or bottom
        if (bEraseBckgnd)
        {
            TRY 
            {
                CBrush brush(TextBkClr);
                pDC->FillRect(rect, &brush);
            } 
            CATCH(CResourceException, e)
            {
                //e->ReportError();
            }
            END_CATCH
        }

        // Don't adjust frame rect if no grid lines so that the
        // whole cell is enclosed.
        if(pGrid->GetGridLines() != GVL_NONE)
        {
            rect.right--;
            rect.bottom--;
        }

        if (pGrid->GetFrameFocusCell())
        {
                // Use same color as text to outline the cell so that it shows
                // up if the background is black.
            TRY 
            {
				CBrush brush(GetColor(GRID,FACE,SELECTED));
                pDC->FrameRect(rect, &brush);
				rect.DeflateRect(1,1);
				pDC->FrameRect(rect, &brush);
				rect.InflateRect(1,1);
            }
            CATCH(CResourceException, e)
            {
                //e->ReportError();
            }
            END_CATCH
        }
        pDC->SetTextColor(TextClr);

        // Adjust rect after frame draw if no grid lines
        if(pGrid->GetGridLines() == GVL_NONE)
        {
            rect.right--;
            rect.bottom--;
        }

		//rect.DeflateRect(0,1,1,1);  - Removed by Yogurt
    }
    else if (bSelected && ::GetFocus()==GetGrid()->GetSafeHwnd())
    {
        rect.right++; rect.bottom++;    // FillRect doesn't draw RHS or bottom
        pDC->FillSolidRect(rect, GetColor(CELL,BACK,SELECTED));
        rect.right--; rect.bottom--;
        pDC->SetTextColor(GetColor(CELL,FACE,SELECTED));
    }
    else
    {
        if (bEraseBckgnd)
        {
            rect.right++; rect.bottom++;    // FillRect doesn't draw RHS or bottom
            CBrush brush(TextBkClr);
            pDC->FillRect(rect, &brush);
            rect.right--; rect.bottom--;
        }
        pDC->SetTextColor(TextClr);
    }

    // Draw lines only when wanted
    if (GetGrid()->IsCellFixed(row,col) && pGrid->GetGridLines() != GVL_NONE)
    {
        CCellID FocusCell = pGrid->GetFocusCell();

        // As above, always show current location even in list mode so
        // that we know where the cursor is at.
        BOOL bHiliteFixed = pGrid->GetTrackFocusCell() && pGrid->IsValid(FocusCell) &&
                            (FocusCell.row == row || FocusCell.col == col);

        // If this fixed cell is on the same row/col as the focus cell,
        // highlight it.
        if (bHiliteFixed)
        {
            rect.right++; rect.bottom++;
            pDC->DrawEdge(rect, BDR_SUNKENINNER /*EDGE_RAISED*/, BF_RECT);
            rect.DeflateRect(1,1);
        }
        else
        {
            CPen lightpen(PS_SOLID, 1,  ::GetSysColor(COLOR_3DHIGHLIGHT)),
                darkpen(PS_SOLID,  1, ::GetSysColor(COLOR_3DDKSHADOW)),
                *pOldPen = pDC->GetCurrentPen();

            pDC->SelectObject(&lightpen);
            pDC->MoveTo(rect.right, rect.top);
            pDC->LineTo(rect.left, rect.top);
            pDC->LineTo(rect.left, rect.bottom);

            pDC->SelectObject(&darkpen);
            pDC->MoveTo(rect.right, rect.top);
            pDC->LineTo(rect.right, rect.bottom);
            pDC->LineTo(rect.left, rect.bottom);

            pDC->SelectObject(pOldPen);
            rect.DeflateRect(1,1);
        }
    }

    // Draw Text and image
    CFont *pFont = GetFontObject();
	ASSERT(pFont);
    if (pFont)
        pDC->SelectObject(pFont);

	rect.DeflateRect(GetMargin(row,col).cx, 0); //- changed by Yogurt
//    rect.DeflateRect(GetMargin(), GetMargin());    
    rect.right++;    
    rect.bottom++;

    if (pGrid->GetImageList() && m_datamodel->GetImage(row,col) >= 0)
    {
        IMAGEINFO Info;
        if (pGrid->GetImageList()->GetImageInfo(m_datamodel->GetImage(row,col), &Info))
        {
            //  would like to use a clipping region but seems to have issue
            //  working with CMemDC directly.  Instead, don't display image
            //  if any part of it cut-off
            //
            // CRgn rgn;
            // rgn.CreateRectRgnIndirect(rect);
            // pDC->SelectClipRgn(&rgn);
            // rgn.DeleteObject();

            /*
            // removed by Yogurt
            int nImageWidth = Info.rcImage.right-Info.rcImage.left+1;
            int nImageHeight = Info.rcImage.bottom-Info.rcImage.top+1;
            if( nImageWidth + rect.left <= rect.right + (int)(2*GetMargin())
                && nImageHeight + rect.top <= rect.bottom + (int)(2*GetMargin())  )
            {
                pGrid->GetImageList()->Draw(pDC, GetImage(), rect.TopLeft(), ILD_NORMAL);
            }
            */
            // Added by Yogurt
            int nImageWidth = Info.rcImage.right-Info.rcImage.left;            
            int nImageHeight = Info.rcImage.bottom-Info.rcImage.top;            
            if ((nImageWidth + rect.left <= rect.right) && (nImageHeight + rect.top <= rect.bottom))                
                pGrid->GetImageList()->Draw(pDC, m_datamodel->GetImage(row,col), rect.TopLeft(), ILD_NORMAL);

            //rect.left += nImageWidth+GetMargin();
        }
    }

    // Draw sort arrow
    if (pGrid->GetSortColumn() == col && row == 0)
    {
        CSize size = pDC->GetTextExtent(_T("M"));
        int nOffset = 2;

        // Base the size of the triangle on the smaller of the column
        // height or text height with a slight offset top and bottom.
        // Otherwise, it can get drawn outside the bounds of the cell.
        size.cy -= (nOffset * 2);

        if (size.cy >= rect.Height())
            size.cy = rect.Height() - (nOffset * 2);

        size.cx = size.cy;      // Make the dimensions square

        // Kludge for vertical text
        BOOL bVertical = (GetFont(row,col)->lfEscapement == 900);

        // Only draw if it'll fit!
        //if (size.cx + rect.left < rect.right + (int)(2*GetMargin())) - changed / Yogurt
        if (size.cx + rect.left < rect.right)
        {
            int nTriangleBase = rect.bottom - nOffset - size.cy;    // Triangle bottom right
            //int nTriangleBase = (rect.top + rect.bottom - size.cy)/2; // Triangle middle right
            //int nTriangleBase = rect.top + nOffset;                 // Triangle top right

            //int nTriangleLeft = rect.right - size.cx;                 // Triangle RHS
            //int nTriangleLeft = (rect.right + rect.left - size.cx)/2; // Triangle middle
            //int nTriangleLeft = rect.left;                            // Triangle LHS

            int nTriangleLeft;
            if (bVertical)
                nTriangleLeft = (rect.right + rect.left - size.cx)/2; // Triangle middle
            else
                nTriangleLeft = rect.right - size.cx;               // Triangle RHS

            CPen penShadow(PS_SOLID, 0, ::GetSysColor(COLOR_3DSHADOW));
            CPen penLight(PS_SOLID, 0, ::GetSysColor(COLOR_3DHILIGHT));
            if (pGrid->GetSortAscending())
            {
                // Draw triangle pointing upwards
                CPen *pOldPen = (CPen*) pDC->SelectObject(&penLight);
                pDC->MoveTo( nTriangleLeft + 1, nTriangleBase + size.cy + 1);
                pDC->LineTo( nTriangleLeft + (size.cx / 2) + 1, nTriangleBase + 1 );
                pDC->LineTo( nTriangleLeft + size.cx + 1, nTriangleBase + size.cy + 1);
                pDC->LineTo( nTriangleLeft + 1, nTriangleBase + size.cy + 1);

                pDC->SelectObject(&penShadow);
                pDC->MoveTo( nTriangleLeft, nTriangleBase + size.cy );
                pDC->LineTo( nTriangleLeft + (size.cx / 2), nTriangleBase );
                pDC->LineTo( nTriangleLeft + size.cx, nTriangleBase + size.cy );
                pDC->LineTo( nTriangleLeft, nTriangleBase + size.cy );
                pDC->SelectObject(pOldPen);
            }
            else
            {
                // Draw triangle pointing downwards
                CPen *pOldPen = (CPen*) pDC->SelectObject(&penLight);
                pDC->MoveTo( nTriangleLeft + 1, nTriangleBase + 1 );
                pDC->LineTo( nTriangleLeft + (size.cx / 2) + 1, nTriangleBase + size.cy + 1 );
                pDC->LineTo( nTriangleLeft + size.cx + 1, nTriangleBase + 1 );
                pDC->LineTo( nTriangleLeft + 1, nTriangleBase + 1 );
    
                pDC->SelectObject(&penShadow);
                pDC->MoveTo( nTriangleLeft, nTriangleBase );
                pDC->LineTo( nTriangleLeft + (size.cx / 2), nTriangleBase + size.cy );
                pDC->LineTo( nTriangleLeft + size.cx, nTriangleBase );
                pDC->LineTo( nTriangleLeft, nTriangleBase );
                pDC->SelectObject(pOldPen);
            }
            
            if (!bVertical)
                rect.right -= size.cy;
        }
    }

    // We want to see '&' characters so use DT_NOPREFIX
	m_datamodel->GetTextRect(rect,row,col);
    rect.right++;    
    rect.bottom++;

	CString s;
	m_datamodel->GetText(s,row,col);
	::DrawText(pDC->m_hDC, s, -1, rect, m_datamodel->GetFormat(row,col) | DT_NOPREFIX);

    pDC->RestoreDC(nSavedDC);

    return TRUE;
}

CGridCtrl::DefDataModel::DefDataModel():m_grid(0),m_edit_cell(-1,-1)
{
	
}

IClone* CGridCtrl::DefDataModel::Clone()
{
	DefDataModel* model = new DefDataModel();
	model->m_grid = m_grid;
	return model;
}

void CGridCtrl::DefDataModel::GetText(CString& text,int row,int col)
{
	text="";
}

void CGridCtrl::DefDataModel::GetTipText(CString& text,int row,int col)
{
	GetText(text,row,col);
}

void CGridCtrl::DefDataModel::SetText(CString& text,int row,int col)
{
	
}

void CGridCtrl::DefDataModel::Init(CGridCtrl* parent)
{
	m_grid = parent;
}

CGridCtrl* CGridCtrl::DefDataModel::GetGrid()
{
	return m_grid;
}

int CGridCtrl::DefDataModel::Compare(CCellID& l,CCellID& r)
{
	return 0;
}

void CGridCtrl::DefDataModel::SwapRows(int l,int r)
{

}

int CGridCtrl::DefDataModel::GetImage(int row,int col)
{
	return -1;
}

int CGridCtrl::DefDataModel::GetFormat(int row,int col)
{
	return GVHT_LEFT;
}

void CGridCtrl::DefDataModel::OnDblClick(int l,int r)
{
	
}

void CGridCtrl::DefDataModel::OnClickDown(CPoint& point,int l,int r)
{

}

void CGridCtrl::DefDataModel::OnClick(CPoint& point,int l,int r)
{

}

void CGridCtrl::DefDataModel::OnRClick(CPoint& point,int l,int r)
{

}

BOOL CGridCtrl::DefDataModel::GetTextRect(LPRECT pRect,int row,int col)
{
    if (GetImage(row,col) >= 0)
    {
        IMAGEINFO Info;

        CGridCtrl* pGrid = GetGrid();
        CImageList* pImageList = pGrid->GetImageList();
        
        if (pImageList && pImageList->GetImageInfo( GetImage(row,col), &Info))
        {
            int nImageWidth = Info.rcImage.right-Info.rcImage.left+1;
            pRect->left += nImageWidth + 3;
        }
    }
	return TRUE;
}

BOOL CGridCtrl::DefDataModel::Edit(int nRow,int nCol,CRect& rect,CPoint& point,unsigned char nChar)
{
	if ( m_edit_cell!=CCellID() )
	{      
        if (m_pEditWnd)
		    m_pEditWnd->SendMessage ( WM_CHAR, nChar );    
    }  
	else  
	{   
		DWORD dwStyle = ES_LEFT;
		if (GetFormat(nRow,nCol) & DT_RIGHT) 
			dwStyle = ES_RIGHT;
		else if (GetFormat(nRow,nCol) & DT_CENTER) 
			dwStyle = ES_CENTER;
		
		m_edit_cell = CCellID(nRow,nCol);	
		// InPlaceEdit auto-deletes itself
		CGridCtrl* pGrid = GetGrid();
		CString s;
		GetText(s,nRow,nCol);
		m_pEditWnd = new CInPlaceEdit(pGrid, rect, dwStyle, IDC_INPLACE_CONTROL, nRow, nCol, s, nChar);
    }
    return TRUE;
}

void CGridCtrl::DefDataModel::EndEdit()
{
	m_grid->SetFocus();
}

void CGridCtrl::DefDataModel::OnEndEdit(int row,int col,LPCTSTR str)
{
	m_edit_cell = CCellID();
}

BOOL CGridCtrl::DefDataModel::ValidateEdit(LPCTSTR str,int row,int col)
{
	return true;
}

void CGridCtrl::SetDataModel(IDataModel* model)
{
	delete m_datamodel;
	if(m_bAutoSaveState)
	{
		SaveToReg();
	}
	m_datamodel = (IDataModel*)model->Clone();
	m_drawmodel->Init(m_datamodel);
	m_datamodel->Init(this);
	if(m_bAutoSaveState)
	{
		LoadFromReg();
	}
}

void CGridCtrl::SetDrawModel(IDrawModel* model)
{
	delete m_drawmodel;
	m_drawmodel = (IDrawModel*)model->Clone();
	m_drawmodel->Init(m_datamodel);
}


int CGridCtrl::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
	if (CWnd::OnCreate(lpCreateStruct) == -1)
		return -1;
	m_datamodel->Init(this);
	return 0;
}

BOOL CGridCtrl::DefDataModel::OnInsertRow(int nRow)
{
	return true;
}

BOOL CGridCtrl::DefDataModel::OnDeleteRow(int nRow)
{
	return true;
}

CGridCtrl::IDataModel* CGridCtrl::GetDataModel()
{
	return m_datamodel;
}

BOOL CGridCtrl::DefDataModel::IsEditing(int row,int col)
{
	return CCellID(row,col)==m_edit_cell;
}

void CGridCtrl::DefDataModel::InsertRow()
{
	m_grid->InsertRow(0,m_grid->GetFocusCell().row);
}

void CGridCtrl::DefDataModel::DeleteRow()
{
	CCellRange range = m_grid->GetSelectedCellRange();
	if(range.GetMinCol()!=m_grid->GetFixedColumnCount() || range.GetMaxCol()!=m_grid->GetColumnCount()-1)
		return;
	std::vector<int> del_rows;
	for(int i=range.GetMaxRow();i>=range.GetMinRow();i--)
	{
		int j;
		for(j=m_grid->GetFixedColumnCount();j<m_grid->GetColumnCount();j++)
			if(!m_grid->IsCellSelected(i,j))
				break;
		if(j==m_grid->GetColumnCount())
			del_rows.push_back(i);
	}
	for(int i=0;i<(int)del_rows.size();i++)
		m_grid->DeleteRow(del_rows[i]);
	m_grid->RedrawWindow();
}

BOOL CGridCtrl::DefDataModel::GetTipTextRect(LPRECT pRect,int row,int col)
{
	return GetTextRect(pRect,row,col);
}

void CGridCtrl::LoadFromReg(char* path)
{
	CBCGPRegistry reg(false,true);
	CString key;
	if(path)
		key = path;
	else
		key.Format("%sList\\%d",::BCGPGetRegPath("Control",NULL),GetDlgCtrlID());
	if(!reg.Open(key))
		return;
	CDWordArray arr;
	if(!reg.Read("ColumnWidth",arr)||arr.GetSize()!=GetColumnCount())
	{
		return;
	}
	for(int i=0;i<arr.GetSize();i++)
		SetColumnWidth(i,arr[i]);
}

void CGridCtrl::SaveToReg(char* path)
{
	if(!GetColumnCount())
		return;
	CBCGPRegistry reg(false,false);
	CString key;
	if(path)
		key = path;
	else
		key.Format("%sList\\%d",::BCGPGetRegPath("Control",NULL),GetDlgCtrlID());
	reg.CreateKey(key);
	CDWordArray arr;
	arr.SetSize(GetColumnCount());
	for(int i=0;i<arr.GetSize();i++)
		arr[i]=GetColumnWidth(i);	
	reg.Write("ColumnWidth",arr);
}
void CGridCtrl::OnDestroy()
{
	CWnd::OnDestroy();
	if(m_bAutoSaveState)
		SaveToReg();
}

CGridCtrl::DefDataModel::~DefDataModel()
{
}

CWnd* CGridCtrl::DefDataModel::GetEditCtrl(int row,int col)
{
	return m_pEditWnd;
}
void CGridCtrl::OnKillFocus(CWnd* pNewWnd)
{
	CWnd::OnKillFocus(pNewWnd);

	DWORD key;CCellID val;
	for(POSITION pos = m_SelectedCellMap.GetStartPosition();pos;)
	{
		m_SelectedCellMap.GetNextAssoc(pos,key,val);
		RedrawCell(val);
	}
}

void CGridCtrl::OnSetFocus(CWnd* pOldWnd)
{
	CWnd::OnSetFocus(pOldWnd);

	DWORD key;CCellID val;
	for(POSITION pos = m_SelectedCellMap.GetStartPosition();pos;)
	{
		m_SelectedCellMap.GetNextAssoc(pos,key,val);
		RedrawCell(val);
	}
}
