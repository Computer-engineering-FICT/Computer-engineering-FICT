
public class Element{
	private Element Next;
	private TMount Mount;

	void SetNext(Element Cell){
		this.Next=Cell;
	}
	Element GetNext(){
		return Next;
	}

	void SetMount(TMount m){
		this.Mount=m;
	}
	
	TMount GetMount(){
		return Mount;
	}


}
