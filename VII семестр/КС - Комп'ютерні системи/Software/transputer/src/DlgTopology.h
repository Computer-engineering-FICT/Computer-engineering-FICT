#pragma once
#include "TransputerModel.h"

// CDlgTopology dialog

class CTopologyPropList:public CBCGPPropList
{
protected:
	virtual BOOL ValidateItemData(CBCGPProp*);
public:
	ITransputerParam* m_param;
	CTopologyPropList();
	~CTopologyPropList();
	void SetParam(int type,ITransputerParam::Dictionary& dict);
};

class CDlgTopology : public CDialog
{
	DECLARE_DYNAMIC(CDlgTopology)

public:
	CDlgTopology(CWnd* pParent = NULL);   // standard constructor
	virtual ~CDlgTopology();

// Dialog Data
	enum { IDD = IDD_DLG_SYSTEM };
	struct Data
	{
		int topology_type;
		ITransputerParam::Dictionary param;
	}m_data;
protected:
	CTopologyPropList m_param;
	CFont m_bold;
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	afx_msg HBRUSH OnCtlColor(CDC* pDC,CWnd* wnd, UINT nCtlColor);
	DECLARE_MESSAGE_MAP()
public:
	virtual BOOL OnInitDialog();
	afx_msg void OnBnClickedOk();
	afx_msg void OnCbnSelchangeCmbTopology();
};
