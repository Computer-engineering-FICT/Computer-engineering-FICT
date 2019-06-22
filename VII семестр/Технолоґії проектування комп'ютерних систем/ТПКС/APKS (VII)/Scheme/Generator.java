package Scheme;

import java.util.ArrayList;
import java.util.Arrays;

import Scheme.Elements.Connector;
import Scheme.Elements.Element;
import Scheme.Elements.JKTrigger;
import Scheme.Elements.NOT;
import Scheme.Elements.OutputVariable;
import Scheme.Elements.ThreeAND;
import Scheme.Elements.InputVariable;

public class Generator {
	
	private ArrayList<Element> SchemeElements;
	
	private ArrayList<Connector> InputConnectors; 
	private ArrayList<Connector> OutputConnectors;
	
	public ArrayList<Element> createScheme(String[] InputSignals, String[] ColumnNames, String[][] TableData) {
		
		System.out.println(Arrays.toString(InputSignals));
		
		SchemeElements = new ArrayList<Element>();
		
		InputConnectors = new ArrayList<Connector>(); 
		OutputConnectors = new ArrayList<Connector>();
		
		createInputConnectors(InputSignals);
		
		for (int i = 0; i<ColumnNames.length; i++) {
			if (ColumnNames[i].contains("m")) {
				
				ArrayList<String> ConstituentsList = new ArrayList<String>();
				for (int j = 0; j<TableData.length; j++)
					if (TableData[j][i]!=null)
						ConstituentsList.add(TableData[j][i]);
				
				String[] ConstituentsArray = new String[ConstituentsList.size()];
				ConstituentsArray = ConstituentsList.toArray(ConstituentsArray);
				
				convertFunctionToScheme(ColumnNames[i].substring(1), InputSignals, ConstituentsArray);
			}
		}
		
		return SchemeElements;
	}
	
	private void createInputConnectors(String[] InputSignals) {
		InputVariable CurrentVariable;
		NOT CurrentNOT;
		
		Connector CurrentPositiveConnector;
		Connector CurrentNegativeConnector;
		
		for (int i = 0; i<InputSignals.length; i++) {
			if (InputSignals[i].contains("Q")) {
				CurrentPositiveConnector = createTrigger(InputSignals[i]);
			} else {
				CurrentVariable = new InputVariable();
				CurrentPositiveConnector = new Connector(InputSignals[i], CurrentVariable);
				CurrentVariable.setOutput(CurrentPositiveConnector);
				SchemeElements.add(CurrentVariable);
			}
				
			CurrentNOT = new NOT(CurrentPositiveConnector);
			CurrentNegativeConnector = new Connector("!"+InputSignals[i], CurrentNOT);
			
			SchemeElements.add(CurrentNOT);
			InputConnectors.add(CurrentPositiveConnector);
			InputConnectors.add(CurrentNegativeConnector);
		}
	}
	
	private Connector createTrigger(String OutputSignalName) {
		JKTrigger Trigger;
		
		Connector Q;
		
		Trigger = new JKTrigger();

		Q = new Connector(OutputSignalName, Trigger);
		
		Trigger.setQ(Q);
		
		SchemeElements.add(Trigger);
		
		InputConnectors.add(Q);
		
		return Q;
	}
	
	private Connector getInputConnectorByName(String Name) {
		for (int i = 0; i<InputConnectors.size(); i++) {
			if (InputConnectors.get(i).getName().equals(Name)) {
				return InputConnectors.get(i);
			}
		}
		
		return null;
	}
	
	private JKTrigger getTriggerByQ(Connector Q) {
		for (int i = 0; i<SchemeElements.size(); i++) {
			if (SchemeElements.get(i).getClass().equals(JKTrigger.class) && ((JKTrigger) SchemeElements.get(i)).getQ().equals(Q)) {
				return (JKTrigger) SchemeElements.get(i);
			}
		}
		
		return null;
	}
	
	@SuppressWarnings("unchecked")
	private ArrayList<Connector>[] parseConstituents(String[] InputSignals, String[] Constituents) {
		ArrayList<Connector>[] Result = new ArrayList[Constituents.length];
		ArrayList<Connector> ParsedConstituent;
		
		for (int i = 0; i<Constituents.length; i++) {
			ParsedConstituent = new ArrayList<Connector>();
			
			for (int j = 0; j<Constituents[i].length(); j++) {
				if (Constituents[i].charAt(j) == '0') {
					ParsedConstituent.add(getInputConnectorByName("!"+InputSignals[j]));
				} else if (Constituents[i].charAt(j) == '1') {
					ParsedConstituent.add(getInputConnectorByName(InputSignals[j]));
				}
			}
			
			Result[i] = ParsedConstituent;
		}
		
		return Result;
	}
	
	private void convertFunctionToScheme(String FunctionName, String[] InputSignals, String[] Constituents) {
		
		ArrayList<Connector>[] ParsedConstituents = this.parseConstituents(InputSignals, Constituents);
		
		ArrayList<Connector> FinalConstituent = new ArrayList<Connector>();
		for (int i = 0; i<ParsedConstituents.length; i++) {
			FinalConstituent.add(convertConstituentToScheme(null, ParsedConstituents[i], ParsedConstituents.length));
		}
		
		Connector FunctionOutput = convertConstituentToScheme(FunctionName, FinalConstituent, ParsedConstituents.length);
		FunctionOutput.setName(FunctionName);
		OutputConnectors.add(FunctionOutput);
		
		if (FunctionName.contains("J") || FunctionName.contains("K")) {
			JKTrigger CurrentTrigger = getTriggerByQ(getInputConnectorByName("Q"+FunctionName.substring(1)));
			if (FunctionName.contains("J")) {
				CurrentTrigger.setJ(FunctionOutput);
			} else {
				CurrentTrigger.setK(FunctionOutput);
			}
		} else {
			OutputVariable FunctionOut = new OutputVariable();
			FunctionOut.setInput(FunctionOutput);
			SchemeElements.add(FunctionOut);
		}
	}
	
	private Connector convertConstituentToScheme(String OutputName, ArrayList<Connector> Constituent, int ConstituentsQuantityInFunction) {
		ArrayList<Connector> CurrentElementInputs = new ArrayList<Connector>();
		Connector CurrentOutput;
		Element CurrentElement;
		
		while (Constituent.size() > 1) {
			CurrentElementInputs.clear();
			
			while (CurrentElementInputs.size()<3) {
				if (Constituent.size()>0) {
					CurrentElementInputs.add(Constituent.remove(0));
				} else {
					CurrentElementInputs.add(CurrentElementInputs.get(CurrentElementInputs.size()-1));
				}
			}
			
			CurrentElement = new ThreeAND(CurrentElementInputs.get(0), CurrentElementInputs.get(1), CurrentElementInputs.get(2));
			CurrentOutput = new Connector(null, CurrentElement);
			
			SchemeElements.add(CurrentElement);
			Constituent.add(CurrentOutput);
		}
		
		if (ConstituentsQuantityInFunction>1) {
		
			CurrentElement = new NOT(Constituent.remove(0));
			CurrentOutput = new Connector(OutputName, CurrentElement);
			SchemeElements.add(CurrentElement);
			Constituent.add(CurrentOutput);
		}
		
		return Constituent.remove(0);
	}
}
