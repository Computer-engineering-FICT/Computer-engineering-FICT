package cm.exam.buildTree;

public class Transition {
	int id;
	double lambda;
	double probability;
	// headNode -> tallNode
	int headNode;
	int tallNode;

	@Override
	public boolean equals(Object obj) {
		Transition t = (Transition) obj;
		return t.headNode == this.headNode && t.tallNode == this.tallNode;
	}
	
	@Override
	public String toString(){
		return id+"    "+headNode+" ---- "+lambda+"*"+probability+"---->"+tallNode;
	}
}
