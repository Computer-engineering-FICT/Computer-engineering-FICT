package lab1_8;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Point;
import java.awt.geom.Ellipse2D;
import java.awt.geom.Rectangle2D;
import java.util.ArrayList;

public class MiliGraphNode extends AbstractNode {
	
	private static final long serialVersionUID = 1L;
	
	private static final String NAME_CHARACTER = "a";
	private static final int intend = 6;
	
	private ArrayList<MiliGraphLink> NodesLinks = new ArrayList<MiliGraphLink>();
	private int currentNumber;
	private Ellipse2D shapeGraph;
	private Rectangle2D nameBoundsGraph;
	private int grayCodeNumber = -1;

	public MiliGraphNode(int NodeNumber) {
		
		setNumber(NodeNumber);
	}
	
	public void addNewNodeLink(MiliGraphLink Node) {
		
		NodesLinks.add(Node);
	}
	
	public ArrayList<MiliGraphLink> getLinkNodes() {
		
		return NodesLinks;
	}
	
	public String getName() {
		
		return Name;
	}
	
	public int getNumber() {
		
		return currentNumber;
	}
	
	public void setNumber(int NodeNumber) {
		
		currentNumber = NodeNumber;
		Name = NAME_CHARACTER + Integer.toString(currentNumber);
	}
	
	public int getGrayCodeNumber() {
		
		return grayCodeNumber;
	}
	
	public void setGrayCodeNumber(int GrayCodeNumber) {
		
		grayCodeNumber = GrayCodeNumber;
	}
	
	public void generateLookGraph(Graphics2D g2, Point p) {
		
		nameBoundsGraph = g2.getFont().getStringBounds(Name, g2.getFontRenderContext());
		shapeGraph = new Ellipse2D.Double(p.getX(), p.getY(), Math.max(nameBoundsGraph.getHeight(), nameBoundsGraph.getWidth())+intend*2, Math.max(nameBoundsGraph.getHeight(), nameBoundsGraph.getWidth())+intend*2);
	}
	
	public void paintGraph(Graphics2D g2) {
		
		Color tmp = g2.getColor();
		
		g2.setColor(Color.WHITE);
		g2.fill(shapeGraph);
		
		g2.setColor(tmp);
		g2.drawString(Name, (float)(shapeGraph.getX()+intend), (float)(shapeGraph.getCenterY()-nameBoundsGraph.getCenterY()));
		g2.draw(shapeGraph);
	}
	
	public int getShapeSizeGraph(Graphics2D g2) {
		
		nameBoundsGraph = g2.getFont().getStringBounds(Name, g2.getFontRenderContext());
		
		return (int) (Math.max(nameBoundsGraph.getHeight(), nameBoundsGraph.getWidth())+intend*2);
	}
	
	public Point getCenterPositionGraph() {
		
		return new Point((int)(shapeGraph.getCenterX()), (int)(shapeGraph.getCenterY()));
	}
	
	public boolean isPointBelongNodeGraph(Point p) {
		
		return shapeGraph.contains(p);
	}
	
	public void setPositionGraph(Point p) {
		
		shapeGraph = new Ellipse2D.Double(p.getX(), p.getY(), shapeGraph.getHeight(), shapeGraph.getWidth());
	}
	
	public Point getPositionGraph() {
		
		return new Point((int)shapeGraph.getMinX(), (int)shapeGraph.getMinY());
	}

	@Override
	public boolean isPointAtTheLeftOfNodesCenter(Point p) {

		return false;
	}

	@Override
	public boolean isPointAtTheRightOfNodesCenter(Point p) {

		return false;
	}

	@Override
	public boolean isPointBelongNode(Point p) {
	
		if ((p.getX()>=Position.getX()) && (p.getX()<=Position.getX()+ShapeSize.getWidth()) && (p.getY()<=Position.getY()) && (p.getY()>=Position.getY()-ShapeSize.getHeight()))
			return true;
		else
			return false;
	}

	@Override
	public Point paint(Graphics2D g2, Point p) {
		
		Position = p;
		
		g2.drawString(Name, (float)Position.getX(), (float)Position.getY());
		
		ShapeSize = g2.getFont().getStringBounds(Name, g2.getFontRenderContext());
		
		return new Point((int)(p.getX()+ShapeSize.getWidth()), (int)p.getY());
	}
}
