package laboratoryWork1;

public class LSFR {
	
	byte lsfrGenerate(byte[] array){
		byte[] bufferArray= new byte[array.length];
		
		// determine XORs
		byte[] indexOfXorArray={1,4,6};
		
		for(byte i=0; i<(array.length-1); i++){
			boolean flag=false;
			for(byte j=0; j<indexOfXorArray.length; j++){
				if((i+1)==indexOfXorArray[j]){
					flag=true;
				}
			}
			if(flag==true){
				if(array[i]==array[i+1])
					bufferArray[i+1]=0;
				else bufferArray[i+1]=1;
			}
			else bufferArray[i+1]=array[i];
		}
		bufferArray[0]=array[array.length-1];
		
		for(byte i=0; i<array.length; i++){
			array[i]=bufferArray[i];
		}
		return array[array.length-1];
	}
}