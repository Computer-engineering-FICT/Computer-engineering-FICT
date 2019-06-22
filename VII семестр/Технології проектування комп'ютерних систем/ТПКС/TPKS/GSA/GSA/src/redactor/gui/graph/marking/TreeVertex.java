package redactor.gui.graph.marking;

import java.util.ArrayList;
import java.util.List;

/**
 * Wrapper for information about graph vertex.
 * Contains number of vertex, its name (Z+number),
 * list of its children (vertexes, connected to it),
 * binary marker
 *
 */
public class TreeVertex {
    
    int myNumberOfVertex;
    List<Integer> childrenList;
    String name;
    int binaryMarker;

    public void setBinaryMarker(int binaryMarker) {
        this.binaryMarker = binaryMarker;
    }

    public int getBinaryMarker() {
        return binaryMarker;
    }

    public TreeVertex(int myNumberOfVertex) {

        this.myNumberOfVertex = myNumberOfVertex;

        name = "Z"+myNumberOfVertex;

        childrenList = new ArrayList<Integer>();
        binaryMarker = -1;
    }


    public int getMyNumberOfVertex() {
        return myNumberOfVertex;
    }

    public List<Integer> getChildrenList() {
        return childrenList;
    }

    public boolean hasSuchConnection(int vertex1, int vertex2){

        for (int i = 0; i<childrenList.size(); i++){
            if (childrenList.get(i).equals(vertex2) && (myNumberOfVertex == vertex1))
                return true;

            if (childrenList.get(i).equals(vertex1) && (myNumberOfVertex == vertex2))
                return true;
        }

        return false;

    }
/*
    does list of children contain Z+number
 */

    public boolean isChild(int number){
        for (int i = 0 ; i<childrenList.size(); i++){
            if (childrenList.get(i).equals(number))
                return true;
        }

        return false;
    }

    public String getName() {
        return name;
    }

    @Override
    public String toString() {
        return "TreeVertex{" +
                "myNumberOfVertex=" + myNumberOfVertex +
                ", childrenList=" + childrenList +
                ", name='" + name + '\'' +
                ", binaryMarker=" + Integer.toBinaryString(binaryMarker) +
                '}';
    }
}
