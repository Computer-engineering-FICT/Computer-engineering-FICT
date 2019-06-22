package Hand;

public class Deal {

  public String Date;
  
  public Application Application1;
  
  public Application Application2;
  
  Deal(){
	  
  }

 Deal(String date, Application application1, Application application2) {
	this.Date = date;
	this.Application1 = application1;
	this.Application2 = application2;
}

public String getDate() {
	return this.Date;
}

public void setDate(String date) {
	this.Date = date;
}

public Application getApplication1() {
	return this.Application1;
}

public void setApplication1(Application application1) {
	this.Application1 = application1;
}


public Application getApplication2() {
	return this.Application2;
}

public void setApplication2(Application application2) {
	this.Application2 = application2;
}
public String toStringDate() {
	return "Deal [Date=" + getDate() + "]";
}
public String toStringApplication1() {
	return "Deal [Application1=" + getApplication1() + "]";
}
public String toStringApplication2() {
	return "Deal [Application2=" + getApplication2() + "]";
}
}