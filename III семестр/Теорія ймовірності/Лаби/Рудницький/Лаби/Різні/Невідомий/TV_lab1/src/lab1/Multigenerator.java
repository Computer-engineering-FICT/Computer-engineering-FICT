package lab1;
class Multigenerator {
	
	LFSR R0 = new LFSR(16);
	LFSR R1 = new LFSR(16);
	LFSR R2 = new LFSR(16);
	LFSR R3 = new LFSR(16);
	LFSR R4 = new LFSR(16);
	LFSR R5 = new LFSR(16);
	LFSR R6 = new LFSR(16);
	LFSR R7 = new LFSR(16);

	LFSR K0 = new LFSR(16);
	LFSR K1 = new LFSR(16);
	LFSR K2 = new LFSR(16);
	int [] mult = new int [8];
	
	public  int simple() {
		String str = (toString(K0.End())) + (toString(K1.End())) +(toString(K2.End())) ;
		return Integer.parseInt(str, 2);
	}
	
	String toString(int i){
		String str;
		if(i==1){
			str="1";
		}else{
			str="0";
		}
		return str;
	}
	
	public int nextBit(){
		mult[0]= R0.End();
		mult[1]= R1.End();
		mult[2]= R2.End();
		mult[3]= R3.End();
		mult[4]= R4.End();
		mult[5]= R5.End();
		mult[6]= R6.End();
		mult[7]= R7.End();
		R0.LShift();
		R1.LShift();
		R2.LShift();
		R3.LShift();
		R4.LShift();
		R5.LShift();
		R6.LShift();
		R7.LShift();
		K0.LShift();
		K1.LShift();
		K2.LShift();
		return mult[this.simple()];
	}
}
