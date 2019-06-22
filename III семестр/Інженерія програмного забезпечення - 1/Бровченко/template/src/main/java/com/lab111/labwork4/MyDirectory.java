package com.lab111.labwork4;

/**
 * Realize interface MyDirectoryIf.
 * Class for work with directories.
 * @author Anastasia Brovchenko
 */
public class MyDirectory implements MyDirectoryIf {

    @Override
    public void create(String path) {
        System.out.println("Directory "+ path+ " created");
    }

    @Override
    public void rmdir(String path) {
        System.out.println("Directory "+ path+ " deleted");
    }
}
