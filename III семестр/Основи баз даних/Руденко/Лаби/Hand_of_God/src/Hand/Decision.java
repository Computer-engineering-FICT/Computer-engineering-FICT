package Hand;

public class Decision {

  public String Date;

  public String Comment;

  public Profile Profile;

  public Application Application;
      
 Decision(){
	 
 }
 
 Decision(String Date, String Comment, Profile Profile, Application Application){
	 this.Date = Date;
	 this.Comment = Comment;
	 this.Profile = Profile;
	 this.Application = Application;
 }

public String getDate() {
	return this.Date;
}

public void setDate(String date) {
	this.Date = date;
}

public String getComment() {
	return this.Comment;
}

public void setComment(String comment) {
	this.Comment = comment;
}

public Profile getProfile() {
	return this.Profile;
}

public void setProfile(Profile profile) {
	this.Profile = profile;
}

public Application getApplication() {
	return this.Application;
}

public void setApplication(Application application) {
	this.Application = application;
}


public String toStringDate() {
	return "Decision [Date=" + getDate() + "]";
}
public String toStringComment() {
	return "Decision [Comment=" + getComment() + "]";
}
 
public String toStringProfile() {
	return "Decision [Profile=" + getProfile() + "]";
}
public String toStringApplication() {
	return "Decision [Application=" + getApplication() + "]";
}
 
 
}