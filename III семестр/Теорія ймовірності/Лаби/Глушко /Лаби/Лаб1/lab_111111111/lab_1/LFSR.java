package lab_1;



public class LFSR {
	
	private byte Length;
	
	private byte LFSRType;
	
	private byte [] ByteComb,Polinom;
	
	public LFSR(byte [] init, byte Type, String PathToPolinoms){
		this.Length = (byte) init.length;
		this.ByteComb = init;
		this.LFSRType = Type;
		Polinom = PolinomLoad.LodaFromFile(PathToPolinoms, this.GetLength());
	}
	
	public byte GetLength(){
		return this.Length;
	}
	
	private byte LinearShift(){
		byte Sum = 0,Result = this.ByteComb[this.Length-1];
		for (byte i = 0; i<=ByteComb.length-1; i++){
			if (this.Polinom[i] == 1){
				Sum = (byte) (Sum + (this.ByteComb[i]));
			}
		}
		for (byte i = (byte) (this.Length-1); i>=1; i--){
			this.ByteComb[i] = this.ByteComb[i-1];
		}
		this.ByteComb[0] = (byte) ((Sum)%(2));
		return Result;
	}
	
	private byte SepratedShift(){
		byte Result = this.ByteComb[this.Length-1];
		for (byte i = (byte) (this.Length-1); i>=1; i--){
			if (this.Polinom[i-1] == 1){
				this.ByteComb[i] = (byte) ((Result+this.ByteComb[i-1])%2);
			} else {
				this.ByteComb[i] = this.ByteComb[i-1];
			}
		}
		this.ByteComb[0] = Result;
		return Result;
	}
	
	public byte GetNextValue(){
		byte Result;
		if (this.LFSRType == 1){
			Result = this.LinearShift();
		} else {
			Result = this.SepratedShift();
		}
		return Result;
	}
}
