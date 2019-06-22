package Hand;

public class Applicationcategory {

  public String Name;
  
  Applicationcategory(){
	  
  }
  
  Applicationcategory(String Name){
	  this.Name = Name;
  }

  public String getName() {
	  return this.Name;
  }

  public void setName(String name) {
	  this.Name = name;
  }

  public String toStringName() {
	  return "Application [Name=" + getName() + "]";
  }
  
}