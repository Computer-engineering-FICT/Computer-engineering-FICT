package com.lab111.labwork4;
/**
 * abstract class
 * has a link to API object
 * @author Nightingale
 *
 */
public abstract class Figure {
	/**
	 * realization fields    
	 */     
	private API api;
	/**
	 * drawing method
	 */
    public abstract void draw();
    /**
     * method of changing realization
     * @param api realization
     */
    public void setAPI(API api){
    	this.api=api;
    }
    /**
     * returns realization
     * @return
     */
    public API getAPI(){
    	return this.api;
    }
}