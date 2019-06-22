package com.lab111.labwork8;

import java.util.Random;

/**
 * Only workclass.
 *
 * @author Anastasia Brovchenko
 */
public class WorkClass {
    public static void main(String[] args) {

        //create massive for some experiments
        Object[] mas=  new Object[20];
        MyCreator mc;

        //lets try our Factory in work
        for (Object ob: mas){
            if (new Random().nextInt()>0.25) mc= new FirstCreator();
            else mc= new SecondCreator();
            mc.createIterator().searchNextEllement();
        }
    }
}
