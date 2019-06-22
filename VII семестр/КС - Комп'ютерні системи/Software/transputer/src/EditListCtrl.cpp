#include "StdAfx.h"
/*
#include ".\editlistctrl.h"
#include "RegPath.h"

CEditListCtrl::~CEditListCtrl(void)
{
	delete m_data;
}

CEditListCtrl::CEditListCtrl(IDataModel* data)
{
	if(!data)
		AfxThrowInvalidArgException();
	m_cell.m_grid = this;
	m_data = (IDataModel*)(data?data->Clone():0);
	CBCGPVisualManager::GetInstance();

	
	m_crWindowText        = globalData.GetColor(COLOR_WINDOWTEXT);
    m_crWindowColour      = globalData.GetColor(COLOR_WINDOW);
    m_cr3DFace            = globalData.clrBarFace;
    m_crShadow            = globalData.GetColor(COLOR_WINDOW);
    m_crGridLineColour    = RGB(192,192,192);
	SetGridBkColor(m_crShadow);
	SetupDefaultCells();
}


void CEditListCtrl::SetBehaviour(IDataModel* data)
{
	if(!data)
		AfxThrowInvalidArgException();
	m_data = (IDataModel*)(data?data->Clone():0);
	OnDataModelChange();
}

int CEditListCtrl::Create(DWORD dwStyle,const RECT& rect,CWnd* parent,UINT id)
{
	if(!parent)
		AfxThrowInvalidArgException();
	int result = CGridCtrl::Create(rect,parent,id,dwStyle);
	dwStyle|=WS_CHILD;
	return result;
}

void CEditListCtrl::OnDataModelChange()
{
	m_data->Init(this);
}

void CEditListCtrl::Load()
{
	m_data->Init(this);
	CBCGPRegistry reg(false,true);
	CWordArray arr;
	CString key;
	key.Format("%sList\\%d",::BCGPGetRegPath("Control",NULL),GetDlgCtrlID());
	if(!reg.Open(key))
		return;
	if(!reg.Read("ColumnWidth",arr)||arr.GetSize()!=GetColumnCount())
	{
		return;
	}
	for(int i=0;i<arr.GetSize();i++)
		SetColumnWidth(i,arr[i]);
}

BEGIN_MESSAGE_MAP(CEditListCtrl, CGridCtrl)
	ON_WM_CREATE()
    ON_WM_SYSCOLORCHANGE()
    ON_WM_SETTINGCHANGE()
	ON_WM_DESTROY()
END_MESSAGE_MAP()

int CEditListCtrl::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
	if (CGridCtrl::OnCreate(lpCreateStruct) == -1)
		return -1;
	Load();
	return 0;
}

void CEditListCtrl::OnSysColorChange()
{
    CGridCtrl::OnSysColorChange();

    if (GetDefaultCell(FALSE, FALSE)->GetTextClr() == m_crWindowText)                   // Still using system colours
        GetDefaultCell(FALSE, FALSE)->SetTextClr(::globalData.GetColor(COLOR_WINDOWTEXT));      // set to new system colour
    if (GetDefaultCell(FALSE, FALSE)->GetBackClr() == m_crWindowColour)
        GetDefaultCell(FALSE, FALSE)->SetBackClr(::globalData.GetColor(COLOR_WINDOW));

    if (GetDefaultCell(TRUE, FALSE)->GetTextClr() == m_crWindowText)                   // Still using system colours
        GetDefaultCell(TRUE, FALSE)->SetTextClr(::globalData.GetColor(COLOR_WINDOWTEXT));      // set to new system colour
    if (GetDefaultCell(TRUE, FALSE)->GetBackClr() == m_crWindowColour)
        GetDefaultCell(TRUE, FALSE)->SetBackClr(::globalData.GetColor(COLOR_WINDOW));

    if (GetDefaultCell(FALSE, TRUE)->GetTextClr() == m_crWindowText)                   // Still using system colours
        GetDefaultCell(FALSE, TRUE)->SetTextClr(::globalData.GetColor(COLOR_WINDOWTEXT));      // set to new system colour
    if (GetDefaultCell(FALSE, TRUE)->GetBackClr() == m_crWindowColour)
        GetDefaultCell(FALSE, TRUE)->SetBackClr(::globalData.GetColor(COLOR_WINDOW));

    if (GetDefaultCell(TRUE, TRUE)->GetTextClr() == m_crWindowText)                   // Still using system colours
        GetDefaultCell(TRUE, TRUE)->SetTextClr(::globalData.GetColor(COLOR_WINDOWTEXT));      // set to new system colour
    if (GetDefaultCell(TRUE, TRUE)->GetBackClr() == m_crWindowColour)
        GetDefaultCell(TRUE, TRUE)->SetBackClr(::globalData.GetColor(COLOR_WINDOW));

    if (GetGridBkColor() == m_crShadow)
        SetGridBkColor(::globalData.GetColor(COLOR_WINDOW));

    m_crWindowText   = ::globalData.GetColor(COLOR_WINDOWTEXT);
    m_crWindowColour = ::globalData.GetColor(COLOR_WINDOW);
    m_cr3DFace       = globalData.clrBarFace;
    m_crShadow       = ::globalData.GetColor(COLOR_WINDOW);
}

void CEditListCtrl::OnSettingChange(UINT uFlags, LPCTSTR lpszSection)
{
    CGridCtrl::OnSettingChange(uFlags, lpszSection);

    if (GetDefaultCell(FALSE, FALSE)->GetTextClr() == m_crWindowText)                   // Still using system colours
        GetDefaultCell(FALSE, FALSE)->SetTextClr(globalData.GetColor(COLOR_WINDOWTEXT));      // set to new system colour
    if (GetDefaultCell(FALSE, FALSE)->GetBackClr() == m_crWindowColour)
        GetDefaultCell(FALSE, FALSE)->SetBackClr(globalData.GetColor(COLOR_WINDOW));

    if (GetDefaultCell(TRUE, FALSE)->GetTextClr() == m_crWindowText)                   // Still using system colours
        GetDefaultCell(TRUE, FALSE)->SetTextClr(globalData.GetColor(COLOR_WINDOWTEXT));      // set to new system colour
    if (GetDefaultCell(TRUE, FALSE)->GetBackClr() == m_crWindowColour)
        GetDefaultCell(TRUE, FALSE)->SetBackClr(globalData.GetColor(COLOR_WINDOW));

    if (GetDefaultCell(FALSE, TRUE)->GetTextClr() == m_crWindowText)                   // Still using system colours
        GetDefaultCell(FALSE, TRUE)->SetTextClr(globalData.GetColor(COLOR_WINDOWTEXT));      // set to new system colour
    if (GetDefaultCell(FALSE, TRUE)->GetBackClr() == m_crWindowColour)
        GetDefaultCell(FALSE, TRUE)->SetBackClr(globalData.GetColor(COLOR_WINDOW));

    if (GetDefaultCell(TRUE, TRUE)->GetTextClr() == m_crWindowText)                   // Still using system colours
        GetDefaultCell(TRUE, TRUE)->SetTextClr(globalData.GetColor(COLOR_WINDOWTEXT));      // set to new system colour
    if (GetDefaultCell(TRUE, TRUE)->GetBackClr() == m_crWindowColour)
        GetDefaultCell(TRUE, TRUE)->SetBackClr(globalData.GetColor(COLOR_WINDOW));

    if (GetGridBkColor() == m_crShadow)
        SetGridBkColor(globalData.GetColor(COLOR_WINDOW));

    m_crWindowText   = globalData.GetColor(COLOR_WINDOWTEXT);
    m_crWindowColour = globalData.GetColor(COLOR_WINDOW);
    m_cr3DFace       = globalData.clrBarFace;
    m_crShadow       = globalData.GetColor(COLOR_WINDOW);
}

void CEditListCtrl::OnDestroy()
{
	CGridCtrl::OnDestroy();
	CBCGPRegistry reg(false,false);
	CString key;
	key.Format("%s\\List\\%d",::BCGPGetRegPath("Control",NULL),GetDlgCtrlID());
	reg.CreateKey(key);
	CWordArray arr;
	arr.SetSize(GetColumnCount());
	for(int i=0;i<arr.GetSize();i++)
		arr[i]=GetColumnWidth(i);	
	reg.Write("ColumnWidth",arr);
}

CGridCellBase* CEditListCtrl::GetCell(int nRow, int nCol) const
{
	CEditCell* cell = (CEditCell*)&m_cell;
	cell->SetRowCol(nRow,nCol);
	return cell;
}

IMPLEMENT_DYNAMIC(CEditCell, CGridCellBase)

/////////////////////////////////////////////////////////////////////////////
// GridCellBase

CEditCell::CEditCell()
{
    Reset();
}

CEditCell::~CEditCell()
{
}

/////////////////////////////////////////////////////////////////////////////
// GridCellBase Operations

void CEditCell::Reset()
{
    m_nState  = 0;
}

void CEditCell::operator=(const CEditCell& cell)
{
	if (this == &cell) return;

    SetGrid(cell.GetGrid());    // do first in case of dependencies

    SetText(cell.GetText());
    SetImage(cell.GetImage());
    SetData(cell.GetData());
    SetState(cell.GetState());
    SetFormat(cell.GetFormat());
    SetTextClr(cell.GetTextClr());
    SetBackClr(cell.GetBackClr());
    SetFont(cell.IsDefaultFont()? NULL : cell.GetFont());
    SetMargin(cell.GetMargin());
}

/////////////////////////////////////////////////////////////////////////////
// CEditCell Attributes

// Returns a pointer to a cell that holds default values for this particular type of cell
CGridCellBase* CEditCell::GetDefaultCell() const
{
    if (GetGrid())
        return GetGrid()->GetDefaultCell(IsFixedRow(), IsFixedCol());
    return NULL;
}


/////////////////////////////////////////////////////////////////////////////
// CEditCell Operations

// EFW - Various changes to make it draw cells better when using alternate
// color schemes.  Also removed printing references as that's now done
// by PrintCell() and fixed the sort marker so that it doesn't draw out
// of bounds.
BOOL CEditCell::Draw(CDC* pDC, int nRow, int nCol, CRect rect,  BOOL bEraseBkgnd )
{
    // Note - all through this function we totally brutalise 'rect'. Do not
    // depend on it's value being that which was passed in.

    CGridCtrl* pGrid = GetGrid();
    ASSERT(pGrid);

    if (!pGrid || !pDC)
        return FALSE;

    if( rect.Width() <= 0 || rect.Height() <= 0)  // prevents imagelist item from drawing even
        return FALSE;                             //  though cell is hidden

    //TRACE3("Drawing %scell %d, %d\n", IsFixed()? _T("Fixed ") : _T(""), nRow, nCol);

    int nSavedDC = pDC->SaveDC();
    pDC->SetBkMode(TRANSPARENT);

    // Get the default cell implementation for this kind of cell. We use it if this cell
    // has anything marked as "default"
    CGridDefaultCell *pDefaultCell = (CGridDefaultCell*) GetDefaultCell();
    if (!pDefaultCell)
        return FALSE;

    // Set up text and background colours
    COLORREF TextClr, TextBkClr;

    TextClr = (GetTextClr() == CLR_DEFAULT)? pDefaultCell->GetTextClr() : GetTextClr();
    if (GetBackClr() == CLR_DEFAULT)
        TextBkClr = pDefaultCell->GetBackClr();
    else
    {
        bEraseBkgnd = TRUE;
        TextBkClr = GetBackClr();
    }

    // Draw cell background and highlighting (if necessary)
    if ( IsFocused() || IsDropHighlighted() )
    {
        // Always draw even in list mode so that we can tell where the
        // cursor is at.  Use the highlight colors though.
        if(GetState() & GVIS_SELECTED)
        {
			TextBkClr = globalData.GetColor(COLOR_HIGHLIGHT);
            TextClr = globalData.GetColor(COLOR_HIGHLIGHTTEXT);
            bEraseBkgnd = TRUE;
        }

        rect.right++; rect.bottom++;    // FillRect doesn't draw RHS or bottom
        if (bEraseBkgnd)
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
                CBrush brush(TextClr);
                pDC->FrameRect(rect, &brush);
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
    else if ((GetState() & GVIS_SELECTED))
    {
        rect.right++; rect.bottom++;    // FillRect doesn't draw RHS or bottom
        pDC->FillSolidRect(rect, globalData.GetColor(COLOR_HIGHLIGHT));
        rect.right--; rect.bottom--;
        pDC->SetTextColor(globalData.GetColor(COLOR_HIGHLIGHTTEXT));
    }
    else
    {
        if (bEraseBkgnd)
        {
            rect.right++; rect.bottom++;    // FillRect doesn't draw RHS or bottom
            CBrush brush(TextBkClr);
            pDC->FillRect(rect, &brush);
            rect.right--; rect.bottom--;
        }
        pDC->SetTextColor(TextClr);
    }

    // Draw lines only when wanted
    if (IsFixed() && pGrid->GetGridLines() != GVL_NONE)
    {
        CCellID FocusCell = pGrid->GetFocusCell();

        // As above, always show current location even in list mode so
        // that we know where the cursor is at.
        BOOL bHiliteFixed = pGrid->GetTrackFocusCell() && pGrid->IsValid(FocusCell) &&
                            (FocusCell.row == nRow || FocusCell.col == nCol);

        // If this fixed cell is on the same row/col as the focus cell,
        // highlight it.
        if (false)//bHiliteFixed)
        {
            rect.right++; rect.bottom++;
            pDC->DrawEdge(rect, BDR_SUNKENINNER EDGE_RAISED, BF_RECT);
            rect.DeflateRect(1,1);
        }
        else
        {
			CPen lightpen(PS_SOLID, 1,  globalData.GetColor(COLOR_3DHIGHLIGHT)),
                darkpen(PS_SOLID,  1, globalData.GetColor(COLOR_3DDKSHADOW)),
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
#if !defined(_WIN32_WCE_NO_PRINTING) && !defined(GRIDCONTROL_NO_PRINTING)
    if (!pDC->m_bPrinting)
#endif
    {
        CFont *pFont = GetFontObject();
		ASSERT(pFont);
        if (pFont)
            pDC->SelectObject(pFont);
    }

    rect.DeflateRect(GetMargin(), 0); //- changed by Yogurt
//    rect.DeflateRect(GetMargin(), GetMargin());    
    rect.right++;    
    rect.bottom++;

    if (pGrid->GetImageList() && GetImage() >= 0)
    {
        IMAGEINFO Info;
        if (pGrid->GetImageList()->GetImageInfo(GetImage(), &Info))
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
            
            // Added by Yogurt
            int nImageWidth = Info.rcImage.right-Info.rcImage.left;            
            int nImageHeight = Info.rcImage.bottom-Info.rcImage.top;            
            if ((nImageWidth + rect.left <= rect.right) && (nImageHeight + rect.top <= rect.bottom))                
                pGrid->GetImageList()->Draw(pDC, GetImage(), rect.TopLeft(), ILD_NORMAL);

            //rect.left += nImageWidth+GetMargin();
        }
    }

    // Draw sort arrow
    if (pGrid->GetSortColumn() == nCol && nRow == 0)
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
        BOOL bVertical = (GetFont()->lfEscapement == 900);

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
    GetTextRect(rect);
    rect.right++;    
    rect.bottom++;

    DrawText(pDC->m_hDC, GetText(), -1, rect, GetFormat() | DT_NOPREFIX);

    pDC->RestoreDC(nSavedDC);

    return TRUE;
}

/////////////////////////////////////////////////////////////////////////////
// CEditCell Mouse and Cursor events

// Not yet implemented
void CEditCell::OnMouseEnter()
{
    TRACE0("Mouse entered cell\n");
}

void CEditCell::OnMouseOver()
{
    //TRACE0("Mouse over cell\n");
}

// Not Yet Implemented
void CEditCell::OnMouseLeave()
{
    TRACE0("Mouse left cell\n");
}

void CEditCell::OnClick( CPoint PointCellRelative)
{
    UNUSED_ALWAYS(PointCellRelative);
    TRACE2("Mouse Left btn up in cell at x=%i y=%i\n", PointCellRelative.x, PointCellRelative.y);
}

void CEditCell::OnClickDown( CPoint PointCellRelative)
{
    UNUSED_ALWAYS(PointCellRelative);
    TRACE2("Mouse Left btn down in cell at x=%i y=%i\n", PointCellRelative.x, PointCellRelative.y);
}

void CEditCell::OnRClick( CPoint PointCellRelative)
{
    UNUSED_ALWAYS(PointCellRelative);
    TRACE2("Mouse right-clicked in cell at x=%i y=%i\n", PointCellRelative.x, PointCellRelative.y);
}

void CEditCell::OnDblClick( CPoint PointCellRelative)
{
    UNUSED_ALWAYS(PointCellRelative);
    TRACE2("Mouse double-clicked in cell at x=%i y=%i\n", PointCellRelative.x, PointCellRelative.y);
}

// Return TRUE if you set the cursor
BOOL CEditCell::OnSetCursor()
{
#ifndef _WIN32_WCE_NO_CURSOR
    SetCursor(AfxGetApp()->LoadStandardCursor(IDC_ARROW));
#endif
    return TRUE;
}

/////////////////////////////////////////////////////////////////////////////
// CEditCell editing

void CEditCell::OnEndEdit() 
{
	ASSERT( FALSE); 
}

BOOL CEditCell::ValidateEdit(LPCTSTR str)
{
    UNUSED_ALWAYS(str);
	return TRUE;
}

/////////////////////////////////////////////////////////////////////////////
// CEditCell Sizing

BOOL CEditCell::GetTextRect( LPRECT pRect)  // i/o:  i=dims of cell rect; o=dims of text rect
{
    if (GetImage() >= 0)
    {
        IMAGEINFO Info;

        CGridCtrl* pGrid = GetGrid();
        CImageList* pImageList = pGrid->GetImageList();
        
        if (pImageList && pImageList->GetImageInfo( GetImage(), &Info))
        {
            int nImageWidth = Info.rcImage.right-Info.rcImage.left+1;
            pRect->left += nImageWidth + GetMargin();
        }
    }

    return TRUE;
}

// By default this uses the selected font (which is a bigger font)
CSize CEditCell::GetTextExtent(LPCTSTR szText, CDC* pDC )
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
            CGridDefaultCell* pDefCell = (CGridDefaultCell*) GetDefaultCell();
            ASSERT(pDefCell);
            return CSize(pDefCell->GetWidth(), pDefCell->GetHeight());
        }
        bReleaseDC = TRUE;
    }

    CFont *pOldFont = NULL,
          *pFont = GetFontObject();
    if (pFont)
        pOldFont = pDC->SelectObject(pFont);

    CSize size;
    int nFormat = GetFormat();

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
    
    size += CSize(2*GetMargin(), 2*GetMargin());

    // Kludge for vertical text
    LOGFONT *pLF = GetFont();
    if (pLF->lfEscapement == 900 || pLF->lfEscapement == -900)
    {
        int nTemp = size.cx;
        size.cx = size.cy;
        size.cy = nTemp;
        size += CSize(0, 4*GetMargin());
    }
    
    if (bReleaseDC)
        pGrid->ReleaseDC(pDC);

    return size;
}


CSize CEditCell::GetCellExtent(CDC* pDC)
{    
    CSize size = GetTextExtent(GetText(), pDC);    
    CSize ImageSize(0,0);    
    
    int nImage = GetImage();    
    if (nImage >= 0)    
    {        
        CGridCtrl* pGrid = GetGrid();        
        ASSERT(pGrid);        
        IMAGEINFO Info;        
        if (pGrid->GetImageList() && pGrid->GetImageList()->GetImageInfo(nImage, &Info))         
        {            
            ImageSize = CSize(Info.rcImage.right-Info.rcImage.left,                                 
                Info.rcImage.bottom-Info.rcImage.top);            
            if (size.cx > 2*(int)GetMargin ())                
                ImageSize.cx += GetMargin();            
            ImageSize.cy += 2*(int)GetMargin ();        
        }    
    }    
    size.cx += ImageSize.cx + 1;    
    size.cy = max(size.cy, ImageSize.cy) + 1;    
    if (IsFixed())    
    {        
        size.cx++;        
        size.cy++;    
    }    
    return size;
}

// EFW - Added to print cells so that grids that use different colors are
// printed correctly.
BOOL CEditCell::PrintCell(CDC* pDC, int , int , CRect rect)
{
#if defined(_WIN32_WCE_NO_PRINTING) || defined(GRIDCONTROL_NO_PRINTING)
    return FALSE;
#else
    COLORREF crFG, crBG;
    GV_ITEM Item;

    CGridCtrl* pGrid = GetGrid();
    if (!pGrid || !pDC)
        return FALSE;

    if( rect.Width() <= 0
        || rect.Height() <= 0)  // prevents imagelist item from drawing even
        return FALSE;           //  though cell is hidden

    int nSavedDC = pDC->SaveDC();

    pDC->SetBkMode(TRANSPARENT);

    if (pGrid->GetShadedPrintOut())
    {
        // Get the default cell implementation for this kind of cell. We use it if this cell
        // has anything marked as "default"
        CGridDefaultCell *pDefaultCell = (CGridDefaultCell*) GetDefaultCell();
        if (!pDefaultCell)
            return FALSE;

        // Use custom color if it doesn't match the default color and the
        // default grid background color.  If not, leave it alone.
        if(IsFixed())
            crBG = (GetBackClr() != CLR_DEFAULT) ? GetBackClr() : pDefaultCell->GetBackClr();
        else
            crBG = (GetBackClr() != CLR_DEFAULT && GetBackClr() != pDefaultCell->GetBackClr()) ?
                GetBackClr() : CLR_DEFAULT;

        // Use custom color if the background is different or if it doesn't
        // match the default color and the default grid text color.  
        if(IsFixed())
            crFG = (GetBackClr() != CLR_DEFAULT) ? GetTextClr() : pDefaultCell->GetTextClr();
        else
            crFG = (GetBackClr() != CLR_DEFAULT) ? GetTextClr() : pDefaultCell->GetTextClr();

        // If not printing on a color printer, adjust the foreground color
        // to a gray scale if the background color isn't used so that all
        // colors will be visible.  If not, some colors turn to solid black
        // or white when printed and may not show up.  This may be caused by
        // coarse dithering by the printer driver too (see image note below).
        if(pDC->GetDeviceCaps(NUMCOLORS) == 2 && crBG == CLR_DEFAULT)
            crFG = RGB(GetRValue(crFG) * 0.30, GetGValue(crFG) * 0.59,
                GetBValue(crFG) * 0.11);

        // Only erase the background if the color is not the default
        // grid background color.
        if(crBG != CLR_DEFAULT)
        {
            CBrush brush(crBG);
            rect.right++; rect.bottom++;
            pDC->FillRect(rect, &brush);
            rect.right--; rect.bottom--;
        }
    }
    else
    {
        crBG = CLR_DEFAULT;
        crFG = RGB(0, 0, 0);
    }

    pDC->SetTextColor(crFG);

    CFont *pFont = GetFontObject();
    if (pFont)
        pDC->SelectObject(pFont);

    /*
    // ***************************************************
    // Disabled - if you need this functionality then you'll need to rewrite.
    // Create the appropriate font and select into DC.
    CFont Font;
    // Bold the fixed cells if not shading the print out.  Use italic
    // font it it is enabled.
    const LOGFONT* plfFont = GetFont();
    if(IsFixed() && !pGrid->GetShadedPrintOut())
    {
        Font.CreateFont(plfFont->lfHeight, 0, 0, 0, FW_BOLD, plfFont->lfItalic, 0, 0,
            ANSI_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS,
#ifndef _WIN32_WCE
            PROOF_QUALITY,
#else
            DEFAULT_QUALITY,
#endif
            VARIABLE_PITCH | FF_SWISS, plfFont->lfFaceName);
    }
    else
        Font.CreateFontIndirect(plfFont);

    pDC->SelectObject(&Font);
    // ***************************************************
    

    // Draw lines only when wanted on fixed cells.  Normal cell grid lines
    // are handled in OnPrint.
    if(pGrid->GetGridLines() != GVL_NONE && IsFixed())
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

        rect.DeflateRect(1,1);
        pDC->SelectObject(pOldPen);
    }

    rect.DeflateRect(GetMargin(), 0);

    if(pGrid->GetImageList() && GetImage() >= 0)
    {
        // NOTE: If your printed images look like fuzzy garbage, check the
        //       settings on your printer driver.  If it's using coarse
        //       dithering and/or vector graphics, they may print wrong.
        //       Changing to fine dithering and raster graphics makes them
        //       print properly.  My HP 4L had that problem.

        IMAGEINFO Info;
        if(pGrid->GetImageList()->GetImageInfo(GetImage(), &Info))
        {
            int nImageWidth = Info.rcImage.right-Info.rcImage.left;
            pGrid->GetImageList()->Draw(pDC, GetImage(), rect.TopLeft(), ILD_NORMAL);
            rect.left += nImageWidth+GetMargin();
        }
    }

    // Draw without clipping so as not to lose text when printed for real
	// DT_NOCLIP removed 01.01.01. Slower, but who cares - we are printing!
    DrawText(pDC->m_hDC, GetText(), -1, rect,
        GetFormat() | DT_NOPREFIX);

    pDC->RestoreDC(nSavedDC);

    return TRUE;
#endif
}

void CEditListCtrl::SetCellState(int row,int col,DWORD state)
{
	unsigned r=row,c=col;
	unsigned long long key = c<<32|r;
	if(state)
		m_states[key]=state;
	else
		m_states.erase(m_states.find(key));
}

DWORD CEditListCtrl::GetCellState(int row,int col)
{
	unsigned r=row,c=col;
	unsigned long long key = c<<32|r;
	CellStateMap::iterator it = m_states.find(key);
	if(it==m_states.end())
		return 0;
	return it->second;

}

DWORD CEditCell::GetState()const
{
	CCellID id(m_row,m_col);
	DWORD res = m_grid->GetSelectedCellRange().InRange(id)?GVIS_SELECTED:0;
	if(m_grid->GetFocusCell()==id)
		res|=GVIS_FOCUSED;
	if(IsFixedRow())
		res|=GVIS_FIXEDCOL;
	if(IsFixedRow())
		res|=GVIS_FIXEDROW;
	if(IsFixed())
		res|=GVIS_FIXED;
	return res;
}

void CEditCell::SetState(DWORD nState)
{
//	m_grid->SetCellState(m_row,m_col,nState);
}

CGridCtrl* CEditCell::GetGrid()const
{
	return (CGridCtrl*) m_grid;
}

BOOL CEditCell::IsFixedCol()const
{
	return m_col<m_grid->GetFixedColumnCount();
}

BOOL CEditCell::IsFixedRow()const
{
	return m_row<m_grid->GetFixedRowCount();
}

COLORREF CEditCell::GetTextClr()const
{
	return globalData.clrWindowText;
}

COLORREF CEditCell::GetBackClr()const
{
	if(IsFixed())
		return globalData.clrBarFace;
	return globalData.clrWindow;
}

BOOL CEditCell::IsFocused()const
{
	return (CWnd*)&m_grid==m_grid->GetFocus() && IsSelected();
}

BOOL CEditCell::IsSelected()const
{
	return m_grid->GetCellState(m_row,m_col) & GVIS_SELECTED;
}

BOOL CEditCell::IsDropHighlighted()
{
	return false;
}

BOOL CEditCell::IsFixed()const
{
	return IsFixedCol()||IsFixedRow();
}

LOGFONT* CEditCell::GetFont()const
{
	return m_grid->GetDefaultCell(IsFixedRow(),IsFixedCol())->GetFont();
}

CFont* CEditCell::GetFontObject()const
{
	return m_grid->GetDefaultCell(IsFixedRow(),IsFixedCol())->GetFontObject();
}

UINT CEditCell::GetMargin()const
{
	return m_grid->GetDefaultCell(IsFixedRow(),IsFixedCol())->GetMargin();
}

int CEditCell::GetImage()const
{
	return -1;
}

DWORD CEditCell::GetFormat()const
{
	return DT_LEFT;
}

LPCTSTR CEditCell::GetText()const
{
	static CString s;
	m_grid->GetModel()->GetText(s,m_row,m_col);
	return s;
}

LPCTSTR CEditCell::GetTipText()const
{
	return GetText();
}

CEditListCtrl::IDataModel* CEditListCtrl::GetModel()
{
	return m_data;
}

BOOL CEditCell::IsEditing()const
{
	return false;
}
*/
