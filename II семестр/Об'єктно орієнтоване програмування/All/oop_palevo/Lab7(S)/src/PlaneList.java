import java.util.ArrayList;
public class PlaneList {
	private Component current,next,header;
	private int size=0;
	PlaneList(){
		this.header=new Component();
	}
	PlaneList(Component c){
		header=c;
	}
	PlaneList(Plane pl){
		this();
		addToEnd(pl,getSize());
	}
	PlaneList(ArrayList<Plane> list){
		this();
		addToEnd(list);
	}
	public void addPlane(Plane pl){
		addToEnd(pl,getSize());
	}
	public void addToEnd(Plane pl,int index){
		if(index<0){
			System.out.println("Bad Index");
		}else{
			current=next=header;
			moveTo(index,current,next);
			add(pl,current,next);
		}
	}
	
public void addToEnd(ArrayList<Plane> list){
		Plane[] array=new Plane[list.size()];
		list.toArray(array);
		for(Plane p:list){
			addToEnd(p,getSize());
		}
	}
	public void addToEnd(Plane[] array){
		for(Plane p:array){
			addToEnd(p,getSize());
		}
	}
	public void add(Plane pl,Component previous,Component next){
		Component c=new Component();
		c.setPlane(pl);
		previous.setNext(c);
		c.setNext(next);
		size++;
	}
	public boolean move(Plane p,int index){
		if(0<index){
			System.out.println("Bad Index");
			return false;
		}else{
			current=next=header;
			moveTo(index,current,next);
			Component c=new Component();
			c.setNext(next.getNext());
			current.setNext(c);
			return true;
		}
	}
	public void move(Plane[] array,int index){
		if(0<index){
			System.out.println("Bad Index");
		}else{
			for(Plane p:array){
				if(move(p,index)==true){
					move(p,index);
					index++;
				}
			}
		}
	}
	public void remove(Component current,Component next){
		current=next.getNext();
		size--;
	}
	public void remove(Component current,Component next,int number){
		remove(current,next);
		size-=number;
	}
	public boolean hasNext(Component c){
		return c.getNext()!=null;
	}
	public Component getCurrent(){
		return current;
	}
	public boolean next(){
		if(hasNext(current)==false){
			return false;
		}else{
		current=next;
		next=next.getNext();
		return true;
		}
	}
	public Component search(int index){
		if (index<0){
			System.out.println("Bad Index");
			return null;
		}else{
			for(int i=0;i<=index;i++){
				next();
			}
			return getCurrent();
		}
	}
	public boolean moveTo(int index,Component previous,Component next){
		if(0<index){
			System.out.println("Bad Index");
			return false;
		}else{
			for(int i=0;i<=index;i++){
				next();
			}
			return true;
		}
	}
	public boolean check(Plane pl){
		for(int i=0;i<getSize();i++){
			current=next=header;
			moveTo(i,current,next);
			if(pl.equals((Plane)getCurrent().getPlane())==true){
				return false;
			}
		}
		return true;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getSize() {
		return size;
	}
	public void print(Component c){
		c.printPlane();
	}
	public void printAll(){
		for(int i=0;i<getSize();i++){
			next();
			print(getCurrent());
		}
	}
}