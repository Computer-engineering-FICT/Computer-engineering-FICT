package lab_1;

public class StartStop {
	
	private LFSR L_M,L_C;
	
	private byte LastSignal;
	
	public StartStop(byte [] L_Main, byte [] L_Control,byte Type, String PathToPolinoms){
		this.L_M = new LFSR(L_Main, Type, PathToPolinoms);
		this.L_C = new LFSR(L_Control, Type, PathToPolinoms);
		this.LastSignal = 0;
	}
	
	public byte GetNextValue(){
		byte Control = this.L_C.GetNextValue();
		if (Control == 1){
			this.LastSignal = this.L_M.GetNextValue();
		}
		return this.LastSignal;
	}
}
