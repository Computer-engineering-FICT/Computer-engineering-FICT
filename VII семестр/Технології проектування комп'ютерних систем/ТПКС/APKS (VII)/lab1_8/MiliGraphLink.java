package lab1_8;

public class MiliGraphLink {
	
	private MiliGraphNode node;
	private String inputSignals;
	private String outputSignals;
	
	public MiliGraphLink(MiliGraphNode LinkNode, String InputSignalsNames, String OutputSignalsNames) {
		
		node = LinkNode;
		inputSignals = InputSignalsNames;
		outputSignals = OutputSignalsNames;
	}
	
	public MiliGraphNode getLinkNode() {
		
		return node;
	}
	
	public String getInputSignalsNames() {
		
		if (inputSignals.equals(""))
			return "-";

		return inputSignals;
	}

	public String getOutputSignalsNames() {
		
		if (outputSignals.equals(""))
			return "0";
		
		return outputSignals;
	}
}
