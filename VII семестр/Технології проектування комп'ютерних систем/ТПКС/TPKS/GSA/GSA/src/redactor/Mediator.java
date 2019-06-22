package redactor;

import redactor.gui.Canvas;
import redactor.gui.MainFrame;
import redactor.gui.Page;
import redactor.gui.dialogs.*;
import redactor.gui.graph.MealyContentCreator;
import redactor.gui.graph.MealyTextCreator;
import redactor.gui.graph.NewMealyFrame;
import redactor.gui.graph.marking.BinaryMarkerCreator;
import redactor.gui.graph.mimimisation.Minnimisator;
import redactor.gui.graph.mimimisation.TransitionAndMinimizatorTextCreator;
import redactor.gui.graph.mimimisation.TransitionData;
import redactor.gui.graphicalElements.Entity;
import redactor.vhdl.PreparatorForAnd3Form;
import redactor.vhdl.VHDLcreator;

import javax.swing.*;
import javax.swing.filechooser.FileFilter;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Receives messages from  selected menu items  and performs a set of required actions.
 */

public class Mediator {

    private Data data;
    private MainFrame mainFrame;
    private Canvas canvas;
    private JFileChooser chooserOpen, chooserSave;
    private NewDocumentDialog newDocumentDialog;
    private EditOperationValueDialog editOperationValueDialog;
    private EditConditionValueDialog editConditionValueDialog;
    private TextMsaBuilder textMsaBuilder;
    private MealyContentCreator mealyContentCreator;
    private MealyTextCreator mealyTextCreator;
    private BinaryMarkerCreator binaryMarkerCreator;
    private TransitionData transitionData;
    private NewMealyFrame newMealyFrame;
    private TransitionAndMinimizatorTextCreator transitionAndMinimizatorTextCreator;
    private Minnimisator minnimisator;
    private VHDLcreator vhdLcreator;

    HashMap<String, Integer> operationFilterMap;
    HashMap<String, Integer> conditionFilterMap;


    public Mediator(final MainFrame mainFrame) {
        this.mainFrame = mainFrame;
        data = new Data();
        canvas = new Canvas(this, data);
        newDocumentDialog = null;
        chooserOpen = new JFileChooser();
        chooserSave = new JFileChooser();
        textMsaBuilder = new TextMsaBuilder();


        operationFilterMap = new HashMap<String, Integer>();

        operationFilterMap.put(String.valueOf('Y'), 0);
        operationFilterMap.put(String.valueOf('y'), 0);


        for (char i = '0'; i <= '9'; i++)
            operationFilterMap.put(String.valueOf(i), 1);

        operationFilterMap.put(String.valueOf(','), 2);

        conditionFilterMap = new HashMap<String, Integer>();

        conditionFilterMap.put(String.valueOf('X'), 0);
        conditionFilterMap.put(String.valueOf('x'), 0);

        for (char i = '0'; i <= '9'; i++)
            conditionFilterMap.put(String.valueOf(i), 1);

        conditionFilterMap.put(String.valueOf(','), 2);


    }


    public void update(final Message message) {
        int result;
        switch (message.getId()) {

            case Message.exit:
                System.exit(0);
                break;

            case Message.toolBarStateChanged:
                canvas.setToolBarState(message.getToolBarState(), false);
                canvas.getData().getListOfCurrentConnection().clear();
                canvas.repaint();
                break;

	        case Message.setToolbarState: {
		        mainFrame.selectToolbarButton(message.getToolBarState());
		        break;
	        }

            case Message.newFile:
                if (newDocumentDialog == null) {
                    newDocumentDialog = new NewDocumentDialog(mainFrame, this);
                }
                newDocumentDialog.update();
                newDocumentDialog.setVisible(true);
                break;

            case Message.newDocument:
                if (canvas.getChosenEntity() != null)
                    canvas.setChosenEntity(null);

                Page page = new Page(newDocumentDialog.getWidthValue(), newDocumentDialog.getHeightValue());
                page.setGridVisible(mainFrame.isGridSelected());
                data.refresh();
                data.setPage(page);
                data.setListOfEntities(new ArrayList<Entity>());
                data.getListOfEntities().add(data.createInitialVertex(200, 30));
                data.getListOfEntities().add(data.createFinishVertex(200, 340));
                data.updateJustLoadedData();

                canvas.repaint();
                newDocumentDialog.setVisible(false);
                mainFrame.setMenuEnabled(true);

                break;

            case Message.newOperationDialog:

                editOperationValueDialog = new EditOperationValueDialog(mainFrame, this, data, canvas.getChosenEntity());
                editOperationValueDialog.buildDialog();
                editOperationValueDialog.setVisible(true);

                break;

            case Message.operationValuesUpdate:

                String line = (String) editOperationValueDialog.getComboBox().getSelectedItem();
                for (int i = 0; i < editOperationValueDialog.getListOfOperations().size(); i++) {
                    if (editOperationValueDialog.getListOfOperations().get(i).getNumber() == Integer.valueOf(line.substring(1, line.length()))
                            && testTextByFilter(String.valueOf(editOperationValueDialog.getValueOfOperation().getText()),operationFilterMap)) {
                        editOperationValueDialog.getListOfOperations().get(i).setInitialValue(String.valueOf(editOperationValueDialog.getValueOfOperation().getText()));

                    }
                }
                canvas.repaint();
                break;

            case Message.newConditionDialog:

                editConditionValueDialog = new EditConditionValueDialog(mainFrame, this, data, canvas.getChosenEntity());
                editConditionValueDialog.buildDialog();
                editConditionValueDialog.setVisible(true);

                break;

            case Message.conditionValuesUpdate:

                String line1 = (String) editConditionValueDialog.getComboBox().getSelectedItem();
                for (int i = 0; i < editConditionValueDialog.getListOfConditions().size(); i++) {
                    if (editConditionValueDialog.getListOfConditions().get(i).getNumber() == Integer.valueOf(line1.substring(1, line1.length()))
                            && testTextByFilter(editConditionValueDialog.getValueOfCondition().getText(), conditionFilterMap)) {

                        editConditionValueDialog.getListOfConditions().get(i).setInitialValue(String.valueOf(editConditionValueDialog.getValueOfCondition().getText()));


                        int newLeftOutput = Integer.valueOf(editConditionValueDialog.getLeftOutput().getText());
                        int newRightOutput = Integer.valueOf(editConditionValueDialog.getRightOutput().getText());

                        if (checkValuesOfOutputs(newLeftOutput, newRightOutput)) {
                            editConditionValueDialog.getListOfConditions().get(i).setLeftOutputValue(newLeftOutput);
                            editConditionValueDialog.getListOfConditions().get(i).setRightOutputValue(newRightOutput);
                        }


                    }
                }
                canvas.repaint();
                break;

            case Message.showMSA: {
                MsaDialog dialog = new MsaDialog(mainFrame, data.getMatrix());
                dialog.setVisible(true);

                break;
            }

            case Message.findAllCycles:
                AllCyclesDialog allCyclesDialog = new AllCyclesDialog(mainFrame, data.getCycles(), data.getEndlessCycles());
                allCyclesDialog.setVisible(true);

            case Message.findAllWays:
                AllWaysDialog allWaysDialog = new AllWaysDialog(mainFrame, data.getFullWays());
                allWaysDialog.setVisible(true);
                break;

            case Message.controlEntry: {
                JDialog dialog = new ErrorsDialog(mainFrame, data.getListOfEntities());
                dialog.setVisible(true);
                break;
            }


            case Message.saveAlgoFile:
                chooserSave.setFileFilter(new FileFilter() {
                    public boolean accept(final File f) {
                        return f.getName().toLowerCase().endsWith(".TXT") || f.getName().toLowerCase().endsWith(".txt") || f.isDirectory();
                    }

                    public String getDescription() {
                        return "TXT File";
                    }
                });
                chooserSave.setCurrentDirectory(new File("."));
                result = chooserSave.showSaveDialog(mainFrame);
                if (result == JFileChooser.APPROVE_OPTION) {
                    String path;
                    if (chooserSave.getSelectedFile().getPath().toLowerCase().endsWith(".txt")) {
                        path = chooserSave.getSelectedFile().getPath();
                    } else {
                        path = chooserSave.getSelectedFile().getPath() + ".txt";
                    }
                    //    textBuilder.writeToFile(path, data);

                    textMsaBuilder.writeToFile(path, data);
                }

                break;
            
            case Message.saveGraphFile:
                chooserSave.setFileFilter(new FileFilter() {
                    public boolean accept(final File f) {
                        return f.getName().toLowerCase().endsWith(".TXT") || f.getName().toLowerCase().endsWith(".txt") || f.isDirectory();
                    }

                    public String getDescription() {
                        return "TXT File";
                    }
                });
                chooserSave.setCurrentDirectory(new File("."));
                result = chooserSave.showSaveDialog(mainFrame);
                if (result == JFileChooser.APPROVE_OPTION) {
                    String path;
                    if (chooserSave.getSelectedFile().getPath().toLowerCase().endsWith(".txt")) {
                        path = chooserSave.getSelectedFile().getPath();
                    } else {
                        path = chooserSave.getSelectedFile().getPath() + ".txt";
                    }



                    mealyTextCreator = new MealyTextCreator(mealyContentCreator.getAutomateTable(), mealyContentCreator.getzCounter()) ;

                    try {
                        mealyTextCreator.writeToFile(path);
                    } catch (IOException e) {
                        e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
                    }
                }
                
                break;

            case Message.saveVHDL:

                chooserSave.setFileFilter(new FileFilter() {
                    public boolean accept(final File f) {
                        return f.getName().toLowerCase().endsWith(".vhd") || f.isDirectory();
                    }

                    public String getDescription() {
                        return "VHD File";
                    }
                });
                chooserSave.setCurrentDirectory(new File("."));
                result = chooserSave.showSaveDialog(mainFrame);
                if (result == JFileChooser.APPROVE_OPTION) {
                    String path;
                    if (chooserSave.getSelectedFile().getPath().toLowerCase().endsWith(".vhd")) {
                        path = chooserSave.getSelectedFile().getPath();
                    } else {
                        path = chooserSave.getSelectedFile().getPath() + ".vhd";
                    }

                    vhdLcreator = new VHDLcreator(minnimisator.getMimimisated(), transitionData.getHeader());


                    try {
                        vhdLcreator.writeToFile(path);
                    } catch (IOException e) {
                        e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
                    }
                }
                break;

            case Message.testVHDL:
                PreparatorForAnd3Form preparatorForAnd3Form = new PreparatorForAnd3Form(minnimisator.getMimimisated(), transitionData.getHeader());
                preparatorForAnd3Form.prepareNodes();
                preparatorForAnd3Form.printInfo();
                break;

            case Message.openAlgoFile:

                chooserOpen.setFileFilter(new FileFilter() {
                    public boolean accept(final File f) {
                        return f.getName().toLowerCase().endsWith(".txt") || f.isDirectory();
                    }

                    public String getDescription() {
                        return "TXT File";
                    }
                });

                chooserOpen.setCurrentDirectory(new File("."));

                result = chooserOpen.showOpenDialog(mainFrame);
                if (result == JFileChooser.APPROVE_OPTION) {
                    canvas.setChosenEntity(null);

                    TextMsaBuilder textMsaBuilder1 = new TextMsaBuilder();
                    textMsaBuilder1.restoreListOfEntities(chooserOpen.getSelectedFile().getPath(), data);
                    textMsaBuilder1.restoreLinks(chooserOpen.getSelectedFile().getPath(), data);

                    data.updateJustLoadedData();
                    data.getPage().setGridVisible(mainFrame.isGridSelected());
                    mainFrame.setMenuEnabled(true);
                    canvas.repaint();
                }
                break;

            case Message.openGraphFile:


                chooserOpen.setFileFilter(new FileFilter() {
                    public boolean accept(final File f) {
                        return f.getName().toLowerCase().endsWith(".txt") || f.isDirectory();
                    }

                    public String getDescription() {
                        return "TXT File";
                    }
                });

                chooserOpen.setCurrentDirectory(new File("."));

                result = chooserOpen.showOpenDialog(mainFrame);
                if (result == JFileChooser.APPROVE_OPTION) {
                    canvas.setChosenEntity(null);

                    List<String[]> ways = new ArrayList<String[]>();
                    int zCounter = 0;
                    ArrayList<Integer[]> markers = new ArrayList<Integer[]>();
                    
                    if (mealyTextCreator ==  null)
                        mealyTextCreator = new MealyTextCreator() ;

                    try {
                      zCounter = mealyTextCreator.readFromFile(chooserOpen.getSelectedFile().getPath(), ways, zCounter, markers);

                        System.out.println("read graph OK!");
                        for (int i = 0; i<markers.size(); i++){
                            System.out.print("Z"+markers.get(i)[0] + " ---> " + markers.get(i)[1]);
                        }


                    } catch (IOException e) {
                        e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
                    } catch (ClassNotFoundException e) {
                        e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
                    }



                    
                    NewMealyFrame mealyFrame = new NewMealyFrame(ways,this, zCounter - 1, null) ;
                    mealyFrame.setVisible(true);
                   
                }
                break;

            case Message.showGraph:

                mealyContentCreator = new MealyContentCreator(data);
                MealyDialog mealyDialog = new MealyDialog(mainFrame, mealyContentCreator);
                mealyDialog.setVisible(true);

                mealyContentCreator.fillAutomateTable();

         //       mealyContentCreator.printAutomateTable();
                binaryMarkerCreator = new
                        BinaryMarkerCreator(mealyContentCreator.getAutomateTable(), mealyContentCreator.getzCounter()) ;
                
                binaryMarkerCreator.useCreateMarking();


                transitionData = new TransitionData(binaryMarkerCreator.generateTransitionTable(),
                        binaryMarkerCreator.getSizeOfMarking());

                minnimisator = new Minnimisator(transitionData,
                        binaryMarkerCreator.getSizeOfMarking());
                minnimisator.executeMimimisation();

            //    transitionData.generateTriggerStates();
           //     transitionData.fillStateTable();

                 newMealyFrame = new NewMealyFrame(mealyContentCreator.getAutomateTable(),this,
                        mealyContentCreator.getzCounter()-1, transitionData);
                newMealyFrame.setVisible(true);



                break;

            case Message.showTransTable:

                MimimisationAndStructureDialog mimimisationAndStructureDialog = new MimimisationAndStructureDialog(newMealyFrame, transitionData, minnimisator.getMimimisated() );
                mimimisationAndStructureDialog.setVisible(true);



                break;

            case Message.saveTransTable:

                chooserSave.setFileFilter(new FileFilter() {
                    public boolean accept(final File f) {
                        return f.getName().toLowerCase().endsWith(".TXT") || f.getName().toLowerCase().endsWith(".txt") || f.isDirectory();
                    }

                    public String getDescription() {
                        return "TXT File";
                    }
                });
                chooserSave.setCurrentDirectory(new File("."));
                result = chooserSave.showSaveDialog(newMealyFrame);
                if (result == JFileChooser.APPROVE_OPTION) {
                    String path;
                    if (chooserSave.getSelectedFile().getPath().toLowerCase().endsWith(".txt")) {
                        path = chooserSave.getSelectedFile().getPath();
                    } else {
                        path = chooserSave.getSelectedFile().getPath() + ".txt";
                    }
                    //    textBuilder.writeToFile(path, data);
                    transitionAndMinimizatorTextCreator = new TransitionAndMinimizatorTextCreator(transitionData, minnimisator.getMimimisated());
                    transitionAndMinimizatorTextCreator.writeToFile(path);
                }

                break;

        }
    }

    public boolean testTextByFilter(String text, HashMap<String,Integer> filterMap) {

       int ytest = 0;
        String currentSymbol = "";


        for (int i = 0; i < text.length(); i++) {

            currentSymbol = text.substring(i, i + 1);

            if (!filterMap.containsKey(currentSymbol)) {
                System.out.println("bad content");
                return false;
            }

            if ((filterMap.get(currentSymbol) == 0) && (ytest != 0)) {
                System.out.println("wrong symbol " + text.substring(i, i + 1));
                return false;
            }

            if ((filterMap.get(currentSymbol) == 0) && (ytest == 0)) {
                ytest = 1;
            }

            if ((filterMap.get(currentSymbol) == 1) && (ytest != 0)) {
                ytest = 2;
            }

            if ((filterMap.get(currentSymbol) == 1) && (ytest == 0)) {
                System.out.println("unexpected number " + text.substring(i, i + 1));
                return false;
            }

            if ((filterMap.get(currentSymbol) == 2) && (ytest == 0)) {
                System.out.println("unexpected ','");
                return false;
            }

            if ((filterMap.get(currentSymbol) == 2) && (ytest == 2)) {
                ytest = 0;
            }


        }

        if (ytest == 2) {
            System.out.println("OK");
            return true;
        }

        return false;


    }

     public boolean checkValuesOfOutputs(int left, int right) {
        return ((((left == 0) || (left == 1)) && ((right == 0) || (right == 1))) && (left != right));

    }


    public Canvas getCanvas() {
        return canvas;
    }
}
