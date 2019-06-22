package lab1_8;

import java.awt.AWTEvent;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Point;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;
import java.util.ArrayList;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

public class LSADrawPanel extends JPanel implements MouseListener, MouseMotionListener {

	private static final long serialVersionUID = 1L;

	private static Font currentFont = new Font("SansSerif", Font.PLAIN, 28);
	
	private ArrayList<AbstractNode> DrawObjects = new ArrayList<AbstractNode>();
	private ArrayList<AbstractNode> MarkedAlgorithm = new ArrayList<AbstractNode>();
	private AbstractNode CurrentObject = null;
	private AbstractNode CurrentErrorObject = null;
	
	private JFrame ParrentWindow = null;
	
	private Point StartNodePosition = new Point(10, 40);
	
	private boolean drawMiliGraphNodes = false;
	
	public LSADrawPanel(boolean b) {
		
		super(b);
		
		this.setFont(currentFont);
		
		this.setBackground(Color.WHITE);
		
		this.setFocusable(true);
		
		enableEvents(AWTEvent.MOUSE_EVENT_MASK|AWTEvent.MOUSE_MOTION_EVENT_MASK);
		
		addMouseListener(this);
		addMouseMotionListener(this);
	}
	
	public void addDrawObject(AbstractNode obj) {
		
		drawMiliGraphNodes = false;
		DrawObjects.add(obj);
		this.updateUI();
	}
	
	public void paint(Graphics g) {
		
		Graphics2D g2 = (Graphics2D) g;
		
		super.paint(g2);
		
		g.setColor(Color.BLACK);
		
		Point CurrentNodePosition = StartNodePosition;
	
		if (drawMiliGraphNodes)
			for (AbstractNode e : MarkedAlgorithm) {
			
				if (e.getClass().equals(MiliGraphNode.class))
					g2.setColor(Color.BLUE);
			
				CurrentNodePosition = e.paint(g2, CurrentNodePosition);
			
				g2.setColor(Color.BLACK);
			}
		else
			for (AbstractNode e : DrawObjects) {
				
				if ((CurrentObject!=null) && e.equals(CurrentObject))
					g2.setColor(Color.RED);
				
				if ((CurrentErrorObject!=null) && e.equals(CurrentErrorObject))
					g2.setColor(Color.LIGHT_GRAY);
				
				if ((CurrentErrorObject!=null) && (CurrentObject!=null) && e.equals(CurrentErrorObject) && (CurrentObject.equals(CurrentErrorObject)))
					g2.setColor(Color.ORANGE);
					
				CurrentNodePosition = e.paint(g2, CurrentNodePosition);
				
				g2.setColor(Color.BLACK);
			}
		
		this.setPreferredSize(new Dimension((int) (CurrentNodePosition.getX()+StartNodePosition.getX()), 0));
	}
	
	public AbstractNode FindNodeByPoint(Point p) {
		
		for (AbstractNode e : DrawObjects)
			if (e.isPointBelongNode(p))
				return e;

		return null;
	} 
	
	public static Font getCurrentFont() {
		
		return currentFont;
	}
	
	public void setParentWindow(JFrame f) {
		
		ParrentWindow = f;
	}
	
	public boolean isInArrowExist(int ArrowNumber) {
		
		for (AbstractNode e : DrawObjects)
			if ((e.getClass().equals(InArrowNode.class)) && (((InArrowNode)e).getNumber()==ArrowNumber))
				return true;
		
		return false;
	}
	
	public boolean isBeginExist() {
		
		for (AbstractNode e : DrawObjects)
			if (e.getClass().equals(BeginNode.class))
				return true;
		
		return false;
	}
	
	public boolean isEndExist() {
		
		for (AbstractNode e : DrawObjects)
			if (e.getClass().equals(EndNode.class))
				return true;
		
		return false;
	}
	
	public boolean isOpenBracketAllowed() {
		
		if ((!DrawObjects.isEmpty()) && (DrawObjects.get(DrawObjects.size()-1).getClass().equals(OpenBracketNode.class)))
			return false;
		
		for (int i = DrawObjects.size()-1; i>=0; i--) {
			
			if (DrawObjects.get(i).getClass().equals(OpenBracketNode.class))
				return false;

			if (DrawObjects.get(i).getClass().equals(CloseBracketNode.class))
				return true;
		}
		
		return true;
	}
	
	public boolean isCloseBracketAllowed() {
		
		if (DrawObjects.isEmpty())
			return false;
		
		if ((DrawObjects.get(DrawObjects.size()-1).getClass().equals(CloseBracketNode.class)) || (DrawObjects.get(DrawObjects.size()-1).getClass().equals(OpenBracketNode.class)))
			return false;
		
		for (int i = DrawObjects.size()-1; i>=0; i--) {
			
			if ((!DrawObjects.get(i).getClass().equals(ArithmeticalNode.class)) && (!DrawObjects.get(i).getClass().equals(OpenBracketNode.class)))
				return false;
			
			if (DrawObjects.get(i).getClass().equals(OpenBracketNode.class))
				return true;
		}
		
		return true;
	}
	
	public boolean isAnyNodeLinkedOnInArrow(int ArrowNumber) {
		
		for (AbstractNode e : DrawObjects) {
			
			if ((e.getClass().equals(LogicalNode.class)) && (((LogicalNode)e).getOnFalseArrowNumber() == ArrowNumber))
				return true;
			
			if ((e.getClass().equals(OutArrowNode.class)) && (((OutArrowNode)e).getNumber() == ArrowNumber))
				return true;
		}
		
		return false;
	} 
	
	public void removeSelectedNode() {
		
		if (CurrentObject!=null) {
		
			DrawObjects.remove(CurrentObject);
			CurrentObject = null;
			this.updateUI();
		}
		else
			JOptionPane.showMessageDialog(ParrentWindow, "None Of Nodes Is Selected.");
	}

	public void mouseClicked(MouseEvent e) {
		
		if (e.getClickCount()==2) {
		
			CurrentObject = FindNodeByPoint(e.getPoint());
			
			if (CurrentObject!=null) {
				
				if (CurrentObject.getClass().equals(ArithmeticalNode.class)) {
					
					ArithmeticalNodePropertiesDialog currentDialog = new ArithmeticalNodePropertiesDialog(ParrentWindow, ((ArithmeticalNode)CurrentObject).getNumber());
					
					if (currentDialog.isDisplayable()) {

						((ArithmeticalNode)CurrentObject).setNumber(currentDialog.getNodeNumber());	
						
						currentDialog.dispose();
						this.updateUI();
					}
				}
				
				if (CurrentObject.getClass().equals(LogicalNode.class)) {
					
					LogicalNodePropertiesDialog currentDialog = new LogicalNodePropertiesDialog(ParrentWindow, ((LogicalNode)CurrentObject).getNumber(), ((LogicalNode)CurrentObject).getOnFalseArrowNumber());
					
					if (currentDialog.isDisplayable()) {

						((LogicalNode)CurrentObject).setNumber(currentDialog.getNodeNumber());
						((LogicalNode)CurrentObject).setOnFalseArrowNumber(currentDialog.getOnFalseArrowNumber());

						currentDialog.dispose();
						this.updateUI();
					}
				}
				
				if (CurrentObject.getClass().equals(InArrowNode.class)) {
					
					ArrowNodePropertiesDialog currentDialog = new ArrowNodePropertiesDialog(ParrentWindow, ((InArrowNode)CurrentObject).getNumber());
					
					if (currentDialog.isDisplayable()) {

						if (!isInArrowExist(currentDialog.getNodeNumber()))
							((InArrowNode)CurrentObject).setNumber(currentDialog.getNodeNumber());
						else 
							JOptionPane.showMessageDialog(ParrentWindow, "Arrow with number "+currentDialog.getNodeNumber()+" already exist.");

						currentDialog.dispose();
						this.updateUI();
					}
				}
				
				if (CurrentObject.getClass().equals(OutArrowNode.class)) {
					
					ArrowNodePropertiesDialog currentDialog = new ArrowNodePropertiesDialog(ParrentWindow, ((OutArrowNode)CurrentObject).getNumber());
					
					if (currentDialog.isDisplayable()) {

						((OutArrowNode)CurrentObject).setNumber(currentDialog.getNodeNumber());

						currentDialog.dispose();
						this.updateUI();
					}
				}
			}
		}
	}

	public void mouseEntered(MouseEvent e) {
		
		if (!this.hasFocus())
			this.requestFocus();
	}

	public void mouseExited(MouseEvent e) {}

	public void mousePressed(MouseEvent e) {

		if (drawMiliGraphNodes)
			drawMiliGraphNodes = false;
		else {
			
			CurrentErrorObject = null;
			CurrentObject = FindNodeByPoint(e.getPoint());
		}
		
		this.updateUI();
	}
	
	public void mouseReleased(MouseEvent e) {}

	public void mouseDragged(MouseEvent e) {
		
		if ((e.getModifiersEx() & MouseEvent.BUTTON1_DOWN_MASK)!=0)
			if (CurrentObject!=null) {
				
				int CurrentObjectIndex = DrawObjects.indexOf(CurrentObject);
				
				if ((CurrentObjectIndex!=0) && (CurrentObjectIndex!=(DrawObjects.size()-1))) {
					
					if ((CurrentObject.isPointAtTheLeftOfNodesCenter(e.getPoint())) && (DrawObjects.get(CurrentObjectIndex-1).isPointAtTheLeftOfNodesCenter(e.getPoint()))) {
						
						DrawObjects.remove(CurrentObject);
						DrawObjects.add(CurrentObjectIndex-1, CurrentObject);
						this.updateUI();
					}
				
					if ((CurrentObject.isPointAtTheRightOfNodesCenter(e.getPoint())) && (DrawObjects.get(CurrentObjectIndex+1).isPointAtTheRightOfNodesCenter(e.getPoint()))) {
						
						DrawObjects.remove(CurrentObject);
						DrawObjects.add(CurrentObjectIndex+1, CurrentObject);
						this.updateUI();
					}
				}
				
				if ((CurrentObjectIndex==0) && (CurrentObjectIndex!=(DrawObjects.size()-1)))
					if ((CurrentObject.isPointAtTheRightOfNodesCenter(e.getPoint())) && (DrawObjects.get(CurrentObjectIndex+1).isPointAtTheRightOfNodesCenter(e.getPoint()))) {
						
						DrawObjects.remove(CurrentObject);
						DrawObjects.add(CurrentObjectIndex+1, CurrentObject);
						this.updateUI();
					}
				
				if ((CurrentObjectIndex!=0) && (CurrentObjectIndex==(DrawObjects.size()-1)))
					if ((CurrentObject.isPointAtTheLeftOfNodesCenter(e.getPoint())) && (DrawObjects.get(CurrentObjectIndex-1).isPointAtTheLeftOfNodesCenter(e.getPoint()))) {
						
						DrawObjects.remove(CurrentObject);
						DrawObjects.add(CurrentObjectIndex-1, CurrentObject);
						this.updateUI();
					}
			}
	}

	public void mouseMoved(MouseEvent e) {}
	
	public boolean isCorrectInput() {
		
		OpenBracketNode OpenedBracket = null;
		
		if (DrawObjects.size()<3) {
			
			JOptionPane.showMessageDialog(ParrentWindow, "Not Enaph Nodes.");
			return false;
		}
		
		if (!DrawObjects.get(0).getClass().equals(BeginNode.class)) {
			
			JOptionPane.showMessageDialog(ParrentWindow, "First Node Must Be Begin.");
			return false;
		}
		
		if (!DrawObjects.get(DrawObjects.size()-1).getClass().equals(EndNode.class)) {
			
			JOptionPane.showMessageDialog(ParrentWindow, "Last Node Must Be End.");
			return false;
		}
		
		for (AbstractNode e: DrawObjects) {
			
			if (e.getClass().equals(LogicalNode.class)) {
				
				if (!isInArrowExist(((LogicalNode)e).getOnFalseArrowNumber())) {
					
					CurrentErrorObject = e;
					updateUI();
			
					JOptionPane.showMessageDialog(ParrentWindow, "Arrow With Number "+((LogicalNode)e).getOnFalseArrowNumber()+" On Which Linked "+e.getName()+" Node Does Not Exist.");
					return false;
				}

				for (int i = DrawObjects.indexOf(e)+1; DrawObjects.get(i).getClass().equals(InArrowNode.class); i++)
					if (((LogicalNode)e).getOnFalseArrowNumber() == ((InArrowNode)(DrawObjects.get(i))).getNumber()) {
					
						CurrentErrorObject = e;
						updateUI();
					
						JOptionPane.showMessageDialog(ParrentWindow, "Node "+e.getName()+" Twice Linked On Arrow With Number "+((LogicalNode)e).getOnFalseArrowNumber()+".");
						return false;
					}
			}
			
			if (e.getClass().equals(InArrowNode.class)) {
				
				if (!isAnyNodeLinkedOnInArrow(((InArrowNode)e).getNumber())) {
			
					JOptionPane.showMessageDialog(ParrentWindow, "No One Logical Node Linked On Arrow With Number "+e.getName()+".");
					return false;
				}
				
				if (DrawObjects.get(DrawObjects.indexOf(e)+1).getClass().equals(InArrowNode.class)) {
					
					CurrentErrorObject = e;
					updateUI();
			
					JOptionPane.showMessageDialog(ParrentWindow, "Several In Arrow Can't Running.");
					return false;
				}
			}
			
			if (e.getClass().equals(OutArrowNode.class)) {
				
				if (!isInArrowExist(((OutArrowNode)e).getNumber())) {
					
					CurrentErrorObject = e;
					updateUI();
			
					JOptionPane.showMessageDialog(ParrentWindow, "Arrow With Number "+((LogicalNode)e).getOnFalseArrowNumber()+" On Which Linked Out Arrow "+e.getName()+" Does Not Exist.");
					return false;
				}
				
				if (!DrawObjects.get(DrawObjects.indexOf(e)+1).getClass().equals(InArrowNode.class)) {
					
					CurrentErrorObject = e;
					updateUI();
			
					JOptionPane.showMessageDialog(ParrentWindow, "After Out Arrow Must Be In Arrow.");
					return false;
				}
				
				if (DrawObjects.get(DrawObjects.indexOf(e)-1).getClass().equals(InArrowNode.class)) {
					
					CurrentErrorObject = e;
					updateUI();
			
					JOptionPane.showMessageDialog(ParrentWindow, "Before Out Arrow Can't Be In Arrow.");
					return false;
				}
			}
			
			if (((e.getClass().equals(EndNode.class)) || (e.getClass().equals(OpenBracketNode.class))) && (OpenedBracket!=null)) {
				
				CurrentErrorObject = OpenedBracket;
				updateUI();
				
				JOptionPane.showMessageDialog(ParrentWindow, "Open Bracket Don't Closed.");
				return false;
			}
			
			if ((e.getClass().equals(OpenBracketNode.class)) && (OpenedBracket==null))
				OpenedBracket = (OpenBracketNode)e;
			
			if ((e.getClass().equals(CloseBracketNode.class)) && (OpenedBracket==null)) {
				
				CurrentErrorObject = e;
				updateUI();
				
				JOptionPane.showMessageDialog(ParrentWindow, "Close Bracket Don't Openned.");
				return false;
			}
			
			if ((e.getClass().equals(CloseBracketNode.class)) && (OpenedBracket!=null)) {
				
				if (DrawObjects.indexOf(OpenedBracket)+1==DrawObjects.indexOf(e)) {
					
					CurrentErrorObject = OpenedBracket;
					updateUI();
					
					JOptionPane.showMessageDialog(ParrentWindow, "Brackets Is Empty.");
					return false;
				}
				
				for (int i = DrawObjects.indexOf(OpenedBracket)+1; i<DrawObjects.indexOf(e); i++)
					if (!DrawObjects.get(i).getClass().equals(ArithmeticalNode.class)) {
						
						CurrentErrorObject = e;
						updateUI();
						
						JOptionPane.showMessageDialog(ParrentWindow, "Illegal Node In Brackets.");
						return false;
					}
				
				OpenedBracket = null;
			}
		}

		return true;
	}

	public ArrayList<AbstractNode> getDrawObjects () {
		
		return DrawObjects;
	}
	
	public int[][] getCoherenceMatrix() {
		
		int MatrixSize = 0;
		
		for (int i = 0; i<DrawObjects.size(); i++) {
			
			if (DrawObjects.get(i).getClass().equals(OpenBracketNode.class)) {
				
				MatrixSize++;
				
				do {
					i++;
				} while(!DrawObjects.get(i).getClass().equals(CloseBracketNode.class));
			}
			
			if ((DrawObjects.get(i).getClass().equals(LogicalNode.class)) || (DrawObjects.get(i).getClass().equals(EndNode.class)) || (DrawObjects.get(i).getClass().equals(ArithmeticalNode.class)))
				MatrixSize++;
		}
		
		int[][] CM = new int[MatrixSize][MatrixSize];
		int MatrixIndex = 0;
		
		for (int i = 0; i<DrawObjects.size()-1; i++) {
			
			if ((DrawObjects.get(i).getClass().equals(BeginNode.class)) || (DrawObjects.get(i).getClass().equals(ArithmeticalNode.class))) {
				
				if (DrawObjects.get(i+1).getClass().equals(OutArrowNode.class))
					CM[MatrixIndex][getJumpNodeNumber((OutArrowNode)DrawObjects.get(i+1))] = 1;
				else
					CM[MatrixIndex][MatrixIndex] = 1;
				
				MatrixIndex++;
			}
			
			if (DrawObjects.get(i).getClass().equals(LogicalNode.class)) {
				
				int ArrowNodeLink = 0;
				
				for (int j = 1; j<DrawObjects.size(); j++) {
					
					if (DrawObjects.get(j).getClass().equals(OpenBracketNode.class)) {
						
						ArrowNodeLink++;
						
						do {
							j++;
						} while(!DrawObjects.get(j).getClass().equals(CloseBracketNode.class));
					}
					
					if ((DrawObjects.get(j).getClass().equals(LogicalNode.class)) || (DrawObjects.get(j).getClass().equals(EndNode.class)) || (DrawObjects.get(j).getClass().equals(ArithmeticalNode.class)))
						ArrowNodeLink++;
					
					if ((DrawObjects.get(j).getClass().equals(InArrowNode.class)) && (((InArrowNode)DrawObjects.get(j)).getNumber()==((LogicalNode)DrawObjects.get(i)).getOnFalseArrowNumber()))
						break;
				}
				
				if (DrawObjects.get(i+1).getClass().equals(OutArrowNode.class))
					CM[MatrixIndex][getJumpNodeNumber((OutArrowNode)DrawObjects.get(i+1))] = 1;
				else
					CM[MatrixIndex][MatrixIndex] = 1;
				
				CM[MatrixIndex][ArrowNodeLink] = -1;
				
				MatrixIndex++;
			}
			
			if (DrawObjects.get(i).getClass().equals(OpenBracketNode.class)) {
				
				do {
					i++;
				} while(!DrawObjects.get(i).getClass().equals(CloseBracketNode.class));
				
				if (DrawObjects.get(i+1).getClass().equals(OutArrowNode.class))
					CM[MatrixIndex][getJumpNodeNumber((OutArrowNode)DrawObjects.get(i+1))] = 1;
				else
					CM[MatrixIndex][MatrixIndex] = 1;
				
				MatrixIndex++;
			}
		}
		
		return CM;
	}
	
	private int getJumpNodeNumber(OutArrowNode Jump) {
		
		int JumpLink = 0;
		
		for (int j = 0; !((DrawObjects.get(j).getClass().equals(InArrowNode.class)) && (((InArrowNode)DrawObjects.get(j)).getNumber()==Jump.getNumber())); j++) {
			
			if (DrawObjects.get(j).getClass().equals(OpenBracketNode.class)) {
				
				JumpLink++;
				
				do {
					j++;
				} while(!DrawObjects.get(j).getClass().equals(CloseBracketNode.class));
			}
			
			if ((DrawObjects.get(j).getClass().equals(LogicalNode.class)) || (DrawObjects.get(j).getClass().equals(EndNode.class)) || (DrawObjects.get(j).getClass().equals(ArithmeticalNode.class)))
				JumpLink++;
		}
		
		return JumpLink;
	}
	
	public void addObjectsFromFile(ArrayList<AbstractNode> Objects, int[][] CoherenceMatrix) {
		
		DrawObjects.clear();
		DrawObjects = Objects;
		
		drawMiliGraphNodes = false;
		this.updateUI();
	}
	
	public ArrayList<MiliGraphNode> getMiliDrawObjects() {
		
		MarkedAlgorithm.clear();
		ArrayList<Integer> InsertAfterInArrow = new ArrayList<Integer>();
		
		int counterMiliGraphNode = 0;
		
		for (int i = 0; i<DrawObjects.size(); i++) {
			
			if (DrawObjects.get(i).getClass().equals(BeginNode.class)) {
				
				MarkedAlgorithm.add(DrawObjects.get(i));
				
				if (DrawObjects.get(i+1).getClass().equals(OutArrowNode.class)) {
					
					if (!InsertAfterInArrow.contains(((OutArrowNode)DrawObjects.get(i+1)).getNumber()))
						InsertAfterInArrow.add(((OutArrowNode)DrawObjects.get(i+1)).getNumber());
					
					i++;
					MarkedAlgorithm.add(DrawObjects.get(i));
				}
				else {
					if (DrawObjects.get(i+1).getClass().equals(InArrowNode.class)) {
					
						i++;
						MarkedAlgorithm.add(DrawObjects.get(i));
					}
				
					MarkedAlgorithm.add(new MiliGraphNode(counterMiliGraphNode));
					counterMiliGraphNode++;
				}
				
				continue;
			}
			
			if (DrawObjects.get(i).getClass().equals(OpenBracketNode.class)) {
				
				MarkedAlgorithm.add(DrawObjects.get(i)); 
				
				do {
					i++;
					MarkedAlgorithm.add(DrawObjects.get(i));
				} while(!DrawObjects.get(i).getClass().equals(CloseBracketNode.class));
				
				if (DrawObjects.get(i+1).getClass().equals(OutArrowNode.class)) {
					
					if (!InsertAfterInArrow.contains(((OutArrowNode)DrawObjects.get(i+1)).getNumber()))
						InsertAfterInArrow.add(((OutArrowNode)DrawObjects.get(i+1)).getNumber());
					
					i++;
					MarkedAlgorithm.add(DrawObjects.get(i));
				}
				else {
					
					if (DrawObjects.get(i+1).getClass().equals(InArrowNode.class)) {
					
						i++;					
						MarkedAlgorithm.add(DrawObjects.get(i));
					}
				
					if (DrawObjects.get(i+1).getClass().equals(EndNode.class)) {
						for (AbstractNode e: MarkedAlgorithm)
						if (e.getClass().equals(MiliGraphNode.class)) {
							
								MarkedAlgorithm.add(e);
								break;
							}
					}
					else {
					
						MarkedAlgorithm.add(new MiliGraphNode(counterMiliGraphNode));
						counterMiliGraphNode++;
					}
				}
				
				continue;
			}
			
			if (DrawObjects.get(i).getClass().equals(ArithmeticalNode.class)) {
				
				MarkedAlgorithm.add(DrawObjects.get(i));
				
				if (DrawObjects.get(i+1).getClass().equals(OutArrowNode.class)) {
					
					if (!InsertAfterInArrow.contains(((OutArrowNode)DrawObjects.get(i+1)).getNumber()))
						InsertAfterInArrow.add(((OutArrowNode)DrawObjects.get(i+1)).getNumber());
					
					i++;
					MarkedAlgorithm.add(DrawObjects.get(i));
				}
				else {
				
					if (DrawObjects.get(i+1).getClass().equals(InArrowNode.class)) {
					
						i++;
						MarkedAlgorithm.add(DrawObjects.get(i));
					}
				
					if (DrawObjects.get(i+1).getClass().equals(EndNode.class)) {
						for (AbstractNode e: MarkedAlgorithm)
							if (e.getClass().equals(MiliGraphNode.class)) {
						
								MarkedAlgorithm.add(e);
								break;
							}
						}
					else {
					
						MarkedAlgorithm.add(new MiliGraphNode(counterMiliGraphNode));
						counterMiliGraphNode++;
					}
				}
				
				continue;
			}
			
			if ((DrawObjects.get(i).getClass().equals(EndNode.class)) && (!MarkedAlgorithm.get(MarkedAlgorithm.size()-1).getClass().equals(MiliGraphNode.class))) {
				
				for (AbstractNode e: MarkedAlgorithm)
					if (e.getClass().equals(MiliGraphNode.class)) {
					
						MarkedAlgorithm.add(e);
						break;
					}
				
				MarkedAlgorithm.add(DrawObjects.get(i));
				continue;
			}
			
			if ((DrawObjects.get(i).getClass().equals(InArrowNode.class)) && !((DrawObjects.get(i+1).getClass().equals(EndNode.class))))
				for (int j = 0; j<InsertAfterInArrow.size(); j++)
					if (((InArrowNode)DrawObjects.get(i)).getNumber()==InsertAfterInArrow.get(j)) {
						
						MarkedAlgorithm.add(DrawObjects.get(i));
						MarkedAlgorithm.add(new MiliGraphNode(counterMiliGraphNode));
						counterMiliGraphNode++;
						
						InsertAfterInArrow.remove(InsertAfterInArrow.get(j));
						continue;
					}
						
			MarkedAlgorithm.add(DrawObjects.get(i));
		}
		
		if (!InsertAfterInArrow.isEmpty())
			for (int i = 0; i<MarkedAlgorithm.size(); i++)
				if (MarkedAlgorithm.get(i).getClass().equals(InArrowNode.class))
					for (int j = 0; j<InsertAfterInArrow.size(); j++)
						if (((InArrowNode)MarkedAlgorithm.get(i)).getNumber()==InsertAfterInArrow.get(j)) {
					
							MarkedAlgorithm.add(i+1, new MiliGraphNode(counterMiliGraphNode));
							counterMiliGraphNode++;
					
							InsertAfterInArrow.remove(j);
							continue;
						}
		
		for (int i = 0; i<MarkedAlgorithm.size(); i++)
			if (MarkedAlgorithm.get(i).getClass().equals(LogicalNode.class)) {
			
				int false_link = 0;
				while (!((MarkedAlgorithm.get(false_link).getClass().equals(InArrowNode.class)) && (((InArrowNode)MarkedAlgorithm.get(false_link)).getNumber() == ((LogicalNode)MarkedAlgorithm.get(i)).getOnFalseArrowNumber())))
					false_link++;
				
				if (false_link<i) {
					
					boolean cycle = true;
				
					for (int j = false_link; j<i; j++)
						if (MarkedAlgorithm.get(j).getClass().equals(MiliGraphNode.class)) {
							
							cycle = false;
							break;
						}
					
					if (cycle) {
						
						MarkedAlgorithm.add(i, new MiliGraphNode(counterMiliGraphNode));
						counterMiliGraphNode++;
					}
				}
			}
		
		int current_state_index = 0;
		
		for (int i = 0; i<counterMiliGraphNode; i++) {
			
			int current_node = 0;
			while (!((MarkedAlgorithm.get(current_node).getClass().equals(MiliGraphNode.class)) && ((((MiliGraphNode)MarkedAlgorithm.get(current_node)).getNumber()==i))))
				current_node++;
			
			MiliGraphNode current_state = (MiliGraphNode) MarkedAlgorithm.get(current_node);
			current_state_index = current_node;
			
			String input_signals_buffer = "";
			String output_signals_buffer = "";
			
			ArrayList<Boolean> logical_node_checked = new ArrayList<Boolean>();
			
			int k = 0;
			do {
				
				current_node = current_state_index+1;
				k = 0;
				input_signals_buffer = "";
				output_signals_buffer = "";
				
				while (!MarkedAlgorithm.get(current_node).getClass().equals(MiliGraphNode.class)) {
					
					if (MarkedAlgorithm.get(current_node).getClass().equals(ArithmeticalNode.class))
						output_signals_buffer = output_signals_buffer+((ArithmeticalNode)MarkedAlgorithm.get(current_node)).getName();
					
					if (MarkedAlgorithm.get(current_node).getClass().equals(LogicalNode.class)) {
						
						k++;
						if (k>logical_node_checked.size()) {
							
							logical_node_checked.add(true);
							input_signals_buffer = input_signals_buffer+((LogicalNode)MarkedAlgorithm.get(current_node)).getName();
						}
						else
							if (k==logical_node_checked.size()) {
							
								logical_node_checked.set(k-1, false);
								input_signals_buffer = input_signals_buffer+"!"+((LogicalNode)MarkedAlgorithm.get(current_node)).getName();
							
								int false_link = 0;
								while (!((MarkedAlgorithm.get(false_link).getClass().equals(InArrowNode.class)) && (((InArrowNode)MarkedAlgorithm.get(false_link)).getNumber() == ((LogicalNode)MarkedAlgorithm.get(current_node)).getOnFalseArrowNumber())))
									false_link++;
								
								current_node = false_link;
							}
							else
								if (k<logical_node_checked.size())
									if (logical_node_checked.get(k-1))
										input_signals_buffer = input_signals_buffer+((LogicalNode)MarkedAlgorithm.get(current_node)).getName();
									else {
								
										input_signals_buffer = input_signals_buffer+"!"+((LogicalNode)MarkedAlgorithm.get(current_node)).getName();
								
										int false_link = 0;
										while (!((MarkedAlgorithm.get(false_link).getClass().equals(InArrowNode.class)) && (((InArrowNode)MarkedAlgorithm.get(false_link)).getNumber() == ((LogicalNode)MarkedAlgorithm.get(current_node)).getOnFalseArrowNumber())))
											false_link++;
									
										current_node = false_link;
									}
					}
					
					if (MarkedAlgorithm.get(current_node).getClass().equals(OutArrowNode.class)) {
						
						int jump_link = 0;
						while (!((MarkedAlgorithm.get(jump_link).getClass().equals(InArrowNode.class)) && (((InArrowNode)MarkedAlgorithm.get(jump_link)).getNumber() == ((OutArrowNode)MarkedAlgorithm.get(current_node)).getNumber())))
							jump_link++;
						
						current_node = jump_link;
					}
					
					current_node++;
				}
				
				while ((!logical_node_checked.isEmpty()) && (!logical_node_checked.get(k-1))) {
					
					logical_node_checked.remove(k-1);
					k--;
				}
				
				current_state.addNewNodeLink(new MiliGraphLink((MiliGraphNode) MarkedAlgorithm.get(current_node), input_signals_buffer, output_signals_buffer));				
			} while (k!=0);
		}
		
		ArrayList<MiliGraphNode> result = new ArrayList<MiliGraphNode>();
		
		for (Object e: MarkedAlgorithm)
			if (e.getClass().equals(MiliGraphNode.class))
				result.add((MiliGraphNode) e);
		
		if (result.get(0).equals(result.get(result.size()-1)))
			result.remove(result.size()-1);
		
		CurrentObject = null;
		CurrentErrorObject = null;
		
		drawMiliGraphNodes = true;
		updateUI();
		
		return result;
	}
}
