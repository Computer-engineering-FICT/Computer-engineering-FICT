package edu.editor.typetable;

import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.ArrayList;

import javax.swing.DefaultCellEditor;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.TableModel;

import edu.editor.algorithm.model.AlgorithmModel;
import edu.editor.algorithm.parser.operand.Variable;


public class TypeFrame extends JDialog{
	private static final long serialVersionUID = -2745770517469828858L;
	static String [][] data;
	String [] colNames = {"Name","Type"};
	JTable table;
	JButton add = new JButton("Add");
	JButton ok = new JButton("Ok");
	AlgorithmModel model;
	
	public static enum TypesColumn 			{View, 			Pascal, 	Java, 	 Cpp};
									//----------------|-----------|----------|-------
	public static String[][] types = {	{"Целое",		"integer",	"int",     "int"},
										{"Дробное",		"real",		"double",  "double"},
										{"Сивол",		"char",		"char",	   "char"},
										{"Строка",		"string",	"String",  "String"},
										{"Логическое",	"boolean",	"boolean", "bool"}
		};
    //ArrayList<Variable> getVariables();
	public TypeFrame(final AlgorithmModel model){
        /*types[0][0] = "Целое";
        types[1][0] = "Дробное";
        types[2][0] = "Сивол";
        types[3][0] = "Строка";
        types[4][0] = "Логическое";*/
		this.model = model;
		ArrayList<Variable> var = model.getVariables();
        data = null; // todo "костыль" {кажется, не на логичном месте} (для того, чтобы не было ошибки при последующей генерации без переменных)
//		System.out.println(var.size());
        if (!var.isEmpty()) {
            initializeData(var); //todo "костыль?"2 :)

            setModal(true);
            setDefaultCloseOperation(HIDE_ON_CLOSE);

            setBounds(100,100,200,400);

            table = new JTable(data,colNames);
            final JScrollPane pane = new JScrollPane(table);
            pane.getViewport().add(table, null);

            JComboBox comboBox = new JComboBox();
            /*comboBox.addItem("integer");
            comboBox.addItem("byte");
            comboBox.addItem("real");
            comboBox.addItem("char");
            comboBox.addItem("string");
            comboBox.addItem("boolean");*/
            /*comboBox.addItem("Целое число");
            comboBox.addItem("Дробное число");
            comboBox.addItem("Сивол");
            comboBox.addItem("Строка");
            comboBox.addItem("Истина/ложь");*/
            for (String[] type : types) {
                comboBox.addItem(type[0]);
            }
            table.getColumnModel().getColumn(1).setCellEditor(new DefaultCellEditor(comboBox));

            getContentPane().add("Center",pane);

            ok.addMouseListener(new MouseAdapter(){
                public void mouseClicked(MouseEvent arg0) {
                    ArrayList<Variable> originalVariables = model.getVariables();
                    String[][] newData = new String[originalVariables.size()][table.getColumnCount()];
                    for (int i=0; i<originalVariables.size();i++){
                        newData[i][0] = originalVariables.get(i).getValue();
                        newData[i][1] = getTypeFromNormalizedNameTable(newData[i][0]);
                    }
                    for (int i=originalVariables.size(); i<table.getRowCount();i++){
                        for (int j=0; j<table.getColumnCount();j++){
                            newData[i][j] = (String) table.getModel().getValueAt(i, j);
                        }
                    }
                    data = newData;
                    setVisible(false);
                }

                private String getTypeFromNormalizedNameTable(String originalName) {
                    return (String) table.getModel().getValueAt(getNormalizedNameIndex(originalName), 1);
                }

                private int getNormalizedNameIndex(String originalName) {
                    TableModel tableModel = table.getModel();
                    String normalizedName = normalizeVariableName(originalName);
                    for (int i = 0; i < tableModel.getRowCount(); i++) {
                        if (tableModel.getValueAt(i,0).equals(normalizedName))
                            return i;
                    }
                    return -1;
                }
            });

            //todo addButton can make damage to program logic? (information "where create variable" is absent)
            add.addMouseListener(new MouseAdapter(){
                public void mouseClicked(MouseEvent arg0) {
                    data = new String[table.getRowCount()+1][table.getColumnCount()];
                    for (int i=0; i<table.getRowCount();i++){
                        for (int j=0; j<table.getColumnCount();j++){
                            data[i][j] = (String) table.getModel().getValueAt(i, j);
                        }
                    }
                    data[table.getRowCount()][1] = "";
                    table = new JTable(data,colNames);
                    JComboBox comboBox = new JComboBox();
                    for (String[] type : types) {
                        comboBox.addItem(type[0]);
                    }
                    table.getColumnModel().getColumn(1).setCellEditor(new DefaultCellEditor(comboBox));
                    pane.getViewport().add(table, null);
                }
            });

            getContentPane().add("South",ok);
            getContentPane().add("North",add);
            setVisible(true);
        }
	}

    private void initializeData(ArrayList<Variable> originalVariableList) {
        ArrayList<String> normalizedVariableNameList = getNormalizedVariableNameList(originalVariableList);
        data = new String[normalizedVariableNameList.size()][2];
        for (int i=0; i<normalizedVariableNameList.size(); i++){
            data[i][0] = normalizedVariableNameList.get(i);
//                data[i][1] = "<select_type>";
            data[i][1] = "Целое";
        }
    }

    private ArrayList<String> getNormalizedVariableNameList(ArrayList<Variable> originalVariableList) {
        ArrayList<String> normalizedVariableList = new ArrayList<String>();
        for (Variable variable : originalVariableList) {
            String normalizedVariableName = normalizeVariableName(variable.getValue());
            if (!normalizedVariableList.contains(normalizedVariableName))
                normalizedVariableList.add(normalizedVariableName);
        }
        return normalizedVariableList;
    }

    public static String normalizeVariableName(String value) {
        String normalizedVariableName = value.replaceAll(" ", "");
        if (value.contains("[")) {
            normalizedVariableName = normalizedVariableName.substring(0, value.indexOf('[')) + "[]";
        }
        return normalizedVariableName;
    }

    public String[][] getVars(TypesColumn column){
        if (data != null) {
            localize(column);
        }
		return data;
	}

	private void localize(/*String[][] data, */TypesColumn typesColumn) {
		for (String[] varAndType : data ) {
			int i = 0;
			for (; i < types.length && !types[i][0].equals(varAndType[1]); i++);

			varAndType[1] = types[i][typesColumn.ordinal()];
		}
		//return data;
	}
	
}
