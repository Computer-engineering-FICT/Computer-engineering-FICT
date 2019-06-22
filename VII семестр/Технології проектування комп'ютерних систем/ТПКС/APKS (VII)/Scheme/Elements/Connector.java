package Scheme.Elements;

public class Connector {

	private Element Owner;
	private String Name;

	public Connector(String Name, Element Owner) {
		this.Name = Name;
		this.Owner = Owner;
	}
	
	public String getName() {
		return Name;
	}
	
	public void setName(String Name) {
		this.Name = Name;
	}
	
	public Element getOwner() {
		return Owner;
	}
}
