package com.lab111.labwork4;
/**
 * concrete realization API2
 * @author Nightingale
 *
 */
public class ImpAPI2 implements API2 {
	@Override
	public void draw(int x1, int y1, int x2, int y2) {	
		System.out.println("draw line: begin x="+x1+" y="
				+y1+", end x="+x2+" y="+y2);
	}
	@Override
	public void drawLine(int x1, int y1, int x2, int y2) {
		draw(x1,y1,x2,y2);		
	}
	@Override
	public void drawPoint(int x, int y) {
		draw(x,y,x,y);
	}
	@Override
	public void drawRect(int x, int y, int width, int height, double phi) {
		double cos=Math.cos(phi);
		double sin=Math.sin(phi);
		int x1=(int) (x+width/2*cos);
		int y1=(int) (y+width/2*sin);
		int x2=(int) (x-height/2*sin);
		int y2=(int) (y-height/2*cos);
		int x3=(int) (x-width*2/cos);
		int y3=(int) (y-width/2*sin);
		int x4=(int) (x+height/2*sin);
		int y4=(int) (y+height/2*cos);
		System.out.println("draw rectangle:"+" phi="+phi);
		draw(x1,y1,x2,y2);
		draw(x2,y2,x3,y3);
		draw(x3,y3,x4,y4);
		draw(x4,y4,x1,y1);
	}
}
