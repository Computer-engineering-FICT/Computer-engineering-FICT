package Hand;

public class UserCategory {

  public String Name;
 UserCategory(){
	 
 }
public UserCategory(String name) {
	
	this.Name = name;
}
public String getName() {
	return this.Name;
}
public void setName(String name) {
	this.Name = name;
}

public String toStringName() {
	return "UserCategory [Name=" + getName() + "]";
}
 
}