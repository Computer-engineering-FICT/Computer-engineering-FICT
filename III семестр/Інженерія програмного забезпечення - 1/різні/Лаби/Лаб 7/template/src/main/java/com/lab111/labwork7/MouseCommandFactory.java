package com.lab111.labwork7;

/**
 * Factory for mouse command interface. Also a way to introduce 'client'
 * role in a 'command' pattern
 * @author freil
 *
 */
public interface MouseCommandFactory {

	/**
	 * Instantiates a command that can be executed at a later time
	 * @return
	 */
	MouseCommand getCommand();
}
