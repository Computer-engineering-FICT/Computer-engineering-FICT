package Hand;

public class Comment {

  public String Date;

  public Integer Rating;

  public String Text;

  public Profile Profile;

  public Deal Deal;
  
  Comment(){
	  
  }

public Comment(String date, Integer rating, String text, Hand.Profile profile,
		Hand.Deal deal) {
	this.Date = date;
	this.Rating = rating;
	this.Text = text;
	this.Profile = profile;
	this.Deal = deal;
}

public String getDate() {
	return this.Date;
}

public void setDate(String date) {
	this.Date = date;
}

public Integer getRating() {
	return this.Rating;
}

public void setRating(Integer rating) {
	this.Rating = rating;
}

public String getText() {
	return this.Text;
}

public void setText(String text) {
	this.Text = text;
}

public Profile getProfile() {
	return this.Profile;
}

public void setProfile(Profile profile) {
	this.Profile = profile;
}

public Deal getDeal() {
	return this.Deal;
}

public void setDeal(Deal deal) {
	this.Deal = deal;
}
public String toStringDate() {
	return "UserCategory [Date=" + getDate() + "]";
}
public String toStringRating() {
	return "UserCategory [Rating=" + getRating() + "]";
}
public String toStringText() {
	return "UserCategory [Text=" + getText() + "]";
}
public String toStringProfile() {
	return "UserCategory [Profile=" + getProfile() + "]";
}
public String toStringDeal() {
	return "UserCategory [Deal=" + getDeal() + "]";
}
 
}