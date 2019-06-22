package Hand;

public class Application {

  public String Date;

  public String Description;

  public String Photo;
  
  Application(){
	  
  }
  
  Application(String Date, String Description, String Photo){
	  this.Date = Date;
	  this.Description = Description;
	  this.Photo = Photo;
  }

public String getDate() {
	return this.Date;
}

public void setDate(String date) {
	this.Date = date;
}

public String getDescription() {
	return this.Description;
}

public void setDescription(String description) {
	this.Description = description;
}

public String getPhoto() {
	return this.Photo;
}

public void setPhoto(String photo) {
	this.Photo = photo;
}


public String toStringDate() {
	return "Application [Date=" + getDate() + "]";
}

public String toStringDescription() {
	return "Application [Description=" + getDescription() + "]";
}
  
public String toStringPhoto() {
	return "Application [Photo=" + getPhoto() + "]";
}  

}