package lab1_8;

import java.awt.AWTEvent;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Point;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;
import java.awt.geom.Rectangle2D;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

import javax.swing.JPanel;

public class MiliGraphDrawPanel extends JPanel implements MouseListener, MouseMotionListener {

	private static final long serialVersionUID = 1L;

	private static final Font STANDART_BIG_FONT = new Font("SansSerif", Font.PLAIN, 22);
	private static final Font STANDART_LITTLE_FONT = new Font("SansSerif", Font.PLAIN, 16);
	
	private ArrayList<MiliGraphNode> DrawObjects = new ArrayList<MiliGraphNode>();
	private MiliGraphNode CurrentObject = null;
	private boolean paint_by_circle = true;
	private Point delta;
	private String[] columnNames;
	private String[][] StructureTableData;
	
	public MiliGraphDrawPanel(boolean b) {
		
		super(b);
		
		this.setFont(STANDART_BIG_FONT);
		
		this.setBackground(Color.WHITE);
		
		enableEvents(AWTEvent.MOUSE_EVENT_MASK|AWTEvent.MOUSE_MOTION_EVENT_MASK);
		
		addMouseListener(this);
		addMouseMotionListener(this);
	}
	
	public void addDrawObjects(ArrayList<MiliGraphNode> Objects) {
		
		DrawObjects = Objects;
		paint_by_circle = true;
		this.updateUI();
	}
	
	public void paint(Graphics g) {
		
		Graphics2D g2 = (Graphics2D) g;
		
		super.paint(g2);
		
		g.setColor(Color.BLACK);
		
		if (paint_by_circle) {
			
			int delta = 0;
		
			for (MiliGraphNode e : DrawObjects)
				if (delta<e.getShapeSizeGraph(g2))
					delta = e.getShapeSizeGraph(g2);
		
			double angle = 2*Math.PI/DrawObjects.size();
			int x, y;
			int centerX = (this.getWidth()-delta)/2;
			int centerY = (this.getHeight()-delta)/2;
			int radius = Math.min(centerX, centerY)-STANDART_LITTLE_FONT.getSize()-10;
			centerY = centerY-STANDART_LITTLE_FONT.getSize();
		
			for (MiliGraphNode e : DrawObjects) {
			
				if (e.equals(CurrentObject))
					g2.setColor(Color.RED);
			
				x = (int) (centerX+radius*Math.cos(angle*DrawObjects.indexOf(e)));
				y = (int) (centerY+radius*Math.sin(angle*DrawObjects.indexOf(e)));
			
				e.generateLookGraph(g2, new Point(x, y));
			
				g2.setColor(Color.BLACK);
			}
			
			paint_by_circle = false;
		}
		
		ArrayList<MiliGraphLink> currentNodeLinks; 
		
		for (MiliGraphNode e : DrawObjects) {
			
			currentNodeLinks = e.getLinkNodes();
			
			for (MiliGraphLink l: currentNodeLinks)
				if (!e.equals(l.getLinkNode())) {
					
					boolean each_other_linked = false;
					
					for (MiliGraphLink m: l.getLinkNode().getLinkNodes())
						if (e.equals(m.getLinkNode())) {
							
							each_other_linked = true;
							break;
						}
					
					if (each_other_linked) {
						
						double angle = Math.PI/6+Math.atan((l.getLinkNode().getCenterPositionGraph().getY()-e.getCenterPositionGraph().getY())/(l.getLinkNode().getCenterPositionGraph().getX()-e.getCenterPositionGraph().getX()));
						
						if (l.getLinkNode().getCenterPositionGraph().getX()>=e.getCenterPositionGraph().getX())
							angle = angle+Math.PI;
						
						int new_x_e = (int)(l.getLinkNode().getCenterPositionGraph().x+(l.getLinkNode().getShapeSizeGraph(g2)/2)*Math.cos(angle));
						int new_y_e = (int)(l.getLinkNode().getCenterPositionGraph().y+(l.getLinkNode().getShapeSizeGraph(g2)/2)*Math.sin(angle));
						
						int new_x_b = (int)(e.getCenterPositionGraph().x+(e.getShapeSizeGraph(g2)/2)*Math.cos(angle));
						int new_y_b = (int)(e.getCenterPositionGraph().y+(e.getShapeSizeGraph(g2)/2)*Math.sin(angle));
						
						g2.draw(Arrow2D.getArrow(new Point(new_x_b, new_y_b), new Point(new_x_e, new_y_e), 15, 25));
					}
					else {
						
						double angle = Math.atan((l.getLinkNode().getCenterPositionGraph().getY()-e.getCenterPositionGraph().getY())/(l.getLinkNode().getCenterPositionGraph().getX()-e.getCenterPositionGraph().getX()));
						
						if (l.getLinkNode().getCenterPositionGraph().getX()>=e.getCenterPositionGraph().getX())
							angle = angle+Math.PI;
						
						int new_x = (int)(l.getLinkNode().getCenterPositionGraph().x+(l.getLinkNode().getShapeSizeGraph(g2)/2)*Math.cos(angle));
						int new_y = (int)(l.getLinkNode().getCenterPositionGraph().y+(l.getLinkNode().getShapeSizeGraph(g2)/2)*Math.sin(angle));
						
						g2.draw(Arrow2D.getArrow(e.getCenterPositionGraph(), new Point(new_x, new_y), 15, 25));
					}
				}
		}
		
		for (MiliGraphNode e : DrawObjects) {
			
			currentNodeLinks = e.getLinkNodes();
			
			for (MiliGraphLink l : currentNodeLinks)
				if (e.equals(l.getLinkNode())) {
					
					g2.setFont(MiliGraphDrawPanel.STANDART_LITTLE_FONT);
					Rectangle2D signals_bound = g2.getFont().getStringBounds(l.getInputSignalsNames()+"/"+l.getOutputSignalsNames(), g2.getFontRenderContext());
					int signals_x = (int)(e.getCenterPositionGraph().getX()-signals_bound.getCenterX());
					int signals_y = (int)(e.getCenterPositionGraph().y+e.getShapeSizeGraph(g2)/2+signals_bound.getHeight());
					
					Rectangle2D signals_background = new Rectangle2D.Double(signals_x, signals_y+2*signals_bound.getCenterY(), signals_bound.getWidth(), signals_bound.getHeight()); 
					g2.setColor(Color.WHITE);
					g2.fill(signals_background);
					
					g2.setColor(Color.BLACK);
					
					g2.drawString(l.getInputSignalsNames()+"/"+l.getOutputSignalsNames(), signals_x, signals_y-(int)signals_bound.getCenterY());
					g2.setFont(MiliGraphDrawPanel.STANDART_BIG_FONT);
				}
				else {
					
					boolean each_other_linked = false;
					
					for (MiliGraphLink m: l.getLinkNode().getLinkNodes())
						if (e.equals(m.getLinkNode())) {
							
							each_other_linked = true;
							break;
						}
					
					if (each_other_linked) {
						
						double angle = Math.PI/6+Math.atan((l.getLinkNode().getCenterPositionGraph().getY()-e.getCenterPositionGraph().getY())/(l.getLinkNode().getCenterPositionGraph().getX()-e.getCenterPositionGraph().getX()));
						
						if (l.getLinkNode().getCenterPositionGraph().getX()>=e.getCenterPositionGraph().getX())
							angle = angle+Math.PI;
						
						int new_x_e = (int)(l.getLinkNode().getCenterPositionGraph().x+(l.getLinkNode().getShapeSizeGraph(g2)/2)*Math.cos(angle));
						int new_y_e = (int)(l.getLinkNode().getCenterPositionGraph().y+(l.getLinkNode().getShapeSizeGraph(g2)/2)*Math.sin(angle));
						
						int new_x_b = (int)(e.getCenterPositionGraph().x+(e.getShapeSizeGraph(g2)/2)*Math.cos(angle));
						int new_y_b = (int)(e.getCenterPositionGraph().y+(e.getShapeSizeGraph(g2)/2)*Math.sin(angle));
					
						g2.setFont(MiliGraphDrawPanel.STANDART_LITTLE_FONT);
						Rectangle2D signals_bound = g2.getFont().getStringBounds(l.getInputSignalsNames()+"/"+l.getOutputSignalsNames(), g2.getFontRenderContext());
						
						int signals_x = (int)(new_x_b+(new_x_e-new_x_b)/2-signals_bound.getCenterX());
						int signals_y = (int)(new_y_b+(new_y_e-new_y_b)/2-signals_bound.getCenterY());
					
						Rectangle2D signals_background = new Rectangle2D.Double(signals_x-2, signals_y-signals_bound.getHeight()-signals_bound.getCenterY()/2, signals_bound.getWidth()+4, signals_bound.getHeight()); 
						g2.setColor(Color.WHITE);
						g2.fill(signals_background);
					
						g2.setColor(Color.BLACK);
						g2.drawString(l.getInputSignalsNames()+"/"+l.getOutputSignalsNames(), signals_x, signals_y);
						g2.setFont(MiliGraphDrawPanel.STANDART_BIG_FONT);
					}
					else {
						
						g2.setFont(MiliGraphDrawPanel.STANDART_LITTLE_FONT);
						Rectangle2D signals_bound = g2.getFont().getStringBounds(l.getInputSignalsNames()+"/"+l.getOutputSignalsNames(), g2.getFontRenderContext());
						int signals_x = (int)(e.getCenterPositionGraph().x+(l.getLinkNode().getCenterPositionGraph().x-e.getCenterPositionGraph().x)/2-signals_bound.getCenterX());
						int signals_y = (int)(e.getCenterPositionGraph().y+(l.getLinkNode().getCenterPositionGraph().y-e.getCenterPositionGraph().y)/2-signals_bound.getCenterY());
					
						Rectangle2D signals_background = new Rectangle2D.Double(signals_x-2, signals_y-signals_bound.getHeight()-signals_bound.getCenterY()/2, signals_bound.getWidth()+4, signals_bound.getHeight()); 
						g2.setColor(Color.WHITE);
						g2.fill(signals_background);
					
						g2.setColor(Color.BLACK);
						g2.drawString(l.getInputSignalsNames()+"/"+l.getOutputSignalsNames(), signals_x, signals_y);
						g2.setFont(MiliGraphDrawPanel.STANDART_BIG_FONT);
					}
				}
			
			g2.setFont(MiliGraphDrawPanel.STANDART_LITTLE_FONT);
			
			String current_gray_code_number = null;
			
			if (e.getGrayCodeNumber()==-1)
				current_gray_code_number = "none";
			else
				current_gray_code_number = Integer.toBinaryString(e.getGrayCodeNumber());
			
			Rectangle2D gray_code_bound = g2.getFont().getStringBounds(current_gray_code_number, g2.getFontRenderContext());
			int gray_code_x = (int)(e.getCenterPositionGraph().getX()-gray_code_bound.getCenterX());
			int gray_code_y = (int)(e.getCenterPositionGraph().y-e.getShapeSizeGraph(g2)/2-gray_code_bound.getHeight());
			
			Rectangle2D gray_code_background = new Rectangle2D.Double(gray_code_x, gray_code_y, gray_code_bound.getWidth(), gray_code_bound.getHeight());
			g2.setColor(Color.WHITE);
			g2.fill(gray_code_background);
			
			g2.setColor(Color.BLACK);
			
			g2.drawString(current_gray_code_number, gray_code_x, gray_code_y+(int)(gray_code_bound.getHeight()*0.75));
			g2.setFont(MiliGraphDrawPanel.STANDART_BIG_FONT);
			
			if (e.equals(CurrentObject))
				g2.setColor(Color.RED);
			
			e.paintGraph(g2);
			
			if (e.equals(CurrentObject))
				g2.setColor(Color.BLACK);
		}
	}
	
	public MiliGraphNode FindNodeByPoint(Point p) {
		
		for (MiliGraphNode e : DrawObjects)
			if (e.isPointBelongNodeGraph(p))
				return e;

		return null;
	}
	
	public MiliGraphNode FindNodeByNumber(int n) {
		
		for (MiliGraphNode e : DrawObjects)
			if (e.getNumber() == n)
				return e;

		return null;
	} 
	
	public void mouseClicked(MouseEvent e) {
		
		if (e.getClickCount()==2) {
			
			paint_by_circle = true;
			updateUI();
		}
	}

	public void mouseEntered(MouseEvent e) {}

	public void mouseExited(MouseEvent e) {}

	public void mousePressed(MouseEvent e) {

		CurrentObject = FindNodeByPoint(e.getPoint());
		
		if (CurrentObject!=null)
			delta = new Point((int)(CurrentObject.getPositionGraph().getX()-e.getPoint().getX()), (int)(CurrentObject.getPositionGraph().getY()-e.getPoint().getY()));
		else
			delta = null;
		
		this.updateUI();
	}
	
	public void mouseReleased(MouseEvent e) {}

	public void mouseDragged(MouseEvent e) {
		
		if ((e.getModifiersEx() & MouseEvent.BUTTON1_DOWN_MASK)!=0)
			if (CurrentObject!=null) {
				
				CurrentObject.setPositionGraph(new Point((int)(e.getPoint().getX()+delta.getX()), (int)(e.getPoint().getY()+delta.getX())));
				updateUI();
			}
	}

	public void mouseMoved(MouseEvent e) {}
	
	public ArrayList<MiliGraphNode> getDrawObjects () {
		
		return DrawObjects;
	}
	
	public String getGraphTextFormat() {
		
		String buffer = "";
		
		if (!DrawObjects.isEmpty()) {
			
			for (MiliGraphNode e: DrawObjects)
				buffer = buffer+e.getNumber()+" "+e.getGrayCodeNumber()+"\n";
			
			buffer = buffer+"\n";
			
			for (MiliGraphNode e: DrawObjects){
				
				buffer = buffer+e.getNumber()+"\n";
				
				for (MiliGraphLink g: e.getLinkNodes())
					buffer = buffer+g.getLinkNode().getNumber()+" "+g.getInputSignalsNames()+" "+g.getOutputSignalsNames()+"\n";
				
				buffer = buffer+"\n";
			}
			
			return buffer;
		}
		else
			return null;
	}
	
	public void addDrawObjectsFromString(BufferedReader input) {
		
		DrawObjects.clear();
		
		String currentString;
		
		try {
			
			while (((currentString = input.readLine())!=null) && (!currentString.equals(""))) {
				
				DrawObjects.add(new MiliGraphNode(Integer.parseInt(currentString.substring(0, currentString.indexOf(" ")))));
				DrawObjects.get(DrawObjects.size()-1).setGrayCodeNumber(Integer.parseInt(currentString.substring(currentString.indexOf(" ")+1, currentString.length())));
			}
			
			String inputSignals, outputSignals;
			int linkNodeNumber, currentNodeNumber;
			
			for (int i = 0; i<DrawObjects.size(); i++) {
				
				currentString = input.readLine();
				currentNodeNumber = Integer.parseInt(currentString);
				
				while (((currentString = input.readLine())!=null) && (!currentString.equals(""))) {
					
					linkNodeNumber = Integer.parseInt(currentString.substring(0, currentString.indexOf(" ")));
					
					currentString = currentString.substring(currentString.indexOf(" ")+1);
					inputSignals = currentString.substring(0, currentString.indexOf(" "));
					
					outputSignals = currentString.substring(currentString.indexOf(" ")+1);
					
					FindNodeByNumber(currentNodeNumber).addNewNodeLink(new MiliGraphLink(FindNodeByNumber(linkNodeNumber), inputSignals, outputSignals));
				}
			}
			
			input.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		paint_by_circle = true;
		updateUI();
	}
	
	public boolean setGrayCode() {
		
		boolean alredy_marked = true;
		
		for (int i = 0; i<DrawObjects.size(); i++)
			if (DrawObjects.get(i).getGrayCodeNumber()==-1) {
				
				alredy_marked = false;
				break;
			}
		
		if (alredy_marked)
			return true;
		
		for (int i = 0; i<DrawObjects.size(); i++)
			DrawObjects.get(i).setGrayCodeNumber(-1);
		
		boolean no_found_odd_cycleas_and_second_level_coherence_nodes = true;
		
		while (no_found_odd_cycleas_and_second_level_coherence_nodes) {
			
			while (checkANDrepairSecondLevelCoherenceNodes());
			
			no_found_odd_cycleas_and_second_level_coherence_nodes = false;
			
			while (checkANDrepairOddNodesQuantityCycles())
				no_found_odd_cycleas_and_second_level_coherence_nodes = true;
		}
		
		int[][] coherence_matrix = getCoherenceMatrix();
		
		int max_node_pow = 0;
		
		for (int i = 0; i<coherence_matrix.length; i++) {
		
			int links_quantity = 0;
			
			for (int j = 0; j<coherence_matrix[i].length; j++)
				if ((coherence_matrix[i][j]==1) && (i!=j))
					links_quantity++;
			
			if (max_node_pow<links_quantity)
				max_node_pow = links_quantity;
		}
		
		while (Math.pow(2, max_node_pow)<DrawObjects.size())
			max_node_pow++;
		
		ArrayList<Integer> checked_nodes = new ArrayList<Integer>();
		
		ArrayList<Integer> nodes_to_check = new ArrayList<Integer>();
		nodes_to_check.add(0);
		
		ArrayList<Integer> used_gray_code_numbers = new ArrayList<Integer>();
		
		ArrayList<GrayCodeCycleNode> cycle_indicator = new ArrayList<GrayCodeCycleNode>();
		
		int max_node_pow_changed_times = 0;
		
		while (checked_nodes.size()<DrawObjects.size()) {
			
			if ((cycle_indicator.isEmpty()) || (!nodes_to_check.get(0).equals(cycle_indicator.get(cycle_indicator.size()-1).getAttachedNodeNumber())))
				cycle_indicator.add(new GrayCodeCycleNode(nodes_to_check.get(0)));
			
			ArrayList<MiliGraphPossibleGrayCodeNumbers> coherence_nodes_gray_codes = new ArrayList<MiliGraphPossibleGrayCodeNumbers>();
			
			for (int i = 0; i<coherence_matrix[nodes_to_check.get(0)].length; i++)
				if ((coherence_matrix[nodes_to_check.get(0)][i]==1) && (i!=nodes_to_check.get(0)))
					if (DrawObjects.get(i).getGrayCodeNumber()==-1) {
						
						if (!nodes_to_check.contains(i))
							nodes_to_check.add(i);
					}
					else
						coherence_nodes_gray_codes.add(new MiliGraphPossibleGrayCodeNumbers(DrawObjects.get(i).getGrayCodeNumber(), max_node_pow));
			
			if (coherence_nodes_gray_codes.isEmpty()) {
				
				for (int i = 0; i<Math.pow(2, max_node_pow); i++)
					if ((used_gray_code_numbers.isEmpty() && (cycle_indicator.get(cycle_indicator.size()-1).getGrayCodeNumbers().isEmpty())) || ((!used_gray_code_numbers.contains(i)) && (!cycle_indicator.get(cycle_indicator.size()-1).getGrayCodeNumbers().contains(i)))) {
						
						DrawObjects.get(nodes_to_check.get(0)).setGrayCodeNumber(i);
						used_gray_code_numbers.add(i);
						break;
					}
			}
			else {
				
				for (int j = 0; j<coherence_nodes_gray_codes.get(0).getPossibleGrayCodesNumbers().size(); j++) {
					
					boolean one_bit_difference = true;
							
					for (int k = 1; k<coherence_nodes_gray_codes.size(); k++) //?
						if (!coherence_nodes_gray_codes.get(k).isPosiibleGrayCode(coherence_nodes_gray_codes.get(0).getPossibleGrayCodesNumbers().get(j)))
							one_bit_difference = false;
							
					if ((one_bit_difference) && (!used_gray_code_numbers.contains(coherence_nodes_gray_codes.get(0).getPossibleGrayCodesNumbers().get(j))) && (!cycle_indicator.get(cycle_indicator.size()-1).getGrayCodeNumbers().contains(coherence_nodes_gray_codes.get(0).getPossibleGrayCodesNumbers().get(j)))) {
								
						DrawObjects.get(nodes_to_check.get(0)).setGrayCodeNumber(coherence_nodes_gray_codes.get(0).getPossibleGrayCodesNumbers().get(j));
						used_gray_code_numbers.add(coherence_nodes_gray_codes.get(0).getPossibleGrayCodesNumbers().get(j));
						break;
					}
				}
			}
			
			if (DrawObjects.get(nodes_to_check.get(0)).getGrayCodeNumber()==-1) {
				
				if (!checked_nodes.isEmpty()) {
				
					nodes_to_check.add(0, checked_nodes.get(checked_nodes.size()-1));
					checked_nodes.remove(checked_nodes.size()-1);
				}
				
				for (int i = 0; i<cycle_indicator.get(cycle_indicator.size()-1).getGrayCodeNumbers().size(); i++)
					used_gray_code_numbers.remove(cycle_indicator.get(cycle_indicator.size()-1).getGrayCodeNumbers().get(i));
				
				cycle_indicator.remove(cycle_indicator.size()-1);
				
				DrawObjects.get(nodes_to_check.get(0)).setGrayCodeNumber(-1);
				
				if (cycle_indicator.isEmpty()) {
					if (max_node_pow_changed_times<=3) {
					
						max_node_pow++;
						max_node_pow_changed_times++;
					}
					else
						return false;
				}
				else
					for (int i = 0; i<cycle_indicator.get(cycle_indicator.size()-1).getGrayCodeNumbers().size(); i++)
						used_gray_code_numbers.remove(cycle_indicator.get(cycle_indicator.size()-1).getGrayCodeNumbers().get(i));
			}
			else {
				
				cycle_indicator.get(cycle_indicator.size()-1).addGrayCodeNumber(DrawObjects.get(nodes_to_check.get(0)).getGrayCodeNumber());
				
				if (!checked_nodes.contains(nodes_to_check.get(0)))
					checked_nodes.add(nodes_to_check.get(0));
			
				nodes_to_check.remove(0);
			}
		}
		
		paint_by_circle = true;
		updateUI();
		
		return true;
	}
	
	private int[][] getCoherenceMatrix() {
		
		if (DrawObjects == null)
			return null;
		
		int[][] coherence_matrix = new int[DrawObjects.size()][DrawObjects.size()];
		
		for (int i = 0; i<DrawObjects.size(); i++)
			for (int j = 0; j<DrawObjects.get(i).getLinkNodes().size(); j++) {
				
				coherence_matrix[DrawObjects.indexOf(DrawObjects.get(i).getLinkNodes().get(j).getLinkNode())][i] = 1;
				coherence_matrix[i][DrawObjects.indexOf(DrawObjects.get(i).getLinkNodes().get(j).getLinkNode())] = 1;
			}
		
		return coherence_matrix;
	}
	
	private boolean checkANDrepairSecondLevelCoherenceNodes() {
		
		int[][] coherence_matrix = getCoherenceMatrix();
		
		if (coherence_matrix==null)
			return false;
			
		for (int i = 0; i < coherence_matrix.length-1; i++)
			for (int j = i+1; j<coherence_matrix.length; j++) {
					
				ArrayList<Integer> coherence_nodes_numbers = new ArrayList<Integer>();
					
				for (int k = 0; k<coherence_matrix[i].length; k++)
					if ((i!=k) && (j!=k) && ((coherence_matrix[i][k] & coherence_matrix[j][k])!=0))
						coherence_nodes_numbers.add(k);
					
				if (coherence_nodes_numbers.size() > 2) {
					
					MiliGraphNode new_node = new MiliGraphNode(DrawObjects.size());
						
					coherence_nodes_numbers.remove(coherence_nodes_numbers.size()-1);
					coherence_nodes_numbers.remove(coherence_nodes_numbers.size()-1);
						
					MiliGraphNode current_node;
						
					current_node = DrawObjects.get(i);
						
					for (int l = 0; l<current_node.getLinkNodes().size(); l++) {
							
						boolean compared = false;
							
						for (int m = 0; m<coherence_nodes_numbers.size(); m++)
							if (current_node.getLinkNodes().get(l).getLinkNode().getNumber()==coherence_nodes_numbers.get(m)) {
									
								compared = true;
								new_node.addNewNodeLink(current_node.getLinkNodes().get(l));
							}
							
						if (compared)
							current_node.getLinkNodes().remove(l--);
					}
						
					if (new_node.getLinkNodes().size()!=0)
						current_node.addNewNodeLink(new MiliGraphLink(new_node, "-", "0"));
						
					for (int k = 0; k<coherence_nodes_numbers.size(); k++) {
							
						current_node = DrawObjects.get(coherence_nodes_numbers.get(k));
							
						boolean isWasLinks = false;
							
						for (int l = 0; l<current_node.getLinkNodes().size(); l++)
							if (current_node.getLinkNodes().get(l).getLinkNode().equals(DrawObjects.get(i))) {
									
								isWasLinks = true;
								new_node.addNewNodeLink(current_node.getLinkNodes().get(l));
								current_node.getLinkNodes().remove(l--);
							}
							
						if (isWasLinks)
							current_node.addNewNodeLink(new MiliGraphLink(new_node, "-", "0"));
					}
						
					DrawObjects.add(new_node);
						
					return true;
				}
			}
		
		return false;
	}
	
	@SuppressWarnings("unchecked")
	private boolean checkANDrepairOddNodesQuantityCycles() {
		
		int[][] coherence_matrix = getCoherenceMatrix();
		
		int left_nodes = coherence_matrix.length;
		
		ArrayList<ArrayList<Integer>> cycles = new ArrayList<ArrayList<Integer>>();
		
		while (left_nodes!=0) {
			
			int current_node_number = coherence_matrix.length-left_nodes;
			
			ArrayList<ArrayList<Integer>> simple_ways_between_two_nodes = new ArrayList<ArrayList<Integer>>();
		
			for (int i = current_node_number+1; i<coherence_matrix[current_node_number].length; i++)
				if (coherence_matrix[current_node_number][i]==1)
					for (int j = i+1; j<coherence_matrix[current_node_number].length; j++)
						if (coherence_matrix[current_node_number][j]==1) {
							
							simple_ways_between_two_nodes.clear();
							simple_ways_between_two_nodes.add(new ArrayList<Integer>());
							simple_ways_between_two_nodes.get(simple_ways_between_two_nodes.size()-1).add(i);
							
							ArrayList<Integer> checked_nodes = new ArrayList<Integer>();
							checked_nodes.add(current_node_number);
							checked_nodes.add(j);
							
							ArrayList<Integer> nodes_to_check = new ArrayList<Integer>();
							nodes_to_check.add(i);
							
							while (nodes_to_check.size()!=0) {
								
								ArrayList<Integer> possible_branches = new ArrayList<Integer>();
								
								for (int k = current_node_number+1; k<coherence_matrix[nodes_to_check.get(0)].length; k++)
									if (coherence_matrix[nodes_to_check.get(0)][k]==1) {
										possible_branches.add(k);
										
										if (!checked_nodes.contains(k))
											nodes_to_check.add(k);
									}
								
								for (int k = 0; k<simple_ways_between_two_nodes.size(); k++) {
										
									boolean node_changed = false;
										
									for (int l = 0; l<possible_branches.size(); l++)
										if ((simple_ways_between_two_nodes.get(k).get(simple_ways_between_two_nodes.get(k).size()-1).equals(nodes_to_check.get(0))) && (!simple_ways_between_two_nodes.get(k).contains(possible_branches.get(l)))) {
												
											simple_ways_between_two_nodes.add((ArrayList<Integer>) simple_ways_between_two_nodes.get(k).clone());
											simple_ways_between_two_nodes.get(simple_ways_between_two_nodes.size()-1).add(possible_branches.get(l));
											node_changed = true;
										}
										
									if (node_changed)
										simple_ways_between_two_nodes.remove(k--);
								}
								
								checked_nodes.add(nodes_to_check.get(0));
								nodes_to_check.remove(0);
							}
							
							for (int k = 0; k<simple_ways_between_two_nodes.size(); k++)
								if (simple_ways_between_two_nodes.get(k).get(simple_ways_between_two_nodes.get(k).size()-1).equals(j)) {
									
									cycles.add(simple_ways_between_two_nodes.get(k));
									cycles.get(cycles.size()-1).add(0, current_node_number);
									cycles.get(cycles.size()-1).add(current_node_number);
								}
						}
			
			left_nodes--;
		}
		
		for (int i = 0; i<cycles.size(); i++)
			if (cycles.get(i).size()%2==1)
				cycles.remove(i--);
		
		if (cycles.isEmpty())
			return false;
		
		int shared_node_cycles_max_quantity = 0;
		
		ArrayList<MiliGraphCyclesSharedNode> cyceles_shared_nodes = new ArrayList<MiliGraphCyclesSharedNode>();
		
		for (int i = 0; i<DrawObjects.size(); i++) {
			
			cyceles_shared_nodes.add(new MiliGraphCyclesSharedNode(i));
			
			for (int j = 0; j<cycles.size(); j++)
				if (cycles.get(j).contains(DrawObjects.get(i).getNumber()))
					cyceles_shared_nodes.get(cyceles_shared_nodes.size()-1).addCycleNumber(j);
			
			shared_node_cycles_max_quantity = Math.max(shared_node_cycles_max_quantity, cyceles_shared_nodes.get(cyceles_shared_nodes.size()-1).getCyclesNumbers().size());
		}
		
		for (int i = 0; i<cyceles_shared_nodes.size(); i++)
			if (cyceles_shared_nodes.get(i).getCyclesNumbers().size()!=shared_node_cycles_max_quantity)
				cyceles_shared_nodes.remove(i--);
		
		int cycles_shared_node_max_edge_number = 0;
		int cycles_shared_node_max_edge_quantity = 0;
		
		for (int i = 0; i<cyceles_shared_nodes.size(); i++) {
			
			int cycles_shared_node_current_edge_quantity = 0;
			
			for (int j = 0; j<coherence_matrix[cyceles_shared_nodes.get(i).getNodeNumber()].length; j++)
				if ((coherence_matrix[cyceles_shared_nodes.get(i).getNodeNumber()][j]==1) && (cyceles_shared_nodes.get(i).getNodeNumber()!=j))
					cycles_shared_node_current_edge_quantity++;
			
			if (cycles_shared_node_max_edge_quantity<cycles_shared_node_current_edge_quantity) {
				
				cycles_shared_node_max_edge_number = cyceles_shared_nodes.get(i).getNodeNumber();
				cycles_shared_node_max_edge_quantity = cycles_shared_node_current_edge_quantity;
			}
		}
		
		ArrayList<Integer> coherence_nodes_numbers_to_insert_new_node_between = new ArrayList<Integer>();
		ArrayList<Integer> coherence_nodes_numbers_to_not_insert_new_node_between = new ArrayList<Integer>();
		
		for (int i = 0; i<cycles.size(); i++) {
			
			if ((cycles.get(i).get(0)==cycles_shared_node_max_edge_number) && (cycles.get(i).get(cycles.get(i).size()-1)==cycles_shared_node_max_edge_number)) {
				
				if (((coherence_nodes_numbers_to_insert_new_node_between.isEmpty() && coherence_nodes_numbers_to_not_insert_new_node_between.isEmpty())) || ((!coherence_nodes_numbers_to_insert_new_node_between.contains(cycles.get(i).get(1))) && (!coherence_nodes_numbers_to_insert_new_node_between.contains(cycles.get(i).get(cycles.get(i).size()-2))) && (!coherence_nodes_numbers_to_not_insert_new_node_between.contains(cycles.get(i).get(1))) && (!coherence_nodes_numbers_to_not_insert_new_node_between.contains(cycles.get(i).get(cycles.get(i).size()-2))))) {
					
					coherence_nodes_numbers_to_insert_new_node_between.add(cycles.get(i).get(1));
					coherence_nodes_numbers_to_not_insert_new_node_between.add(cycles.get(i).get(cycles.get(i).size()-2));
				}
				
				if (coherence_nodes_numbers_to_insert_new_node_between.contains(cycles.get(i).get(1)))
					if (!coherence_nodes_numbers_to_not_insert_new_node_between.contains(cycles.get(i).get(cycles.get(i).size()-2)))
						coherence_nodes_numbers_to_not_insert_new_node_between.add(cycles.get(i).get(cycles.get(i).size()-2));
				
				if (coherence_nodes_numbers_to_insert_new_node_between.contains(cycles.get(i).get(cycles.get(i).size()-2)))
					if (!coherence_nodes_numbers_to_not_insert_new_node_between.contains(cycles.get(i).get(1)))
						coherence_nodes_numbers_to_not_insert_new_node_between.add(cycles.get(i).get(1));
				
				if (coherence_nodes_numbers_to_not_insert_new_node_between.contains(cycles.get(i).get(1)))
					if (!coherence_nodes_numbers_to_insert_new_node_between.contains(cycles.get(i).get(cycles.get(i).size()-2)))
						coherence_nodes_numbers_to_insert_new_node_between.add(cycles.get(i).get(cycles.get(i).size()-2));
				
				if (coherence_nodes_numbers_to_not_insert_new_node_between.contains(cycles.get(i).get(cycles.get(i).size()-2)))
					if (!coherence_nodes_numbers_to_insert_new_node_between.contains(cycles.get(i).get(1)))
						coherence_nodes_numbers_to_insert_new_node_between.add(cycles.get(i).get(1));
			}
			else
				if (cycles.get(i).contains(cycles_shared_node_max_edge_number)) {
					
					if (((coherence_nodes_numbers_to_insert_new_node_between.isEmpty() && coherence_nodes_numbers_to_not_insert_new_node_between.isEmpty())) || ((!coherence_nodes_numbers_to_insert_new_node_between.contains(cycles.get(i).get(cycles.get(i).indexOf(cycles_shared_node_max_edge_number)+1))) && (!coherence_nodes_numbers_to_insert_new_node_between.contains(cycles.get(i).get(cycles.get(i).indexOf(cycles_shared_node_max_edge_number)-1))) && (!coherence_nodes_numbers_to_not_insert_new_node_between.contains(cycles.get(i).get(cycles.get(i).indexOf(cycles_shared_node_max_edge_number)-1))) && (!coherence_nodes_numbers_to_not_insert_new_node_between.contains(cycles.get(i).get(cycles.get(i).indexOf(cycles_shared_node_max_edge_number)+1))))) {
						
						coherence_nodes_numbers_to_insert_new_node_between.add(cycles.get(i).get(cycles.get(i).indexOf(cycles_shared_node_max_edge_number)-1));
						coherence_nodes_numbers_to_not_insert_new_node_between.add(cycles.get(i).get(cycles.get(i).indexOf(cycles_shared_node_max_edge_number)+1));
					}
					
					if (coherence_nodes_numbers_to_insert_new_node_between.contains(cycles.get(i).get(cycles.get(i).indexOf(cycles_shared_node_max_edge_number)-1)))
						if (!coherence_nodes_numbers_to_not_insert_new_node_between.contains(cycles.get(i).get(cycles.get(i).indexOf(cycles_shared_node_max_edge_number)+1)))
							coherence_nodes_numbers_to_not_insert_new_node_between.add(cycles.get(i).get(cycles.get(i).indexOf(cycles_shared_node_max_edge_number)+1));
					
					if (coherence_nodes_numbers_to_insert_new_node_between.contains(cycles.get(i).get(cycles.get(i).indexOf(cycles_shared_node_max_edge_number)+1)))
						if (!coherence_nodes_numbers_to_not_insert_new_node_between.contains(cycles.get(i).get(cycles.get(i).indexOf(cycles_shared_node_max_edge_number)-1)))
							coherence_nodes_numbers_to_not_insert_new_node_between.add(cycles.get(i).get(cycles.get(i).indexOf(cycles_shared_node_max_edge_number)-1));
					
					if (coherence_nodes_numbers_to_not_insert_new_node_between.contains(cycles.get(i).get(cycles.get(i).indexOf(cycles_shared_node_max_edge_number)-1)))
						if (!coherence_nodes_numbers_to_insert_new_node_between.contains(cycles.get(i).get(cycles.get(i).indexOf(cycles_shared_node_max_edge_number)+1)))
							coherence_nodes_numbers_to_insert_new_node_between.add(cycles.get(i).get(cycles.get(i).indexOf(cycles_shared_node_max_edge_number)+1));
					
					if (coherence_nodes_numbers_to_not_insert_new_node_between.contains(cycles.get(i).get(cycles.get(i).indexOf(cycles_shared_node_max_edge_number)+1)))
						if (!coherence_nodes_numbers_to_insert_new_node_between.contains(cycles.get(i).get(cycles.get(i).indexOf(cycles_shared_node_max_edge_number)-1)))
							coherence_nodes_numbers_to_insert_new_node_between.add(cycles.get(i).get(cycles.get(i).indexOf(cycles_shared_node_max_edge_number)-1));
				}
		}
		
		if (coherence_nodes_numbers_to_insert_new_node_between.size()>coherence_nodes_numbers_to_not_insert_new_node_between.size())
			coherence_nodes_numbers_to_insert_new_node_between = coherence_nodes_numbers_to_not_insert_new_node_between;
		
		MiliGraphNode new_node = new MiliGraphNode(DrawObjects.size());
				
		MiliGraphNode current_node = DrawObjects.get(cycles_shared_node_max_edge_number);
				
		for (int i = 0; i<current_node.getLinkNodes().size(); i++) {
					
			boolean compared = false;
					
			for (int j = 0; j<coherence_nodes_numbers_to_insert_new_node_between.size(); j++)
				if (current_node.getLinkNodes().get(i).getLinkNode().getNumber()==coherence_nodes_numbers_to_insert_new_node_between.get(j)) {
							
					compared = true;
					new_node.addNewNodeLink(current_node.getLinkNodes().get(i));
				}
					
			if (compared)
				current_node.getLinkNodes().remove(i--);
		}
				
		if (new_node.getLinkNodes().size()!=0)
			current_node.addNewNodeLink(new MiliGraphLink(new_node, "-", "0"));
				
		for (int i = 0; i<coherence_nodes_numbers_to_insert_new_node_between.size(); i++) {
					
			current_node = DrawObjects.get(coherence_nodes_numbers_to_insert_new_node_between.get(i));
					
			boolean isWasLinks = false;
					
			for (int j = 0; j<current_node.getLinkNodes().size(); j++)
				if (current_node.getLinkNodes().get(j).getLinkNode().equals(DrawObjects.get(cycles_shared_node_max_edge_number))) {
							
					isWasLinks = true;
					new_node.addNewNodeLink(current_node.getLinkNodes().get(j));
					current_node.getLinkNodes().remove(j--);
				}
					
			if (isWasLinks)
				current_node.addNewNodeLink(new MiliGraphLink(new_node, "-", "0"));
		}
				
		DrawObjects.add(new_node);
				
		return true;
	}
	
	public boolean prepareDataForStructureTableCreation() {
		
		if (DrawObjects.isEmpty())
			return false;
		
		int max_gray_code_number = 0;
		
		for (int i = 0; i<DrawObjects.size(); i++) {
		
			if (DrawObjects.get(i).getGrayCodeNumber()==-1)
				return false;
			
			max_gray_code_number = Math.max(max_gray_code_number, DrawObjects.get(i).getGrayCodeNumber());
		}

		int gray_code_range = 1;
		
		while (!((Math.pow(2, gray_code_range-1)<max_gray_code_number) && (max_gray_code_number<=Math.pow(2, gray_code_range))))
			gray_code_range++;

		ArrayList<String> logical_conditions = new ArrayList<String>();
		
		for (int i = 0; i<DrawObjects.size(); i++)			
			for (int j = 0; j<DrawObjects.get(i).getLinkNodes().size(); j++)
				if (!(DrawObjects.get(i).getLinkNodes().get(j).getInputSignalsNames().equals("-"))) {
					
					String tmp_in_signals =  DrawObjects.get(i).getLinkNodes().get(j).getInputSignalsNames();
					
					while (tmp_in_signals.indexOf("!")!=-1)
						tmp_in_signals = tmp_in_signals.substring(0, tmp_in_signals.indexOf("!"))+tmp_in_signals.substring(tmp_in_signals.indexOf("!")+1, tmp_in_signals.length());
					
					while (!tmp_in_signals.isEmpty())
						if (tmp_in_signals.substring(LogicalNode.NAME_CHARACTER.length()).indexOf(LogicalNode.NAME_CHARACTER)==-1) {
							
							if (!logical_conditions.contains(tmp_in_signals))
								logical_conditions.add(tmp_in_signals);
	
							tmp_in_signals = "";
						}
						else {
							if (!logical_conditions.contains(tmp_in_signals.substring(0, tmp_in_signals.substring(LogicalNode.NAME_CHARACTER.length()).indexOf(LogicalNode.NAME_CHARACTER)+LogicalNode.NAME_CHARACTER.length())))
								logical_conditions.add(tmp_in_signals.substring(0, tmp_in_signals.substring(LogicalNode.NAME_CHARACTER.length()).indexOf(LogicalNode.NAME_CHARACTER)+LogicalNode.NAME_CHARACTER.length()));
	
							tmp_in_signals = tmp_in_signals.substring(tmp_in_signals.substring(LogicalNode.NAME_CHARACTER.length()).indexOf(LogicalNode.NAME_CHARACTER)+LogicalNode.NAME_CHARACTER.length());
						}
				}
		
		Collections.sort(logical_conditions);
		
		ArrayList<String> control_signals = new ArrayList<String>();
		
		for (int i = 0; i<DrawObjects.size(); i++)			
			for (int j = 0; j<DrawObjects.get(i).getLinkNodes().size(); j++)
				if (!(DrawObjects.get(i).getLinkNodes().get(j).getOutputSignalsNames().equals("0"))) {
					
					String tmp_out_signals =  DrawObjects.get(i).getLinkNodes().get(j).getOutputSignalsNames();
					
					while (!tmp_out_signals.isEmpty())
						if (tmp_out_signals.substring(ArithmeticalNode.NAME_CHARACTER.length()).indexOf(ArithmeticalNode.NAME_CHARACTER)==-1) {
							
							if (!control_signals.contains(tmp_out_signals))
								control_signals.add(tmp_out_signals);
	
							tmp_out_signals = "";
						}
						else {
							if (!control_signals.contains(tmp_out_signals.substring(0, tmp_out_signals.substring(ArithmeticalNode.NAME_CHARACTER.length()).indexOf(ArithmeticalNode.NAME_CHARACTER)+ArithmeticalNode.NAME_CHARACTER.length())))
								control_signals.add(tmp_out_signals.substring(0, tmp_out_signals.substring(ArithmeticalNode.NAME_CHARACTER.length()).indexOf(ArithmeticalNode.NAME_CHARACTER)+ArithmeticalNode.NAME_CHARACTER.length()));
	
							tmp_out_signals = tmp_out_signals.substring(tmp_out_signals.substring(ArithmeticalNode.NAME_CHARACTER.length()).indexOf(ArithmeticalNode.NAME_CHARACTER)+ArithmeticalNode.NAME_CHARACTER.length());
						}
				}
		
		Collections.sort(control_signals);
		
		ArrayList<String> column_names = new ArrayList<String>();
		
		column_names.add("BS");
		
		String tmp = "";
		for (int i = gray_code_range-1; i>=0; i--)
			tmp = tmp+"Q"+i;
		
		column_names.add(tmp);
		
		column_names.add("ES");
		
		tmp = "";
		for (int i = gray_code_range-1; i>=0; i--)
			tmp = tmp+"Q"+i+"+";
		
		column_names.add(tmp);
		
		for (int i = 0; i<logical_conditions.size(); i++)
			column_names.add(logical_conditions.get(i));
		
		for (int i = 0; i<control_signals.size(); i++)
			column_names.add(control_signals.get(i));
		
		for (int i = gray_code_range-1; i>=0; i--) {
		
			column_names.add("J"+i);
			column_names.add("K"+i);
		}
		
		columnNames = new String[column_names.size()];
		columnNames = column_names.toArray(columnNames);
		
		ArrayList<String[]> structure_table_data = new ArrayList<String[]>();
		
		for (int i = 0; i<DrawObjects.size(); i++) {			

			for (int j = 0; j<DrawObjects.get(i).getLinkNodes().size(); j++) {
				
				structure_table_data.add(new String[columnNames.length]);
				
				structure_table_data.get(structure_table_data.size()-1)[0] = DrawObjects.get(i).getName();
				
				String tmp_gray_code_number = Integer.toBinaryString(DrawObjects.get(i).getGrayCodeNumber());
				while (tmp_gray_code_number.length()<gray_code_range)
					tmp_gray_code_number = "0"+tmp_gray_code_number;
				structure_table_data.get(structure_table_data.size()-1)[1] = tmp_gray_code_number;
				
				structure_table_data.get(structure_table_data.size()-1)[2] = DrawObjects.get(i).getLinkNodes().get(j).getLinkNode().getName();
				
				tmp_gray_code_number = Integer.toBinaryString(DrawObjects.get(i).getLinkNodes().get(j).getLinkNode().getGrayCodeNumber());
				while (tmp_gray_code_number.length()<gray_code_range)
					tmp_gray_code_number = "0"+tmp_gray_code_number;
				structure_table_data.get(structure_table_data.size()-1)[3] = tmp_gray_code_number;
				
				for (int k = 0; k<logical_conditions.size(); k++)
					if (DrawObjects.get(i).getLinkNodes().get(j).getInputSignalsNames().contains("!"+logical_conditions.get(k)))
						structure_table_data.get(structure_table_data.size()-1)[4+k] = "0";
					else
						if (DrawObjects.get(i).getLinkNodes().get(j).getInputSignalsNames().contains(logical_conditions.get(k)))
							structure_table_data.get(structure_table_data.size()-1)[4+k] = "1";
						else
							structure_table_data.get(structure_table_data.size()-1)[4+k] = "-";
				
				for (int k = 0; k<control_signals.size(); k++)
					if (DrawObjects.get(i).getLinkNodes().get(j).getOutputSignalsNames().contains(control_signals.get(k)))
						structure_table_data.get(structure_table_data.size()-1)[4+logical_conditions.size()+k] = "1";
					else
						structure_table_data.get(structure_table_data.size()-1)[4+logical_conditions.size()+k] = "0";
				
				for (int k = 0; k<gray_code_range; k++)
					if (structure_table_data.get(structure_table_data.size()-1)[1].charAt(k)=='0')
						if (structure_table_data.get(structure_table_data.size()-1)[3].charAt(k)=='0') {
						
							structure_table_data.get(structure_table_data.size()-1)[4+logical_conditions.size()+control_signals.size()+2*k] = "0";
							structure_table_data.get(structure_table_data.size()-1)[4+logical_conditions.size()+control_signals.size()+2*k+1] = "-";
						}
						else{
							
							structure_table_data.get(structure_table_data.size()-1)[4+logical_conditions.size()+control_signals.size()+2*k] = "1";
							structure_table_data.get(structure_table_data.size()-1)[4+logical_conditions.size()+control_signals.size()+2*k+1] = "-";
						}
					else
						if (structure_table_data.get(structure_table_data.size()-1)[3].charAt(k)=='0') {
						
							structure_table_data.get(structure_table_data.size()-1)[4+logical_conditions.size()+control_signals.size()+2*k] = "-";
							structure_table_data.get(structure_table_data.size()-1)[4+logical_conditions.size()+control_signals.size()+2*k+1] = "1";
						}
						else{
						
							structure_table_data.get(structure_table_data.size()-1)[4+logical_conditions.size()+control_signals.size()+2*k] = "-";
							structure_table_data.get(structure_table_data.size()-1)[4+logical_conditions.size()+control_signals.size()+2*k+1] = "0";
						}
			}
		}
		
		StructureTableData = new String[structure_table_data.size()][column_names.size()];
		for (int i = 0; i<structure_table_data.size(); i++)
			for (int j = 0; j<column_names.size(); j++)
				StructureTableData[i][j] = structure_table_data.get(i)[j];
		
		return true;
	}
	
	public String[] getStructureTableColumnsNames() {
		
		return columnNames;
	}
	
	public Object[][] getStructureTableData() {
		
		return StructureTableData;
	}
}
