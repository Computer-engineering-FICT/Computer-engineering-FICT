package lab1;
import java.util.Random;
public class LFSR {
	protected boolean[] reg;
	protected Random random = new Random();
	LFSR() {
	}
	LFSR(int sz) {
		reg = new boolean[sz];
		Rand();
	}
	 public void Shift(int end, int begin){
		 for(int i=end;i>begin;--i){
			 reg[i]=reg[i-1];
		 }
	 }

	public boolean LShift() {
		boolean buf=reg[15];
		Shift(15,12);
		reg[12]=buf^reg[11];
		Shift(11,3);
		reg[3]=buf^reg[2];
		Shift(2,1);
		reg[1] = buf^reg[0];
		reg[0]=buf;
		return buf;
	}

	void Rand() {
		for (int i = 0; i < reg.length; ++i) {
			reg[i] = random.nextBoolean();
		}
	}

	public int End() {
		int end;
		if (reg[0] == true) {
			end = 1;
		} else {
			end = 0;
		}
		return end;
	}
	public  void ztrue(){
		for(int i=0;i<reg.length;++i){
			reg[i]=true;
		}
	}
}
