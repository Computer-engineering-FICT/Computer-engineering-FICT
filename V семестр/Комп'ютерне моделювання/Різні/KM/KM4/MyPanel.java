package KM4;

import java.awt.Color;
import java.awt.Graphics;
import java.util.Random;
import javax.swing.JPanel;
public class MyPanel extends JPanel{
    private boolean drawen = false;
    private int[] _y;
    private int _m;
    private float max_delta_local = 0;

public float getDeltaMax(){
        return max_delta_local - 10;
}
     public void count(int N, int M, int A, int C, int D, int kk, double ljambda){
        drawen = true;
        _m = M; 
        double[] w = new double[kk]; // масив згенерованих чисел
        double[] t = new double[N]; // масив згенерованих чисел
        _y = new int[M];
        Random random = new Random();
        
        double sum = 0;
        for (int i = 0; i < N; i++) {
            sum = 0;
            w[0] = random.nextDouble();
            for (int q = 1; q < kk; q++){
                w[q] = (A * w[q - 1] + C) / D; // генерація чисел
                w[q] -= (int) w[q];
                sum += Math.log(w[q]);
            }
            t[i] = - 1 / (ljambda * kk) * sum;
            t[i] -= (int) t[i];
            //System.out.println(t[i]);
        }
        for (int i = 0; i < N - 1; i++) {_y[(int) (t[i] * M)]++;}
            _y[M - 1]++;
        float[] delta = new float[M];    
        float midsum = (float) N / M;
        max_delta_local = 0;
	for (int k = 0; k < M; k++){
            delta[k]=(Math.abs(_y[k]-midsum))*100/midsum;
	    if (delta[k] > max_delta_local){
                max_delta_local = delta[k];
	    }
        }   
    }
	public void paint(Graphics g) {
		super.paint(g);
                System.out.println(drawen);
                if (drawen){
                    g.drawLine(10, 360, 360, 360);
                    g.drawLine(10, 10, 10, 360);
                    int maxY = getMax(_y);
                    int oneY = 350 / maxY;
                    int oneX = 350 / _m;
                    int color = 0x000FFF;
                    Color c = new Color(color);
                    for (int i = 0; i < _y.length; i++){
                            g.setColor(c);
                            g.fillRect((i + 1)*oneX, 360 - oneY * _y[i], oneX, oneY * _y[i]);
                            c = new Color(color - i*(_m / 10));
                    }
                }
	}
	private int getMax(int[] _y2) {
		int max = 0;
		for (int i = 0; i < _y2.length; i++){
			if (max < _y2[i]) max = _y2[i];
		}
		return max;
	}
}
