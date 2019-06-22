package kursach;

import javax.swing.JComponent;

public class Line extends JComponent implements Parametrized {
    private LineModel model;
    public static final int LEFT_TO_RIGHT = 0;
    public static final int RIGHT_TO_LEFT = 1;
    private int type;


    public Line() {
        setModel(new LineModel());
        setUI(UIStorage.line);
    }

    public boolean isSelected() {
        return model.isSelected();
    }

    public void setSelected(boolean selected) {
        model.setSelected(selected);
        repaint();
    }

    public void setModel(LineModel model) {
        this.model = model;
    }

    public LineModel getModel() {
        return model;
    }

    public void setParameter(int param) {
        model.setTransfer(param);
        repaint();
    }

    public int getTransfer() {
        return model.getTransfer();
    }

    public int getType()
    {
        return type;
    }

    public void setType( int ltype )
    {
        type = ltype;
    }

    public void setStartNode(Node n) {
        model.setStartNode( n );
    }

    public Node getStartNode() {
        return model.getStartNode();
    }

    public void setEndNode(Node n) {
        model.setEndNode( n );
    }

    public Node getEndNode() {
        return model.getEndNode();
    }
}
