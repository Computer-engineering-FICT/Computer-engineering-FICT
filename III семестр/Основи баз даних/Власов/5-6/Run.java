package database;

public class Run extends Object {
	public static void main(String[] args) throws Exception {

		Object ObjectT = new Object();

		readAll(ObjectT);
		update(ObjectT, 3);
		Read(ObjectT, 3);
		create(ObjectT);
		Read(ObjectT, 4);
		delete(ObjectT);
		readAll(ObjectT);
		End();
	}
}
