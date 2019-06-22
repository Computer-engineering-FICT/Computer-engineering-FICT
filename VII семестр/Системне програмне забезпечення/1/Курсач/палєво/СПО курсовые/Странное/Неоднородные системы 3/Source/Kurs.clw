; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CCpuDialog
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "Kurs.h"
LastPage=0

ClassCount=7
Class1=CKursApp
Class2=CKursDoc
Class3=CKursView
Class4=CMainFrame

ResourceCount=11
Resource1=IDD_ABOUTBOX
Resource2=IDD_DIALOG1
Class5=CAboutDlg
Resource3=IDD_ABOUTBOX (English (U.S.))
Resource4=IDD_CHANGEVAL
Resource5=IDR_MAINFRAME (English (U.S.))
Class6=CPropDlg
Resource6=IDR_MAINFRAME
Class7=CCpuDialog
Resource7=IDR_MENU1
Resource8=IDD_CHANGEVAL (Russian)
Resource9=IDD_DIALOG1 (Russian)
Resource10=IDR_MENU1 (Russian)
Resource11=IDR_MAINFRAME (Russian)

[CLS:CKursApp]
Type=0
HeaderFile=Kurs.h
ImplementationFile=Kurs.cpp
Filter=N

[CLS:CKursDoc]
Type=0
HeaderFile=KursDoc.h
ImplementationFile=KursDoc.cpp
Filter=N
BaseClass=CDocument
VirtualFilter=DC

[CLS:CKursView]
Type=0
HeaderFile=KursView.h
ImplementationFile=KursView.cpp
Filter=C
LastObject=CKursView
BaseClass=CView
VirtualFilter=VWC

[CLS:CMainFrame]
Type=0
HeaderFile=MainFrm.h
ImplementationFile=MainFrm.cpp
Filter=T



[CLS:CAboutDlg]
Type=0
HeaderFile=Kurs.cpp
ImplementationFile=Kurs.cpp
Filter=D

[DLG:IDD_ABOUTBOX]
Type=1
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308352
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889
Class=CAboutDlg

[MNU:IDR_MAINFRAME]
Type=1
Class=?
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_APP_EXIT
Command5=ID_ADD_TASKM
Command6=ID_ADD_RELATION
Command7=ID_DEL_TASK
Command8=ID_DEL_RELATION
Command9=ID_PROPERT
Command10=ID_REPAINT
Command11=ID_VIEW_GRAPHS
Command12=ID_VIEW_PROC
Command13=ID_CPU
Command14=ID_EVALUATE
Command15=ID_FAULT
CommandCount=15

[ACL:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_FILE_PRINT
Command5=ID_EDIT_UNDO
Command6=ID_EDIT_CUT
Command7=ID_EDIT_COPY
Command8=ID_EDIT_PASTE
Command9=ID_EDIT_UNDO
Command10=ID_EDIT_CUT
Command11=ID_EDIT_COPY
Command12=ID_EDIT_PASTE
CommandCount=14
Command13=ID_NEXT_PANE
Command14=ID_PREV_PANE


[ACL:IDR_MAINFRAME (English (U.S.))]
Type=1
Class=?
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_DEL_TASK
Command5=ID_DEL_RELATION
Command6=ID_STATE_TRACE
Command7=ID_STATE_MANUAL
Command8=ID_CPU
Command9=ID_EVALUATE
Command10=ID_FAULT
Command11=ID_PROPERT
Command12=ID_REPAINT
Command13=ID_VIEW_GRAPHS
Command14=ID_VIEW_PROC
Command15=ID_STATE_NORM
Command16=ID_ADD_TASKM
Command17=ID_PROPERT
Command18=ID_STEP
CommandCount=18

[DLG:IDD_ABOUTBOX (English (U.S.))]
Type=1
Class=CAboutDlg
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308480
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889

[MNU:IDR_MENU1]
Type=1
Class=?
CommandCount=0

[DLG:IDD_CHANGEVAL]
Type=1
Class=CPropDlg
ControlCount=3
Control1=IDOK,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_EDIT1,edit,1350639744

[CLS:CPropDlg]
Type=0
HeaderFile=PropDlg.h
ImplementationFile=PropDlg.cpp
BaseClass=CDialog
Filter=D
VirtualFilter=dWC
LastObject=CPropDlg

[DLG:IDD_DIALOG1]
Type=1
Class=CCpuDialog
ControlCount=10
Control1=IDOK,button,1342242816
Control2=IDCANCEL,button,1342242816
Control3=IDC_EDIT1,edit,1350639616
Control4=IDC_STATIC,static,1342308352
Control5=IDC_LIST1,listbox,1352728833
Control6=IDC_STATIC,static,1342308352
Control7=IDC_STATIC,static,1342308353
Control8=IDC_EDIT2,edit,1350631424
Control9=IDC_SPIN1,msctls_updown32,1342308514
Control10=IDC_BUTTON1,button,1342242816

[CLS:CCpuDialog]
Type=0
HeaderFile=CpuDialog.h
ImplementationFile=CpuDialog.cpp
BaseClass=CDialog
Filter=D
VirtualFilter=dWC
LastObject=CCpuDialog

[DLG:IDD_CHANGEVAL (Russian)]
Type=1
ControlCount=3
Control1=IDOK,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_EDIT1,edit,1350639744

[DLG:IDD_DIALOG1 (Russian)]
Type=1
ControlCount=10
Control1=IDOK,button,1342242816
Control2=IDCANCEL,button,1342242816
Control3=IDC_EDIT1,edit,1350639616
Control4=IDC_STATIC,static,1342308352
Control5=IDC_LIST1,listbox,1352728833
Control6=IDC_STATIC,static,1342308352
Control7=IDC_STATIC,static,1342308353
Control8=IDC_EDIT2,edit,1350631424
Control9=IDC_SPIN1,msctls_updown32,1342308514
Control10=IDC_BUTTON1,button,1342242816

[MNU:IDR_MAINFRAME (Russian)]
Type=1
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_APP_EXIT
Command5=ID_ADD_TASKM
Command6=ID_ADD_RELATION
Command7=ID_DEL_TASK
Command8=ID_DEL_RELATION
Command9=ID_PROPERT
Command10=ID_REPAINT
Command11=ID_VIEW_GRAPHS
Command12=ID_VIEW_PROC
Command13=ID_STATE_NORM
Command14=ID_STATE_TRACE
Command15=ID_STATE_MANUAL
Command16=ID_CPU
Command17=ID_EVALUATE
Command18=ID_FAULT
Command19=ID_STEP
CommandCount=19

[MNU:IDR_MENU1 (Russian)]
Type=1
CommandCount=0

