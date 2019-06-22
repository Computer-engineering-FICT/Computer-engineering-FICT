import mpi.*;
import java.util.Date;

public class MPILab8 {
	public static void main(String[] args) throws Exception {	
		MPI.Init(args);
		int rank = MPI.COMM_WORLD.Rank();
		System.out.println("Start thread " + rank);
		int size = MPI.COMM_WORLD.Size();

		int P = 4; //(кол-во задач)вводится с консоли при запуске приложения.
		int N = 4; //ранг матрицы
		int H = N/P; //коеф. разбиения матрицы(целая часть для одной задачи)

		Date date = new java.util.Date();
		long startTime = date.getTime();

		int currentH = 0;
		if(rank == 1){
			currentH=N;
		}else if(rank == 2) {
			currentH=2*H;
		}else{
			currentH=H;
		}

		int[] Ah = new int[currentH];
		int[] Bh = new int[currentH];
		int[] C = new int[N];
		int[] MXh = new int[currentH * N];
		int[] MO = new int[N * N];
		int[] MZ = new int[N * N];

		//ВВОД И РАССПРОСТРАНЕНИЕ ДАННЫХ
		if (rank == 0) {
			//receive Bh,MXh,C,MZ,MO from T1
			MPI.COMM_WORLD.Recv(MZ,  0, N*N, MPI.INT, 1, 1);
			MPI.COMM_WORLD.Recv(MO,  0, N*N, MPI.INT, 1, 1);
			MPI.COMM_WORLD.Recv(C,  0, N, MPI.INT, 1, 1);

			MPI.COMM_WORLD.Recv(MXh, 0, H * N, MPI.INT, 1, 1);
			MPI.COMM_WORLD.Recv(Bh, 0, H, MPI.INT, 1, 1);
		}else if (rank == 1) {
			//ввод данных
			for (int i = 0; i < N; i++) {
				Bh[i] = 1;
				C[i] = 1;
				for (int j = 0; j < N; j++) {
					MXh[i*N + j] = 1;
				}
			}

			//передача-прием данных
			MPI.COMM_WORLD.Send(C, 0, N, MPI.INT, 2, 1);

			MPI.COMM_WORLD.Send(MXh, 2*H*N, 2*H * N, MPI.INT, 2, 1);
			MPI.COMM_WORLD.Send(Bh, 2*H, 2*H, MPI.INT, 2, 1);

			MPI.COMM_WORLD.Recv(MZ,  0, N*N, MPI.INT, 2, 1);
			MPI.COMM_WORLD.Recv(MO,  0, N*N, MPI.INT, 2, 1);

			MPI.COMM_WORLD.Send(MZ,  0, N*N, MPI.INT, 0, 1);
			MPI.COMM_WORLD.Send(MO,  0, N*N, MPI.INT, 0, 1);
			MPI.COMM_WORLD.Send(C,  0, N, MPI.INT, 0, 1);

			MPI.COMM_WORLD.Send(MXh, H*N, H * N, MPI.INT, 0, 1);
			MPI.COMM_WORLD.Send(Bh, H, H, MPI.INT, 0, 1);
		}else if (rank == 2) {
			//ввод данных
			for (int i = 0; i < N*N; i++) {
				MO[i] = 1;
			}

			//передача-прием данных
			MPI.COMM_WORLD.Recv(MZ, 0, N*N, MPI.INT, 3, 1);

			MPI.COMM_WORLD.Recv(C, 0, N, MPI.INT, 1, 1);

			MPI.COMM_WORLD.Recv(MXh, 0, 2*H * N, MPI.INT, 1, 1);
			MPI.COMM_WORLD.Recv(Bh, 0, 2*H, MPI.INT, 1, 1);

			MPI.COMM_WORLD.Send(MO,  0, N*N, MPI.INT, 3, 1);
			MPI.COMM_WORLD.Send(C,  0, N, MPI.INT, 3, 1);

			MPI.COMM_WORLD.Send(MXh, H*N, H * N, MPI.INT, 3, 1);
			MPI.COMM_WORLD.Send(Bh, H, H, MPI.INT, 3, 1);

			MPI.COMM_WORLD.Send(MZ,  0, N*N, MPI.INT, 1, 1);
			MPI.COMM_WORLD.Send(MO,  0, N*N, MPI.INT, 1, 1);
		}else if (rank == 3) {
			//ввод данных
			for (int i = 0; i < N*N; i++) {
				MZ[i] = 1;
			}

			//передача-прием данных
			MPI.COMM_WORLD.Send(MZ,  0, N*N, MPI.INT, 2, 1);

			MPI.COMM_WORLD.Recv(MO, 0, N*N, MPI.INT, 2, 1);
			MPI.COMM_WORLD.Recv(C, 0, N, MPI.INT, 2, 1);

			MPI.COMM_WORLD.Recv(MXh, 0, H * N, MPI.INT, 2, 1);
			MPI.COMM_WORLD.Recv(Bh, 0, H, MPI.INT, 2, 1);
		}

		//счет
		//buf=MXh*MZ
		int[] tmpMh = new int[currentH*N];
		for (int z = 0; z < H; z++) {
			for (int i = 0; i < N; i++) {
				tmpMh[z*N + i] = 0;
				for (int j = 0; j < N; j++) {
					tmpMh[z*N + i] += MXh[z*N + j] * MZ[j*N  + i];
				}
			}
		}
		//MXh=buf*MO
		for (int z = 0; z < H; z++) {
			for (int i = 0; i < N; i++) {
				MXh[z*N + i] = 0;
				for (int j = 0; j < N; j++) {
					MXh[z*N + i] += tmpMh[z*N + j] * MO[j*N  + i];
				}
			}
		}
		//tmpVh=MXh*C
		int[] tmpVh = new int[currentH];
		for (int z = 0; z < H; z++) {
			tmpVh[z] = 0;
			for (int j = 0; j < N; j++) {
				tmpVh[z] += MXh[z*N + j] * C[j];
			}
		}
		//Ah=Bh+tmpVh
		for (int j = 0; j < H; j++) {
			Ah[j] += Bh[j] + tmpVh[j];
		}

		//ОТПРАВЛЕНИЕ РЕЗУЛЬТАТА
		if (rank == 0) {
			MPI.COMM_WORLD.Send(Ah, 0, H, MPI.INT, 1, 1);
		}else if (rank == 1) {
			MPI.COMM_WORLD.Recv(Ah, H, H, MPI.INT, 0, 1);
			MPI.COMM_WORLD.Recv(Ah, 2*H, 2*H, MPI.INT, 2, 1);

			//output
			if(N<9){
				for (int z = 0; z < N; z++) {
					System.out.println(String.format("A[%d]=", z) + Ah[z]);
				}	
			}
		}else if (rank == 2) {
			MPI.COMM_WORLD.Recv(Ah, H, H, MPI.INT, 3, 1);
			MPI.COMM_WORLD.Send(Ah, 0, 2*H, MPI.INT, 1, 1);
		}else if (rank == 3) {
			MPI.COMM_WORLD.Send(Ah, 0, H, MPI.INT, 2, 1);
		}
		System.out.println("Finish thread " + rank);

		if (rank == 1) {
			date = new java.util.Date();
			long finishTime = date.getTime();
			long time  = finishTime - startTime;
			System.out.println("N = " + N + " P=" + P + " Work time: " + time + " ms"); 
		}
		MPI.Finalize();
	} 
}