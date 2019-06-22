import java.util.*;
import java.io.*;

public class Multiplexor {
	protected int bit_rate_out;
	protected int bit_rate_rand;
	protected int sz_out;
	protected int sz_rand;
	protected int iterationCount;
	protected String lastGeneration;
	protected LFSRr[] output;
	protected LFSRr[] random;

	public Multiplexor(int size, int count) {
		this.iterationCount = count;
		this.output = new LFSRr[size];
		this.random = new LFSRr[(int) Math
				.round((Math.log(size) / Math.log(2)))];
	}

	public Multiplexor(String file_gen, String file_random, int count) {
		try {
			this.iterationCount = count;
			Scanner fr = new Scanner(new FileReader(file_random));
			int sz = new Integer(fr.nextLine());
			random = new LFSRr[sz];
			// lastGeneration = "";
			sz_rand = sz;
			String alg = fr.nextLine();
			bit_rate_rand = alg.length();
			int i = 0;
			while (fr.hasNext())
				random[i++] = new LFSRr(fr.nextLine(), alg);
			fr.close();
			sz = (int) Math.round(Math.pow(2, sz));
			sz_out = sz;
			output = new LFSRr[sz];
			fr = new Scanner(new FileReader(file_gen));
			alg = fr.nextLine();
			bit_rate_out = alg.length();
			i = 0;
			while (fr.hasNext())
				output[i++] = new LFSRr(fr.nextLine(), alg);
			fr.close();
			if (i != sz)
				System.out.println("Error");
		} catch (Exception e) {
			System.out.println("Error : " + e);
		}
	}

	public String generateNumber() {
		String num = "";
		for (int i = 0; i < sz_rand; i++)
			num += random[i].move();
		return num;
	}

	public int move() {
		return output[Integer.parseInt(this.generateNumber(), 2)].move();
	}

	public Multiplexor generate() {
		this.lastGeneration = "";
		for (int i = 0; i < this.iterationCount; i++)
			this.lastGeneration += move();
		return this;
	}

	public String getLastGeneration() {
		return this.lastGeneration;
	}

	public int getBitRateOut() {
		return this.bit_rate_out;
	}

	public int getBitRateRand() {
		return this.bit_rate_rand;
	}

	public int getSizeOut() {
		return this.sz_out;
	}

	public int getSizeRand() {
		return this.sz_rand;
	}

	public int getIterationCount() {
		return this.iterationCount;
	}

	public Multiplexor setIterationCount(int count) {
		this.iterationCount = count;
		return this;
	}

	public static void main(String[] args) {
		Multiplexor mult = new Multiplexor("gen", "rand", 10000);
		// System.out.println(Integer.parseInt(mult.generateNumber(), 2));
		// for (int i = 0; i < 100; i++)
		// System.out.println(Integer.parseInt(mult.generateNumber(), 2));
		// System.out.println("bro = " + bit_rate_out);
		// System.out.println("brr = " + bit_rate_rand);
		// System.out.println("so = " + sz_out);
		// System.out.println("sr = " + sz_rand);
	}
}
