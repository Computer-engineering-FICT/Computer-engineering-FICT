package Hand;

public class Type {

  public String Name;
 Type(){
	 
 }
public Type(String name) {
	this.Name = name;
}
public String getName() {
	return this.Name;
}
public void setName(String name) {
	this.Name = name;
}

public String toStringName() {
	return "Type [Name=" + getName() + "]";
}
 
}