package kursach;

public class LineModel {
    private boolean selected = false;
    private int transfer;
    private Node start, end;

    public LineModel() {
    }

    public boolean isSelected() {
        return selected;
    }

    public void setSelected(boolean selected) {
        this.selected = selected;
    }

    public void setTransfer(int transfer) {
        this.transfer = transfer;
    }

    public int getTransfer() {
        return transfer;
    }

    public void setStartNode(Node n) {
        start = n;
    }

    public Node getStartNode() {
        return start;
    }

    public void setEndNode(Node n) {
        end = n;
    }

    public Node getEndNode() {
        return end;
    }
}
