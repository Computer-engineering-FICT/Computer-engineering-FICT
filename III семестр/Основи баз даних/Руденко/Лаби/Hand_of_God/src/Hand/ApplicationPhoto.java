package Hand;

public class ApplicationPhoto {

  public String URL;
  
  ApplicationPhoto(){
	  
  }
  
  ApplicationPhoto(String URL){
	  this.URL = URL;
  }

  public String getURL() {
	  return this.URL;
  }

  public void setURL(String URL) {
	  this.URL = URL;
  }


  public String toStringApplicationPhoto() {
	  return "ApplicationPhoto [URL=" + getURL() + "]";
  }
   
}