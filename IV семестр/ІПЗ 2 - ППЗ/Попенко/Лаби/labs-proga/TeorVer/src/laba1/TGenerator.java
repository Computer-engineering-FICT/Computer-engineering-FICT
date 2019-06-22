package laba1;

import java.util.Random;

/**
 * @author Ruslan Popenko
 *
 */
public class TGenerator {
	byte[] sequence;

	TGenerator(int size) {
		sequence = new byte[size];

		byte[] tabl = new byte[64];
		Random rand=new Random();

		for (int i = 0; i < tabl.length; i++) {
			tabl[i]=(byte) rand.nextInt(2);
		}

		byte[] p8 = { 4, 3, 2 };
		LFSR R8 = new LFSR((byte) 8, p8);
		byte[] p9 = { 4 };
		LFSR R9 = new LFSR((byte) 9, p9);
		byte[] p10 = { 3 };
		LFSR R10 = new LFSR((byte) 10, p10);
		byte[] p11 = { 2 };
		LFSR R11 = new LFSR((byte) 11, p11);
		byte[] p12 = { 6, 4, 1 };
		LFSR R12 = new LFSR((byte) 12, p12);
		byte[] p13 = { 4, 3, 1 };
		LFSR R13 = new LFSR((byte) 13, p13);

		byte[] buf = new byte[6];

		for (int i = 0; i < sequence.length; i++) {
			String str = "";
			buf[0] = R8.Gen();
			buf[1] = R9.Gen();
			buf[2] = R10.Gen();
			buf[3] = R11.Gen();
			buf[4] = R12.Gen();
			buf[5] = R13.Gen();
			for (int j = 0; j < buf.length; j++) {
				str += buf[j];
			}

			sequence[i] = tabl[Integer.parseInt(str, 2)];

		}

	}

}
