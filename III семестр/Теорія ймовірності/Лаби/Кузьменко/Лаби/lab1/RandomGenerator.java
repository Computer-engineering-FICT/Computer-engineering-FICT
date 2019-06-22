import java.util.Arrays;

public class RandomGenerator 
{
	// розрядність
	int PLASES = 10;
	//регістр зсуву
	int [] sRegister = new int [PLASES];
	int T [] = new int [(int)Math.pow(2, PLASES)];
	//масив для згенерованої послідовності
	private int [] randomValue = new int[10000];
	public RandomGenerator(int NumberOfIterations) 
	{
		String k = Integer.toBinaryString((int)(Math.random()*1023));
		for (int i = 0; i < k.length(); i++) {
			sRegister[i]=Integer.parseInt(k.substring(i, i+1));
		}
		for (int i = 0; i < T.length; i++) {
			T[i]= (int)(Math.random()*2);
		}
		 /*
		for (int i = 0; i < T.length; i++) {
			if (i%2==0){
				T[i]=0;
			}
			else
				T[i]=1;
		}
		//System.out.println(T[0]+"||||||");
		sRegister[0]=1;
		sRegister[1]=0;
		sRegister[2]=1;
		sRegister[3]=0;
		sRegister[4]=1;
		sRegister[5]=0;
		sRegister[6]=1;
		sRegister[7]=0;
		sRegister[8]=1;
		sRegister[9]=0;
		  */		
		for (int i = 0; i < NumberOfIterations; i++) 
		{
		
			randomValue[i]=sRegister[0];
			int buf = sRegister[0];
			sRegister[sRegister.length-1] = T[toDec(sRegister)]^buf^
					(T[toDec(Arrays.copyOfRange(sRegister, 0, sRegister.length))])^
					(T[toDec(Arrays.copyOfRange(sRegister, 1, sRegister.length))])^
					(T[toDec(Arrays.copyOfRange(sRegister, 2, sRegister.length))])^
					(T[toDec(Arrays.copyOfRange(sRegister, 3, sRegister.length))])^
					(T[toDec(Arrays.copyOfRange(sRegister, 4, sRegister.length))])^
					(T[toDec(Arrays.copyOfRange(sRegister, 5, sRegister.length))])^
					(T[toDec(Arrays.copyOfRange(sRegister, 6, sRegister.length))])^
					(T[toDec(Arrays.copyOfRange(sRegister, 7, sRegister.length))])^
					(T[toDec(Arrays.copyOfRange(sRegister, 8, sRegister.length))])^
					(T[toDec(Arrays.copyOfRange(sRegister, 9, sRegister.length))])
					;
			
			landslide(sRegister);
		}
	}
	/*
	 * перетворення з двійкової сс в десяткову сс
	 * mas масив у двійковій системі
	 */
	public int  toDec (int [] mas)
	{
		int value =0;
		int j=0;
		for (int i = mas.length-1; i >=0; i--) {
			value = value +mas[j]*(int)(Math.pow(2, i));
			j++;
		}
		return value;
	}
	/*
	 * зсув на одну позицію вліво
	 */
	private void landslide (int [] mas)
	{
		int [] buf = mas;
		for (int i = 0; i < mas.length-1; i++) {
			mas[i]=buf[i+1];
		}
		sRegister=mas;
	}
	// повернення згенерованої послідовності
	public int [] getRandomValue()
	{
		return randomValue;
	}
}
