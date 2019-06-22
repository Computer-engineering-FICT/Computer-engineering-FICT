public class Plane {
private int speed;
private int distance;
private int year;
private int places;
private int heigth;
private String name;
private String model;
	
Plane(int speed ,int distance,int year,int places,int heigth,String name,String model){
	this.speed=speed;
	this.distance=distance;
	this.year=year;
	this.places=places;
	this.heigth=heigth;
	this.name=name;
	this.model=model;
}
Plane(){
	this(0,0,0,0,0,"-/-","-/-");
}
Plane(int speed){
	this(speed,0,0,0,0,"-/-","-/-");
}
Plane(int speed,int distance){
	this(speed,distance,0,0,0,"-/-","-/-");
}
Plane(int speed,int distance,int year){
	this(speed,distance,year,0,0,"-/-","-/-");
}
Plane(int speed,int distance,int year,int places){
	this(speed,distance,year,places,0,"-/-","-/-");
}
// Access methods:
// Setting methods:
public final void setAll(int speed,int distance,int year,int places,int heigth,String namex,String modelx){
	setSpeed(speed);
	setDistance(distance);
	setYear(year);
	setPlaces(places);
	setHeigth(heigth);
	setName(namex);
	setModel(modelx);
}

public final void setSpeed(int speed){
	this.speed=speed;
}
public final void setDistance(int distance){
	this.distance=distance;
}
public final void setYear(int year){
	this.year=year;
}
public final void setPlaces(int places){
	this.places=places;
}
public final void setHeigth(int heigth){
	this.heigth=heigth;
}
public final void setName(String name){
	this.name = name;
}
public final void setModel(String model){
	this.model=model;
}
// Getting methods:

public final void printAll(){
	System.out.println("Speed: "+getSpeed());
	System.out.println("Distance: "+getDistance());
	System.out.println("Year: "+getYear());
	System.out.println("Places :"+getPlaces());
	System.out.println("Heigth :"+getHeigth());
	System.out.println("Name :"+getName());
	System.out.println("Model :"+getModel());
}
public final int getSpeed(){
	return speed;
}
public final int getDistance(){
	return distance;
}
public final int getYear(){
	return year;
}
public final int getPlaces(){
	return places;
}
public final int getHeigth(){
	return heigth;
}
public final String getName(){
	return name;
}
public final String getModel(){
	return model;
}
}
