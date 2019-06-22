package com.lab111.labwork7;

/**
 * Interface for commands
 * @author freil
 *
 */
public interface MouseCommand {

	/**
	 * Executes drawing command on given graphics at given position
	 * @param graphics
	 * @param x
	 * @param y
	 */
	public void execute(Graphics graphics, int x, int y);
}
