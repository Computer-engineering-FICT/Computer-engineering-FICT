package edu.editor.algorithm.model;

import java.awt.Dimension;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Observable;

import javax.swing.JOptionPane;

import edu.editor.algorithm.model.component.AbstractComponent;
import edu.editor.algorithm.model.component.block.*;
import edu.editor.algorithm.parser.operand.Variable;
import edu.editor.algorithm.view.panel.AlgorithmPanel;

public class AlgorithmModel extends Observable implements Serializable{
     private static final long serialVersionUID = 7922555651081108629L;
     private ArrayList<AbstractComponent> components;
     ArrayList<AbstractBlock> listBlockCopy;
     ArrayList<Connection> listConnectionCopy;
     ArrayList<Variable> variables = new ArrayList<Variable>();
     ArrayList<String> variableNames = new ArrayList<String>();
	 public HashMap<AbstractBlock, ArrayList<String>> firstVariablesAppearanceMap;
     
     public AlgorithmModel() {
          components = new ArrayList<AbstractComponent>();
     }
     
     public final void addComponent(AbstractComponent component) {
          deselectAll();
          components.add(component);
          
          changed();
     }
     
     public final void removeComponent(AbstractComponent component) {
          if (component != null) {
               if (component instanceof Connection) {
                    if (((Connection)component).getStartBlock() instanceof Condition) {
                         if (((Condition)((Connection)component).getStartBlock()).getOutputConnection() != null &&
                        		 ((Condition)((Connection)component).getStartBlock()).getOutputConnection().equals((Connection)component)) {
                              ((Condition)((Connection)component).getStartBlock()).setOutputConnection(null);
                         } else {
                              ((Condition)((Connection)component).getStartBlock()).setSecondOutputConnection(null);
                         }
                    } else {
                         ((Connection)component).getStartBlock().setOutputConnection(null);
                    }
                    if (((Connection)component).getEndBlock() instanceof Connector) {
                         if (((Connector)((Connection)component).getEndBlock()).getInputConnection()!=null &&
                                   ((Connector)((Connection)component).getEndBlock()).getInputConnection().equals((Connection)component)) {
                              ((Connector)((Connection)component).getEndBlock()).setInputConnection(null);
                         } else {
                              ((Connector)((Connection)component).getEndBlock()).setSecondInputConnection(null);
                         }
                    } else {
                         ((Connection)component).getEndBlock().setInputConnection(null);
                    }
               } else {
                    removeComponent(((AbstractBlock)component).getInputConnection());
                    if (component instanceof Condition) {
                        removeComponent(((Condition)component).getSecondOutputConnection());
                    }
                    removeComponent(((AbstractBlock)component).getOutputConnection());
                    
                    if (component instanceof Connector) {
                         removeComponent(((Connector)component).getSecondInputConnection());
                    }
               }
               components.remove(component);
               changed();
          }
     }
     
     public final void removeSelected() {
          for (int i = 0; i < components.size(); i++) {
               if (components.get(i).isSelected()) {
                    removeComponent(components.get(i));
                    i = -1;
               }
          }
     }
     
     public final ArrayList<AbstractComponent> getComponents() {
          return components;
     }
     
     public final void setComponents(ArrayList<AbstractComponent> components) {
          clear();
          this.components = components;
          changed();
     }
     
     public final AbstractComponent getSelected(int x, int y) {
    	  AbstractComponent result = null; 
          for (int i = 0; i < components.size(); i++) {
               if (components.get(i).contains(x, y)) {
                    result = components.get(i);
               }
          }
          return result;
     }
     
     public final ArrayList<AbstractComponent> getSelected(int x1, int y1, int x2, int y2) {
          ArrayList<AbstractComponent> result = new ArrayList<AbstractComponent>();
          for (int i = 0; i < components.size(); i++) {
               if (components.get(i).isSelected(x1, y1, x2, y2)) {
                    result.add(components.get(i));
               }
          }
          return result;
     }
     
     public final void setSelected(int x, int y) {
          deselectAll();
          AbstractComponent ac = null;
          for (int i = 0; i < components.size(); i++) {
               if (components.get(i).contains(x, y)) {
            	   ac = components.get(i);
               }
          }
          if (ac != null) {
        	  ac.setSelected(true);
        	  changed();
          }
     }
     
     public final void setSelected(int x1, int y1, int x2, int y2) {
          deselectAll();
          for (int i = 0; i < components.size(); i++) {
               if (components.get(i).isSelected(x1, y1, x2, y2)) {
                    components.get(i).setSelected(true);
               }
          }
          changed();
     }
     
     public final boolean contains(int x, int y) {
          for (int i = 0; i < components.size(); i++) {
               if (components.get(i).contains(x, y)) {
                    return true;
               }
          }
          return false;
     }
     
     public final void deselectAll() {
          for (int i = 0; i < getComponents().size(); i++) {
               getComponents().get(i).setSelected(false);
          }
          changed();
     }
     
     public final void clear() {
          components.clear();
          changed();
     }
     
     private final void changed() {
          setChanged();
          notifyObservers();
     }
     
     public void changedPanel(AlgorithmPanel panel) {
    	 Dimension dim = getPreferedSize();
    	 if (!panel.getPreferredSize().equals(dim)) {
       	  	panel.setPreferredSize(dim);
//       	  	System.out.println("Ch size to: " + dim.getSize()+ " ");
            panel.setSize(dim);
//       	  	panel.repaint();
         }
     }
     
     private Dimension getPreferedSize(){
    	 int maxX = 0, maxY = 0;
    	 for (int i = 0; i < components.size(); i++) {
    		 if (components.get(i) instanceof AbstractBlock) {
    			 if (maxX < ((AbstractBlock)components.get(i)).getPoint2X()) {
    				 maxX =  ((AbstractBlock)components.get(i)).getPoint2X();
    			 }
    			 if (maxY < ((AbstractBlock)components.get(i)).getPoint2Y()) {
    				 maxY =  ((AbstractBlock)components.get(i)).getPoint2Y();
    			 }
    		 }
    	 }
    	 return new Dimension(maxX + AlgorithmPanel.widthCell * 5, maxY + AlgorithmPanel.heightCell * 5);
     }
     
     /*public final void copySelected(ArrayList<AbstractBlock> listBlockCopy,
    		 ArrayList<Connection> listConnectionCopy) {
    	 
     }*/
     
     public final void copySelected() {
    	 listBlockCopy = new ArrayList<AbstractBlock>();
    	 listConnectionCopy = new ArrayList<Connection>();
    	 Hashtable<AbstractBlock, AbstractBlock> ht = new Hashtable<AbstractBlock, AbstractBlock>();
         for (int i = 0; i < components.size(); i++) {
             if (components.get(i).isSelected()) {
                 if (components.get(i) instanceof AbstractBlock) {
                     if (components.get(i) instanceof Condition) {
                         Condition condition = (Condition) (components.get(i));
                         Condition copy_condition;
                         if (condition.getValue() != null) {
                             copy_condition = new Condition(condition.getCenterX(),
                                     condition.getCenterY(), condition.getValue());
                         } else {
                             copy_condition = new Condition(condition.getCenterX(),
                                     condition.getCenterY());
                         }
                         copy_condition.setHeight(condition.getHeight());
                         copy_condition.setWidth(condition.getWidth());
                         listBlockCopy.add(copy_condition);
                         ht.put(condition, copy_condition);
                     } else {
                         if (components.get(i) instanceof Operator) {
                             Operator operator = (Operator) components.get(i);
                             Operator copy_operator;
                             if (operator.getValue() != null) {
                                 copy_operator = new Operator(operator.getCenterX(),
                                         operator.getCenterY(), operator.getValue());
                             } else {
                                 copy_operator = new Operator(operator.getCenterX(),
                                         operator.getCenterY());
                             }
                             copy_operator.setHeight(operator.getHeight());
                             copy_operator.setWidth(operator.getWidth());
                             listBlockCopy.add(copy_operator);
                             ht.put(operator, copy_operator);
                         } else {
                             if (components.get(i) instanceof Input) {
                                 Input input = (Input) components.get(i);
                                 Input copy_input;
                                 if (input.getValue() != null) {
                                     copy_input = new Input(input.getCenterX(),
                                             input.getCenterY(), input.getValue());
                                 } else {
                                     copy_input = new Input(input.getCenterX(),
                                             input.getCenterY());
                                 }
                                 copy_input.setHeight(input.getHeight());
                                 copy_input.setWidth(input.getWidth());
                                 listBlockCopy.add(copy_input);
                                 ht.put(input, copy_input);
                             } else {
                                 if (components.get(i) instanceof Output) {
                                     Output output = (Output) components.get(i);
                                     Output copy_output;
                                     if (output.getValue() != null) {
                                         copy_output = new Output(output.getCenterX(),
                                                 output.getCenterY(), output.getValue());
                                     } else {
                                         copy_output = new Output(output.getCenterX(),
                                                 output.getCenterY());
                                     }
                                     copy_output.setHeight(output.getHeight());
                                     copy_output.setWidth(output.getWidth());
                                     listBlockCopy.add(copy_output);
                                     ht.put(output, copy_output);
                                 } else {
                                     if (components.get(i) instanceof Connector) {
                                         Connector connector = (Connector) components.get(i);
                                         Connector copy_connector = new Connector(connector.getCenterX(),
                                                 connector.getCenterY());
                                         copy_connector.setHeight(connector.getHeight());
                                         copy_connector.setWidth(connector.getWidth());
                                         listBlockCopy.add(copy_connector);
                                         ht.put(connector, copy_connector);
                                     }
                                 }
                             }
                         }
                     }
                 }
             }
         }
         for (int i = 0; i < components.size(); i++) {
             if (components.get(i).isSelected()) {
                  if (components.get(i) instanceof Connection) {
                	  Connection connection = (Connection) components.get(i);
                	  AbstractBlock startBlock = connection.getStartBlock();
                	  AbstractBlock endBlock = connection.getEndBlock();
                	  AbstractBlock startCopyBlock = ht.get(startBlock);
                	  AbstractBlock endCopyBlock = ht.get(endBlock);
                	  if (startCopyBlock != null && endCopyBlock != null) {
                    	  Connection copyConnection = new Connection(startCopyBlock,endCopyBlock);
                    	  if (connection.getConnArrayX() != null) {
                    		  copyConnection.setConnArrayX(new int[connection.getConnArrayX().length]);
                    		  copyConnection.setConnArrayY(new int[connection.getConnArrayY().length]);
                    		  for (int j = 0; j < connection.getConnArrayX().length; j++) {
                    			  copyConnection.getConnArrayX()[j] = connection.getConnArrayX()[j] +
                                                                        AlgorithmPanel.widthCell;
                    			  copyConnection.getConnArrayY()[j] = connection.getConnArrayY()[j] +
                                                                        AlgorithmPanel.heightCell;
                    		  }
                    	  }
                    	  if (startBlock.getOutputConnection() == connection) {
                			  startCopyBlock.setOutputConnection(copyConnection);
                		  } else {
                			  ((Condition)startCopyBlock).setSecondOutputConnection(copyConnection);
                		  }
                    	  if (endBlock.getInputConnection() == connection) {
                    		  endCopyBlock.setInputConnection(copyConnection);
                    	  } else {
                    		  ((Connector)endCopyBlock).setSecondInputConnection(copyConnection);
                    	  }
//                    	  ht.get(connection.getStartBlock()).setOutputConnection(connection);
                    	  listConnectionCopy.add(copyConnection);
                	  }
                  }
             }
         }
     }
     
     public final void pasteSelected() {
    	 deselectAll();
    	 Hashtable<AbstractBlock, AbstractBlock> ht = new Hashtable<AbstractBlock, AbstractBlock>();
    	 if (listBlockCopy != null) {
             for (int i = 0; i < listBlockCopy.size(); i++) {
//        		 components.add(listBlockCopy.get(i));
                 if (listBlockCopy.get(i) instanceof Condition) {
                     Condition condition = (Condition) (listBlockCopy.get(i));
                     condition.setCenter(condition.getCenterX() + AlgorithmPanel.widthCell,
                             condition.getCenterY() + AlgorithmPanel.heightCell);
                     Condition copy_condition;
                     if (condition.getValue() != null) {
                         copy_condition = new Condition(condition.getCenterX(),
                                 condition.getCenterY(), condition.getValue());
                     } else {
                         copy_condition = new Condition(condition.getCenterX(),
                                 condition.getCenterY());
                     }
                     components.add(condition);
                     listBlockCopy.set(i, copy_condition);
                     ht.put(condition, copy_condition);
                 }
                 if (listBlockCopy.get(i) instanceof Operator) {
                     Operator operator = (Operator) listBlockCopy.get(i);
                     operator.setCenter(operator.getCenterX() + AlgorithmPanel.widthCell,
                             operator.getCenterY() + AlgorithmPanel.heightCell);
                     Operator copy_operator;
                     if (operator.getValue() != null) {
                         copy_operator = new Operator(operator.getCenterX(),
                                 operator.getCenterY(), operator.getValue());
                     } else {
                         copy_operator = new Operator(operator.getCenterX(),
                                 operator.getCenterY());
                     }
                     components.add(operator);
                     listBlockCopy.set(i, copy_operator);
                     ht.put(operator, copy_operator);
                 } else {
                     if (listBlockCopy.get(i) instanceof Output) {
                         Output output = (Output) listBlockCopy.get(i);
                         output.setCenter(output.getCenterX() + AlgorithmPanel.widthCell,
                                 output.getCenterY() + AlgorithmPanel.heightCell);
                         Output copy_output;
                         if (output.getValue() != null) {
                             copy_output = new Output(output.getCenterX(),
                                     output.getCenterY(), output.getValue());
                         } else {
                             copy_output = new Output(output.getCenterX(),
                                     output.getCenterY());
                         }
                         components.add(output);
                         listBlockCopy.set(i, copy_output);
                         ht.put(output, copy_output);
                     } else {
                         if (listBlockCopy.get(i) instanceof Input) {
                             Input input = (Input) listBlockCopy.get(i);
                             input.setCenter(input.getCenterX() + AlgorithmPanel.widthCell,
                                     input.getCenterY() + AlgorithmPanel.heightCell);
                             Input copy_input;
                             if (input.getValue() != null) {
                                 copy_input = new Input(input.getCenterX(),
                                         input.getCenterY(), input.getValue());
                             } else {
                                 copy_input = new Input(input.getCenterX(),
                                         input.getCenterY());
                             }
                             components.add(input);
                             listBlockCopy.set(i, copy_input);
                             ht.put(input, copy_input);
                         } else {
                             if (listBlockCopy.get(i) instanceof Connector) {
                                 Connector connector = (Connector) listBlockCopy.get(i);
                                 connector.setCenter(connector.getCenterX() + AlgorithmPanel.widthCell,
                                         connector.getCenterY() + AlgorithmPanel.heightCell);
                                 Connector copy_connector = new Connector(connector.getCenterX(),
                                         connector.getCenterY());
                                 components.add(connector);
                                 listBlockCopy.set(i, copy_connector);
                                 ht.put(connector, copy_connector);
                             }
                         }
                     }
                 }
             }
         }
    	 if (listConnectionCopy != null) {
    		for (int i = 0; i < listConnectionCopy.size(); i++) {
    			Connection connection = listConnectionCopy.get(i);
    			AbstractBlock startBlock = connection.getStartBlock();
          	  	AbstractBlock endBlock = connection.getEndBlock();
          	  	AbstractBlock startCopyBlock = ht.get(startBlock);
          	  	AbstractBlock endCopyBlock = ht.get(endBlock);
          	  	if (startCopyBlock != null && endCopyBlock != null) {
                    Connection copyConnection = new Connection(startCopyBlock,endCopyBlock);
                    if (connection.getConnArrayX() != null) {
                        copyConnection.setConnArrayX(new int[connection.getConnArrayX().length]);
                        copyConnection.setConnArrayY(new int[connection.getConnArrayY().length]);
                        for (int j = 0; j < connection.getConnArrayX().length; j++) {
                            copyConnection.getConnArrayX()[j] = connection.getConnArrayX()[j] +
                                    AlgorithmPanel.widthCell;
                            copyConnection.getConnArrayY()[j] = connection.getConnArrayY()[j] +
                                    AlgorithmPanel.heightCell;
                        }
                    }
                    if (startBlock.getOutputConnection() == connection) {
                        startCopyBlock.setOutputConnection(copyConnection);
                    } else {
                        ((Condition)startCopyBlock).setSecondOutputConnection(copyConnection);
                    }
                    if (endBlock.getInputConnection() == connection) {
                        endCopyBlock.setInputConnection(copyConnection);
                    } else {
                        ((Connector)endCopyBlock).setSecondInputConnection(copyConnection);
                    }
                    components.add(connection);
                    listConnectionCopy.add(copyConnection);
          	  	}
    		}
    	 }
    	 changed();
     }
     
     public final void cutSelected() {
    	 copySelected();
    	 removeSelected();
     }

	public void selectAll() {
		for (int i = 0; i < getComponents().size(); i++) {
			getComponents().get(i).setSelected(true);
        }
        changed();
	}
	
	public ArrayList<Variable> getVariables(){
		return variables;
	}
	public void setVariables(ArrayList<Variable> v){
		variables = v;
	}

	public void makeMultiBlock() {
		/*for (int i = 0; i < components.size(); i++) {
			if (components.get(i).isSelected()) {
				System.out.println(components.get(i).getClass());
			}
		}*/
		copySelected();
        if (listBlockCopy.size()!=0){
            MultiBlock mb = new MultiBlock(listBlockCopy.get(0).getCenterX(),
                    listBlockCopy.get(0).getCenterY(), "MultiBlock");
            mb.setListBlockCopy(listBlockCopy);
            mb.setListConnectionCopy(listConnectionCopy);
            Connection [] cm;
            cm = getLoosingConnections();
            if (cm != null) {
                removeSelected();
                cm[0].setEndBlock(mb);
                mb.setInputConnection(cm[0]);
                cm[1].setStartBlock(mb);
                mb.setOutputConnection(cm[1]);
                cm[0].getStartBlock().setOutputConnection(cm[0]);
                cm[1].getEndBlock().setInputConnection(cm[1]);
                components.add(cm[0]);
                components.add(cm[1]);
                components.add(mb);
                changed();
            } else {
                JOptionPane.showMessageDialog(null, "Cannot create multi-block.",
                        "Error operation", JOptionPane.ERROR_MESSAGE);
            }
        }
	}

	private Connection [] getLoosingConnections() {
		Connection [] cm = new Connection[2];
		for (int i = 0; i < components.size(); i++) {
			if (components.get(i) instanceof Connection) {
				Connection connection = (Connection) components.get(i);
				if (!connection.getStartBlock().isSelected() && 
						connection.getEndBlock().isSelected()) {
					if (cm[0] == null) {
						cm[0] = connection;
					} else {
						return null;
					}
				} else {
					if (connection.getStartBlock().isSelected() && 
							!connection.getEndBlock().isSelected()) {
						if (cm[1] == null) {
							cm[1] = connection;
						} else {
							return null;
						}
					}
				}
			}
		}
		return cm;
	}
}
