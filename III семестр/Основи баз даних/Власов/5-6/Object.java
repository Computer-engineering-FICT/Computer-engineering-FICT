package database;

public class Object extends ObjectDao {
	private int ID;
	private String Name;
	private String Adress;

	public void SetName(String Name) {
		this.Name = Name;
	}

	public void SetID(int ID) {
		this.ID = ID;
	}

	public void SetAdress(String Adress) {
		this.Adress = Adress;
	}

	public String GetName() {
		return Name;
	}

	public String GetAdress() {
		return Adress;
	}

	public int GetID() {
		return ID;
	}
}
