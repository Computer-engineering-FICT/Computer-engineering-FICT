package KM2;

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
    public void count(int N, int M, int A, int C, int D){
        drawen = true;
        _m = M; 
        double[] w = new double[N]; // масив згенерованих чисел
        double[] w2 = new double[N];
        _y = new int[M];
        Random random = new Random();
        w[0] = 0.67510980;//random.nextDouble();
        for (int i = 1; i < N; i++) {
            w[i] = (A * w[i - 1] + C) / D; // генерація чисел
            w[i] -= (int) w[i];
        }
        //------------------------------------------------
        float wSum = 0;
        for (int i = 0, k = 0; i < N; i++){
            for (int j = 0; j < 12; j++){
                if (i + j >= N){
                    k = i + j - N;
                } else {
                    k = i + j;
                }
                wSum += w[k];
            }
            //System.out.println(wSum);
            wSum -= (int) wSum;
            //System.out.println(wSum);
            w2[i] = wSum;
        }
        for (int i = 0; i < 12; i++){
            
        }
        //------------------------------------------------
        for (int i = 0; i < N - 1; i++) {_y[(int) (w2[i] * M)]++;}
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
