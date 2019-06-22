package laboratoryWork1;

import java.util.HashMap;
import java.util.Map;

public class Test {
	private int buffer;
	double attitude(int[] arr){
		buffer=0;
		for(int i=0;i<arr.length; i++){
			if(arr[i]==1) buffer=buffer+1;
		}
		return (((double) buffer)/((double) arr.length));
	}
	
	double frequency(int[] arr){
		buffer=0;
		for (int i=0; i<(arr.length-1); i++){
			if(arr[i]!=arr[i+1]){
				buffer=buffer+1;
			}
		}
		return ((double) buffer / (double) (arr.length-1));
	}
	
	void window(int[] arr, int windowLength){
		int [] windowArray= new int [(int) Math.pow(2, windowLength)];
		
		for(byte i=0; i<windowArray.length; i++){
			 windowArray[i]=0;
		}
		buffer=0;
		Generate gen= new Generate();
	
		for(int i=0; i<(arr.length-windowLength+1); i++){
			String str=new String();
			for(int k=i; k<i+windowLength; k++){
				str=str+arr[k];
			}
			buffer=gen.binToDec(str);
			windowArray[buffer]=windowArray[buffer]+1;
		}
		
		for(int i=0; i<windowArray.length; i++){
			System.out.println("Number:"+i+". Probability="+
					((double) windowArray[i])/((double) (arr.length-windowLength)));
		}
	}	

	int nonlinearity(int[] arr){
		boolean flagClose=false;
		int ns=0;
		while(flagClose==false){
			flagClose=true;
			ns=ns+1;
			Map<String, Integer> hm = new HashMap<String, Integer>();
			
			for(int i=0; i<arr.length-ns;i++){
				boolean flagCreate=true;
				boolean flagOut=false;
				String hmIndex=new String();
				for(int j=0; j<ns; j++){
					hmIndex=hmIndex+arr[i+j];
				}
				Integer hmValue= arr[i+ns];
				
				if(hm.size()==0)
					hm.put(hmIndex, hmValue);
				else{	
					for (Map.Entry entry : hm.entrySet()) {
						if(entry.getKey().equals(hmIndex)){
							flagCreate=false;
							if(entry.getValue()!=hmValue){
								flagOut=true;
							}	
						}
					}	
				}
				if(flagCreate) hm.put(hmIndex, hmValue);
				if(flagOut){
					flagClose=false;
					break;
				}	
			}
		}
		return ns;
	}
}