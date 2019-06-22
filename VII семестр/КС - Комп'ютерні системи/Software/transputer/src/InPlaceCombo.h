#pragma once
#include "afxwin.h"

class CInPlaceCombo :
	public CComboBox
{
public:
    CInPlaceCombo(CWnd* pParent, CRect& rect, DWORD dwStyle, UINT nID,
                int nRow, int nColumn, CString sInitText, CStringArray& values, UINT nFirstChar);
	virtual ~CInPlaceCombo(void){};
     void EndEdit();
 	public:
	virtual BOOL PreTranslateMessage(MSG* pMsg);
protected:
	virtual void PostNcDestroy();
protected:
    afx_msg void OnKillFocus(CWnd* pNewWnd);
    afx_msg void OnChar(UINT nChar, UINT nRepCnt, UINT nFlags);
    afx_msg void OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);
	afx_msg UINT OnGetDlgCode();
    DECLARE_MESSAGE_MAP()
private:
    int     m_nRow;
    int     m_nColumn;
    CString m_sInitText;
    UINT    m_nLastChar;
    BOOL    m_bExitOnArrows;
    CRect   m_Rect;
};
