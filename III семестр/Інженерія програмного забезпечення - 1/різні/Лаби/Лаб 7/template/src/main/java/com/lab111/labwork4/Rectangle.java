package com.lab111.labwork4;
/**
 * improves figure class
 * defines rectangle
 * @author Nightingale
 *
 */
public class Rectangle extends Figure{
	/**
	 * fields give information about position in space
	 */
	private int x;
	private int y;
	private int width;
	private int height;
	private double phi;
	/**
	 * constructor
	 * @param x center
	 * @param y center
	 * @param width width of object
	 * @param height height of object
	 * @param phi angle to the axis from х
	 * @param api realization
	 */
	public Rectangle(int x, int y, int width, int height, double phi, API api){
    	setX(x);
    	setY(y);
    	setWidth(width);
    	setHeight(height);
    	setPhi(phi);
    	setAPI(api);
    }
    public Rectangle(int x, int y, int width, int height, API api){
    	this(x,y,width,height,0,api);
    }
    public Rectangle(API api){
    	this(0,0,0,0,api);
    }
    /**
     * draw method
     */
    public void draw(){
    	if(getAPI()!=null) getAPI().drawRect(x,y,width,height,phi);
    }
    /**
     * set х
     * @param x center
     */
    public void setX(int x){
    	this.x=x;
    }
    /**
     * set у
     * @param у center
     */
    public void setY(int y){
    	this.y=y;
    }
    /**
     * @return х
     */
    public int getX(){
    	return this.x;
    }
    /**
     * @return у
     */
    public int getY(){
    	return this.y;
    }
    /**
     * @return width
     */
    public int getWidth(){
    	return this.width;
    }
    /**
     * @return height
     */
    public int getHeight(){
    	return this.height;
    }
    /**
     * задает ширину
     * @param w ширина
     */
    public void setWidth(int w){
    	this.width=w;
    }
    /**
     * set height
     * @param h height 
     */
    public void setHeight(int h){
    	this.height=h;
    }
    /**
     * set angle
     * @param phi angle
     */
    public void setPhi(double phi){
    	this.phi=phi;
    }
    /**
     * return angle
     * @return angle
     */
    public double getPhi(){
    	return this.phi;
    }
}