package com.teorver.lab_1;
import java.util.Hashtable;

public class Tester {
	public static void Test1(int[] tested){
		int ones = 0;
		for(int i=0;i<tested.length;i++){
			if(tested[i]==1) ones++;
		}
		System.out.println("Test1: "+ones+" ones of "+tested.length+" bits");
	}
	public static void Test2(int[] tested){
		int ones = 0;
		for(int i=1;i<tested.length;i++){
			if((tested[i]^tested[i-1]) == 1 ) ones++;
		}
		System.out.println("Test2: "+ones+" ones of "+(tested.length-1)+" bits");
	}
	public static void Test3(int[] tested,int windowsize){
		int windows = (int)Math.pow(2, windowsize);
		Hashtable<Integer,Integer> windowsHash = new Hashtable<Integer, Integer>();
		for(int i=0;i<windows;i++){
			windowsHash.put(i, 0);
		}
		for(int i=0;i<tested.length-windowsize+1;i++){
			int winnum = 0;
			for(int j=i;j<i+windowsize;j++){
				winnum*=2;
				winnum+=tested[j];
			}
			windowsHash.put(winnum, ((Integer)windowsHash.get(winnum)+1));
		}
		System.out.println("Test3: ");
		for(int i=0;i<windowsHash.size();i++){
			String windowName = Integer.toBinaryString(i);
			while(windowName.length()<windowsize){
				windowName= "0"+windowName;	
			}
			System.out.println("\t"+windowName+": "+windowsHash.get(i));
		}
	}
	public static void Test4(int[] tested){
		int res = 1;
		boolean flag = true;
		while(flag){
			flag = false;
			Hashtable<Integer,Integer> windowsHash = new Hashtable<Integer, Integer>();
			for(int i=0;i<tested.length-res;i++){
				int winnum = 0;
				for(int j=i;j<i+res;j++){
					winnum*=2;
					winnum+=tested[j];
				}
				if (windowsHash.containsKey(winnum)){
					if(windowsHash.get(winnum) != tested[i+res]){
						flag = true;
						res*=2;
						break;
					}
				}
				else{
					windowsHash.put(winnum,tested[i+res]);
				}
			}
		}
		System.out.println("Test4(Non-linear difficulty): "+res);
	}
}
