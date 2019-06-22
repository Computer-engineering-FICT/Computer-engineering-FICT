public class LFSR {
	int[] razr = {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0};
	int gen;
	int[] pol;

	public LFSR(int[] pol) {
		int res = this.razr[17];
		for (int i = 17; i > 0; i--) {
			if (pol[i - 1] == 1) {
                this.razr[i] = xor((this.razr[i - 1]), res);
            } else {
                this.razr[i] = this.razr[i - 1];
            }
		}
		this.razr[0] = res;
		this.pol = pol;
	}
	
	public static int xor(int a, int b) {
		if ((a + b) == 2) {
			return 0;
		}
		if((a + b) == 1) {
			return 1;
		}
		return 0;
	}
	
	public int generate() {
		int res = this.razr[17];
		for (int i = 17; i > 0; i--) {
			if (this.pol[i - 1] == 1) {
				this.razr[i] = xor((this.razr[i - 1]), res);
			} else {
				this.razr[i] = this.razr[i - 1];
			}
		}
		this.razr[0] = res;
		gen = res;
		return gen;
	}
}
