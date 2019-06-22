/**
 * 
 */
package com.lab111.labwork7;

/**
 * @author freil
 *
 */
public class Lab7 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		DrawingSystem drawingSystem = new DrawingSystem();
		drawingSystem.create(400, 300);
		drawingSystem.onSelectTool("Pen");
		drawingSystem.onClick(100, 200);
		drawingSystem.onClick(120, 180);
		drawingSystem.onSelectTool("Fill");
		drawingSystem.onClick(150, 160);
	}

}
