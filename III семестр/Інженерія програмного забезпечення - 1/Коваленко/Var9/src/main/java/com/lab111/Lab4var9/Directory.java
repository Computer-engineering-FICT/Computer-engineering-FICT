package com.lab111.Lab4var9;

/**
 * This Interface provides a simple methods for manipulating of the directories
 * @author A
 * @version 4.9
 */
public interface Directory {
	/**
	* Method creates a new folder in the current folder
	* @param name - the folder name for creating
	*/
	public void create(String name);
	/**
	* Method removes folder/file of the current directory
	* @param name - the folder/file name for removing
	*/
	public void remove(String name);
	/**
	* Method returns name of current folder
	* @return name of current folder 
	*/
	public String getName();
	/**
	* Empty current directory (delete all child-directories) 
	*/
	public void emptyDirectory();
	/**
	* Show structure of directories 
	*/
	public void printDirectories();
	/**
	* Method returns root directory (the last one in a tree)
	* @return root directory (the last one in a tree)
	*/
	public Directory getRoot();
	/**
	* Method adds new File in directory
	* @param fileToBeAdded - file To Be Added
	*/
	public void addFile(File fileToBeAdded);
}
