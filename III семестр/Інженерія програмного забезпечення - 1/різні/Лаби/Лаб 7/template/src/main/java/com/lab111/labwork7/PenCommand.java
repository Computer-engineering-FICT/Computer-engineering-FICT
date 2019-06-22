package com.lab111.labwork7;

/**
 * A concrete command implementation
 * @author freil
 *
 */
public class PenCommand implements MouseCommand {

	@Override
	public void execute(Graphics graphics, int x, int y) {
		System.out.format("Do pen drawing at (%d, %d)\n", x, y);
	}

}
