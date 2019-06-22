package kpi.os.cours.main;

import java.util.ArrayList;

import kpi.os.cours.forms.MainFrame;

public class Start {

    /**
     * @param args
     */
    public static void main(String[] args) {        
    	ArrayList<Integer> a = new ArrayList<Integer>();
    	a.add(1);
    	a.add(2);
    	
    	ArrayList<Integer> b = (ArrayList<Integer>) a.clone();
    	b.add(3);
    	
    	new MainFrame(); 
    }
}