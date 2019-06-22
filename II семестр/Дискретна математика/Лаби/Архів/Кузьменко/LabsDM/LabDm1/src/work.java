import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;


public class work {
	{
		int i, t, z;
		boolean q, e;
		System.out.println("частина А - 1");
		System.out.println("частина В - 2");
		Scanner sc = new Scanner(System.in);
		String w;
		do {
			z = sc.nextInt();
			switch (z) {
			case 1:
				do {
					System.out.println("Спосіб введення");
					System.out.println("з клавіатури - 1");
					System.out.println("з файла - 2");
					t = sc.nextInt();
					switch (t) {
					case 1:
						q = false;
						System.out.println("введіть кількість імен множини А");
						t = sc.nextInt();
						String a[] = new String[t];
						int genderA[] = new int[t];
						System.out.println("Вводьте імена");
						System.out.println("Спочатку ім*я, поітм стать");
						sc.nextLine();
						for (i = 0; i < t; i++) {
							a[i] = sc.nextLine();
							do {
								w = sc.nextLine();
								if (w.equals("male")) {
									genderA[i] = 1;
									q = false;
								} else if (w.equals("famale")) {
									genderA[i] = 0;
									q = false;
								} else {
									q = true;
									System.out.print("eror");
								}
							} while (q);
						}
						System.out
								.println("Введіть кількість імен множини В");
						t = sc.nextInt();
						String b[] = new String[t];
						int genderB[] = new int[t];
						System.out.println("Починайте введення імен");
						System.out.println("Спочатку ім*я, а поітм стать");
						sc.nextLine();
						for (i = 0; i < t; i++) {
							b[i] = sc.nextLine();
							do {
								w = sc.nextLine();
								if (w.equals("male")) {
									genderB[i] = 1;
									q = false;
								} else if (w.equals("famale")) {
									genderB[i] = 0;
									q = false;
								} else {
									q = true;
									System.out.println("помилка введеня");
								}
							} while (q);
						}
						menuA(a, b, genderA, genderB);
						break;
					case 2:
						try {
							q = false;
							FileReader fr = new FileReader(
									"C:\\Users\\Lenovo\\Desktop\\testa.txt");
							BufferedReader br = new BufferedReader(fr);
							String g;
							int size;
							size = Integer.parseInt(br.readLine());
							String A[] = new String[size];
							int ag[] = new int[size];
							i = 0;
							while ((g = br.readLine()) != null) {
								A[i] = g;
								g = br.readLine();
								if (g.equals("male")) {
									ag[i] = 1;
									i++;
								} else if (g.equals("famale")) {
									ag[i] = 0;
									i++;
								}
							}
							fr.close();
							FileReader fr1 = new FileReader(
									"C:\\Users\\Lenovo\\Desktop\\testb.txt");
							BufferedReader br1 = new BufferedReader(fr1);
							size = Integer.parseInt(br1.readLine());
							String B[] = new String[size];
							int bg[] = new int[size];
							i = 0;
							while ((g = br1.readLine()) != null) {
								B[i] = g;
								g = br1.readLine();
								if (g.equals("male")) {
									bg[i] = 1;
									i++;
								} else if (g.equals("famale")) {
									bg[i] = 0;
									i++;
								}
							}
							fr1.close();
							menuA(A, B, ag, bg);
							break;
						} catch (IOException e1) {
							e1.printStackTrace();
						} finally {
						}
					default:
						q = true;
						System.out.println("eror, try agenderAin");
					}
				} while (q);
				e = false;
				break;
			case 2:

				int r1[][] = { 
						{ 0, 1, 0, 1, 0, 0 }, 
						{ 0, 0, 1, 1, 0, 1 },
						{ 1, 0, 0, 0, 1, 1 }, 
						{ 1, 0, 0, 0, 0, 0 } };

				int r2[][] = { 
						{ 0, 1, 0, 0, 0, 1 }, 
						{ 1, 0, 0, 0, 1, 0 },
						{ 0, 1, 0, 1, 1, 0 }, 
						{ 1, 1, 0, 0, 1, 0 } };
				System.out.println("R1:");
				for (int j = 0; j < r1.length; j++) {
					for (int j2 = 0; j2 < r1[0].length; j2++) {
						System.out.print(r1[j][j2]+" ");
					}
					System.out.println();
				}
				System.out.println("R2:");
				for (int j = 0; j < r2.length; j++) {
					for (int j2 = 0; j2 < r2[0].length; j2++) {
						System.out.print(r2[j][j2]+" ");
					}
					System.out.println();
				}
				System.out.println();
				boolean h = true;
				do{
				System.out.println("R1 об'єднання R2-1");
				System.out.println("R1 xR2-2");
				System.out.println("R1^-1-3");
				System.out.println("R1x(R2^-1)-4");
				System.out.println("Вихід 5");
				boolean p = false;
				do {

					t = sc.nextInt();
					switch (t) {
					case 1:
						prin1(sum(r1, r2));
						menutwo(sum(r1, r2));
						q = false;
						break;
					case 2:
						prin2(rdobutocsInt(r1, r2));
						menutwo(rdobutocsInt(r1, r2));
						q = false;
						break;
					case 3:
						prin1(rob2(r1));
						menutwo(rob2(r1));
						q = false;
						break;
					case 4:
						prin2(rdobutocsInt(r1, rob2(r2)));
						menutwo(rdobutocsInt(r1, rob2(r2)));
						q = false;
						break;
					case 5: h=false; break;
					default:
						System.out.println("error, try again");
						p = true;
					}
				} while (p);
				}while (h);
				e = false;
				break;
			default:
				System.out.println("error, try again");
				e = true;
			}
		} while (e);
	}
	static void prin1(int[][] a) {
		for (int i = 0; i < a.length; i++) {

			for (int j = 0; j < a[i].length; j++) {
				System.out.print(a[i][j] + " ");
			}
			System.out.println();
		}
	}
	static void menuA (String  a[], String b[], int gena[], int genb[] ){
		Scanner sc = new Scanner(System.in);
		System.out.println("Множина імен А");
		System.out.print("{");
		for (int i = 0; i < a.length; i++) {
			System.out.print(a[i]+",");
		}
		System.out.print("}");
		System.out.println();
		System.out.println("Множина імен В");
		System.out.print("{");
		for (int i = 0; i < b.length; i++) {
			System.out.print(b[i]+",");
		}
		System.out.print("}");
		int j=0;
		int s [][] = new int [gena.length][genb.length];
		for (int i = 0; i < gena.length; i++) {
			if (gena[i]==1)
				{s[i][j]=1;j++;}
		}
		j=0;
		boolean f;
		int r[][] = new int [gena.length][genb.length];
		j = -1;
		for (int i = 0; i < gena.length; i++) {
			j++;
			if (gena[i] == 1) {
				do {
					if (j>genb.length)j=0;
					if (genb[j] == 0) {
						f = false;
					} else {
						f = true;
						j++;
					}
				} while (f);
				if (!(a[i].equals(b[j]))) {
					r[i][j] = 1;
				}
			}
		}
		j = -1;
		for (int i = 0; i < gena.length; i++) {
			j++;
			if (gena[i] == 1) {
				do {
					if (j>genb.length)j=0;
					if (r[i][j] == 0)
						f = false;
					else {
						f = true;
						j++;
					}
				} while ((f));
				s[i][j] = 1;
			}
		}
		System.out.println("Відношення aSb");
		printname(a, b, s);
		System.out.println("Відношення aRb");
		printname(a, b, r);
		System.out.println("R+S -1");
		System.out.println("RxS-2");
		System.out.println("R ob-3");
		System.out.println("SxRob-4");
		f=true;
		do{
		int o = sc.nextInt();
		switch (o) {
		case 1:
			printname(a,b, sum(r,s));
			f=false;
			break;
		case 2:
			prin2(rdobutocs(a, b, r, s));
			f=false;
			break;
		case 3:
			printname(b, a, rob(gena, genb,r));	
			f=false;
			break;
		case 4:
			prin2(rdobutocs1(a, b, s, rob(genb, gena,r)));
			f=false;
			break;
		default:
			f=true; 
			System.out.println("помилка введення");
			break;
		}
		}while(f);
	}
	static int[][] rdobutocsInt(int r1[][], int r2[][]) {
		int i, j, n, m;
		int l = 0;
		int h = 0;
		for (i = 0; i < r1.length; i++) {
			for (j = 0; j < r1[i].length; j++) {
				if (r1[i][j] == 1)
					l++;
			}
		}
		int format1[][] = new int[l][2];
		n = 0;
		for (i = 0; i < r1.length; i++) {
			for (j = 0; j < r1[i].length; j++) {
				if (r1[i][j] == 1) {
					format1[n][0] = i;
					format1[n][1] = j;
					n++;
				}
			}
		}
		for (i = 0; i < r2.length; i++) {
			for (j = 0; j < r2[i].length; j++) {
				if (r2[i][j] == 1)
					h++;
			}
		}
		m = 0;
		int format2[][] = new int[h][2];
		for (i = 0; i < r2.length; i++) {
			for (j = 0; j < r2[i].length; j++) {
				if (r2[i][j] == 1) {
					format2[m][0] = i;
					format2[m][1] = j;
					m++;
				}
			}
		}
		m = m - 1;
		n = n - 1;
		int dobutoc[][] = new int[l * h][4];
		n = 0;
		for (i = 0; i < format1.length; i++) {
			for (j = 0; j < format2.length; j++) {
				dobutoc[n][0] = format1[i][0];
				dobutoc[n][1] = format1[i][1];
				dobutoc[n][2] = format2[j][0];
				dobutoc[n][3] = format2[j][1];
				n++;
			}
		}
		return dobutoc;
	}
	static int [][] sum (int r[][], int s [][]){
		for (int i = 0; i < r.length; i++) {
			for (int j = 0; j < r[0].length; j++) {
				if (s[i][j]==1)
					r[i][j]=1;
			}
		}
		return r;
	}
	static void prin2(int rdobutocs[][]) {
		int i;
		for (i = 0; i < rdobutocs.length; i++) {
			System.out.println(rdobutocs[i][0] + "-" + rdobutocs[i][1] + "|"
					+ rdobutocs[i][2] + "-" + rdobutocs[i][3]);
		}
	}
	static String[][] rdobutocs1(String[] a, String[] b, int s[][], int rob[][]) {
		String rformat[][] = new String[format(b, a, rob).length][2];
		rformat = format(b, a, rob);
		String sformat[][] = new String[format(a, b, s).length][2];
		sformat = format(a, b, s);
		int i, j, n;
		n = 0;
		String rdobutocs[][] = new String[rformat.length * sformat.length][4];
		for (i = 0; i < sformat.length; i++) {
			for (j = 0; j < rformat.length; j++) {
				rdobutocs[n][0] = sformat[i][0];
				rdobutocs[n][1] = sformat[i][1];
				rdobutocs[n][2] = rformat[j][0];
				rdobutocs[n][3] = rformat[j][1];
				n++;
			}
		}
		return rdobutocs;
	}
	static String[][] format(String[] a, String[] b, int r[][]) {
		int i, j, n, k;
		k = 0;
		n = 0;
		for (i = 0; i < r.length; i++) {
			for (j = 0; j < r.length; j++) {
				if (r[i][j] == 1)
					k++;
			}
		}
		String format[][] = new String[k][2];
		for (i = 0; i < r.length; i++) {
			for (j = 0; j < r.length; j++) {
				if (r[i][j] == 1) {
					format[n][0] = a[i];
					format[n][1] = b[j];
					n++;
				}
			}
		}
		return format;
	}
	static int[][] rob(int genderA[], int genderB[],int r[][]) {
		int rob[][] = new int[genderB.length][genderA.length];
		for (int k = 0; k < rob.length; k++) {
			for (int k2 = 0; k2 < rob.length; k2++) {
				if (r[k][k2]==1)rob[k2][k]=1;
			}
		}
		return rob;
	}
	static void dobutocdob(String a [], String b [], int r[][], int s [][]){
		int k=0;
		for (int i = 0; i < r.length; i++) {
			for (int j = 0; j < r.length; j++) {
				if (r[i][j]==1)k++;
			}
		}
		String formatr [][] = new String [k][2];
		k=0;
		for (int i = 0; i < r.length; i++) {
			for (int j = 0; j < r[0].length; j++) {
				if (r[i][j] == 1) {
					formatr[k][0] = a[i];
					formatr[k][1] = b[j];
					k++;
				}
			}
		}
	}
	static void printname(String a[], String b[], int r[][]) {
		for (int i = 0; i < r.length; i++) {
			for (int j = 0; j < r[0].length; j++) {
				if (r[i][j] == 1)
					System.out.println("("+a[i] + "-" + b[j]+")");
			}
		
		}
	}
	static String[][] rdobutocs(String[] a, String[] b, int r[][], int s[][]) {
		String rformat[][] = new String[format(a, b, r).length][2];
		rformat = format(a, b, r);
		String sformat[][] = new String[format(a, b, s).length][2];
		sformat = format(a, b, s);
		int i, j, n;
		n = 0;
		String rdobutocs[][] = new String[rformat.length * sformat.length][4];
		for (i = 0; i < rformat.length; i++) {
			for (j = 0; j < sformat.length; j++) {
				rdobutocs[n][0] = rformat[i][0];
				rdobutocs[n][1] = rformat[i][1];
				rdobutocs[n][2] = sformat[j][0];
				rdobutocs[n][3] = sformat[j][1];
				n++;
			}
		}
		return rdobutocs;
	}
	static void prin2(String rdobutocs[][]) {
		int i;
		for (i = 0; i < rdobutocs.length; i++) {
			System.out.println("("+rdobutocs[i][0] + "-" + rdobutocs[i][1] + ")|("
					+ rdobutocs[i][2] + "-" + rdobutocs[i][3]+")");
		}
	}
	static void menutwo(int r1[][]) {
		Scanner sc = new Scanner(System.in);
		int i;
		String w;
		boolean q = true;
		System.out.println("Перевірити на:");
		do{
		System.out.println("рефлексивність -1");
		System.out.println("антирефлексивність-2");
		System.out.println("симетричність-3");
		System.out.println("антисиметричність-4");
		System.out.println("транзитивність-5");
			w = sc.nextLine();
			i = Integer.parseInt(w);
			switch (i) {
			case 1:
				prin3(reflex(rob2(r1)));
				q = false;
				break;
			case 2:
				prin3(antireflex(r1));
				q = false;
				break;
			case 3:
				prin3(sumetric(r1));
				q = false;
				break;
			case 4:
				prin3(antysumetric(r1));
				q = false;
				break;
			case 5:
				prin3(transit(r1));
				q = false;
				break;
			default:
				System.out.println("error, try again");
				q = true;
			}
		} while (q);
	}
	static int[][] rob2(int r[][]) {
		int i, j;
		j = 0;
		int rob2[][] = new int[r[0].length][r.length];
		for (i = 0; i < r[0].length; i++) {
			for (j = 0; j < r.length; j++) {
				if (r[j][i] == 1)
					rob2[i][j] = 1;
			}
		}
		return rob2;
	}
	static boolean transit(int a[][]) {
		boolean q;
		boolean b = true;
		int k = 0;
		for (int i = 0; i < a.length; i++) {
			if (b == false)
				break;
			k=0;
			for (int j = 0; j < a[i].length; j++) {
				if (a[i][j] == 1) {
					do {
						if (a[k][j] == 1)
							q = false;
						else {
							q = true;
							k++;
						}
					} while ((q) & (k < a[0].length));
					if (a[i][k] == 1)
						b = true;
					else {
						b = false;
						break;
					}
				}
			}
		}
		return b;
	}
	static void prin3(boolean q) {
		if (q == true)
			System.out.println("yes");
		else
			System.out.println("no");
	}
	static boolean antysumetric(int r2[][]) {
		boolean q = true;
		int i, j;
		for (i = 0; i < r2.length; i++) {
			for (j = 0; j < r2.length; j++) {
				if ((r2[i][j] == 0) & (r2[j][i] == 0))
					q = true;
				else {
					q = false;
					break;
				}
			}
			if (q == false)
				break;
		}
		return q;
	}

	static boolean sumetric(int r2[][]) {
		boolean q = true;
		int i, j;
		for (i = 0; i < r2.length; i++) {
			for (j = 0; j < r2.length; j++) {
				if (r2[i][j] == r2[j][i])
					q = true;
				else {
					q = false;
					break;
				}
			}
			if (q == false)
				break;
		}
		return q;

	}

	static boolean antireflex(int r2[][]) {
		boolean q = true;
		int i, j;
		for (i = 0; i < r2.length; i++) {
			for (j = 0; j < r2[0].length; j++) {
				if (i == j) {
					if (r2[i][j] == 0)
						q = true;
					else {
						q = false;
						break;
					}
				}

			}
			if (q == false)
				break;
		}
		return q;
	}

	static boolean reflex(int r2[][]) {
		boolean q = true;
		int i, j;
		for (i = 0; i < r2.length; i++) {
			for (j = 0; j < r2.length; j++) {
				if (i == j) {
					if (r2[i][j] == 1)
						q = true;
					else {
						q = false;
						break;
					}
				} else {
					if (r2[i][j] == 0)
						q = true;
					else {
						q = false;
						break;
					}
				}
			}
			if (q == false)
				break;
		}
		return q;

	}

}
