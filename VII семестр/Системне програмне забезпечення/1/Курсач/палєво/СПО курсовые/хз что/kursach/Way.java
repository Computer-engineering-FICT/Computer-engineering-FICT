package kursach;

import javax.swing.JComponent;
import java.util.ArrayList;

public class Way extends JComponent{
    private ArrayList<Integer> nodes = new ArrayList<Integer>();

    public Way() {
    }

    public ArrayList<Integer> getNodes()
    {
        return nodes;
    }

    public void setNodes(ArrayList<Integer> n)
    {
        nodes = n;
    }

    public void addNode(int node)
    {
        nodes.add( node );
    }

    public int getNode(int index)
    {
        return nodes.get(index);
    }
}
