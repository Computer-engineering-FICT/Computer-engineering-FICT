package com.lab111.labwork7;

/**
 * Base class for implementations of 'client' role in a 'command' pattern
 * @author freil
 *
 */
public abstract class Tool implements MouseCommandFactory {

	protected String name;

	public String getName() {
		return name;
	}

	@Override
	public abstract MouseCommand getCommand();
}
