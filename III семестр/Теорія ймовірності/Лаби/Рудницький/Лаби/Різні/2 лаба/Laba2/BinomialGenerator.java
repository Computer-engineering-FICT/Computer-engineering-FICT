package Laba2;

import java.util.Random;

public class BinomialGenerator {
	Random random = new Random();

	public int nextNumber(int n, double p) {
		int R = 0;
		for (int i = 0; i < n; ++i) {
			if (random.nextDouble() < p) {
				R += 1;
			}
		}
		return R;
	}
public int[] numberSet(int size,int n,double p){
	int[] ary=new int[size];
	for(int i=0; i<size;++i){
		ary[i]=nextNumber(n, p);
	}
	return ary;
}
}
