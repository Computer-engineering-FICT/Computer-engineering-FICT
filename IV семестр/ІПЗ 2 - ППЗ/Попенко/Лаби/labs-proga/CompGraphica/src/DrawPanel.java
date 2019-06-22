import java.awt.Color;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;

import javax.swing.JComponent;


public class DrawPanel extends JComponent implements Runnable {
		private double timer;
		private double timerDelta = 0.5;
		private int radius = 200;
		private int rad = 100;
		private int x, y;

		private int width, height;
		private BufferedImage dbImage;
		private Graphics2D dbGraphics;

		public DrawPanel(DrawBoard drb) {
			super();
			width = DrawBoard.WIDTH;
			height = DrawBoard.HEIGHT;
			this.setSize(width, height);
			dbImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
			dbGraphics = dbImage.createGraphics();
			dbGraphics.setBackground(Color.WHITE);
			dbGraphics.setColor(Color.ORANGE);
			timer = 0;
			new Thread(this).start();
		}
		@Override
		protected void paintComponent(Graphics g) {
			Graphics2D g2 = (Graphics2D) g;
			dbGraphics.clearRect(0, 0, width, height);
			x = (int) -Math.round(Math.cos(timer*Math.PI/180)*radius);
			y = (int) -Math.round(Math.sin(timer*Math.PI/180)*radius);
			int x1 = (int) -Math.round(Math.cos(0.0*Math.PI/180)*radius);
			int y1 = (int) -Math.round(Math.sin(0.0*Math.PI/180)*radius);
			if((timer <= 180))
				dbGraphics.fillOval(x + width/2  - rad/2, y + height/2 - rad/2, rad, rad);
			else 
				timer = 0.0;
			g2.drawImage(dbImage, 0, 0, this);
			
		} 
		
		
		@Override
		public void run() {
			while (true) {
				repaint();
				timer += timerDelta;
				try {
					Thread.sleep(10);
				} catch (InterruptedException ex) {
					System.out.println("InterruptedException!\n" + ex.getMessage());
				}
			}
		}
	}