package com.lab111.labwork4;
/**
 * concrete realization API1
 * @author Nightingale
 *
 */
public class ImpAPI1 implements API1{
	@Override
	public void draw(int x1, int y1, int x2, int y2) {
		System.out.println("draw rectangle: ("+x1+","+y1+") ("+x2+","+y1+
				") ("+x2+","+y2+") ("+x1+","+y2+")");		
	}
	@Override
	public void drawLine(int x1, int y1, int x2, int y2) {		
		int x=Math.abs(x1-x2);
		int y=Math.abs(y1-y2);
		if (x>=y){
			draw(x1,y1,x2,y1);
		    draw(x2,y1,x2,y2);
		}else{
			draw(x1,y1,x1,y2);
			draw(x1,y2,x2,y2);
		}
	}
	@Override
	public void drawPoint(int x, int y) {
		draw(x,y,x,y);
	}
	@Override
	public void drawRect(int x, int y, int width, int height, double phi) {
		int x1=x-width/2;
		int y1=y-height/2;
		int x2=x+width/2;
		int y2=y+height/2;
		draw(x1,y1,x2,y2);			
	}
}