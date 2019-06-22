package apks;

import java.io.Serializable;
import java.util.ArrayList;

import javax.swing.table.DefaultTableModel;

public class Flowchart implements Serializable {
    private ArrayList<Block> blocks;
    private ArrayList<Arrow> arrows;
    private DefaultTableModel tableModel;
    private ArrayList<ArrayList<Integer>> adjacencyMatrix;
    private ArrayList<ArrayList<ArrayList<Integer>>> signalsMatrix;

    public Flowchart(ArrayList<Block> blocks, ArrayList<Arrow> arrows,
    		DefaultTableModel tableModel,
            ArrayList<ArrayList<Integer>> adjacencyMatrix,
            ArrayList<ArrayList<ArrayList<Integer>>> signalsMatrix) {
        this.blocks = blocks;
        this.arrows = arrows;
        this.tableModel = tableModel;
        this.adjacencyMatrix = adjacencyMatrix;
        this.signalsMatrix = signalsMatrix;
    }

    public void setBlocks(ArrayList<Block> blocks) {this.blocks = blocks;}
    public ArrayList<Block> getBlocks() {return this.blocks;}

    public void setArrows(ArrayList<Arrow> arrows) {this.arrows = arrows;}
    public ArrayList<Arrow> getArrows() {return this.arrows;}

    public void setTableModel(DefaultTableModel tableModel) {this.tableModel = tableModel;}
    public DefaultTableModel getTableModel() {return this.tableModel;}
    
    public void setAdjacencyMatrix(ArrayList<ArrayList<Integer>> adjacencyMatrix) {
        this.adjacencyMatrix = adjacencyMatrix;
    }
    public ArrayList<ArrayList<Integer>> getAdjacencyMatrix() {return this.adjacencyMatrix;}
    
    public void setSignalsMatrix(ArrayList<ArrayList<ArrayList<Integer>>> signalsMatrix) {
        this.signalsMatrix = signalsMatrix;
    }
    public ArrayList<ArrayList<ArrayList<Integer>>> getSignalsMatrix() {return this.signalsMatrix;}
}
