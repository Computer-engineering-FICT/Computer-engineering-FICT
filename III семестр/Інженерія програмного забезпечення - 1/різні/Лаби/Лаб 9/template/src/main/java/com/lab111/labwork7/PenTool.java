package com.lab111.labwork7;

/**
 * Pen tool implementation, example of a concrete 'client' in 'command' pattern
 * @author freil
 *
 */
public class PenTool extends Tool {

	public PenTool() {
		name = "Pen";
	}

	@Override
	public MouseCommand getCommand() {
		System.out.println("Command object created");
		return new PenCommand();
	}

}
