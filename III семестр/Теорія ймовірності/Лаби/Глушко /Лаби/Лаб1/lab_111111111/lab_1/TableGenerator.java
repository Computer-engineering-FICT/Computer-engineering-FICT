package lab_1;

public class TableGenerator {
	
	private LFSR [] L;
	
	private byte [] Number;
	
	private String Table;
	
	public TableGenerator(byte [][] LFSR_Array,byte Type,String PathToPolinoms, String PathToTable){
		this.L = new LFSR [LFSR_Array.length];
		for (byte i=0; i<=LFSR_Array.length-1; i++){
			this.L[i] = new LFSR(LFSR_Array[i],Type,PathToPolinoms);
		}
		this.Table = PathToTable;
		this.Number = new byte [this.L.length];
	}
	
	public byte GetNextValue(){
		for (byte i=0; i<=this.L.length-1; i++){
			this.Number[i] = this.L[i].GetNextValue();
		}
		String StrValue = "";
		for (byte i=0; i<=this.L.length-1; i++){
			StrValue = StrValue + this.Number[i];
		}
		int CurrentTableValue = Integer.parseInt(StrValue, 2);
		byte Result = TableValueLoad.LoadValueFromFile(this.Table, CurrentTableValue);
		return Result;
	}
}
