package com.lab111.labwork7;

import java.util.Stack;

/**
 * Context that keeps current drawing editor state. In this case tool property
 * used as state object thus taking its part in a 'state' pattern
 * Also, it is able to 
 *
 * @author freil
 *
 */
public class DrawingContext {
	
	private Tool selectedTool;

	private Graphics graphics;

	private Stack<Object> undo;

	public DrawingContext() {
		System.out.println("Created new 'DrawingContext' state object");
		undo = new Stack<Object>();
	}

	public void selectTool(Tool tool) {
		selectedTool = tool;
		System.out.println("Tool '" + tool.getName() + "' selected in drawing context");
	}

	public Tool getSelectedTool() {
		return selectedTool;
	}

	/**
	 * @return the graphics
	 */
	public Graphics getGraphics() {
		return graphics;
	}

	/**
	 * @param graphics the graphics to set
	 */
	public void setGraphics(Graphics graphics) {
		this.graphics = graphics;
	}

	/**
	 * Sample 'memento' object creation, thus implementing a 'memento' pattern 
	 * @return
	 */
	public Object createCheckpoint() {
		return graphics.clone();
	}

	/**
	 * Restores previously saved graphics content thus implementing a
	 * 'memento' pattern
	 * @param checkpoint
	 */
	public void restoreToCheckpoint(Object checkpoint) {
		if (checkpoint instanceof Graphics) {
			setGraphics((Graphics)checkpoint);
		}
	}

	public void addUndoStep(Object step) {
		System.out.println("'Memento' object is stored in undo chain");
		undo.push(step);
	}

	public Object getUndoStep() {
		return undo.pop();
	}
}
