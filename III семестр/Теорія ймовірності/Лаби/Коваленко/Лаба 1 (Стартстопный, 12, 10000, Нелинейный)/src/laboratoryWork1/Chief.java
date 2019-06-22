package laboratoryWork1;

public class Chief {
	public static void main(String[] args){
		int[] arr= new int[10000];
		
		Generate gen= new Generate();
		Test test= new Test();
		
		arr=gen.generateSequence(arr.length);
		System.out.println("Test number one="+test.attitude(arr));
		System.out.println("Test number two="+test.frequency(arr));
		System.out.println("Test number three:");
		test.window(arr, 5);
		System.out.println("Test number four:"+test.nonlinearity(arr));
	}
}