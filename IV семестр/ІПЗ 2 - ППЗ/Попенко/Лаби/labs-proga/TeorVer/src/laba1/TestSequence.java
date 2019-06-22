/**
 * 
 */
package laba1;

import java.util.ArrayList;
import java.util.Arrays;

/**
 * @author Ruslan Popenko
 *
 */
public class TestSequence {

	TGenerator T = new TGenerator(10000);

	public TestSequence() {

	}

	public double Test1() {
		double s = 0;
		for (int i = 0; i < T.sequence.length; i++) {
			if (T.sequence[i] == 1)
				s++;
		}
		double g = (double) T.sequence.length;
		return (s / g);

	}

	public double Test2() {
		double s = 0;
		byte[] buf = new byte[T.sequence.length - 1];
		for (int i = 0; i < T.sequence.length - 1; i++) {
			buf[i] = (byte) (T.sequence[i] ^ T.sequence[i + 1]);
			if (buf[i] == 1)
				s++;
		}
		return (s / buf.length);

	}

	public void Test3(int sizeW) {
		byte[] window = new byte[sizeW];
		int length = (int) (Math.pow(2, sizeW));
		int[] rang = new int[length];
		for (int i = 0; i < window.length; i++) {
			window[i] = 0;
		}
		boolean t = false;

		for (int i = 0; i < rang.length; i++) {
			rang[i] = 0;

			for (int j = 0; j < T.sequence.length - sizeW + 1; j++) {
				t = true;
				for (int n = j; n < j + window.length; n++) {
					if (T.sequence[n] != window[n - j]) {
						t = false;
					}

				}
				if (t) {
					rang[i]++;
				}

			}

			for (int j = window.length - 1; j >= 0; j--) {
				if (window[j] == 0) {
					window[j] = 1;
					if (j != window.length - 1) {
						for (int j2 = j + 1; j2 < window.length; j2++) {
							window[j2] = 0;
						}
					}
					break;
				}

			}

		}
		System.out.println("Вікно розміром " + sizeW);
		double buf = 0;
		for (int i = 0; i < rang.length; i++) {
			buf = (double) rang[i];
			buf = buf / T.sequence.length;
			System.out.println(i + ") " + buf);

		}

	}

	public int Test4() {
		byte[] arr = T.sequence;
		int windowSize = 0;
		boolean isSizeFinded = false;
		int maxNum = 0;
		byte[] valuesArr = null;
		
		for (int j = 0; j < arr.length - 1 && isSizeFinded == false; j++) {
			windowSize++;
			maxNum = (int) Math.pow(2, windowSize);
			valuesArr = new byte[maxNum];
			isSizeFinded = true;
			for (int i = 0; i < valuesArr.length; i++) {
				valuesArr[i] = -1;
			}
			for (int i = 0; i < arr.length - windowSize; i++) {
				int numInWindow = getIntFromByteArr(arr, i, i + windowSize - 1);
				int valueForNum = valuesArr[numInWindow];
				if (valueForNum == -1) {
					valuesArr[numInWindow] = arr[i + windowSize];
				} else if (valueForNum != arr[i + windowSize]) {
					isSizeFinded = false;
					break;
				}
			}
		}
		return windowSize;
	}

	
	private int getIntFromByteArr(byte[] arr, int start, int end) {
		int num = 0;
		int twoInPower = 1;
		for (int i = end; i >= start; i--) {
			if (arr[i] == 1) {
				num += twoInPower;
			}
			twoInPower *= 2;
		}
		return num;
	}

}
