package lab1_8;
import java.util.ArrayList;


public class MiliGraphPossibleGrayCodeNumbers {
	
	private int gray_code_number;
	private ArrayList<Integer> possible_gray_codes_numbers = new ArrayList<Integer>();
	
	public MiliGraphPossibleGrayCodeNumbers(int GrayCode, int MaxPow) {
		
		gray_code_number = GrayCode;

		for (int j = 0; j<MaxPow; j++)
			possible_gray_codes_numbers.add(gray_code_number^(int)Math.pow(2, j));
		
	}

	public boolean isPosiibleGrayCode(int GrayCode) {
		
		return possible_gray_codes_numbers.contains(GrayCode);
	}
	
	public ArrayList<Integer> getPossibleGrayCodesNumbers() {
		
		return possible_gray_codes_numbers;
	}
}
