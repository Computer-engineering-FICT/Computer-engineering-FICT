package com.lab111.Lab6var9;

/**
 * Main class for testing Lab.N6 var9
 * @author A
 * @version 6.9
 */
public final class TestMain {

	/**
	 * @param args - arguments from command line
	 */
	public static void main(String[] args) {
		
		PartsOfNetwork ñ = new Cable(1000);
		PartsOfNetwork s = new Server(2000);
		PartsOfNetwork ws = new WorkStation(4000);
		
		System.out.println("Accept the information about prices of cable, server and workstations");
		Visitor v = new Price();
		ñ.accept(v);
		s.accept(v);
		ws.accept(v);
		System.out.println("Price of Cable: " + ñ.getPrice() + " $");
		System.out.println("Price of Server: " + s.getPrice() + " $");
		System.out.println("Price of WorkStations: " + ws.getPrice() + " $");
		System.out.println("Calculation total price of our structure");
		double totalPrice = ñ.getPrice() + s.getPrice() + ws.getPrice(); 
		System.out.println("Total price is : " + totalPrice + " $");
	}
}