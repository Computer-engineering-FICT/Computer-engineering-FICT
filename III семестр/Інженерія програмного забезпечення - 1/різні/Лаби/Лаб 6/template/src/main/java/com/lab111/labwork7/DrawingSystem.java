package com.lab111.labwork7;

/**
 * A graphics editor facade acting as 'invoker' in 'command' pattern and as
 * a caretaker in 'memento' pattern
 * @author freil
 *
 */
public class DrawingSystem {

	private DrawingContext drawingContext;
	
	private Toolbox toolbox;

	public DrawingSystem() {
		drawingContext = new DrawingContext();
		toolbox = new Toolbox(new Tool[] { new PenTool(), new FillTool() });
		toolbox.setContext(drawingContext);
	}

	public void create(int x, int y) {
		Graphics graphics = new Graphics(x, y);
		drawingContext.setGraphics(graphics);
	}

	/**
	 * Process particular mouse event. Invoker role implementation in a
	 * 'command' pattern.
	 * @param x
	 * @param y
	 */
	public void onClick(int x, int y) {
		Tool tool = drawingContext.getSelectedTool();
		MouseCommand command = tool.getCommand();
		// 'caretaker' role in 'memento' pattern 
		Object undoStep = drawingContext.createCheckpoint();
		drawingContext.addUndoStep(undoStep);
		// end of 'caretaker' role code
		command.execute(drawingContext.getGraphics(), x, y);
	}

	public void onSelectTool(String name) {
		toolbox.selectTool(name);
	}

	public void onSelectTool(int index) {
		toolbox.selectTool(index);
	}

}
