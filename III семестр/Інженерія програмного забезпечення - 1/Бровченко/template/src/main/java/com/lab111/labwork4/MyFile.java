package com.lab111.labwork4;

/**
 * Realize interface MyFileIf.
 * Class for work with files.
 * @author Anastasia Brovchenko
 */
public class MyFile implements MyFileIf{

    @Override
    public void open(String path, boolean createIfNotExist) {
        if (createIfNotExist) System.out.println("File "+ path+ " created");
        else System.out.println("File "+ path+ " rewrited");
        System.out.println("File "+ path+ " opened");
    }

    @Override
    public void close() {
        System.out.println("File closed");
    }

    @Override
    public void delete(String path) {
        System.out.println("File "+ path+ " deleted");
    }
}
