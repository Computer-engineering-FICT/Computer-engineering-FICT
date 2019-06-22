package lab1_8;

import java.awt.Dimension;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.Rectangle;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.image.BufferedImage;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;

import javax.imageio.ImageIO;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

import Scheme.Generator;
import Scheme.SchemePanel;

public class MainWindow extends JFrame {
	
	private static final long serialVersionUID = 1L;
	
	private JPanel ButtonPanel = new JPanel(new GridBagLayout());
	private JButton bAddBegin = new JButton("Begin");
	private JButton bAddEnd = new JButton("End");
	private JButton bAddArithmetical = new JButton("Arithmetical");
	private JButton bAddLogical = new JButton("Logical");
	private JButton bAddOpenBracket = new JButton("(");
	private JButton bAddCloseBracket = new JButton(")");
	private JButton bAddInArrow = new JButton("In Arrow");
	private JButton bAddOutArrow = new JButton("Out Arrow");
	private JButton bOpenLSA = new JButton("Open LSA");
	private JButton bSaveLSA = new JButton("Save LSA");
	
	private JButton bDrawMG = new JButton("Draw Mili Graph");
	private JButton bMarkMG = new JButton("Mark Mili Graph");
	private JButton bSaveMG = new JButton("Save Mili Graph");
	private JButton bOpenMG = new JButton("Open Mili Graph");
	
	private JButton bShowST = new JButton("Show Structure Table");
	private JButton bCreateST = new JButton("Create Structure Table");
	private JButton bSaveST = new JButton("Save Structure Table");
	private JButton bOpenST = new JButton("Open Structure Table");
	
	private JButton bMinimizeF = new JButton("Minimize Functions");
	private JButton bSaveMFToVHDL = new JButton("Save to VHDL");
	private JButton bShowMF = new JButton("Show Minimized Functions");
	private JButton bSaveMF = new JButton("Save Minimized Functions");
	private JButton bOpenMF = new JButton("Open Minimized Functions");
	
	private JButton bDrawScheme = new JButton("Draw Scheme");
	
	private LSADrawPanel lsaPanel = new LSADrawPanel(true);
	private JScrollPane lsaPanelScroll = new JScrollPane(lsaPanel);
	
	private JFrame fMiliGraph = new JFrame("Mili Graph");
	private MiliGraphDrawPanel mgPanel = new MiliGraphDrawPanel(true);
	
	private JFrame fStructureTable = new JFrame("Structure Table");
	private JTable tStructureTable = new JTable();
	private JScrollPane spStructureTable = new JScrollPane(tStructureTable);
	
	private JFrame fMinimizedFunctions = new JFrame("Minimized Functions");
	private JTable tMinimizedFunctions = new JTable();
	private JScrollPane spMinimizedFunctions = new JScrollPane(tMinimizedFunctions);
	
	private JFrame fScheme= new JFrame("Scheme");
	private SchemePanel pScheme = new SchemePanel(this);
	private JScrollPane spScheme = new JScrollPane(pScheme);
	
	private JFileChooser FileChoosingDialog = new JFileChooser();
	private ObjectOutputStream outObject;
	private ObjectInputStream inObject;
	private BufferedWriter outText;
	private BufferedReader inText;
	
	private String InputSignalsNames = "";
	
	public MainWindow() {
		
		this.setLayout(new GridBagLayout());
		this.setTitle("LSA Editor");
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		this.setSize(850, 241);
		this.setMinimumSize(new Dimension(850, 241));

		this.setMaximizedBounds(new Rectangle(0, 0, (int) this.getToolkit().getScreenSize().getWidth(), (int) this.getMinimumSize().getHeight()-27));
		this.setLocation((int)(this.getToolkit().getScreenSize().getWidth()-this.getWidth())/2, (int)(this.getToolkit().getScreenSize().getHeight()-this.getHeight())/2);
		
		setLookOfButtonPanel();
		setLookOflsaPanel();
		setAllListeners();
		
		setLookOfMiliGraphWindow();
		setLookOfStructureTableWindow();
		setLookOfMinimizedFunctionsWindow();
		
		FileChoosingDialog.setCurrentDirectory(new File("."));
		FileChoosingDialog.setAcceptAllFileFilterUsed(false);
		
		this.setVisible(true);
	}
	
	private void setLookOfMinimizedFunctionsWindow() {
		
		fMinimizedFunctions.setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);
		
		fMinimizedFunctions.add(spMinimizedFunctions);
		
		fMinimizedFunctions.setSize(700, 300);
	}
	
	private void setLookOfStructureTableWindow() {
		
		fStructureTable.setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);
		
		fStructureTable.add(spStructureTable);
		
		fStructureTable.setSize(700, 300);
	}
	
	private void setLookOfMiliGraphWindow() {
		
		fMiliGraph.setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);
		
		fMiliGraph.add(mgPanel);
		
		fMiliGraph.setSize(500, 500);
	}
	
	private void setLookOfButtonPanel() {
		
		ButtonPanel.add(bAddArithmetical, new GridBagConstraints(0, 0, 1, 1, 100, 100, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(1, 1, 1, 1), 0 , 0));
		ButtonPanel.add(bAddLogical, new GridBagConstraints(0, 1, 1, 1, 100, 100, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(1, 1, 1, 1), 0 , 0));
		ButtonPanel.add(bAddInArrow, new GridBagConstraints(0, 2, 1, 1, 100, 100, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(1, 1, 1, 1), 0 , 0));
		ButtonPanel.add(bAddOutArrow, new GridBagConstraints(0, 3, 1, 1, 100, 100, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(1, 1, 1, 1), 0 , 0));
		
		ButtonPanel.add(bAddBegin, new GridBagConstraints(1, 0, 1, 1, 100, 100, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(1, 1, 1, 1), 0 , 0));
		ButtonPanel.add(bAddEnd, new GridBagConstraints(2, 0, 1, 1, 100, 100, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(1, 1, 1, 1), 0 , 0));
		ButtonPanel.add(bAddOpenBracket, new GridBagConstraints(1, 1, 1, 1, 100, 100, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(1, 1, 1, 1), 0 , 0));
		ButtonPanel.add(bAddCloseBracket, new GridBagConstraints(2, 1, 1, 1, 100, 100, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(1, 1, 1, 1), 0 , 0));
		ButtonPanel.add(bOpenLSA, new GridBagConstraints(1, 2, 2, 1, 100, 100, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(1, 1, 1, 1), 0 , 0));
		ButtonPanel.add(bSaveLSA, new GridBagConstraints(1, 3, 2, 1, 100, 100, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(1, 1, 1, 1), 0 , 0));
		
		ButtonPanel.add(bMarkMG, new GridBagConstraints(3, 0, 1, 1, 100, 100, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(1, 1, 1, 1), 0 , 0));
		ButtonPanel.add(bDrawMG, new GridBagConstraints(3, 1, 1, 1, 100, 100, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(1, 1, 1, 1), 0 , 0));
		ButtonPanel.add(bOpenMG, new GridBagConstraints(3, 2, 1, 1, 100, 100, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(1, 1, 1, 1), 0 , 0));
		ButtonPanel.add(bSaveMG, new GridBagConstraints(3, 3, 1, 1, 100, 100, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(1, 1, 1, 1), 0 , 0));
		
		ButtonPanel.add(bShowST, new GridBagConstraints(4, 0, 1, 1, 100, 100, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(1, 1, 1, 1), 0 , 0));
		ButtonPanel.add(bCreateST, new GridBagConstraints(4, 1, 1, 1, 100, 100, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(1, 1, 1, 1), 0 , 0));
		ButtonPanel.add(bOpenST, new GridBagConstraints(4, 2, 1, 1, 100, 100, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(1, 1, 1, 1), 0 , 0));
		ButtonPanel.add(bSaveST, new GridBagConstraints(4, 3, 1, 1, 100, 100, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(1, 1, 1, 1), 0 , 0));
		
		ButtonPanel.add(bMinimizeF, new GridBagConstraints(5, 0, 1, 1, 100, 100, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(1, 1, 1, 1), 0 , 0));
		ButtonPanel.add(bSaveMFToVHDL, new GridBagConstraints(6, 0, 1, 1, 100, 100, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(1, 1, 1, 1), 0 , 0));
		ButtonPanel.add(bShowMF, new GridBagConstraints(5, 1, 2, 1, 100, 100, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(1, 1, 1, 1), 0 , 0));
		ButtonPanel.add(bOpenMF, new GridBagConstraints(5, 2, 2, 1, 100, 100, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(1, 1, 1, 1), 0 , 0));
		ButtonPanel.add(bSaveMF, new GridBagConstraints(5, 3, 2, 1, 100, 100, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(1, 1, 1, 1), 0 , 0));
		
		ButtonPanel.add(bDrawScheme, new GridBagConstraints(7, 0, 1, 4, 100, 100, GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(1, 1, 1, 1), 0 , 0));
		
		this.add(ButtonPanel, new GridBagConstraints(0, 0, 1, 1, 100, 0, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 0), 0 , 0));
	}
	
	private void setLookOflsaPanel() {
		
		lsaPanel.setParentWindow(this);
		lsaPanelScroll.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_ALWAYS);
		
		this.add(lsaPanelScroll, new GridBagConstraints(0, 1, 1, 1, 100, 100, GridBagConstraints.CENTER, GridBagConstraints.BOTH, new Insets(1, 1, 1, 1), 0 , 0));
	}
	
	@SuppressWarnings("unchecked")
	private String[] minimizeFunction(ArrayList<String> Constituents, ArrayList<String> CoveringTableConstituents) {
		
		ArrayList<String> NewCube = (ArrayList<String>) Constituents.clone();
		
		ArrayList<String> CurrentCube;
		ArrayList<Integer> CurrentAbsorptionCube = new ArrayList<Integer>();
		
		ArrayList<ArrayList<String>> Cubes = new ArrayList<ArrayList<String>>();
		ArrayList<ArrayList<Integer>> AbsorptionCubes = new ArrayList<ArrayList<Integer>>();
		
		boolean Splicing = false;
		
		do {
			
			Splicing = false;
			
			CurrentCube = (ArrayList<String>) NewCube.clone();
			NewCube.clear();
			
			CurrentAbsorptionCube.clear();
			
			for (int i = 0; i<CurrentCube.size()-1; i++)
				for (int j = i+1; j<CurrentCube.size(); j++) {
					
					boolean OneBitDifferece = false;
					int OneBitDiffereceIndex = 0;
					
					for (int k = 0; k<CurrentCube.get(i).length(); k++)
						if (CurrentCube.get(i).charAt(k)!=CurrentCube.get(j).charAt(k)) 
							if ((CurrentCube.get(i).charAt(k)!='-') &&  (CurrentCube.get(j).charAt(k)!='-') && (!OneBitDifferece)) {
				
								OneBitDifferece = true;
								OneBitDiffereceIndex = k;
							}
							else {
								
								OneBitDifferece = false;
								break;
							}
					
					if (OneBitDifferece) {
						
						if ((!NewCube.contains(CurrentCube.get(i).substring(0, OneBitDiffereceIndex)+"-"+CurrentCube.get(i).substring(OneBitDiffereceIndex+1, CurrentCube.get(i).length()))))						
							NewCube.add(CurrentCube.get(i).substring(0, OneBitDiffereceIndex)+"-"+CurrentCube.get(i).substring(OneBitDiffereceIndex+1, CurrentCube.get(i).length()));
						
						if (!CurrentAbsorptionCube.contains(i))
							CurrentAbsorptionCube.add(i);
						
						if (!CurrentAbsorptionCube.contains(j))
							CurrentAbsorptionCube.add(j);
					}
				}

			Cubes.add((ArrayList<String>) CurrentCube.clone());
			AbsorptionCubes.add((ArrayList<Integer>) CurrentAbsorptionCube.clone());
			
			if (!NewCube.isEmpty())
				Splicing = true;

		} while (Splicing);
		
		ArrayList<String> TDNF = new ArrayList<String>();
		
		for (int i = 0; i<Cubes.size(); i++)
			for (int j = 0; j<Cubes.get(i).size(); j++)
				if (!AbsorptionCubes.get(i).contains(j))
					TDNF.add(Cubes.get(i).get(j));
		
		Integer[][] CoveringTable = new Integer[TDNF.size()][CoveringTableConstituents.size()];
		
		for (int i = 0; i<CoveringTable.length; i++)
			for (int j = 0; j<CoveringTable[i].length; j++) {
				
				boolean Cover = true;
				
				for (int k = 0; k<TDNF.get(i).length(); k++)
					if ((TDNF.get(i).charAt(k)!=CoveringTableConstituents.get(j).charAt(k)) && (TDNF.get(i).charAt(k)!='-')) {
							
						Cover = false;
						break;
					}
				
				if (Cover)
					CoveringTable[i][j] = 1;
				else
					CoveringTable[i][j] = 0;
			}
		
		Boolean[] CoveredConstituents = new Boolean[CoveringTableConstituents.size()];
		for (int i = 0; i<CoveredConstituents.length; i++)
			CoveredConstituents[i] = false;
		
		Boolean AllConstituentsAreCovered = false;
		ArrayList<String> MDNF = new ArrayList<String>();
		
		while (!AllConstituentsAreCovered) {
			
			int MinConstituentOnesQuantity = Integer.MAX_VALUE;
			ArrayList<Integer> MinConstituentOnesNumbers = new ArrayList<Integer>();
			
			for (int j = 0; j<CoveringTable[0].length; j++)
				if (!CoveredConstituents[j]) {
					int CurrentConstituentOnesQuantity = 0;
				
					for (int i = 0; i<CoveringTable.length; i++)
						if (CoveringTable[i][j]==1)
							CurrentConstituentOnesQuantity++;
				
					if (CurrentConstituentOnesQuantity<MinConstituentOnesQuantity) {
						
						MinConstituentOnesQuantity = CurrentConstituentOnesQuantity;
						MinConstituentOnesNumbers.clear();
					}

					if (CurrentConstituentOnesQuantity==MinConstituentOnesQuantity)
						MinConstituentOnesNumbers.add(j);
				}
			
			int MaxUncoveredConstituentsQuantity = 0;
			int MaxUncoveredConstituentsNumber = 0;
			for (int j = 0; j<MinConstituentOnesNumbers.size(); j++) {
				
				ArrayList<Integer> CurrentConstituentCoveringImplicantsNumbers = new ArrayList<Integer>();
				
				for (int k = 0; k<CoveringTable.length; k++)
					if (CoveringTable[k][MinConstituentOnesNumbers.get(j)] == 1)
						CurrentConstituentCoveringImplicantsNumbers.add(k);
				
				ArrayList<Integer> CurrentConstituentCoveringConstituentsNumbers = new ArrayList<Integer>();
				
				for (int  k = 0; k<CurrentConstituentCoveringImplicantsNumbers.size(); k++)
					for (int  l = 0; l<CoveringTable[CurrentConstituentCoveringImplicantsNumbers.get(k)].length; l++)
						if ((CoveringTable[CurrentConstituentCoveringImplicantsNumbers.get(k)][l]==1) && (!CoveredConstituents[l]) && (!CurrentConstituentCoveringConstituentsNumbers.contains(l)))
							CurrentConstituentCoveringConstituentsNumbers.add(l);
				
				if (CurrentConstituentCoveringConstituentsNumbers.size()>MaxUncoveredConstituentsQuantity) {
					
					MaxUncoveredConstituentsQuantity = CurrentConstituentCoveringConstituentsNumbers.size();
					MaxUncoveredConstituentsNumber = MinConstituentOnesNumbers.get(j);
				}
			}
				
			for (int i = 0; i<CoveringTable.length; i++)
				if (CoveringTable[i][MaxUncoveredConstituentsNumber]==1) {
				
					MDNF.add(TDNF.get(i));
					
					for (int j = 0; j<CoveredConstituents.length; j++)
						if (CoveringTable[i][j]==1)
							CoveredConstituents[j] = true;
				}
				
			AllConstituentsAreCovered = true;
			for (int i = 0; i<CoveredConstituents.length; i++)
				if (!CoveredConstituents[i]) {
					
					AllConstituentsAreCovered = false;
					break;
				}
		}
		
		String[] ArrayMDNF = new String[MDNF.size()];
		
		ArrayMDNF = MDNF.toArray(ArrayMDNF);
		
		return ArrayMDNF;
	}
	
	private ArrayList<Object> minimizeAllFunctions() {
		
		ArrayList<String[]> tMinimizeFunctionData = new ArrayList<String[]>();
		ArrayList<String> tMinimizeFunctionHeader = new ArrayList<String>();
		
		InputSignalsNames = tStructureTable.getColumnName(1);
		
		for (int k = 0; k<tStructureTable.getModel().getColumnCount(); k++)
			if (tStructureTable.getColumnName(k).contains(LogicalNode.NAME_CHARACTER))
				InputSignalsNames+=tStructureTable.getColumnName(k);
		
		for (int i = 0; i<tStructureTable.getModel().getColumnCount(); i++)
			if ((tStructureTable.getColumnName(i).contains(ArithmeticalNode.NAME_CHARACTER)) || (tStructureTable.getColumnName(i).contains("J")) || (tStructureTable.getColumnName(i).contains("K"))) {
				
				ArrayList<String> Constituents = new ArrayList<String>();
				ArrayList<String> CoveringTableConstituents = new ArrayList<String>();
				
				for (int j = 0; j<tStructureTable.getModel().getRowCount(); j++) {
				
					if (tStructureTable.getValueAt(j, i).equals("1")) {
						
						String Constituent = (String) tStructureTable.getValueAt(j, 1);
						
						for (int k = 0; k<tStructureTable.getModel().getColumnCount(); k++)
							if (tStructureTable.getColumnName(k).contains(LogicalNode.NAME_CHARACTER))
								Constituent+=tStructureTable.getValueAt(j, k);
								
						Constituents.add(Constituent);
						CoveringTableConstituents.add(Constituent);
					}
					
					if (tStructureTable.getValueAt(j, i).equals("-")) {
						
						String Constituent = (String) tStructureTable.getValueAt(j, 1);
						
						for (int k = 0; k<tStructureTable.getModel().getColumnCount(); k++)
							if (tStructureTable.getColumnName(k).contains(LogicalNode.NAME_CHARACTER))
								Constituent = Constituent+tStructureTable.getValueAt(j, k);
								
						Constituents.add(Constituent);
					}
				}
				
				tMinimizeFunctionHeader.add(tStructureTable.getColumnName(i)); 
				String[] tmp = new String[CoveringTableConstituents.size()];
				tmp = (String[]) CoveringTableConstituents.toArray(tmp);
				tMinimizeFunctionData.add(tmp);
				
				tMinimizeFunctionHeader.add("m"+tStructureTable.getColumnName(i));
				tMinimizeFunctionData.add(minimizeFunction(Constituents, CoveringTableConstituents));
		}
		
		ArrayList<Object> AllTableData = new ArrayList<Object>();
		
		String[] tmpHeader = new String[tMinimizeFunctionHeader.size()];
		tmpHeader = (String[]) tMinimizeFunctionHeader.toArray(tmpHeader);
		AllTableData.add(tmpHeader);
		
		int maxRowHeight = 0;
		for (int i = 0; i<tMinimizeFunctionData.size(); i++)
			maxRowHeight = Math.max(maxRowHeight, tMinimizeFunctionData.get(i).length);
			
		String[][] tmpData = new String[maxRowHeight][tMinimizeFunctionData.size()];
		for (int i = 0; i<tMinimizeFunctionData.size(); i++)
			for (int j = 0; j<tMinimizeFunctionData.get(i).length; j++)
				tmpData[j][i] = tMinimizeFunctionData.get(i)[j];
				
		AllTableData.add(tmpData);
		
		return AllTableData;
	}
	
	private String getFunctionOnVHDL(String FunctionName, String[] InputSignals, String[] Constituents) {
		
		String Result = "entity "+FunctionName+" is\n"+"\tport(\n";
		
		ArrayList<String> negativeSignalsNames = new ArrayList<String>();
		
		for (int i =0; i<InputSignals.length; i++)
			if (InputSignals[i].contains("Q"))
				Result+="\t\t"+InputSignals[i]+" : in bit;\n";
			else
				Result+="\t\t"+InputSignals[i]+" : in bit;\n";
		
		for (int i =0; i<Constituents.length; i++)
			for (int j = 0; j<Constituents[i].length(); j++)
				if ((Constituents[i].charAt(j)=='0') && (!negativeSignalsNames.contains(InputSignals[j])))
					negativeSignalsNames.add(InputSignals[j]);
		
		Result+="\t\t"+FunctionName+" : out bit\n";
		
		Result += "\t);\n" +
				"end "+FunctionName+";\n\n";
		
		Result += "architecture BEH of "+FunctionName+" is\n";
		
		int SignalsQuantity = 0;
		
		for (int i = 0; i<Constituents.length; i++) {
			
			int CurrentConstituentSignals = 0;
			
			for (int j = 0; j<Constituents[i].length(); j++)
				if (Constituents[i].charAt(j)!='-')
					CurrentConstituentSignals++;
			
			while (CurrentConstituentSignals>3) {
				
				if (CurrentConstituentSignals%3==0)
					CurrentConstituentSignals = CurrentConstituentSignals/3;
				else
					CurrentConstituentSignals = CurrentConstituentSignals/3+1;
	
				SignalsQuantity += CurrentConstituentSignals;
			}
			
			SignalsQuantity++;
		}
		
		int SignalsQuantityForOR3 = Constituents.length;
		
		while (SignalsQuantityForOR3>3) {
		
			if (SignalsQuantityForOR3%3==0)
				SignalsQuantityForOR3 = SignalsQuantityForOR3/3;
			else
				SignalsQuantityForOR3 = SignalsQuantityForOR3/3+1;
				
			SignalsQuantity += SignalsQuantityForOR3;
		}
		
		if (!negativeSignalsNames.isEmpty() || SignalsQuantity!=0)
			Result += "signal ";
		
		for (int i = 0; i<negativeSignalsNames.size(); i++)
			if ((i==(negativeSignalsNames.size()-1)) && (SignalsQuantity==0))
				Result += "S"+i+" : bit;\n";
			else
				Result += "not"+negativeSignalsNames.get(i)+", ";
		
		for (int i = 1; i<=SignalsQuantity; i++)
			if (i!=SignalsQuantity)
				Result += "S"+i+", ";
			else
				Result += "S"+i+" : bit;\n";
		
		Result += "begin\n";
		
		for (int i = 0; i<negativeSignalsNames.size(); i++)
			Result += "\tnot"+negativeSignalsNames.get(i)+" <= not "+negativeSignalsNames.get(i)+";\n";
		
		int LabelCounter = 1;
		int SignalCounter = 1;
		
		ArrayList<String> SignalsNamesForOR3 = new ArrayList<String>();
		
		for (int i = 0; i<Constituents.length; i++) {
			
			ArrayList<String> CurrentSignalsNames = new ArrayList<String>();
			
			for (int j = 0; j<Constituents[i].length(); j++)
				if (Constituents[i].charAt(j)!='-')
					if (Constituents[i].charAt(j)=='0')
						CurrentSignalsNames.add("not"+InputSignals[j]);
					else
						CurrentSignalsNames.add(InputSignals[j]);
			
			while (CurrentSignalsNames.size()>3) {
				
				int AND3Quantity = 0;
				
				if (CurrentSignalsNames.size()%3==0)
					AND3Quantity = CurrentSignalsNames.size()/3;
				else
					AND3Quantity = CurrentSignalsNames.size()/3+1;
				
				ArrayList<String> TempSignalsNames = new ArrayList<String>();
				
				for (int k = 0; k<AND3Quantity; k++) {
					
					Result += "\tL"+(LabelCounter++)+": entity AND3(BEH) port map (";
					
					for (int l = 3*k; l<3*k+3; l++)
						if (l>=CurrentSignalsNames.size())
							Result += CurrentSignalsNames.get(CurrentSignalsNames.size()-1)+", ";
						else
							Result += CurrentSignalsNames.get(l)+", ";
					
					Result += "S"+SignalCounter+");\n";
					TempSignalsNames.add("S"+(SignalCounter++));
				}
	
				CurrentSignalsNames = TempSignalsNames;
			}
			
			Result += "\tL"+(LabelCounter++)+": entity AND3(BEH) port map (";
			
			for (int l = 0; l<3; l++)
				if (l>=CurrentSignalsNames.size())
					Result += CurrentSignalsNames.get(CurrentSignalsNames.size()-1)+", ";
				else
					Result += CurrentSignalsNames.get(l)+", ";
			
			Result += "S"+SignalCounter+");\n";
			SignalsNamesForOR3.add("S"+(SignalCounter++));
		}
		
		while (SignalsNamesForOR3.size()>3) {
			
			int OR3Quantity = 0;
			
			if (SignalsNamesForOR3.size()%3==0)
				OR3Quantity = SignalsNamesForOR3.size()/3;
			else
				OR3Quantity = SignalsNamesForOR3.size()/3+1;
			
			ArrayList<String> TempSignalsNames = new ArrayList<String>();
			
			for (int k = 0; k<OR3Quantity; k++) {
				
				Result += "\tL"+(LabelCounter++)+": entity OR3(BEH) port map (";
				
				for (int l = 3*k; l<3*k+3; l++)
					if (l>=SignalsNamesForOR3.size())
						Result += SignalsNamesForOR3.get(SignalsNamesForOR3.size()-1)+", ";
					else
						Result += SignalsNamesForOR3.get(l)+", ";
				
				Result += "S"+SignalCounter+");\n";
				TempSignalsNames.add("S"+(SignalCounter++));
			}

			SignalsNamesForOR3 = TempSignalsNames;
		}
		
		Result += "\tL"+(LabelCounter++)+": entity OR3(BEH) port map (";
		
		for (int l = 0; l<3; l++)
			if (l>=SignalsNamesForOR3.size())
				Result += SignalsNamesForOR3.get(SignalsNamesForOR3.size()-1)+", ";
			else
				Result += SignalsNamesForOR3.get(l)+", ";
		
		Result += FunctionName+");\n";
		Result += "end BEH;\n\n";
		
		return Result;
	}
	
	private String getQFunctionOnVHDL(String QName) {
		
		String QNumber = QName.substring(1);
		
		String Result;
		Result = "entity "+QName+" is\n" +
				"\tport(\n" +
				"\t\tJ"+QNumber+" : in bit;\n" +
				"\t\tK"+QNumber+" : in bit;\n" +
				"\t\tCLK : in bit;\n" +
				"\t\t"+QName+" : inout bit\n" +
				"\t);\n" +
				"end "+QName+";\n\n";

		Result += "architecture BEH of "+QName+" is\n" +
				"begin\n" +
				"\tL1: entity JK(BEH) port map(J"+QNumber+", K"+QNumber+", CLK, "+QName+");\n" +
				"end BEH;\n\n";
		
		return Result;
	}
	
	private String[] parseInputSignalsNames(String ISNames) {
		
		ArrayList<String> ResultList = new ArrayList<String>();
		
		boolean isDigit;
		
		for (int i = 0; i<ISNames.length(); i++) {
		
			isDigit = true;
			
			try {
				
				Integer.parseInt(String.valueOf(ISNames.charAt(i)));
			} catch(NumberFormatException e) {
				
				isDigit = false;
			}
			
			if ((!isDigit) && (i!=0)) {
			
				ResultList.add(ISNames.substring(0, i));
				ISNames = ISNames.substring(i, ISNames.length());
				i = 0;
			}
		}
		
		ResultList.add(ISNames.substring(0, ISNames.length()));
		
		String[] ResultArray = new String[ResultList.size()];
		
		ResultArray = ResultList.toArray(ResultArray);
		
		return ResultArray;
	}
	
	private String getAND3OnVHDL() {
		
		String Result;
		Result = "entity AND3 is\n" +
				"\tport(\n" +
				"\t\tIN1 : in bit;\n" +
				"\t\tIN2 : in bit;\n" +
				"\t\tIN3 : in bit;\n" +
				"\t\tOUT1 : out bit\n" +
				"\t);\n" +
				"end AND3;\n\n" +
				"architecture BEH of AND3 is\n" +
				"begin\n" +
				"\tOUT1 <= IN1 and IN2 and IN3;\n" +
				"end BEH;\n\n";
		
		return Result;
	}
	
	private String getOR3OnVHDL() {
		
		String Result;
		Result = "entity OR3 is\n" +
				"\tport(\n" +
				"\t\tIN1 : in bit;\n" +
				"\t\tIN2 : in bit;\n" +
				"\t\tIN3 : in bit;\n" +
				"\t\tOUT1 : out bit\n" +
				"\t);\n" +
				"end OR3;\n\n" +
				"architecture BEH of OR3 is\n" +
				"begin\n" +
				"\tOUT1 <= IN1 or IN2 or IN3;\n" +
				"end BEH;\n\n";
		
		return Result;
	}
	
	private String getJKOnVHDL() {
		
		String Result;
		Result = "entity JK is\n" +
				"\tport(\n" +
				"\t\tJ : in bit;\n" +
				"\t\tK : in bit;\n" +
				"\t\tCLK : in bit;\n" +
				"\t\tQ : inout bit\n" +
				"\t);\n" +
				"end JK;\n\n" +
				"architecture BEH of JK is\n" +
				"begin\n" +
				"\tprocess (CLK)\n" +
				"\tbegin\n" +
				"\t\tif (CLK'event and CLK = '1') then\n" +
				"\t\t\tif (J = '0' and K = '0') then Q <= Q;\n" +
				"\t\t\telsif (J = '1' and K = '0') then Q <= '1';\n" +
				"\t\t\telsif (J = '0' and K = '1') then Q <= '0';\n" +
				"\t\t\telsif (J = '1' and K = '1') then Q <= not(Q);\n" +
				"\t\t\tend if;\n" +
				"\t\tend if;\n" +
				"\tend process;\n" +
				"end BEH;\n\n";
		
		return Result;
	}
	
	private String getMinimizedFunctionsOnVHDL(String[] ColumnNames, String[][] TableData) {
		
		String Result = "";
		
		Result += getAND3OnVHDL();
		Result += getOR3OnVHDL();
		Result += getJKOnVHDL();
		
		for (int i = 0; i<ColumnNames.length; i++)
			if (ColumnNames[i].contains("m") && (ColumnNames[i].contains("J") || ColumnNames[i].contains("K"))) {
				
				ArrayList<String> ConstituentsList = new ArrayList<String>();
				
				for (int j = 0; j<TableData.length; j++)
					if (TableData[j][i]!=null)
						ConstituentsList.add(TableData[j][i]);
				
				String[] ConstituentsArray = new String[ConstituentsList.size()];
				ConstituentsArray = ConstituentsList.toArray(ConstituentsArray);
				
				Result += getFunctionOnVHDL(ColumnNames[i].substring(1), parseInputSignalsNames(InputSignalsNames), ConstituentsArray);
			}
		
		String[] InputSiganlsNamesArray = parseInputSignalsNames(InputSignalsNames);
		
		for (int i = 0; i<InputSiganlsNamesArray.length; i++)
			if (InputSiganlsNamesArray[i].contains("Q"))
				Result += getQFunctionOnVHDL(InputSiganlsNamesArray[i]);
		
		for (int i = 0; i<ColumnNames.length; i++)
			if (ColumnNames[i].contains("m") && ColumnNames[i].contains(ArithmeticalNode.NAME_CHARACTER)) {
				
				ArrayList<String> ConstituentsList = new ArrayList<String>();
				
				for (int j = 0; j<TableData.length; j++)
					if (TableData[j][i]!=null)
						ConstituentsList.add(TableData[j][i]);
				
				String[] ConstituentsArray = new String[ConstituentsList.size()];
				ConstituentsArray = ConstituentsList.toArray(ConstituentsArray);
				
				Result += getFunctionOnVHDL(ColumnNames[i].substring(1), parseInputSignalsNames(InputSignalsNames), ConstituentsArray);
			}
		
		Result += "entity UPPER is\n"+"\tport(\n\t\tCLK : in bit;\n";
		
		String[] InputSignals = parseInputSignalsNames(InputSignalsNames);
		
		for (int i =0; i<InputSignals.length; i++)
			if (InputSignals[i].contains("Q"))
				Result+="\t\t"+InputSignals[i]+" : inout bit;\n";
			else
				Result+="\t\t"+InputSignals[i]+" : in bit;\n";
		
		for (int i = 0; i<ColumnNames.length; i++)
			if (ColumnNames[i].contains(ArithmeticalNode.NAME_CHARACTER) && !ColumnNames[i].contains("m"))
				Result+="\t\t"+ColumnNames[i]+" : out bit;\n";
		
		Result = Result.substring(0, Result.length()-2)+"\n";
		
		Result += "\t);\n" +
				"end UPPER;\n\n";
		
		Result += "architecture BEH of UPPER is\n";
		
		Result += "signal ";
		
		ArrayList<Integer> QNumbers = new ArrayList<Integer>();
		
		for (int i = 0; i<InputSignals.length; i++)
			if (InputSignals[i].contains("Q"))
				QNumbers.add(Integer.parseInt(InputSignals[i].substring(1, InputSignals[i].length())));
		
		for (int i = 0; i<QNumbers.size(); i++)
			if (i==(QNumbers.size()-1)) {
			
				Result += "J"+QNumbers.get(i)+", ";
				Result += "K"+QNumbers.get(i)+", ";
				Result += "SQ"+QNumbers.get(i)+" : bit;\n";
			}
			else {
				
				Result += "J"+QNumbers.get(i)+", ";
				Result += "K"+QNumbers.get(i)+", ";
				Result += "SQ"+QNumbers.get(i)+", ";
			}
		
		Result += "begin\n";
		
		for (int i = 0; i<QNumbers.size(); i++)
			Result += "\tSQ"+QNumbers.get(i)+" <= Q"+QNumbers.get(i)+";\n";
		Result += "\n";
		
		int LabelCounter = 1;
		
		for (int i = 0; i<ColumnNames.length; i++)
			if (ColumnNames[i].contains(ArithmeticalNode.NAME_CHARACTER) && !ColumnNames[i].contains("m")) {
				
				Result += "\tL"+(LabelCounter++)+": entity "+ColumnNames[i]+"(BEH) port map (";
				for (int j = 0; j<InputSignals.length; j++)
					if (InputSignals[j].contains("Q"))
						Result += "S"+InputSignals[j]+", ";
					else
						Result += InputSignals[j]+", ";	
				Result += ColumnNames[i]+");\n";
			}
		Result += "\n";
		
		for (int i = 0; i<QNumbers.size(); i++) {

			Result += "\tL"+(LabelCounter++)+": entity J"+QNumbers.get(i)+"(BEH) port map (";
			for (int j = 0; j<InputSignals.length; j++)
				if (InputSignals[j].contains("Q"))
					Result += "S"+InputSignals[j]+", ";
				else
					Result += InputSignals[j]+", ";
			Result += "J"+QNumbers.get(i)+");\n";
			
			Result += "\tL"+(LabelCounter++)+": entity K"+QNumbers.get(i)+"(BEH) port map (";
			for (int j = 0; j<InputSignals.length; j++)
				if (InputSignals[j].contains("Q"))
					Result += "S"+InputSignals[j]+", ";
				else
					Result += InputSignals[j]+", ";
			Result += "K"+QNumbers.get(i)+");\n";
		}
		Result += "\n";
		
		for (int i = 0; i<QNumbers.size(); i++)
			Result += "\tL"+(LabelCounter++)+": entity Q"+QNumbers.get(i)+"(BEH) port map (J"+QNumbers.get(i)+", K"+QNumbers.get(i)+", CLK, Q"+QNumbers.get(i)+");\n";
		
		Result += "end BEH;\n\n";
					
		return Result;
	}
	
	private void setAllListeners() {
		
		bAddBegin.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent e) {
				
				if (!lsaPanel.isBeginExist())
					lsaPanel.addDrawObject(new BeginNode());
				else
					JOptionPane.showMessageDialog(MainWindow.this, "Only one begin node allowed.");
			}
		});
		
		bAddEnd.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent e) {
				
				if (!lsaPanel.isEndExist())
					lsaPanel.addDrawObject(new EndNode());
				else
					JOptionPane.showMessageDialog(MainWindow.this, "Only one end node allowed.");
			}
		});
		
		bAddLogical.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent e) {
				
				LogicalNodePropertiesDialog currentDialog;
				
				currentDialog = new LogicalNodePropertiesDialog(MainWindow.this, 1, 1);
				
				if (currentDialog.isDisplayable()) {
					
					lsaPanel.addDrawObject(new LogicalNode(currentDialog.getNodeNumber(), currentDialog.getOnFalseArrowNumber()));
					currentDialog.dispose();
				}
			}
		});
		
		bAddArithmetical.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent e) {
				
				ArithmeticalNodePropertiesDialog currentDialog;
				
				currentDialog = new ArithmeticalNodePropertiesDialog(MainWindow.this, 1);
				
				if (currentDialog.isDisplayable()) {
					
					lsaPanel.addDrawObject(new ArithmeticalNode(currentDialog.getNodeNumber()));
					currentDialog.dispose();
				}
			}
		});
		
		bAddOpenBracket.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent e) {
				
				if (lsaPanel.isOpenBracketAllowed())
					lsaPanel.addDrawObject(new OpenBracketNode());
				else
					JOptionPane.showMessageDialog(MainWindow.this, "Can't add open bracket.");
			}
		});
		
		bAddCloseBracket.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent e) {
				
				if (lsaPanel.isCloseBracketAllowed())
					lsaPanel.addDrawObject(new CloseBracketNode());
				else
					JOptionPane.showMessageDialog(MainWindow.this, "Can't add close bracket.");
			}
		});
		
		bAddInArrow.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent e) {
				
				ArrowNodePropertiesDialog currentDialog;
				
				currentDialog = new ArrowNodePropertiesDialog(MainWindow.this, 1);
				
				if (currentDialog.isDisplayable()) {
					
					if (!lsaPanel.isInArrowExist(currentDialog.getNodeNumber()))
						lsaPanel.addDrawObject(new InArrowNode(currentDialog.getNodeNumber()));
					else 
						JOptionPane.showMessageDialog(MainWindow.this, "In arrow with number "+currentDialog.getNodeNumber()+" already exist.");

					currentDialog.dispose();
				}
			}
		});
		
		bAddOutArrow.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent e) {
				
				ArrowNodePropertiesDialog currentDialog;
				
				currentDialog = new ArrowNodePropertiesDialog(MainWindow.this, 1);
				
				if (currentDialog.isDisplayable()) {
					
					lsaPanel.addDrawObject(new OutArrowNode(currentDialog.getNodeNumber()));

					currentDialog.dispose();
				}
			}
		});
		
		bSaveLSA.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent e) {
				
				if (lsaPanel.isCorrectInput()) {
					
					FileChoosingDialog.setFileFilter(new LSAF_Filter());
					
					if (JFileChooser.APPROVE_OPTION==FileChoosingDialog.showSaveDialog(MainWindow.this)) {

						try {
							if (FileChoosingDialog.getSelectedFile().getName().endsWith(".lsaf"))
								outObject = new ObjectOutputStream(new FileOutputStream(FileChoosingDialog.getSelectedFile().getPath()));
							else
								outObject = new ObjectOutputStream(new FileOutputStream(FileChoosingDialog.getSelectedFile().getPath()+".lsaf"));
						
							outObject.writeObject(lsaPanel.getDrawObjects());
							outObject.writeObject(lsaPanel.getCoherenceMatrix());

							outObject.close();
							
						} catch (FileNotFoundException e1) {
							e1.printStackTrace();
							JOptionPane.showMessageDialog(MainWindow.this, "Can't Save Algorithm.");
						} catch (IOException e1) {
							e1.printStackTrace();
							JOptionPane.showMessageDialog(MainWindow.this, "Can't Save Algorithm.");
						}
					}
				}
				else
					JOptionPane.showMessageDialog(MainWindow.this, "Can't Save Algorithm.");
			}
		});
		
		bOpenLSA.addActionListener(new ActionListener() {

			@SuppressWarnings("unchecked")
			public void actionPerformed(ActionEvent e) {
				
				FileChoosingDialog.setFileFilter(new LSAF_Filter());
				
				if (JFileChooser.APPROVE_OPTION==FileChoosingDialog.showOpenDialog(MainWindow.this)) {

					try {
						if (FileChoosingDialog.getSelectedFile().getName().endsWith(".lsaf"))
							inObject = new ObjectInputStream(new FileInputStream(FileChoosingDialog.getSelectedFile().getPath()));
						else
							inObject = new ObjectInputStream(new FileInputStream(FileChoosingDialog.getSelectedFile().getPath()+".lsaf"));
						
						lsaPanel.addObjectsFromFile((ArrayList<AbstractNode>)inObject.readObject(), (int[][])inObject.readObject());
						
						inObject.close();
						
					} catch (FileNotFoundException e1) {
						JOptionPane.showMessageDialog(MainWindow.this, "File Not Found.");
					} catch (IOException e1) {
						JOptionPane.showMessageDialog(MainWindow.this, "Can't Open Algorithm.");
					} catch (ClassNotFoundException e1) {
						JOptionPane.showMessageDialog(MainWindow.this, "Wrong File Format.");
					}
				}
			}
		});
		
		bMarkMG.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent e) {
				
				if (!mgPanel.getDrawObjects().isEmpty()) {
					
					mgPanel.setGrayCode();
					
					if (!fMiliGraph.isVisible())
						fMiliGraph.setVisible(true);
				}
				else
					JOptionPane.showMessageDialog(MainWindow.this, "Can't Mark Mili Graph.");
			}
		});
		
		bDrawMG.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent e) {
				
				if (lsaPanel.isCorrectInput()) {
					mgPanel.addDrawObjects(lsaPanel.getMiliDrawObjects());
					
					if (!fMiliGraph.isVisible())
						fMiliGraph.setVisible(true);
				}
				else
					JOptionPane.showMessageDialog(MainWindow.this, "Can't Draw Mili's Graph.");
			}
		});
		
		bSaveMG.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent e) {
				
				if (!mgPanel.getDrawObjects().isEmpty()) {
					
					FileChoosingDialog.setFileFilter(new MGF_Filter());
					
					if (JFileChooser.APPROVE_OPTION==FileChoosingDialog.showSaveDialog(MainWindow.this)) {

						try {
							if (FileChoosingDialog.getSelectedFile().getName().endsWith(".mgf"))
								outText = new BufferedWriter(new FileWriter(FileChoosingDialog.getSelectedFile().getPath()));
							else
								outText = new BufferedWriter(new FileWriter(FileChoosingDialog.getSelectedFile().getPath()+".mgf"));
						
							
							outText.write(mgPanel.getGraphTextFormat());
							
							outText.close();

						} catch (FileNotFoundException e1) {
							e1.printStackTrace();
							JOptionPane.showMessageDialog(MainWindow.this, "Can't Save Mili Graph.");
						} catch (IOException e1) {
							e1.printStackTrace();
							JOptionPane.showMessageDialog(MainWindow.this, "Can't Save Mili Graph.");
						}
					}
				}
				else
					JOptionPane.showMessageDialog(MainWindow.this, "Can't Save Mili Graph.");
			}
		});
		
		bOpenMG.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent e) {
				
				FileChoosingDialog.setFileFilter(new MGF_Filter());
				
				if (JFileChooser.APPROVE_OPTION==FileChoosingDialog.showOpenDialog(MainWindow.this)) {

					try {
						if (FileChoosingDialog.getSelectedFile().getName().endsWith(".mgf"))
							inText = new BufferedReader(new FileReader(FileChoosingDialog.getSelectedFile().getPath()));
						else
							inText = new BufferedReader(new FileReader(FileChoosingDialog.getSelectedFile().getPath()+".mgf"));
						
						mgPanel.addDrawObjectsFromString(inText);
						
						if (!fMiliGraph.isVisible())
							fMiliGraph.setVisible(true);
						
					} catch (FileNotFoundException e1) {
						JOptionPane.showMessageDialog(MainWindow.this, "File Not Found.");
					}
				}
			}
		});
		
		bShowST.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent e) {
				
				if (!fStructureTable.isVisible())
					fStructureTable.setVisible(true);
			}
		});
		
		bCreateST.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent e) {
				
				if (mgPanel.prepareDataForStructureTableCreation()) {
					
					tStructureTable.setModel(new DefaultTableModel(mgPanel.getStructureTableData(), mgPanel.getStructureTableColumnsNames()));
					
					if (!fStructureTable.isVisible())
						fStructureTable.setVisible(true);
				}
				else
					JOptionPane.showMessageDialog(MainWindow.this, "Can't Create Structure Table.");
					
			}
		});
		
		bSaveST.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent e) {
				
				if ((tStructureTable.getModel().getRowCount()!=0) && (tStructureTable.getModel().getColumnCount()!=0)) {
					
					FileChoosingDialog.setFileFilter(new STF_Filter());
					
					if (JFileChooser.APPROVE_OPTION==FileChoosingDialog.showSaveDialog(MainWindow.this)) {

						try {
							if (FileChoosingDialog.getSelectedFile().getName().endsWith(".stf"))
								outObject = new ObjectOutputStream(new FileOutputStream(FileChoosingDialog.getSelectedFile().getPath()));
							else
								outObject = new ObjectOutputStream(new FileOutputStream(FileChoosingDialog.getSelectedFile().getPath()+".stf"));
						
							String[] ColumnNames = new String[tStructureTable.getColumnCount()];
							String[][] TableData = new String[tStructureTable.getRowCount()][tStructureTable.getColumnCount()];
							
							for (int i = 0; i<tStructureTable.getColumnCount(); i++) 
								ColumnNames[i] = tStructureTable.getColumnName(i);
							
							for (int i = 0; i<tStructureTable.getRowCount(); i++)
								for (int j = 0; j<tStructureTable.getColumnCount(); j++)
									TableData[i][j] = (String) tStructureTable.getValueAt(i, j);
							
							outObject.writeObject(TableData);
							outObject.writeObject(ColumnNames);
							
							outObject.close();

						} catch (FileNotFoundException e1) {
							e1.printStackTrace();
							JOptionPane.showMessageDialog(MainWindow.this, "Can't Save Structure Table.");
						} catch (IOException e1) {
							e1.printStackTrace();
							JOptionPane.showMessageDialog(MainWindow.this, "Can't Save Structure Table.");
						}
					}
				}
				else
					JOptionPane.showMessageDialog(MainWindow.this, "Can't Save Structure Table.");
			}
		});
		
		bOpenST.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent e) {
				
				FileChoosingDialog.setFileFilter(new STF_Filter());
				
				if (JFileChooser.APPROVE_OPTION==FileChoosingDialog.showOpenDialog(MainWindow.this)) {

					try {
						if (FileChoosingDialog.getSelectedFile().getName().endsWith(".stf"))
							inObject = new ObjectInputStream(new FileInputStream(FileChoosingDialog.getSelectedFile().getPath()));
						else
							inObject = new ObjectInputStream(new FileInputStream(FileChoosingDialog.getSelectedFile().getPath()+".stf"));
						
						tStructureTable.setModel(new DefaultTableModel((String[][]) inObject.readObject(), (String[]) inObject.readObject()));
						
						inObject.close();
						
						if (!fStructureTable.isVisible())
							fStructureTable.setVisible(true);
						
					} catch (FileNotFoundException e1) {
						JOptionPane.showMessageDialog(MainWindow.this, "File Not Found.");
					} catch (IOException e1) {
						JOptionPane.showMessageDialog(MainWindow.this, "Can't Open Structure Table.");
					} catch (ClassNotFoundException e1) {
						JOptionPane.showMessageDialog(MainWindow.this, "Wrong File Format.");
					}
				}
			}
		});
		
		bMinimizeF.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent e) {
				
				if ((tStructureTable.getModel().getRowCount()!=0) && (tStructureTable.getModel().getColumnCount()!=0)) {
					
					ArrayList<Object> AllTableData = minimizeAllFunctions();
					
					tMinimizedFunctions.setModel(new DefaultTableModel((String[][]) AllTableData.get(1), (String[]) AllTableData.get(0)));
					
					if (!fMinimizedFunctions.isVisible())
						fMinimizedFunctions.setVisible(true);
				}
				else
					JOptionPane.showMessageDialog(MainWindow.this, "Can't Minimize Functions.");
			}
		});
		
		bSaveMFToVHDL.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent e) {
				
				if ((tMinimizedFunctions.getModel().getRowCount()!=0) && (tMinimizedFunctions.getModel().getColumnCount()!=0) && (!InputSignalsNames.isEmpty())) {
					
					FileChoosingDialog.setFileFilter(new VHD_Filter());
					
					if (JFileChooser.APPROVE_OPTION==FileChoosingDialog.showSaveDialog(MainWindow.this)) {

						try {
							if (FileChoosingDialog.getSelectedFile().getName().endsWith(".vhd"))
								outText = new BufferedWriter(new FileWriter(FileChoosingDialog.getSelectedFile().getPath()));
							else
								outText = new BufferedWriter(new FileWriter(FileChoosingDialog.getSelectedFile().getPath()+".vhd"));
						
							
							String[] ColumnNames = new String[tMinimizedFunctions.getColumnCount()];
							String[][] TableData = new String[tMinimizedFunctions.getRowCount()][tMinimizedFunctions.getColumnCount()];
							
							for (int i = 0; i<tMinimizedFunctions.getColumnCount(); i++) 
								ColumnNames[i] = tMinimizedFunctions.getColumnName(i);
							
							for (int i = 0; i<tMinimizedFunctions.getRowCount(); i++)
								for (int j = 0; j<tMinimizedFunctions.getColumnCount(); j++)
									TableData[i][j] = (String) tMinimizedFunctions.getValueAt(i, j);
							
							outText.write(getMinimizedFunctionsOnVHDL(ColumnNames, TableData));
							
							outText.close();

						} catch (FileNotFoundException e1) {
							e1.printStackTrace();
							JOptionPane.showMessageDialog(MainWindow.this, "Can't Save Minimized Functions To VHDL.");
						} catch (IOException e1) {
							e1.printStackTrace();
							JOptionPane.showMessageDialog(MainWindow.this, "Can't Save Minimized Functions To VHDL.");
						}
					}
				}
				else
					JOptionPane.showMessageDialog(MainWindow.this, "Not Enough Data For Saving Minimized Functions To VHDL.");
			}
		});
		
		bShowMF.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent e) {
				
				if (!fMinimizedFunctions.isVisible())
					fMinimizedFunctions.setVisible(true);
			}
		});
		
		bSaveMF.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent e) {
				
				if ((tMinimizedFunctions.getModel().getRowCount()!=0) && (tMinimizedFunctions.getModel().getColumnCount()!=0)) {
					
					FileChoosingDialog.setFileFilter(new MFF_Filter());
					
					if (JFileChooser.APPROVE_OPTION==FileChoosingDialog.showSaveDialog(MainWindow.this)) {

						try {
							if (FileChoosingDialog.getSelectedFile().getName().endsWith(".mff"))
								outObject = new ObjectOutputStream(new FileOutputStream(FileChoosingDialog.getSelectedFile().getPath()));
							else
								outObject = new ObjectOutputStream(new FileOutputStream(FileChoosingDialog.getSelectedFile().getPath()+".mff"));
						
							String[] ColumnNames = new String[tMinimizedFunctions.getColumnCount()];
							String[][] TableData = new String[tMinimizedFunctions.getRowCount()][tMinimizedFunctions.getColumnCount()];
							
							for (int i = 0; i<tMinimizedFunctions.getColumnCount(); i++) 
								ColumnNames[i] = tMinimizedFunctions.getColumnName(i);
							
							for (int i = 0; i<tMinimizedFunctions.getRowCount(); i++)
								for (int j = 0; j<tMinimizedFunctions.getColumnCount(); j++)
									TableData[i][j] = (String) tMinimizedFunctions.getValueAt(i, j);
							
							outObject.writeObject(TableData);
							outObject.writeObject(ColumnNames);
							outObject.writeObject(InputSignalsNames);
							
							outObject.close();

						} catch (FileNotFoundException e1) {
							e1.printStackTrace();
							JOptionPane.showMessageDialog(MainWindow.this, "Can't Save Minimized Functions Table.");
						} catch (IOException e1) {
							e1.printStackTrace();
							JOptionPane.showMessageDialog(MainWindow.this, "Can't Save Minimized Functions Table.");
						}
					}
				}
				else
					JOptionPane.showMessageDialog(MainWindow.this, "Can't Save Minimized Functions Table.");
			}
		});
		
		bOpenMF.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent e) {
				
				FileChoosingDialog.setFileFilter(new MFF_Filter());
				
				if (JFileChooser.APPROVE_OPTION==FileChoosingDialog.showOpenDialog(MainWindow.this)) {

					try {
						if (FileChoosingDialog.getSelectedFile().getName().endsWith(".mff"))
							inObject = new ObjectInputStream(new FileInputStream(FileChoosingDialog.getSelectedFile().getPath()));
						else
							inObject = new ObjectInputStream(new FileInputStream(FileChoosingDialog.getSelectedFile().getPath()+".mff"));
						
						tMinimizedFunctions.setModel(new DefaultTableModel((String[][]) inObject.readObject(), (String[]) inObject.readObject()));
						InputSignalsNames = (String) inObject.readObject();
						
						inObject.close();
						
						if (!fMinimizedFunctions.isVisible())
							fMinimizedFunctions.setVisible(true);
						
					} catch (FileNotFoundException e1) {
						JOptionPane.showMessageDialog(MainWindow.this, "File Not Found.");
					} catch (IOException e1) {
						JOptionPane.showMessageDialog(MainWindow.this, "Can't Open Minimized Functions Table.");
					} catch (ClassNotFoundException e1) {
						JOptionPane.showMessageDialog(MainWindow.this, "Wrong File Format.");
					}
				}
			}
		});
		
		bDrawScheme.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent e) {
				
				if ((tMinimizedFunctions.getModel().getRowCount()!=0)
						&& (tMinimizedFunctions.getModel().getColumnCount()!=0)
						&& (!InputSignalsNames.isEmpty())) {
					
					String[] ColumnNames = new String[tMinimizedFunctions.getColumnCount()];
					String[][] TableData = new String[tMinimizedFunctions.getRowCount()][tMinimizedFunctions.getColumnCount()];
							
					for (int i = 0; i<tMinimizedFunctions.getColumnCount(); i++) 
						ColumnNames[i] = tMinimizedFunctions.getColumnName(i);
							
					for (int i = 0; i<tMinimizedFunctions.getRowCount(); i++)
						for (int j = 0; j<tMinimizedFunctions.getColumnCount(); j++)
							TableData[i][j] = (String) tMinimizedFunctions.getValueAt(i, j);
					
					Generator gScheme = new Generator();
					pScheme.setElements(gScheme.createScheme(parseInputSignalsNames(InputSignalsNames), ColumnNames, TableData));
					
					fScheme.add(spScheme);
					fScheme.setSize(500, 600);
					fScheme.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
					fScheme.setVisible(true);
				}
				else
					JOptionPane.showMessageDialog(MainWindow.this, "Not Enough Data For Drawing Scheme Of Minimized Functions.");
			}
		});
		
		lsaPanel.addPropertyChangeListener(new PropertyChangeListener() {

			public void propertyChange(PropertyChangeEvent evt) {
				
				lsaPanel.setSize(lsaPanel.getPreferredSize());
				lsaPanelScroll.updateUI();
			}
		});
		
		lsaPanel.addKeyListener(new KeyListener() {

			public void keyPressed(KeyEvent e) {

				if (e.getKeyCode()==KeyEvent.VK_DELETE)
					lsaPanel.removeSelectedNode();
			}

			public void keyReleased(KeyEvent e) {}

			public void keyTyped(KeyEvent e) {}
		});
	}
	
	public void saveImage(BufferedImage Image) {
		if (Image != null) {
			
			FileChoosingDialog.setFileFilter(new PNG_Filter());
			
			if (JFileChooser.APPROVE_OPTION==FileChoosingDialog.showSaveDialog(fScheme)) {

				
				try {
					File ImageFile;
					if (FileChoosingDialog.getSelectedFile().getName().endsWith(".png"))
						ImageFile = new File(FileChoosingDialog.getSelectedFile().getPath());
					else
						ImageFile = new File(FileChoosingDialog.getSelectedFile().getPath()+".mff");
				
					ImageIO.write(Image, "png", ImageFile);
				} catch (FileNotFoundException e1) {
					e1.printStackTrace();
					JOptionPane.showMessageDialog(MainWindow.this, "Can't Save Scheme Image.");
				} catch (IOException e1) {
					e1.printStackTrace();
					JOptionPane.showMessageDialog(MainWindow.this, "Can't Save Scheme Image.");
				}
			}
		}
		else
			JOptionPane.showMessageDialog(MainWindow.this, "Can't Save Scheme Image.");
	}
}
