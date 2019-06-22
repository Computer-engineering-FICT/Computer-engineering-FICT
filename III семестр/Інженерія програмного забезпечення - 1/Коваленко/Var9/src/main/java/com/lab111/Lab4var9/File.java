package com.lab111.Lab4var9;

/**
 * This interface provides the simple interface for the manipulating of files
 * @author A
 * @version 4.9
 */
public interface File {
	/**
	 * Method opens file in the path
	 * @param path - path of directories
	 * @param createlfNotExist
	 */
	public void open(String path, boolean createIfNotExist);
	/**
	 * Method close current file (you cannot manipulate with him)
	 */
	public void close();
	/**
	 * Method delete this file 
	 */
	public void delete();
	/**
	 * Method return file name 
	 * @return file name
	 */
	public String getName();
	/**
	 * Method open file in exist directory
	 * @param name - file name
	 * @param parent - directory name
	 * @param createIfNotExist - create If Not Exist
	 */
	public void open(String name, Directory parent, boolean createIfNotExist);
}
