package laboratoryWork1;

public class Generate {
	private byte[] array1={1,1,0,0,0,1,1,1,0,1,1,0};
	private byte[] array2={0,1,1,0,1,1,1,0,0,0,0,1};

	int[] generateSequence(int len){
		int[] resultArray= new int[len];
		LSFR gen= new LSFR();
		byte buffer=gen.lsfrGenerate(array2);
		
		for(int i=0;i<len;i++){
			if(gen.lsfrGenerate(array1)==1)
				buffer=gen.lsfrGenerate(array2);
			resultArray[i]= buffer;
		}
		return resultArray;
	}	
	
	int binToDec(String str){
		int result=Integer.parseInt(str,2);
		return result;
	}
}