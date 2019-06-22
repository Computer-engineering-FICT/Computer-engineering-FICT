package kpi.flashfs.main;

import java.io.File;
import java.util.Scanner;

import kpi.flashfs.control.Controller;

public class Main {
	
	public static void create(Controller c) {
		System.out.println("Input file name:");
		Scanner scan = new Scanner(System.in);
		String name = scan.nextLine();
		c.create(name);
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Controller control = new Controller(new File(Params.FILE_NAME));
		control.mount();

		System.out.println("File " + Params.FILE_NAME + " mounted");
		
		Scanner scan = new Scanner(System.in);
		int choise = 1;
		while (choise != 0) {
			System.out.println("Make choise:");
			System.out.println("1. Create file");
			System.out.println("2. Print file table");
			System.out.println("0. Exit");
			
			choise = scan.nextInt();
			switch (choise) {
			case 0: break;
			case 1:
				create(control);
				break;
			case 2:
				System.out.println(control.printFileTable());
				break;
			default:
				System.out.println("Illegal choise. Try again:");
				break;
			}
		}
		
		control.unmount();
		System.out.println("OK");
	}
}
