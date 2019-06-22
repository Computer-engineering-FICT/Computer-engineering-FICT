package com.lab111.labwork7;

/**
 * A concrete command implementation
 * @author freil
 *
 */
public class FillCommand implements MouseCommand {

	@Override
	public void execute(Graphics graphics, int x, int y) {
		System.out.format("Fill the area around (%d, %d)\n", x, y);
	}

}
