package Hand;

public class Profile {

  public String Photo;

  public String Email;

  public String Login;

  public String Password;

  public String Contacts;

  public Boolean State;

  public String Info;

  public UserCategory Category;

  Profile() {
	  
  }

  Profile(String Photo, String Email, String Login, String Password, String Contacts, Boolean State, String Info, UserCategory Category) {
	  this.Photo = Photo;
	  this.Email = Email;
	  this.Login = Login;
	  this.Contacts = Password;
	  this.State = State;
	  this.Info = Info;
	  this.Category = Category;
  }

  public String getPhoto() {
	  return this.Photo;
  }

  public void setPhoto(String Photo) {
	  Photo = this.Photo;
  }

  public String getEmail() {
	  return this.Email;
  }

  public void setEmail(String email) {
	  this.Email = email;
  }

  public String getLogin() {
	  return this.Login;
  }

  public void setLogin(String login) {
	  this.Login = login;
  }

  public String getPassword() {
	  return this.Password;
  }

  public void setPassword(String password) {
	  this.Password = password;
  }

  public String getContacts() {
	  return this.Contacts;
  }

  public void setContacts(String contacts) {
	  this.Contacts = contacts;
  }

  public Boolean getState() {
	  return this.State;
  }

  public void setState(Boolean state) {
	  this.State = state;
  }

  public String getInfo() {
	  return this.Info;
  }

  public void setInfo(String info) {
	  this.Info = info;
  }

  public UserCategory getCategory() {
	  return this.Category;
  }

  public void setCategory(UserCategory category) {
	  this.Category = category;
  }

  public String toStringPhoto() {
	  return "Profile [Photo=" + getPhoto() + "]";
  }
  
  public String toStringEmail() {
  	return "Email [Email=" + getEmail() + "]";
  }
  
  public String toStringLogin() {
  	return "Login [Login=" + getLogin() + "]";
  }
  
  public String toStringPassword() {
  	return "Password [Password=" + getPassword() + "]";
  }
  
  public String toStringContacts() {
  	return "Contacts [Contacts=" + getContacts() + "]";
  }
  
  public String toStringState() {
	  	return "State [State=" + getState() + "]";
  }
  
  public String toStringInfo() {
	  	return "Info [Info=" + getInfo() + "]";
  }
  
  public String toStringCategory() {
	  	return "Category [Category=" + getCategory() + "]";
  }
  
  }