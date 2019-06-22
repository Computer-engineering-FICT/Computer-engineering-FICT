package lab1;

import java.util.ArrayList;

import lab1.mura.ForGraphMura;
import lab1.mura.Mura;
import lab1.mura.MuraManager;

/**
 * Клас для сусіднього кодування
 * 
 * @author Dmytro Pogrebnjuk
 * 
 */
public class NeighbourCode {
	private static NeighbourCode _instance;
	private MuraManager _mm;
	private int[] _digit;
	private int _numDigit = -1;
	private String _prev = null;
	private String _cur = null;

	private NeighbourCode() {
		_mm = MuraManager.get_instance();
	}

	public static NeighbourCode getInstance() {
		if (_instance == null) {
			_instance = new NeighbourCode();
		}
		return _instance;
	}

	public void setNeighbourCoding() {
		_numDigit = (int) (Math.log(_mm.get_size()) / Math.log(2));
		_digit = new int[_mm.get_size()];
		codeOneMura(_digit, "", ServiceClass.getFirstMura());
	}

	private boolean codeOneMura(int[] stack, String prev, Mura mura) {
		String cur = null;
		if (mura.get_code() == null) {
			if (prev == "") {
				cur = convertIntToStr(0);
				// позначити перший елемент, та
				mura.set_code(cur);
				// зазначити 0-ве місце - як зайняте
				stack[0] = 1;
			} else {
				boolean isFind = false;
				for (int i = 0; !isFind; i++) {
					if (i == _numDigit)
						return false;
					// можливо, майбутнє маркування
					String mayCur = invertSymbol(prev, _numDigit - i - 1);
					if (stack[convertStrToInt(mayCur)] == 0) {
						stack[convertStrToInt(mayCur)] = 1;
						isFind = true;
						cur = mayCur;
						mura.set_code(cur);
					}
				}
			}

			ArrayList<ForGraphMura> arr = mura.getAllConnection();
			for (int i = 0; i < arr.size(); i++) {
				// наступний породжений стан.
				Mura child = arr.get(i).get_toBlock();
				if (!codeOneMura(stack, cur, child)) {
					// якщо хоч одна "дитина" не змогла себе пронумерувати
					return false;
				}
			}
		} if ()
		return true;
	}

	private String convertIntToStr(int digit) {
		String res = Integer.toBinaryString(digit);
		for (; res.length() < _numDigit;) {
			res += "0";
		}
		return res;
	}

	private int convertStrToInt(String str) {
		return Integer.parseInt(str, 2);
	}

	private String invertSymbol(String src, int pos) {
		char[] charArr = src.toCharArray();
		char c = charArr[pos];
		if (c == '1') {
			charArr[pos] = '0';
		} else {
			charArr[pos] = '1';
		}
		return String.valueOf(charArr);
	}

	private int countNumInStack(int[] stack) {
		int res = 0;
		for (int i = 0; i < stack.length; i++) {
			if (stack[i] == 1)
				res++;
		}
		return res;
	}
}
