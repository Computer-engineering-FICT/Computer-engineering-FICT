package com.lab111.Lab4var9;

/**
 * 
 * @author A
 * @version 4.9
 */
public class TextFile implements File {
	private Directory parent; 
	private String name;

	/**
	 * @see com.lab111.Lab4var9.File#open(java.lang.String, boolean)
	 */
	@Override
	public void open(String path, boolean createIfNotExist) {
		String[] tokens = path.split("/");
		parent = new Folder(path.substring(0, tokens[tokens.length-1].length()-1)); 
		name = tokens[tokens.length-1]+".txt"; 
		parent.addFile(this); 
		if(createIfNotExist){
			parent.remove(name);
		}
	}
	/**
	 * @see com.lab111.Lab4var9.File#close()
	 */
	@Override
	public void close() {
		System.out.println("close file name = "+name);
	}
	/**
	 * @see com.lab111.Lab4var9.File#delete()
	 */
	@Override
	public void delete() {
		parent.remove(this.name);
		System.out.println("remove this file name = "+this.name);
	}
	/**
	 * @see com.lab111.Lab4var9.File#getName()
	 */
	@Override
	public String getName() {
		return name;
	}
	/**
	 * @see com.lab111.Lab4var9.File#open(java.lang.String, com.lab111.Lab4var9.Directory, boolean)
	 */
	@Override
	public void open(String name, Directory parent, boolean createIfNotExist) {
		this.name = name+".txt"; 
		this.parent = parent; 
		parent.addFile(this); 
		if(createIfNotExist){
			parent.remove(name);
		}
	}
}
