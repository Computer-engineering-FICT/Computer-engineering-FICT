/**
 * 
 */
package laba1;

import java.util.Arrays;
import java.util.Random;

/**
 * @author Ruslan Popenko
 *
 */
public class LFSR {
	byte[] work;
	byte[] buf;
	byte[] pol;

	public LFSR(byte bit, byte[] polinom) {
	    pol=new byte [polinom.length];
	    for (int i = 0; i < polinom.length; i++) {
			pol[i]=polinom[i];
		}
		work = new byte[bit];
		buf = new byte[bit];
		Random rand = new Random();
		for (int i = 0; i < work.length; i++) {
			work[i] = (byte) rand.nextInt(2);
		}
		for (int i = 0; i < buf.length; i++) {
			buf[i] = 95;
		}

	}

	public byte Gen() {

		int where = 0;

		byte gen = work[0];
		buf[buf.length - 1] = gen;
		for (int i = 0; i < pol.length; i++) {
			where = work.length - pol[i] - 1;
			buf[where] = (byte) (gen ^ work[work.length - pol[i]]);
		}

		for (int i = 0; i < buf.length; i++) {
			if (buf[i] == 95) {
				buf[i] = work[i + 1];
			}
		}

		for (int i = 0; i < buf.length; i++) {
			work[i] = buf[i];
		}

		for (int i = 0; i < buf.length; i++) {
			buf[i] = 95;
		}

		return gen;
	}

}
