import java.util.Date;

import mpi.*;

public class MPI_main {
	
	public static void main(String[] args) throws Exception {		
		MPI.Init(args);
		int rank = MPI.COMM_WORLD.Rank();
		int size = MPI.COMM_WORLD.Size();
		int P = size;
		int N = Integer.parseInt(args[3]); //вводится с консоли при запуске приложения.
		int H = N/P;
		
		int currentH_B_A;
		int currentH_ME_MX;
		//если верхняя линия
		if (rank <= (P / 2) - 1) {
			currentH_B_A = N - (rank * 2 * H);
			currentH_ME_MX = (rank + 1) * 2 * H;
		} else { //если нижняя линия
			currentH_B_A = H;
			currentH_ME_MX = H;
		}
		int[] MX = new int[currentH_ME_MX * N];
		int[] ME = new int[currentH_ME_MX * N];
		int[] B = new int[currentH_B_A];
		int[] MO = new int[N * N];
		int[] C = new int[N];
		int[] A = new int[currentH_B_A];
		
		Date date;
		long startTime = 0;
	    if (rank == 0) {
	        date = new java.util.Date();
	        startTime = date.getTime();
	    }
	    if (rank < P/4 - 1) {
			if (rank == 0) {
				//ввод данных
				for (int i = 0; i < N; i++) {
					for (int j = 0; j < N; j++) {
						MO[i*N + j] = 1;
					}
				}
				for (int i = 0; i < B.length; i++) {
					B[i] = 1;
				}	
			} else {
				MPI.COMM_WORLD.Recv(B, 0, B.length, MPI.INT, rank - 1, rank - 1);
				MPI.COMM_WORLD.Recv(MO, 0, N * N, MPI.INT, rank - 1, rank - 1);
			}
			MPI.COMM_WORLD.Send(B, 2 * H, B.length - 2 * H, MPI.INT, rank + 1, rank);
			MPI.COMM_WORLD.Send(MO, 0, N * N, MPI.INT, rank + 1, rank);

			//принять С, МЕ, МХ
			MPI.COMM_WORLD.Recv(C, 0, N, MPI.INT, rank + 1, rank);
			MPI.COMM_WORLD.Recv(ME, 0, ME.length, MPI.INT, rank + 1, rank);
			MPI.COMM_WORLD.Recv(MX, 0, MX.length, MPI.INT, rank + 1, rank);

			if (rank > 0) {
				MPI.COMM_WORLD.Send(C, 0, N, MPI.INT, rank + (P / 2), rank);
				MPI.COMM_WORLD.Send(MX, H * N, H * N, MPI.INT, rank + (P / 2), rank);
				MPI.COMM_WORLD.Send(ME, H * N, H * N, MPI.INT, rank + (P / 2), rank);
			}

		} else if ((rank > P / 4) & (rank < P / 2)) {
			if (rank == P/2 - 1) {
				//ввод данных
				for (int i = 0; i < N; i++) {
					for (int j = 0; j < N; j++) {
						MX[i*N + j] = 1;
						ME[i*N + j] = 1;
					}
				}
				for (int i = 0; i < C.length; i++) {
					C[i] = 1;
				}
				int temp;
				for (int i = 0; i < N; i++) {
					for (int j = i; j < N; j++) {
						temp = MX[i*N + j];
						MX[i*N + j] = MX[j*N + i];
						MX[j*N + i] = temp;
						
						temp = ME[i*N + j];
						ME[i*N + j] = ME[j*N + i];
						ME[j*N + i] = temp;
					}
				}
			} else {
				//принять С, МЕ, МХ
				MPI.COMM_WORLD.Recv(C, 0, N, MPI.INT, rank + 1, rank);
				MPI.COMM_WORLD.Recv(ME, 0, ME.length, MPI.INT, rank + 1, rank);
				MPI.COMM_WORLD.Recv(MX, 0, MX.length, MPI.INT, rank + 1, rank);
			}
			MPI.COMM_WORLD.Send(C, 0, N, MPI.INT, rank + (P / 2), rank);
			MPI.COMM_WORLD.Send(MX, H * N, H * N, MPI.INT, rank + (P / 2), rank);
			MPI.COMM_WORLD.Send(ME, H * N, H * N, MPI.INT, rank + (P / 2), rank);

			MPI.COMM_WORLD.Recv(B, 0, B.length, MPI.INT, rank - 1, rank - 1);
			MPI.COMM_WORLD.Recv(MO, 0, N * N, MPI.INT, rank - 1, rank - 1);
		
			if (rank < P-1) {
				MPI.COMM_WORLD.Send(B, 2 * H, B.length - 2 * H, MPI.INT, rank + 1, rank);
				MPI.COMM_WORLD.Send(MO, 0, N * N, MPI.INT, rank + 1, rank);
			}
		}
		
		if (rank == P/4 - 1) {
			MPI.COMM_WORLD.Recv(B, 0, B.length, MPI.INT, rank - 1, rank - 1);
			MPI.COMM_WORLD.Recv(MO, 0, N * N, MPI.INT, rank - 1, rank - 1);
			
			MPI.COMM_WORLD.Send(B, 2 * H, B.length - 2 * H, MPI.INT, rank + 1, rank);
			MPI.COMM_WORLD.Send(MO, 0, N * N, MPI.INT, rank + 1, rank);
			
			MPI.COMM_WORLD.Recv(C, 0, N, MPI.INT, rank + 1, rank);
			MPI.COMM_WORLD.Recv(ME, 0, ME.length, MPI.INT, rank + 1, rank);
			MPI.COMM_WORLD.Recv(MX, 0, MX.length, MPI.INT, rank + 1, rank);
			
			MPI.COMM_WORLD.Send(C, 0, N, MPI.INT, rank + (P / 2), rank);
			MPI.COMM_WORLD.Send(MX, H * N, H * N, MPI.INT, rank + (P / 2), rank);
			MPI.COMM_WORLD.Send(ME, H * N, H * N, MPI.INT, rank + (P / 2), rank);
		}
		
		if (rank == P/4) {
			MPI.COMM_WORLD.Recv(C, 0, N, MPI.INT, rank + 1, rank);
			MPI.COMM_WORLD.Recv(ME, 0, ME.length, MPI.INT, rank + 1, rank);
			MPI.COMM_WORLD.Recv(MX, 0, MX.length, MPI.INT, rank + 1, rank);
			
			MPI.COMM_WORLD.Recv(B, 0, B.length, MPI.INT, rank - 1, rank - 1);
			MPI.COMM_WORLD.Recv(MO, 0, N * N, MPI.INT, rank - 1, rank - 1);
			
			MPI.COMM_WORLD.Send(B, 2 * H, B.length - 2 * H, MPI.INT, rank + 1, rank);
			MPI.COMM_WORLD.Send(MO, 0, N * N, MPI.INT, rank + 1, rank);
			
			MPI.COMM_WORLD.Send(C, 0, N, MPI.INT, rank + (P / 2), rank);
			MPI.COMM_WORLD.Send(MX, H * N, H * N, MPI.INT, rank + (P / 2), rank);
			MPI.COMM_WORLD.Send(ME, H * N, H * N, MPI.INT, rank + (P / 2), rank);
		}
	 	
		if (rank < P/2) {

		//ВЫЧИСЛЕНИЕ
		int[] temp = new int[N * N];
		//MT=(!МО*МХh-МЕh!)
		int sum;
		for (int z = 0; z < H; z++) {
	        for (int i = 0; i < N; i++) {
	            sum = 0;
	            for (int j = 0; j < N; j++) {
	                sum += MO[i*N + j] * MX[z*N  + j];
	            }
	            temp[z*N + i] = sum - ME[z*N + i];
	        }
	    }    

		//А=Вh+С*MTh
	    for (int z = 0; z < H; z++) {
	        for (int i = 0; i < N; i++) {
	            sum = 0;
	            for (int j = 0; j < N; j++) {
	                sum += C[i] * temp[z*N + j];
	            }
	            A[z] = sum + B[z];
	        }
	    }
	    for (int z = 0; z < A.length; z++) {
	    	System.out.print(A[z] + " ");
	    }
	    //ОТПРАВКА РЕЗУЛЬТАТА
	    if (rank >= (P / 2)) {
	    	MPI.COMM_WORLD.Send(A, 0, A.length, MPI.INT, rank - (P / 2), rank - (P / 2));
	    }
	    if (rank < (P / 2)) {
	    	MPI.COMM_WORLD.Recv(A, H, H, MPI.INT, rank + (P / 2), rank);
	    	
	    	if (rank != (P / 2) - 1) {
	    		MPI.COMM_WORLD.Recv(A, 2 * H, A.length - 2 * H, MPI.INT, rank + 1, rank + 1);
	    	}
	    	if (rank != 0) {
	    		MPI.COMM_WORLD.Send(A, 0, A.length, MPI.INT, rank - 1, rank);
	    	}
	    }
		}

	    //РЕЗУЛЬТАТОМ ИМЕЕТСЯ A == [N-1][N][N-3][N-2]...[4][5][2][3][0][1]
	    if (rank == 0) {
	    	if (N < 20) {
	    		int[] As = new int[N];
		    	for (int i = 0; i < A.length; i += 2) {
		    		As[i] = A[N - i - 2];
		    		As[i + 1] = A[N - i - 1];
		    	}
			    for (int z = 0; z < A.length; z++) {
			    	System.out.print(As[z] + " ");
			    }
		    	System.out.println("RESULT IS ");
		    	for (int z = 0; z < A.length; z++) {
			    	System.out.print(As[z] + " ");
			    }
	    	}
	    }

	    if (rank == 0) {
	    	date = new java.util.Date();
	        long finishTime = date.getTime();
	        long time  = finishTime - startTime;
	        
	        System.out.println();
	        System.out.println("N = " + N + " P = " + P + " Work time: " + time + " ms");  
	    }
	    
		MPI.Finalize();
	}
	
}