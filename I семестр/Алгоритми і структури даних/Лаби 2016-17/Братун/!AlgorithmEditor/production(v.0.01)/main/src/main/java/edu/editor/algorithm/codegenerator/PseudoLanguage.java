package edu.editor.algorithm.codegenerator;

//import java.awt.Color;
//import java.io.BufferedReader;
import edu.editor.algorithm.checker.SimpleChecker;
import edu.editor.algorithm.language.CppTranslator;
import edu.editor.algorithm.language.JavaTranslator;
import edu.editor.algorithm.language.PascalTranslator;
import edu.editor.algorithm.language.Translator;
import edu.editor.algorithm.model.AlgorithmModel;
import edu.editor.algorithm.model.component.AbstractComponent;
import edu.editor.algorithm.model.component.block.*;
import edu.editor.algorithm.parser.StatementParser;
import edu.editor.typetable.TypeFrame;
import org.knowm.xchart.Chart;
import org.knowm.xchart.SwingWrapper;

import javax.swing.*;
import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

//import java.io.InputStream;
//import java.io.InputStreamReader;
//import java.util.Arrays;
//import edu.editor.algorithm.language.IntLanguage;
//import edu.editor.algorithm.model.component.block.InputOutput;

/**
 * Игра ума. Класс предназначен для отработки последовательности генерации строк кода
 * (обхода ГСА).
 *  	
 */

public class PseudoLanguage {
    private boolean debugMode = false;

    enum Language { Cpp, Pascal, Assembler, Java}

    private static final Map<Language, String> languageWithSourceFileNameExtensionMap = new HashMap<Language, String>()
    {{
        put(Language.Cpp, "cpp");
        put(Language.Pascal, "pas");
        put(Language.Assembler, "asm");
        put(Language.Java, "java");
    }};
    private static final Map<Language , String> languageWithFolderNameMap = new HashMap<Language, String>() {{
        put(Language.Cpp, "cpp");
        put(Language.Pascal, "pascal");
        put(Language.Assembler, "asm");
        put(Language.Java, "java");
    }};

    private int maxArrayElementQuantity = 10000;
    private int measurementsQuantity = 10;

	private AlgorithmModel model;
	//private IntLanguage language;
	private Translator translator;

    private JTextArea jTextArea;
//    private HashMap<String, String> classMap;
    private String [][] ScannerMethodTypes = {
            {"String ", "Line"},
            {"int ", "Int"},
            {"double ", "Double"},
            {"char ", "Line"}, //possible: {"char", ""},
            {"boolean ", "Boolean"}
    };
    private Map<String, String> ScannerMethodTypesMap;
    private boolean isScannerCreatedInMethod;
    private String firstInsertionInMethodBody = "";
    private boolean isBlockContainingArray; //todo for what it is?! (answered, no?)

    public PseudoLanguage(AlgorithmModel model/*, IntLanguage language*/,Translator translator){
		this.model = model;
		//this.language = language;
		this.translator = translator;
        ScannerMethodTypesMap = new HashMap<String, String>();
        for(String[] strings : ScannerMethodTypes)
        {
            ScannerMethodTypesMap.put(strings[0], strings[1]);
        }
	}

    /*public Translator getTranslator() {
        return translator;
    }*/

    public void generate(){
		if (translator instanceof PascalTranslator) {
			generatePascal();
		} else {
            if (translator instanceof CppTranslator) {
                generateCpp();
            } else {
                if (translator instanceof JavaTranslator) {
                    generateJava();
                } else {
                    generateAssembler();
                }
            }
		}
	}

    private void generateCpp() {
        initializeCppProgramText();
        createCppProgramFrame();
    }

    private void initializeCppProgramText() {
        StatementParser parser = new StatementParser(model);
        parser.parseModel();
        TypeFrame f = new TypeFrame(model);
        var = f.getVars(TypeFrame.TypesColumn.Cpp);

        ArrayList<AbstractComponent> comp = model.getComponents();
        AbstractBlock beg = null;

        for (int i=0;i<comp.size();i++){
            if ((comp.get(i) instanceof Begin) || (comp.get(i) instanceof BeginActivity)) {
                beg = (AbstractBlock) comp.get(i);
                break;
            }
        }

        String mainMethodBody = step(beg.getOutputConnection(),null,1);

        programText = "#include <iostream>\n" +
                (doStartAndStopTimerBlocksExist() ? "#include <windows.h>\n" : "") +
                "\n" +
                "using namespace std;\n" +
                "\n" +
                "int main (int argc, char *argv[])\n" +
                "{\n" + firstInsertionInMethodBody + mainMethodBody +
                "    return 0;\n" +
                "}";

        firstInsertionInMethodBody = "";
    }

    /*private void createCppSourceProgram() throws IOException {
        programText = jTextArea.getText();
        FileWriter fw = new FileWriter(new File("data\\cpp\\result\\program.cpp"));
        BufferedWriter bw = new BufferedWriter(fw);
        bw.write(jTextArea.getText());
        bw.close();
    }*/

    /*private void writeSourceProgramFiles() throws IOException {
//        programText = jTextArea.getText();
        String languageFolderName;
        if ("C++".equals(currentLanguage)) {
            languageFolderName = "cpp";
        } else {
            languageFolderName = "";
        }
        FileWriter fw = new FileWriter(new File("data\\" + languageFolderName + "\\result\\program.cpp"));
        BufferedWriter bw = new BufferedWriter(fw);
        bw.write(jTextArea.getText());
        bw.close();
    }*/

    private void writeSourceProgramFiles(Language currentLanguage) throws IOException {
        if (currentLanguage != Language.Java) {
            FileWriter fw = new FileWriter("data\\" + languageWithFolderNameMap.get(currentLanguage) +
                    "\\result\\program." + languageWithSourceFileNameExtensionMap.get(currentLanguage));
            BufferedWriter bw = new BufferedWriter(fw);
            if (jTextArea != null) {
                bw.write(jTextArea.getText());
            } else {
                bw.write(programText);
            }
            bw.close();
        } else { //Java
            /*
            * !todo: work only if:
            *  1) all of classes or interfaces a public
            *  2) no string "public class "+<class_name> in the diagram
            *  3) no classes will be added, deleted (+name changed) just by programFrame
            * */
            for (String className : classNames){
                int startClassText = programText.indexOf("public class " + className);
                if (startClassText == -1) {
                    startClassText = programText.indexOf("public interface " + className);
                }

                int startNextClassText = programText.indexOf("public class ", startClassText+1);
                int startNextInterfaceText = programText.indexOf("public interface ", startClassText+1);
                int endClassText;

                if (startNextClassText != -1 && startNextInterfaceText != -1) {
                    endClassText = Math.min(startNextClassText, startNextInterfaceText);
                } else {
                    endClassText = Math.max(startNextClassText, startNextInterfaceText);
                }

                String classText;
                if (endClassText != -1) {
                    classText = programText.substring(startClassText, endClassText);
                } else {
                    classText = programText.substring(startClassText);
                }
                createClassFile(className, classText);
            }
        }
    }

    private void createCppProgramFrame() {
        JFrame textFrame = new JFrame("C++ Program");
        textFrame.setBounds(200, 300, 450, 250);
        jTextArea = new JTextArea(programText);
        JScrollPane jsp = new JScrollPane(jTextArea);
        JButton runButt = new JButton("Run");
        runButtonConfig(runButt, Language.Cpp);
        /*runButt.addActionListener(e -> {
            try {
//                createCppSourceProgram();
                writeSourceProgramFiles();
                new ProcessBuilder("cmd", "/c","start",
                        "data\\cpp\\" + (debugMode ? "debug" : "release") + ".bat").start();
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        });*/
        textFrame.getContentPane().add("South",runButt);

        /*todo !ASD tmp
        JButton testButton = new JButton("Test");
        testButton.addActionListener(e -> {
            try {
//                createCppSourceProgram();
                writeSourceProgramFiles(Language.Cpp);
                *//*programText = jTextArea.getText();
                FileWriter fw = new FileWriter(new File("data\\cpp\\result\\program.cpp"));
                BufferedWriter bw = new BufferedWriter(fw);
                bw.write(jTextArea.getText());
                bw.close();*//*

                //get console result
                Runtime rt = Runtime.getRuntime();
                Process proc = rt.exec("data\\cpp\\test.bat");

                BufferedReader stdInput = new BufferedReader(new
                        InputStreamReader(proc.getInputStream()));

                System.out.println("Here is the time test result:\n");
                String s;
                ArrayList<Number> measureList = new ArrayList<>();
                String keySubString = "Time: ";
                while ((s = stdInput.readLine()) != null) {
                    if (s.contains(keySubString)) {
                        System.out.println(s.substring(s.indexOf(keySubString) + keySubString.length()));
                        measureList.add(Integer.parseInt(s.substring(s.indexOf(keySubString) + keySubString.length())));
                    }
                }

                ArrayList<Number> naturalNumberList = new ArrayList<>();
                for (int i = 0; i < measurementsQuantity; i++) {
                    naturalNumberList.add(i);
                }
                // Create Chart
                Chart chart = QuickChart.getChart("Sample Chart", "X", "Y", "y(x)", naturalNumberList, measureList);

                // Show it
                new SwingWrapper(chart).displayChart();

                *//*new ProcessBuilder("cmd", "/c","start",
                        "data\\cpp\\" + (debugMode ? "debug" : "release") + ".bat").start();*//*

            } catch (IOException e1) {
                e1.printStackTrace();
            }
        });
        textFrame.getContentPane().add("East", testButton);*/

        textFrame.getContentPane().add(jsp);
        textFrame.setVisible(true);
    }

    private void generateAssembler() {

        programText = "DATA SECTION\r\n" +
                ";\r\n" +
                "KEEP DD 0               ;temporary place to keep things\r\n" +
                ";\r\n" +
                "CODE SECTION\r\n" +
                ";\r\n" +
                "START:\r\n" +
                "PUSH -11                ;STD_OUTPUT_HANDLE\r\n" +
                "CALL GetStdHandle       ;get, in eax, handle to active screen buffer\r\n" +
                "PUSH 0,ADDR KEEP        ;KEEP receives output from API\r\n";

        ArrayList<AbstractComponent> comp = model.getComponents();
        AbstractBlock beg = null;

        for (int i=0;i<comp.size();i++){
            if ((comp.get(i) instanceof Begin) || (comp.get(i) instanceof BeginActivity)) {
                beg = (AbstractBlock) comp.get(i);
                break;
            }
        }

        StatementParser parser = new StatementParser(model);
        parser.parseModel();
        programText += step(beg.getOutputConnection(),null,0);

        programText += "PUSH EAX                ;handle to active screen buffer\r\n" +
                "CALL WriteFile\r\n" +
                "XOR EAX,EAX             ;return eax=0 as preferred by Windows\r\n" +
                "RET";

        createAssemblerProgramFrame();
    }

    ArrayList<String> classNames = new ArrayList<String>();
	String mainClassName;
    String programText;
	
	private void generateJava() {
        initializeJavaProgramText();
        createJavaProgramFrame();
	}

    private void initializeJavaProgramText() {
        StatementParser parser = new StatementParser(model);
//        model.firstVariablesAppearanceMap = new HashMap<AbstractBlock, ArrayList<String>>();
        parser.parseModel();
        TypeFrame f = new TypeFrame(model);
        var = f.getVars(TypeFrame.TypesColumn.Java);
        programText = "";
//        classMap = new HashMap<String, String>();

        ArrayList<AbstractComponent> comp = model.getComponents();

        if (classBlockExists()) {
            Iterator<AbstractComponent> iterator = comp.iterator();
            AbstractComponent component;
            while (iterator.hasNext()){
                component = iterator.next();
                if (component instanceof ClassBlock){
                    String classText = "";
                    ClassBlock currentClassBlock = (ClassBlock) component;
                    Connection outputConnection = currentClassBlock.getOutputConnection();
                    String relations = "";
                    if (outputConnection != null) {
                        ClassBlock parentBlock = (ClassBlock) outputConnection.getEndBlock();
                        if (parentBlock instanceof InterfaceBlock) {
                            relations += " implements " + parentBlock.getValue();
                        } else {
                            relations += " extends " + parentBlock.getValue();
                        }
                    }

                    String className = currentClassBlock.getValue();
                    classNames.add(className);

                    String classType = " ";
                    if (currentClassBlock instanceof InterfaceBlock) {
                        classType += "interface ";
                    } else {
                        classType += "class ";
                        if (currentClassBlock instanceof AbstractClassBlock) {
                            classType = " abstract" + classType;
                        }
                    }

                    classText += "public" + classType + className + relations + " {\n";
                    //class fields
                    String[] fieldStrings = currentClassBlock.getFields().split("\\n");
                    String fieldString;
                    if (fieldStrings.length != 1 || !fieldStrings[0].equals("")) {
                        for (int i = 0; i < fieldStrings.length; i++) {
                            classText += getTabs(1);

                            fieldString = fieldStrings[i];

                            //visibility
                            if (fieldString.contains("+")){
                                classText += "public ";
                            } else {
                                if (fieldString.contains("-")) {
                                    classText += "private ";
                                }
                            }

                            //static
                            if (fieldString.contains("#")){
                                classText += "static ";
                            }

                            fieldString = fieldString.substring(fieldString.indexOf(' ')+1);
                            //name and type
                            classText += fieldString.substring(fieldString.indexOf(": ")+2) + " " + fieldString.substring(0, fieldString.indexOf(": ")-1) + ";\n";

                            //TODO multi-fields
                        }
                    }


                    //class methods
                    String[] methodStrings = currentClassBlock.getMethods().split("\\n");
                    if (methodStrings.length > 1 || !methodStrings[0].equals("")){ // if methods exist
                        String methodString;
                        for (int j = 0; j < methodStrings.length; j++) {
                            methodString = methodStrings[j];

                            classText += "    ";
                            //visibility
                            if (methodString.contains("+")){
                                classText += "public ";
                            } else {
                                if (methodString.contains("-")) {
                                    classText += "private ";
                                }
                            }

                            //static
                            if (methodString.contains("#")){
                                classText += "static ";
                            }

                            //method's name
                            String methodName = methodString.substring(methodString.indexOf(' ')+1, methodString.indexOf('('));
                            if (methodName.indexOf(' ') == methodName.length()-1){
                                methodName = methodName.substring(0, methodName.length()-1);
                            }

                            if (methodName.equals("main")) {
                                mainClassName = className;
                            }

                            //type
                            if (!methodString.contains(":")){
                                //TODO constructor (not "void")
                                if (!methodName.equals(className)){
                                    classText += "void ";
                                }
                                classText += methodString.substring(methodString.indexOf(' ')+1);
                            } else {
                                String typeString = methodString.substring(methodString.indexOf(':')+2); //without space after ':'
                                classText += typeString + ' ' + methodString.substring(methodString.indexOf(' ')+1, methodString.indexOf(':'));
                            }

                            //method's body
                            Begin beg = null;

                            for (int i=0;i<comp.size();i++){
                                if (comp.get(i) instanceof Begin &&
                                        ((AbstractBlock)comp.get(i)).getValue().equals(methodName)) {
                                    beg = (Begin) comp.get(i);
                                    break;
                                }
                            }
                            isScannerCreatedInMethod = false;
                            String methodBody = step(beg.getOutputConnection(),null,2);
                            classText+=" {\n    " + firstInsertionInMethodBody + /*"\n" +*/ methodBody; //!todo null is Ok?

                            classText += "    }\n";
                        }
                    }

                    classText += "}\n";

                    /*//file creature
                    createClassFile(className,classText);*/
//                    classMap.put(className, classText);

                    programText += classText + "\n";
                }
            }
        } else { // (!classBlockExists())

            String className = "A";
            classNames.add(className);
            mainClassName = className;

            programText += "public class " + className + " {\n";

            //class methods
            programText += "    public static void main (String[] args)";

            //method's body
            AbstractBlock beg = null;

            for (int i=0;i<comp.size();i++){
                if ((comp.get(i) instanceof Begin) || (comp.get(i) instanceof BeginActivity)) {
                    beg = (AbstractBlock) comp.get(i);
                    break;
                }
            }

            isScannerCreatedInMethod = false;

            String methodBody = step(beg.getOutputConnection(),null,2);

            programText+=" {\n" + firstInsertionInMethodBody + /*"\n" +*/ methodBody;

            programText += "    }\n";

            programText += "}\n";


            /*//file creature
            createClassFile(className,programText); // program = one class*/
//            classMap.put(className,programText);
        }

        firstInsertionInMethodBody = "";
    }

    private void createJavaProgramFrame() {
        JFrame textFrame = new JFrame("Java Program");
        textFrame.setBounds(200, 300, 450, 250);
        jTextArea = new JTextArea(programText);
        //jTextArea.setEditable(false);
        JScrollPane jsp = new JScrollPane(jTextArea);
        JButton runButt = new JButton("Run");
        runButt.addActionListener(e -> {
            try {
                //new ProcessBuilder("cmd", "/c","start", "data\\java\\rm.bat").start();
                programText = jTextArea.getText();
                writeSourceProgramFiles(Language.Java);
                FileWriter fw = new FileWriter(new File("data\\java\\exec.bat"));
                BufferedWriter bw = new BufferedWriter(fw);
//					String fileText = "del *.class\n"*/;
                String fileText = "cd data\\java\\result\\\n" +
                        "del *.class\n";
                for (int i = 0; i < classNames.size(); i++) {
                    fileText += "javac " + classNames.get(i) + ".java\n";
                }
                if (!debugMode) {
                    fileText += "cls\n";
                }
                if (mainClassName != null) {
                    fileText += "java -classpath . " + mainClassName + "\n";
                }
                fileText += "pause\n";
                fileText += "exit";
                bw.write(fileText);
                bw.close();
                new ProcessBuilder("cmd", "/c","start", "data\\java\\exec.bat").start();

                /*fw = new FileWriter(new File("data\\java\\rm.bat"));
                bw = new BufferedWriter(fw);
                fileText = "cd data\\java\\result\n" +
                        "rm *\n" +
                        "exit";
                *//*for (int i = 0; i < classNames.size(); i++) {
                    fileText += classNames.get(i) + ".java, " + classNames.get(i) + ".class, ";
                }
                fileText += "\n" + "exit";*//*
                bw.write(fileText);
                bw.close();*/
            } catch (IOException e1) {
                e1.printStackTrace();
            }

        });
        textFrame.getContentPane().add("South",runButt);
        textFrame.getContentPane().add(jsp);
        textFrame.setVisible(true);
    }

    private void runButtonConfig(JButton runButton, Language currentLanguage) {
        runButton.addActionListener(e -> {
            try {
//                String languageFolderName = languageWithFolderNameMap.get(currentLanguage);
                /*if (currentLanguage == Language.Assembler) {
                    sourceFileNameExtension = "asm";
                    languageFolderName = sourceFileNameExtension;
                } else {
                    if (currentLanguage == Language.Cpp) {
                        sourceFileNameExtension = "cpp";
                        languageFolderName = sourceFileNameExtension;
                    } else { //Language.Pascal
                        sourceFileNameExtension = "pas";
                        languageFolderName = "pascal";
                    }
                }*/
                /*FileWriter fw = new FileWriter(new File("data\\" + languageFolderName + "\\result\\program." +
                        sourceFileNameExtension));
                BufferedWriter bw = new BufferedWriter(fw);
                bw.write(jTextArea.getText());
                bw.close();*/
                writeSourceProgramFiles(currentLanguage);

                new ProcessBuilder("cmd", "/c","start", "data\\" + languageWithFolderNameMap.get(currentLanguage) + "\\"
                        + (debugMode ? "debug" : "release") + ".bat").start();
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        });
        /*String[] args = new String[3];
                    args[0] = "cmd";
                    args[1] = "/c";
                    File file = null;
                    if ((file = new File("1.exe")).exists()) {
                        file.delete();
                    }
                    Runtime runtime = Runtime.getRuntime();
                    args[2] = "bpc 1";
                    runtime = Runtime.getRuntime();
                    Process process = runtime.exec(args);
                    InputStream is = process.getInputStream();
                    InputStreamReader isr = new InputStreamReader(is);
                    BufferedReader br = new BufferedReader(isr);
                    String line;
                    System.out.printf("Output of running %s is:\n",
                            Arrays.toString(args));
                    while ((line = br.readLine()) != null) {
                        System.out.println(line);
                    }
                    args[2] = "1";
                    process = runtime.exec(args);
                    is = process.getInputStream();
                    isr = new InputStreamReader(is);
                    br = new BufferedReader(isr);
                    System.out.printf("Output of running " + file + ":\n");
                    boolean flag = false;
                    String outStr = "";
                    while ((line = br.readLine()) != null) {
                        System.out.println(line);
                        outStr += line + "\n";
                        flag = true;
                    }
                    if (flag) {
                          JFrame outFrame = new JFrame("Out");
                        outFrame.setBounds(450, 300, 200, 150);
                        JTextArea jOutArea = new JTextArea(outStr);
                        jOutArea.setBackground(Color.BLACK);
                        jOutArea.setForeground(Color.WHITE);
                        JScrollPane jOutSP = new JScrollPane(jOutArea);
                        outFrame.add(jOutSP);
                        outFrame.setVisible(true);
                    }*/
    }

    private void createAssemblerProgramFrame() {
        JFrame textFrame = new JFrame("Assembler Program");
        textFrame.setBounds(200, 300, 450, 250);
        jTextArea = new JTextArea(programText);
        //jTextArea.setEditable(false);
        JScrollPane jsp = new JScrollPane(jTextArea);
        JButton runButton = new JButton("Run");
        /*String sourceFileName = "data\\asm\\result\\program.asm";
        String languageFolderName = "asm";*/
        runButtonConfig(runButton, Language.Assembler);
        textFrame.getContentPane().add("South",runButton);
        textFrame.getContentPane().add(jsp);
        textFrame.setVisible(true);
    }

    private void createClassFile(String className, String classText) {
        try {
            FileWriter fw = new FileWriter(new File("data\\java\\result\\" + className + ".java"));
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write(classText);
            bw.close();
        } catch (IOException e1) {
            e1.printStackTrace();
        }
    }


    private boolean classBlockExists() {
        for (AbstractComponent component : model.getComponents())
            if (component instanceof ClassBlock)
                return true;
        return false;
    }

    String[][] var;

    private ArrayList<String> getNormalizedVariableNameList() {
        ArrayList<String> normalizedVariableList = new ArrayList<String>();
        for (String[] variableNameAndType : var) {
            String normalizedVariableName = TypeFrame.normalizeVariableName(variableNameAndType[0]);
            if (!normalizedVariableList.contains(normalizedVariableName))
                normalizedVariableList.add(normalizedVariableName);
        }
        return normalizedVariableList;
    }

    private int getNormalizedNameIndexInVar(String normalizedName) {
        for (int i = 0; i < var.length; i++) {
            if (TypeFrame.normalizeVariableName(var[i][0]).equals(normalizedName))
                return i;
        }
        return -1;
    }

    private boolean doStartAndStopTimerBlocksExist() {
        ArrayList<AbstractComponent> components = model.getComponents();
        AbstractComponent component;
        boolean doesStartBlockExist = false;
        boolean doesStopBlockExist = false;
        for (int i = 0; i < components.size() && !(doesStartBlockExist && doesStopBlockExist); i++) {
            component = components.get(i);
            if (component instanceof StartTimerBlock) {
                doesStartBlockExist = true;
            } else {
                if (component instanceof StopTimerBlock) {
                    doesStopBlockExist = true;
                }
            }
        }

        if (doesStartBlockExist && doesStopBlockExist) {
            return true;
        }
        return false;
    }

    private void generatePascal() {
		if (SimpleChecker.check(model)){
            initializePascalProgramText();
			JFrame textFrame = new JFrame("Pascal Program");
			textFrame.setBounds(200, 300, 250, 350);
			jTextArea = new JTextArea(programText);
			JScrollPane jsp = new JScrollPane(jTextArea);
			JButton runButton = new JButton("Run");
//            String sourceFileName = "data\\asm\\result\\program.pas";
            runButtonConfig(runButton, Language.Pascal);
			/*runButt.addActionListener(e -> {
                try {
                    FileWriter fw = new FileWriter(new File("data\\pascal\\result\\program.pas"));
                    BufferedWriter bw = new BufferedWriter(fw);
                    bw.write(jTextArea.getText());
                    bw.close();

                    new ProcessBuilder("cmd", "/c","start", "data\\pascal\\" + (debugMode ? "debug" : "release") +
                            ".bat").start();

                } catch (IOException e1) {
                    e1.printStackTrace();
                }

            });*/
			textFrame.getContentPane().add("South", runButton);
			textFrame.getContentPane().add(jsp);
			/*JButton button = new JButton("Ok");
			button.setBounds(10, 50, 220, 50);
			textFrame.add(button);
			button.addActionListener(new ActionListener(){
				@Override
				public void actionPerformed(ActionEvent e) {
					text = jTextField.getText();
					textFrame.dispose();
					abstractBlock.setValue(text);
					panel.repaint();
				}
			});*/
			textFrame.setVisible(true);
//			textFrame.setAlwaysOnTop(true);
		}else
			JOptionPane.showMessageDialog(null, "Quality test have not passed. Check your structure.", "Error operation", JOptionPane.ERROR_MESSAGE);
//			System.out.println("Quality test have not passed. Check your structure)))");
//		System.out.println("===============");
	}

    private void initializePascalProgramText() {
        ArrayList<AbstractComponent> comp = model.getComponents();
        StatementParser parser = new StatementParser(model);
        parser.parseModel();
        TypeFrame f = new TypeFrame(model);
        var = f.getVars(TypeFrame.TypesColumn.Pascal);
//			System.out.println("=== Program ===");
        programText = "";

        //todo fix var section (?)
        if (var != null || doStartAndStopTimerBlocksExist()) {
            if (doStartAndStopTimerBlocksExist()) {
                programText += "uses dos;\n";
            }
            programText += "var\n";
            if (var != null){
                ArrayList<String> normalizedVariableNameList = getNormalizedVariableNameList();
                for (String normalizedVariableName : normalizedVariableNameList){
                    programText += getTabs(1) +
                            (normalizedVariableName.contains("[")
                                    ? normalizedVariableName.substring(0, normalizedVariableName.length()-2)
                                    //todo what with usual [1..n]?
                                    + ": array [0.." + (maxArrayElementQuantity-1) + "] of "
                                    : normalizedVariableName + ": "
                            ) + var[getNormalizedNameIndexInVar(normalizedVariableName)][1] + ";\n";
                }
            }
            if (doStartAndStopTimerBlocksExist()) {
                programText += getTabs(1) + "Hour, Min, Sec, HSec: word;\n" +
                        getTabs(1) + "Hour2, Min2, Sec2, HSec2: word;\n";
            }
        }

        programText += "begin\n";
        Begin beg = null;
        End end = null;
        for (int i=0;i<comp.size();i++){
            if (comp.get(i) instanceof Begin) {
                beg = (Begin) comp.get(i);
                break;
            }
        }
        for (int i=0;i<comp.size();i++){
            if (comp.get(i) instanceof End) {
                end = (End) comp.get(i);
                break;
            }
        }
        programText+=step(beg.getOutputConnection(),end,1);
        programText+="end.";
    }


    AbstractBlock currentBlock;

	private String step (Connection start, AbstractBlock end,int tabs){
		String res="";
		currentBlock = start.getEndBlock();
        //todo !!!split this "if-else-...-if-else" construction!!!
		if (!currentBlock.equals(end)){

			if (currentBlock instanceof Operator){
				//res=getTabs(tabs)+language.IOInterpreter(temp.getValue())+";\n";
                if (translator instanceof PascalTranslator) {
                    res=getTabs(tabs)+translator.translate(currentBlock.getParsedValue())+";\n";
                } else { //JavaTranslator
                    if (currentBlock instanceof ComplexOperator) {
                        res=getTabs(tabs)+currentBlock.getValue()+"();\n"; //todo add parameters (possibility exists in "simple" operator)
                    } else {
                        isBlockContainingArray = false;
                        String type = getType(); //todo multiple variables
                        if (isBlockContainingArray)
                            type = "";

                        res=getTabs(tabs)+type+translator.translate(currentBlock.getParsedValue())+";\n"; //todo multiple variables
                    }
                }
				res+=step(currentBlock.getOutputConnection(),end,tabs);
			} else {
                if (currentBlock instanceof Connector){
                    Connection sec =((Connector) currentBlock).getSecondInputConnection();
                    if (sec.equals(start)) sec = currentBlock.getInputConnection();
                    if (sec.getStartBlock() instanceof Condition){
                        if (translator instanceof PascalTranslator) {
                            //repeat
                            res=getTabs(tabs)+"repeat\n";
                            res+=step(currentBlock.getOutputConnection(),sec.getStartBlock(),tabs+1);
                            res+=getTabs(tabs)+"\n"+"until "+sec.getStartBlock().getValue()+";\n";
                            res+=step(sec.getStartBlock().getOutputConnection(),end,tabs);
                        } else { //JavaTranslator
                            res=getTabs(tabs)+"do {\n";
                            res+=step(currentBlock.getOutputConnection(),sec.getStartBlock(),tabs+1);
                            res+=getTabs(tabs)+"} while ("+sec.getStartBlock().getValue()+");\n";
                            res+=step(sec.getStartBlock().getOutputConnection(),end,tabs);
                        }
                    }else{
                        if (currentBlock.getOutputConnection().getEndBlock() instanceof Condition){
                            if (translator instanceof PascalTranslator) {
                                //while??
                                Condition cond = (Condition) currentBlock.getOutputConnection().getEndBlock();
                                res = getTabs(tabs)+"while "+ translator.translate(cond.getParsedValue())+" do\n"+getTabs(tabs+1)+" begin\n";
                                res+=step(cond.getOutputConnection(),currentBlock,tabs+2);
                                res+=getTabs(tabs+1)+"end;\n";
                                res+=step(cond.getSecondOutputConnection(),end,tabs);
                            } else { //JavaTranslator
                                Condition cond = (Condition) currentBlock.getOutputConnection().getEndBlock();
                                res = getTabs(tabs)+"while ("+ translator.translate(cond.getParsedValue())+") {\n";
                                res+=step(cond.getOutputConnection(),currentBlock,tabs+1);
                                res+=getTabs(tabs)+"}\n";
                                res+=step(cond.getSecondOutputConnection(),end,tabs);
                            }

                        }
                    }
                } else {
                    if (currentBlock instanceof Condition){
                        Condition currentCondition = (Condition)currentBlock;
                        Connector c = getEndIf(currentCondition);
                        if (translator instanceof PascalTranslator) {
                            res = getTabs(tabs)+"If "+translator.translate(currentBlock.getParsedValue())+" then\n"+getTabs(tabs+1)+"begin\n";
                            res+=step(currentBlock.getOutputConnection(),c,tabs+2);
                            res+=getTabs(tabs+1)+"end\n";
                            res+=getTabs(tabs)+"else\n"+getTabs(tabs+1)+"begin\n";
                            res+=step(currentCondition.getSecondOutputConnection(),c,tabs+2);
                            res+=getTabs(tabs+1)+"end;\n";
                        } else { //JavaTranslator
                            res = getTabs(tabs)+"if ("+translator.translate(currentBlock.getParsedValue())+") {\n";
                            res+=step(currentBlock.getOutputConnection(),c,tabs+1);
                            res+=getTabs(tabs)+"} else {\n";
                            res+=step(currentCondition.getSecondOutputConnection(),c,tabs+1);
                            res+=getTabs(tabs)+"}\n";
                        }
                        res+=step(c.getOutputConnection(),end,tabs);
                    } else {
                        if (currentBlock instanceof Output) {
                            //todo add output without prefix "ln"
                            if (translator instanceof PascalTranslator) {
//                        res += getTabs(tabs) + "write('" + temp.getParsedValue().getValue() + "');\n";
                                res += getTabs(tabs) + "writeln(" + translator.translate(currentBlock.getParsedValue()) + ");\n";
                            } else {
                                if (translator instanceof CppTranslator) {
                                    res += getTabs(tabs) + "cout << " +
                                            translator.translate(currentBlock.getParsedValue()) + " << endl;\n";
                                } else {
                                    if (translator instanceof JavaTranslator) {
//                                  res += getTabs(tabs) + "System.out.println(" + currentBlock.getValue() + ");\n";
                                        res += getTabs(tabs) + "System.out.println(" +
                                                translator.translate(currentBlock.getParsedValue()) + ");\n";
                                    } else { //ExeTranslator
                                    /*
                "PUSH 24,'Hello World (from GoAsm)'    ;24=length of string\r\n" +
                */
                                        String value = translator.translate(currentBlock.getParsedValue());
                                        final int lengthNewLineString = 2; // length for string "0Dh,0Ah" (new line)
                                        int lengthOutPut = value.length() + lengthNewLineString;
                                        res += getTabs(tabs) + "PUSH " + lengthOutPut + ",<'" +
                                                value + "',0Dh,0Ah>\t;" + lengthOutPut + "=length of string\r\n";
                                    }
                                }
                            }
                            res+=step(currentBlock.getOutputConnection(),end,tabs);
                        } else {
                            if (currentBlock instanceof Input) {
                                if (translator instanceof PascalTranslator) {
//                        res += getTabs(tabs) + "write('" + temp.getParsedValue().getValue() + "');\n";
                                    res += getTabs(tabs) + "readln(" + translator.translate(currentBlock.getParsedValue()) + ");\n";
                                } else {
                                    if (translator instanceof CppTranslator) {
                                        String type = getType(); //todo multiple variables
                                        if (!("".equals(type) || isBlockContainingArray)) {
                                            res += getTabs(tabs) + type + currentBlock.getValue() + ";\n";
                                        }
                                        res += getTabs(tabs) + "cin >> " + translator.translate(currentBlock.getParsedValue()) + ";\n";
                                    } else { //JavaTranslator
                                        if (!isScannerCreatedInMethod) {
                                            res += getTabs(tabs) + "java.util.Scanner scanner = new java.util.Scanner(System.in);\n";
                                            isScannerCreatedInMethod = true;
                                        }
                                        isBlockContainingArray = false;
                                        String type = getType(); //todo multiple variables
                                        String scannerMethodTypeString = getScannerMethodType(type);
                                        if (isBlockContainingArray)
                                            type = "";

                                        res += getTabs(tabs) + type + currentBlock.getValue() + " = scanner.next" +
                                                scannerMethodTypeString + (type.equals("char ")?"().charAt(0":"(")+");\n";
                                    }
                                }
                                res+=step(currentBlock.getOutputConnection(),end,tabs);
                            } else {
                                if (currentBlock instanceof EndMethod) {
                                    if (!currentBlock.getValue().equals("END")) {
                                        res += getTabs(tabs) + "return " + currentBlock.getValue() + ";\n";
                                    }
                                } else {
                                    if (currentBlock instanceof StartTimerBlock) {
                                        if (translator instanceof PascalTranslator) {
                                            res += getTabs(tabs) + "getTime(Hour, Min, Sec, HSec);\n";
                                        } else {
                                            if (translator instanceof CppTranslator) {
                                                res += getTabs(tabs) + "int start=GetTickCount();\n";
                                            } else {
                                                if (translator instanceof JavaTranslator) {
                                                    res += getTabs(tabs) + "long time1 = System.currentTimeMillis();\n";
                                                }
                                            }
                                        }
                                        res+=step(currentBlock.getOutputConnection(),end,tabs);
                                    } else {
                                        if (currentBlock instanceof StopTimerBlock) {
                                            if (translator instanceof PascalTranslator) {
                                                res += getTabs(tabs) +
                                                        "getTime(Hour2, Min2, Sec2, HSec2);\n" + getTabs(tabs) +
                                                        "Writeln('Time: ', ((((Hour2-Hour)*60+(Min2-Min))*60+" +
                                                        "(Sec2-Sec))*100+HSec2-HSec)*10);\n";
                                            } else {
                                                if (translator instanceof CppTranslator) {
                                                    res += getTabs(tabs) + "int end=GetTickCount();\n" +
                                                            getTabs(tabs) + "cout << \"Time: \" << (end - start) " +
                                                            "<< endl;\n";
                                                } else {
                                                    if (translator instanceof JavaTranslator) {
                                                        res += getTabs(tabs) + "long time2 = " +
                                                                "System.currentTimeMillis();\n" +
                                                                getTabs(tabs) + "System.out.println(\"Time: \" + " +
                                                                "(time2 - time1));\n";
                                                    }
                                                }
                                            }
                                            res+=step(currentBlock.getOutputConnection(),end,tabs);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
			/*if (temp instanceof InputOutput){
				res=getTabs(tabs)+temp.getValue()+";\n";
				res+=step(temp.getOutputConnection(),end,tabs);
			}*/
		}
		return res;
	}


    private String getScannerMethodType(String type) {
        if (type.contains("[")) {
            type = type.substring(0,type.indexOf("[")) + " ";
        }
        return ScannerMethodTypesMap.get(type);
        /*if (type.equals("String ")) {
            return "Line";
        } else {
            if (type.equals("int ")) {
                return "Int";
            }
        }
        return null;*/
    }


    private String getType() {
        String result = "";
        if (model.firstVariablesAppearanceMap.containsKey(currentBlock)) { //todo ?only contains?
            String variableName = model.firstVariablesAppearanceMap.get(currentBlock).get(0); //todo multiple variables
            int i=0;
            for (; i < var.length && !variableName.equals(var[i][0]); i++);

            result = var[i][1];

            //todo try to do it (creating array) before first appearance of array (not in "firstInsertionInMethodBody")
            if (variableName.contains("[")) { // is array
                isBlockContainingArray = true;
                if ("".equals(firstInsertionInMethodBody))
                    if (translator instanceof CppTranslator) {
                        firstInsertionInMethodBody = "    " + result + " " +
                                variableName.substring(0,variableName.indexOf('[')) + "[" + maxArrayElementQuantity +
                                "];\n";
                    } else { //Java (?)
                        firstInsertionInMethodBody = "        " + result + "[] " +
                                variableName.substring(0,variableName.indexOf('[')) + " = new " + result + "[" +
                                maxArrayElementQuantity + "];\n";
                    }
            }

            result += " ";

        }
        return result;
    }


    /**
	 * Возвращает коннектор, которым кончаются обе ветки условия start.
	 * @param start - исследуемое условие.
	 */
	public static Connector getEndIf (Condition start){
		AbstractBlock left = start.getOutputConnection().getEndBlock();
		AbstractBlock right = start.getSecondOutputConnection().getEndBlock();
		HashMap<Integer,Connector> lpath = new HashMap<Integer, Connector>();
		HashMap<Integer,Connector> rpath = new HashMap<Integer, Connector>();
		int lstep=0;
		int rstep=0;
		if (left instanceof Connector){
			lpath.put(lstep, (Connector) left);
			lstep++;
		}
		if (right instanceof Connector){
			rpath.put(rstep, (Connector) right);
			rstep++;
		}
		Connector res = null;
		while(res == null){
			while(! (left instanceof Connector) && !(left instanceof End)){
				left=left.getOutputConnection().getEndBlock();
			}
			if (left instanceof Connector){
				lpath.put(lstep, (Connector) left);
				lstep++;
                left=left.getOutputConnection().getEndBlock();
			}
			while(! (right instanceof Connector)&& !(right instanceof End)){
				right=right.getOutputConnection().getEndBlock();
			}
			if (right instanceof Connector){
				rpath.put(rstep, (Connector) right);
				rstep++;
                right=right.getOutputConnection().getEndBlock();
			}
			res = getCommon(lpath, rpath);
			
		}
		return res;
	}
	
	private static Connector getCommon(HashMap<Integer,Connector>left, HashMap<Integer,Connector> right){
		Connector res = null;
		if (left!=null && right!=null){
			for (int i=0; i<right.size();i++){
				if (left.containsValue(right.get(i))) {
					res = right.get(i);
					break;
				}
			}
		}
		return res;
	}
	
	private String getTabs(int n){
		String res="";
		for (int i=0;i<n;i++){
			res+="    ";
		}
		return res;
	}

    public void test() {
        try {
            // Create Chart
//            Chart chart = QuickChart.getChart("Sample Chart", "X", "Y", "y(x)", naturalNumberList, measureList);
            Chart chart = new Chart(1000, 400);
            chart.setChartTitle("Test Results");
//            chart.setXAxisTitle("X");
//            chart.setYAxisTitle("Y");
            ArrayList<Number> naturalNumberList = new ArrayList<>();
            for (int i = 1; i <= measurementsQuantity; i++) {
                naturalNumberList.add(i);
            }

            //Pascal
            translator = new PascalTranslator();
            Language currentLanguage = Language.Pascal;
            initializePascalProgramText();
            writeSourceProgramFiles(currentLanguage);

            chart.addSeries("Pascal", naturalNumberList, runTestAndGetResults(currentLanguage));

            //C++
            translator = new CppTranslator();
            currentLanguage = Language.Cpp;
            initializeCppProgramText();
            writeSourceProgramFiles(currentLanguage);

            //todo 32bit and 64bit
            chart.addSeries("C++ (32 bit)", naturalNumberList, runTestAndGetResults(currentLanguage, 32));
            chart.addSeries("C++ (64 bit)", naturalNumberList, runTestAndGetResults(currentLanguage, 64));

            //Java
            translator = new JavaTranslator();
            currentLanguage = Language.Java;
            initializeJavaProgramText();
            writeSourceProgramFiles(currentLanguage);

            chart.addSeries("Java", naturalNumberList, runTestAndGetResults(currentLanguage));

            // Show Chart
            new SwingWrapper(chart).displayChart();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private ArrayList<Number> runTestAndGetResults(Language currentLanguage) throws IOException {
        return runTestAndGetResults(currentLanguage, 0);
    }

    private ArrayList<Number> runTestAndGetResults(Language currentLanguage, int bitWidth) throws IOException {
        if (currentLanguage == Language.Java) {
            FileWriter fw = new FileWriter(new File("data\\java\\test.bat"));
            BufferedWriter bw = new BufferedWriter(fw);
//					String fileText = "del *.class\n"*/;
            String fileText = "cd data\\java\\result\\\n" +
                    "del *.class\n";
            for (int i = 0; i < classNames.size(); i++) {
                fileText += "javac " + classNames.get(i) + ".java\n";
            }
            if (mainClassName != null) {
                for (int i = 0; i < measurementsQuantity; i++) {
                    fileText += "java " + mainClassName + "\n";
                }
            }
            bw.write(fileText);
            bw.close();
        }
        //get console result
        Runtime rt = Runtime.getRuntime();
        Process proc = rt.exec("data\\"+ languageWithFolderNameMap.get(currentLanguage) + "\\test" +
                (bitWidth == 0 ? "" : bitWidth) + ".bat");
        BufferedReader stdInput = new BufferedReader(new InputStreamReader(proc.getInputStream()));

        System.out.println("Here is the " + currentLanguage + " time test result:\n");
        String s;
        ArrayList<Number> measureList = new ArrayList<>();
        String keySubString = "Time: ";
        while ((s = stdInput.readLine()) != null) {
            System.out.println(s);
            if (s.contains(keySubString)) {
                System.out.println(s.substring(s.indexOf(keySubString) + keySubString.length()));
                measureList.add(Integer.parseInt(s.substring(s.indexOf(keySubString) + keySubString.length())));
            }
        }
        return measureList;
    }

    public void translationTimeTest() {
        Runtime rt = Runtime.getRuntime();
        try {
//            Process proc = rt.exec("ppcrossx64 data\\pascal\\result\\program.pas");
            long time1 = System.currentTimeMillis();
            Process proc = rt.exec("data\\pascal\\result\\program.exe");
            long time2 = System.currentTimeMillis();
            System.out.println("Time(0): " + (time2 - time1));
            BufferedReader stdInput = new BufferedReader(new InputStreamReader(proc.getInputStream()));
            String s;
            while ((s = stdInput.readLine()) != null) {
                System.out.println(s);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}