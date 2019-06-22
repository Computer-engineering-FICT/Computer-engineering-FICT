package redactor;

/**
 * Creates simple messages that are used for method mediator.updateJustLoadedData(message).
 */
public class Message {

    private int id;
    private int toolBarState;

    public static final int toolBarStateChanged = 1;	//MainFrame
    public static final int newFile = 2;					//MainFrame
    public static final int openAlgoFile = 3;				//MainFrame
    public static final int openGraphFile = 4;				//MainFrame
    public static final int saveAlgoFile = 5;				//MainFrame
    public static final int saveGraphFile = 6;				//MainFrame
    public static final int exit = 7;	                    //MainFrame
    public static final int controlEntry = 10;				//MainFrame
    public static final int findEndlessCycles = 11;			//MainFrame
    public static final int showMSA = 12;				    //MainFrame
    public static final int findAllWays = 13;				//MainFrame
    public static final int findAllCycles = 14;				//MainFrame
    public static final int showGraph = 15; 	            //MainFrame
    public static final int showGrid = 16; 	            //MainFrame
    public static final int about = 17;
    public static final int newDocument = 18;
    public static final int newOperationDialog = 19;
    public static final int operationValuesUpdate = 20;
    public static final int conditionValuesUpdate = 21;
    public static final int newConditionDialog = 22;
    public static final int saveMsaId = 23;
	public static final int setToolbarState = 24;
    public static final int showTransTable =  30;
    public static final int saveTransTable = 31;
    public static final int saveVHDL = 32;
    public static final int testVHDL = 33;


	public int getToolBarState() {
        return toolBarState;
    }
    public void setToolBarState(final int toolBarState) {
        this.toolBarState = toolBarState;
    }
    public int getId() {
        return id;
    }
    public Message (final int id) {
        this.id = id;
    }


}
