package com.lab111.labwork7;

/**
 * Fill tool implementation, example of a concrete 'client' in 'command' pattern
 * @author freil
 *
 */
public class FillTool extends Tool {

	public FillTool() {
		name = "Fill";
	}

	@Override
	public MouseCommand getCommand() {
		System.out.println("Command object created");
		return new FillCommand();
	}

}
