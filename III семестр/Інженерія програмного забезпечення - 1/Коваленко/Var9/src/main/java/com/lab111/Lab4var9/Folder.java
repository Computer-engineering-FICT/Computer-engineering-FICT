package com.lab111.Lab4var9;

import java.util.ArrayList;

/**
 * class Folder realizes directory
 * @author A
 * @version 4.9
 */
public class Folder implements Directory{
	private Directory parentFolder;
	private String name; 
	private ArrayList<Directory> childrens; 
	private ArrayList<File> files;
	
	public Folder(String path){
		if (path.length() == 2){
			parentFolder = null;
			name = path; 
			loadFiles(path);
			System.out.println("The root folder was created: name = "+name);
		} 
		else {
			String[] tokens = path.split("/"); 
			name = tokens[tokens.length-1];
			System.out.println("The \"" + name + "\" folder was created");
			parentFolder = new Folder(
					path.substring(0, path.length() - tokens[tokens.length-1].length()-1));
			loadFiles(path);
		}
	}
	public Folder(String name, Directory parent){ 
		parentFolder = parent;
		((Folder)parent).addChild(this); 
		this.name = name; 
		childrens = new ArrayList<>(); 
		files = new ArrayList<>();
		System.out.println("The \"" + name + "\" was created");
	}
	private void loadFiles(String path){ 
		childrens = new ArrayList<>(); files = new ArrayList<>();
		System.out.println("All files and folders in " + name + " were loaded");
	}
	private void addChild(Directory children){ 
		childrens.add(children);
	}
	public ArrayList<Directory> getChildrens(){ 
		return childrens;
	}
	/**
	 * @see com.lab111.Lab4var9.Directory#create(java.lang.String)
	 */
	@Override
	public void create(String name) {
		addChild(new Folder(name, this));		
	}
	/**
	 * @see com.lab111.Lab4var9.Directory#remove(java.lang.String)
	 */
	@Override
	public void remove(String name) {
		if(isFolder(name)){
			getFolder(name).emptyDirectory();
		}
		if(getFile(name) != null) {
			getFile(name).delete();
		}
		System.out.println("No such files in directory");
	}
	/**
	 * @see com.lab111.Lab4var9.Directory#getName()
	 */
	@Override
	public String getName() {
		return name;
	}
	/**
	 * @see com.lab111.Lab4var9.Directory#emptyDirectory()
	 */
	@Override
	public void emptyDirectory() {
		Directory[] chs = new Directory[0]; 
		chs = childrens.toArray(chs); 
		for(Directory f : chs){
			f.emptyDirectory();
		}
		for(File f : files){
			f.delete();
		}
		((Folder)parentFolder).childrens.remove(this);
	}
	/**
	 * @see com.lab111.Lab4var9.Directory#printDirectories()
	 */
	@Override
	public void printDirectories() {
		System.out.println(name); 
		for(Directory d : childrens) {
			d.printDirectories(); 
		}
		for(File f : files){
			System.out.println(f.getName());
		}
	}
	/**
	 * @see com.lab111.Lab4var9.Directory#getRoot()
	 */
	@Override
	public Directory getRoot() {
		if(parentFolder == null) 
			return this;
		return parentFolder.getRoot();
	}
	/**
	 * @see com.lab111.Lab4var9.Directory#addFile(com.lab111.Lab4var9.File)
	 */
	@Override
	public void addFile(File fileToBeAdded) {
		files.add(fileToBeAdded);		
	}
	public boolean isFolder(String name){ 
		return getFolder(name) != null;
	}
	private Directory getFolder(String name){
		for(Directory f : childrens){
			if(f.getName().equals(name)) 
				return f;
		}
		return null;
	}
	private File getFile(String name){
		for(File f : files){
			if(f.getName().equals(name)) return f;
		}
		return null;
	}
}
