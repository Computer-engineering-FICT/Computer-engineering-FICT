package com.teorver.lab_1;

public class ConGenerator {
	public static int[] random(int n){
		int x[] = new int[n];
		x[0] = (int) (Math.abs(System.currentTimeMillis() % Integer.MAX_VALUE));
		int a = 9301; 
		int b = 49297;
		int m = 233280;
		int k=0;
		for(int i=1;i<n;i++){
			x[i] = (int)(Math.abs(((x[i-1]*a - b) % m) % Integer.MAX_VALUE));
			while(x[i-1]!=0){
				if(x[i-1] % 2 == 0){ 
					k++;
					}
				x[i-1] = x[i-1]/2;
			}
			x[i-1] = k%2;
		}
		x[x.length-1] = (int)(x[x.length-1] % 2);
		return x;
	}
}
