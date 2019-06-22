import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

class wor {
	{

		int i, t, y;
		boolean q, e;
		System.out.println("Завдання А - 1");
		System.out.println("Завдання В - 2");
		Scanner sc = new Scanner(System.in);
		String w;
		do {
			y = sc.nextInt();
			switch (y) {
			case 1:
				do {
					System.out.println("Введення з клавіатури - 1");
					System.out.println("Введення з файла - 2");
					t = sc.nextInt();
					switch (t) {
					case 1:
						q = false;
						System.out
								.println("Enter the number of names in the first set. "
										+ "For each name, indicate gender");
						t = sc.nextInt();
						String a[] = new String[t];
						int ga[] = new int[t];
						System.out.println("Begin etntering the names");
						System.out
								.println("first second entering the gender (male/famele) ");
						sc.nextLine();
						for (i = 0; i < t; i++) {
							a[i] = sc.nextLine();
							do {
								w = sc.nextLine();
								if (w.equals("male")) {
									ga[i] = 1;
									q = false;
								} else if (w.equals("famale")) {
									ga[i] = 0;
									q = false;
								} else {
									q = true;
									System.out.print("eror");
								}
							} while (q);
						}
						System.out
								.println("Enter the number of names in the second set. "
										+ "For each name, indicate gender");
						t = sc.nextInt();
						String b[] = new String[t];
						int gb[] = new int[t];
						System.out.println("Begin etntering the names");
						System.out
								.println("first second entering the gender (male/famele) ");
						sc.nextLine();
						for (i = 0; i < t; i++) {
							b[i] = sc.nextLine();
							do {
								w = sc.nextLine();
								if (w.equals("male")) {
									gb[i] = 1;
									q = false;
								} else if (w.equals("famale")) {
									gb[i] = 0;
									q = false;
								} else {
									q = true;
									System.out
											.println("none male/famele, try again");
								}
							} while (q);
						}
						menu1(a, b, ga, gb);
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
							menu1(A, B, ag, bg);
							break;
						} catch (IOException e1) {
							e1.printStackTrace();
						} finally {
						}
					default:
						q = true;
						System.out.println("eror, try again");
					}
				} while (q);
				e = false;
				break;
			case 2:

				int r1[][] = { 
						{ 1, 1, 0, 1, 0, 0 }, 
						{ 0, 1, 1, 1, 0, 1 },
						{ 0, 0, 0, 0, 0, 1 }, 
						{ 1, 0, 0, 0, 1, 0 } };

				int r2[][] = { 
						{ 0, 0, 0, 0, 0, 1 }, 
						{ 1, 1, 0, 1, 1, 0 },
						{ 0, 1, 1, 0, 1, 0 }, 
						{ 1, 1, 0, 0, 1, 0 } };
				System.out.println("R1:");
				prinmas(r1);
				System.out.println("R2:");
				prinmas(r2);
				System.out.println();
				boolean h; 
				do{
				h= true;
				System.out.println("R1 об'єднання R2-1");
				System.out.println("R1 xR2-2");
				System.out.println("R1^-1-3");
				System.out.println("R1x(R2^-1)-4");
				System.out.println("exit - 5");
				boolean z = false;
				do {

					t = sc.nextInt();
					switch (t) {
					case 1:
						prinmas(rsums(r1, r2));
						menu2(rsums(r1, r2));
						z = false;
						break;
					case 2:
						prindec(rdecsInt(r1, r2));
						menu2(rdecsInt(r1, r2));
						z = false;
						break;
					case 3:
						prinmas(rob2(r1));
						menu2(rob2(r1));
						z = false;
						break;
					case 4:
						prindec(rdecsInt(r1, rob2(r2)));
						menu2(rdecsInt(r1, rob2(r2)));
						z = false;
						break;
					case 5: h=false;z=false; break;
					default:
						System.out.println("error, try again");
						z = true;
					}
				} while (z);
				}while (h);
				e = false;
				break;
			default:
				System.out.println("error, try again");
				e = true;
			}
		} while (e);
	}

	void menu1(String a[], String b[], int ga[], int gb[]) {
		int i;
		int[][] r = new int[ga.length][ga.length];
		boolean q=true;
		Scanner sc = new Scanner(System.in);
		int[][] s = new int[ga.length][ga.length];
		System.out.print("A = ");
		for (i = 0; i < a.length; i++) {
			System.out.print("{" + a[i] + " " + "}");
		}
		System.out.println();
		System.out.print("B = ");
		for (i = 0; i < b.length; i++) {
			System.out.print("{" + b[i] + " " + "}");
		}
		System.out.println();
		int j;
		j = 0;
		for (i = 0; i < ga.length; i++) {
			if (ga[i] == 1) {
				do {
					if (gb[j] == 1) {
						q = false;
					} else {
						q = true;
						j++;
					}
				} while (q);
				if (!(a[i].equals(b[j]))) {
					r[i][j] = 1;
					j++;
				}
			}
		}
		j = 0;
		for (i = 0; i < ga.length; i++) {
			if (ga[i] == 1) {
				do {
					if (r[i][j] == 0)
						q = false;
					else {
						q = true;
						j++;
					}
				} while ((q) & (j < ga.length));
				s[i][j] = 1;
				j++;
			}
		}
		System.out.println();
		System.out.println("aRb:");
		printname(a, b, r);
		System.out.println();
		System.out.println("aSb");
		printname(a, b, s);
		System.out.println();
		boolean h=true;
		do{
		System.out.println("S+R enter 1");
		System.out.println("SxR enter 2");
		System.out.println("(R^-1) enter 3");
		System.out.println("Sx(R^-1) enter 4");
		System.out.println("exit enter 5");
		System.out.println();
		do {
			int c = sc.nextInt();

			switch (c) {
			case 1:
				printname(a, b, rsums(s, r));
				
				q = false;
				break;
			case 2:
				prindec(rdecs(a, b, s, r));
				q = false;
				break;
			case 3:
				printname(b, a, rob(ga, gb,r));

				q = false;
				break;
			case 4:
				prindec(rdecs1(a, b, s, rob(gb, ga,r)));
				q = false;
				break;
			case 5: h=false;q=false;break;
			default:
				System.out.println("eror, try again");
				q = true;
			}
		} while (q);
		}while(h);
		
	}

	void menu2(int r1[][]) {
		Scanner sc = new Scanner(System.in);
		int i;
		boolean q = true;
		boolean h;
		System.out.println("Перевірка на:");
		do{
			h=true;
			do {
		System.out.println("рефлексивність -1");
		System.out.println("антирефлексивність-2");
		System.out.println("симетричність-3");
		System.out.println("антисиметричність-4");
		System.out.println("транзитивність-5");
		System.out.println("exit -6");

			i = sc.nextInt();
			switch (i) {
			case 1:
				prinperev(reflex(rob2(r1)));
				q = false;
				break;
			case 2:
				prinperev(antireflex(r1));
				q = false;
				break;
			case 3:
				prinperev(sumetry(r1));
				q = false;
				break;
			case 4:
				prinperev(antysumetry(r1));
				q = false;
				break;
			case 5:
				prinperev(transit(r1));
				q = false;
				break;
			case 6: h=false;q=false;break;
			default:
				System.out.println("error, try again");
				q = true;
				break;
			}
		} while (q);
		}while(h);
	}

	void prinperev(boolean q) {
		if (q == true)
			System.out.println("yes");
		else
			System.out.println("no");
	}

	void printname(String a[], String b[], int r[][]) {
		for (int i = 0; i < r.length; i++) {
			for (int j = 0; j < r.length; j++) {
				if (r[i][j] == 1)
					System.out.println(a[i] + "-" + b[j]);
			}
		}
	}

	boolean antysumetry(int r2[][]) {
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

	boolean sumetry(int r2[][]) {
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

	boolean antireflex(int r2[][]) {
		boolean q = true;
		int i, j;
		for (i = 0; i < r2.length; i++) {
			for (j = 0; j < r2.length; j++) {
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

	boolean reflex(int r2[][]) {
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

	int[][] rob(int ga[], int gb[],int r[][]) {
		int rob[][] = new int[gb.length][ga.length];
		for (int k = 0; k < rob.length; k++) {
			for (int k2 = 0; k2 < rob.length; k2++) {
				if (r[k][k2]==1)rob[k2][k]=1;
			}
		}
		return rob;
	}

	int[][] rob2(int r[][]) {
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

	String[][] bin(String[] a, String[] b, int r[][]) {
		int i, j, n, k;
		k = 0;
		n = 0;
		for (i = 0; i < r.length; i++) {
			for (j = 0; j < r.length; j++) {
				if (r[i][j] == 1)
					k++;
			}
		}
		String bin[][] = new String[k][2];
		for (i = 0; i < r.length; i++) {
			for (j = 0; j < r.length; j++) {
				if (r[i][j] == 1) {
					bin[n][0] = a[i];
					bin[n][1] = b[j];
					n++;
				}
			}
		}
		return bin;
	}

	void prinmas(int[][] a) {
		for (int i = 0; i < a.length; i++) {

			for (int j = 0; j < a[i].length; j++) {
				System.out.print(a[i][j] + " ");
			}
			System.out.println();
		}
	}

	int[][] rsums(int r[][], int s[][]) {
		int i, j;
		int sum[][] = new int[r.length][r[0].length];
		for (i = 0; i < r.length; i++) {
			for (j = 0; j < r[i].length; j++) {
				if ((r[i][j] == 1) | (s[i][j] == 1))
					sum[i][j] = 1;
			}
		}
		return sum;
	}

	String[][] rdecs(String[] a, String[] b, int r[][], int s[][]) {
		String rbin[][] = new String[bin(a, b, r).length][2];
		rbin = bin(a, b, r);
		String sbin[][] = new String[bin(a, b, s).length][2];
		sbin = bin(a, b, s);
		int i, j, n;
		n = 0;
		String rdecs[][] = new String[rbin.length * sbin.length][4];
		for (i = 0; i < rbin.length; i++) {
			for (j = 0; j < sbin.length; j++) {
				rdecs[n][0] = rbin[i][0];
				rdecs[n][1] = rbin[i][1];
				rdecs[n][2] = sbin[j][0];
				rdecs[n][3] = sbin[j][1];
				n++;
			}
		}
		return rdecs;
	}
	String[][] rdecs1(String[] a, String[] b, int s[][], int rob[][]) {
		
		String rbin[][] = new String[bin(b, a, rob).length][2];
		rbin = bin(b, a, rob);
		String sbin[][] = new String[bin(a, b, s).length][2];
		sbin = bin(a, b, s);
		int i, j, n;
		n = 0;
		String rdecs[][] = new String[rbin.length * sbin.length][4];
		for (i = 0; i < rbin.length; i++) {
			for (j = 0; j < sbin.length; j++) {
				rdecs[n][0] = sbin[i][0];
				rdecs[n][1] = sbin[i][1];
				rdecs[n][2] = rbin[j][0];
				rdecs[n][3] = rbin[j][1];
				n++;
			}
		}
		return rdecs;
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

	int[][] rdecsInt(int r1[][], int r2[][]) {
		int i, j, n, m;
		int l = 0;
		int h = 0;
		for (i = 0; i < r1.length; i++) {
			for (j = 0; j < r1[i].length; j++) {
				if (r1[i][j] == 1)
					l++;
			}
		}
		int bin1[][] = new int[l][2];
		n = 0;
		for (i = 0; i < r1.length; i++) {
			for (j = 0; j < r1[i].length; j++) {
				if (r1[i][j] == 1) {
					bin1[n][0] = i;
					bin1[n][1] = j;
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
		int bin2[][] = new int[h][2];
		for (i = 0; i < r2.length; i++) {
			for (j = 0; j < r2[i].length; j++) {
				if (r2[i][j] == 1) {
					bin2[m][0] = i;
					bin2[m][1] = j;
					m++;
				}
			}
		}
		m = m - 1;
		n = n - 1;
		int dec[][] = new int[l * h][4];
		n = 0;
		for (i = 0; i < bin1.length; i++) {
			for (j = 0; j < bin2.length; j++) {
				dec[n][0] = bin1[i][0];
				dec[n][1] = bin1[i][1];
				dec[n][2] = bin2[j][0];
				dec[n][3] = bin2[j][1];
				n++;
			}
		}
		return dec;
	}

	void prindec(String rdecs[][]) {
		int i;
		for (i = 0; i < rdecs.length; i++) {
			System.out.println(rdecs[i][0] + "-" + rdecs[i][1] + "|"
					+ rdecs[i][2] + "-" + rdecs[i][3]);
		}
	}

	void prindec(int rdecs[][]) {
		int i;
		for (i = 0; i < rdecs.length; i++) {
			System.out.println(rdecs[i][0] + "-" + rdecs[i][1] + "|"
					+ rdecs[i][2] + "-" + rdecs[i][3]);
		}
	}
}
