package lab1;
public class test {
	public static void main(String[] args){
		int [] ary = new int[10000];
		Multigenerator generator = new Multigenerator();
		for(int i=0;i<ary.length;++i){
			ary[i]=generator.nextBit();
		}
		for(int i=0;i<ary.length;++i){
			System.out.print(" "+ary[i]);
			if(i%100==0 & i!=0){
				System.out.println();
			}
		}
		System.out.println();
		Testing.FrequencyTest(ary);
		Testing.DifFrequencyTest(ary);
		Testing.RangTest(ary,4);
		Testing.LinearComplexityTest(ary);
		
		}
}
