package edu.editor.algorithm.controller.listener.mouse;

import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.io.Serializable;

import javax.swing.*;

import edu.editor.algorithm.model.AlgorithmModel;
import edu.editor.algorithm.model.component.block.*;
import edu.editor.algorithm.model.component.block.Output;
import edu.editor.algorithm.view.panel.AlgorithmPanel;

public class TextMouseListener implements MouseListener, Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3703772479467563235L;
	private AlgorithmPanel panel;
	
	public AlgorithmPanel getPanel() {
		return panel;
	}
	
	JFrame textFrame;
	String text;
	JTextField jTextField;
    JTextArea textArea;
	public JTextField getJTextField() {
		return jTextField;
	}
	AbstractBlock abstractBlock;
	
	public TextMouseListener(AlgorithmPanel panel) {
		this.panel = panel; 
	}
	
	@Override
	public void mouseClicked(MouseEvent e) {
		if (jTextField != null) {
			if (abstractBlock != null && (abstractBlock instanceof Operator ||
					abstractBlock instanceof Condition /*|| abstractBlock instanceof ClassBlock*/||
					abstractBlock instanceof Output ||
                    abstractBlock instanceof BeginActivity ||
                    abstractBlock instanceof Input)) {
				abstractBlock.setValue(jTextField.getText());
			}
			panel.remove(jTextField);
		} /*else {
            if ()
        }*/
		AlgorithmModel model = panel.getModel();
		switch (e.getButton()) {
		case MouseEvent.BUTTON1:
			model.deselectAll();
			if (e.getClickCount() == 2) {
				
			} else {
				if (e.getClickCount() == 1) {
					if (model.contains(e.getX(), e.getY())) {
//						model.setSelected(e.getX(), e.getY());
						if (model.getSelected(e.getX(), e.getY()) instanceof AbstractBlock) {
							abstractBlock = (AbstractBlock) model.getSelected(e.getX(), e.getY());
							if (abstractBlock instanceof Operator ||
									abstractBlock instanceof Condition ||
                                    abstractBlock instanceof ClassBlock ||
                					abstractBlock instanceof Output ||
                					abstractBlock instanceof Input ||
                					abstractBlock instanceof BeginActivity ||
                					abstractBlock instanceof BeginMethod ||
                					abstractBlock instanceof EndMethod) {
								jTextField = new JTextField();
								if (!(abstractBlock instanceof ClassBlock) && 
										(abstractBlock.getValue() != null)) {
									jTextField.setText(abstractBlock.getValue());
								}

								if (abstractBlock instanceof Operator ||
										abstractBlock instanceof Output ||
										abstractBlock instanceof Input ||
										abstractBlock instanceof BeginMethod ||
	                					abstractBlock instanceof EndMethod){
									jTextField.setHorizontalAlignment(JTextField.CENTER);
									jTextField.setBounds(
											abstractBlock.getPoint1X() + AlgorithmPanel.widthCell / 4,
											abstractBlock.getPoint1Y() + (int) (AlgorithmPanel.heightCell / (double)4 * 5),
											abstractBlock.getWidth() - AlgorithmPanel.widthCell / 3, 
											abstractBlock.getHeight() - AlgorithmPanel.heightCell / 2 * 5);
								} else {
									if (abstractBlock instanceof Condition) {
										jTextField.setHorizontalAlignment(JTextField.CENTER);
										jTextField.setBounds(
												abstractBlock.getPoint1X() + AlgorithmPanel.widthCell / 4 * 11,
												abstractBlock.getPoint1Y() + (int) (AlgorithmPanel.heightCell / (double)4 * 5),
												abstractBlock.getWidth() - AlgorithmPanel.widthCell / 3 * 13,
												abstractBlock.getHeight() - AlgorithmPanel.heightCell / 2 * 5);
									} else {
                                        if (abstractBlock instanceof BeginActivity) {
                                            jTextField.setHorizontalAlignment(JTextField.CENTER);
                                            jTextField.setBounds(
                                                    abstractBlock.getPoint1X() - AlgorithmPanel.widthCell * 2,
                                                    abstractBlock.getPoint1Y() - AlgorithmPanel.heightCell * 5 / 3,
                                                    abstractBlock.getWidth() * 2,
                                                    abstractBlock.getHeight() - AlgorithmPanel.heightCell / 2 * 5);
                                        } else { //abstractBlock instanceof ClassBlock

                                            if (e.getY()>=abstractBlock.getPoint1Y() &&
                                                    e.getY()<abstractBlock.getPoint1Y()+abstractBlock.getHeight()/3) {
                                                if (abstractBlock.getValue() != null) {
                                                    jTextField.setText(abstractBlock.getValue());
                                                }
                                                jTextField.setHorizontalAlignment(JTextField.CENTER);
                                                jTextField.setBounds(
                                                        abstractBlock.getPoint1X() + AlgorithmPanel.widthCell / 4,
                                                        abstractBlock.getPoint1Y() + (int) (AlgorithmPanel.heightCell / (double)12 * 5),
                                                        abstractBlock.getWidth() - AlgorithmPanel.widthCell / 3,
                                                        abstractBlock.getHeight()/3 - AlgorithmPanel.heightCell / 6 * 5);
                                            } else {
                                                if (e.getY()>=abstractBlock.getPoint1Y()+abstractBlock.getHeight()/3 &&
                                                        e.getY()<abstractBlock.getPoint1Y()+abstractBlock.getHeight()*2/3) {
                                                    jTextField.setText(((ClassBlock)abstractBlock).getFields());
                                                    jTextField.setBounds(
                                                            abstractBlock.getPoint1X() + AlgorithmPanel.widthCell / 4,
                                                            abstractBlock.getPoint1Y() + abstractBlock.getHeight()/3 + (int) (AlgorithmPanel.heightCell / (double)12 * 5),
                                                            abstractBlock.getWidth() - AlgorithmPanel.widthCell / 3,
                                                            abstractBlock.getHeight()/3 - AlgorithmPanel.heightCell / 6 * 5);
                                                } else {
                                                    jTextField = null;
                                                    textArea = new JTextArea();
                                                    textArea.setText(((ClassBlock)abstractBlock).getMethods());
                                                    textArea.setBounds(
                                                            abstractBlock.getPoint1X() + AlgorithmPanel.widthCell / 4,
                                                            abstractBlock.getPoint1Y() + abstractBlock.getHeight()*2/3 + (int) (AlgorithmPanel.heightCell / (double)12 * 5),
                                                            abstractBlock.getWidth() - AlgorithmPanel.widthCell / 3,
                                                            abstractBlock.getHeight()/3 - AlgorithmPanel.heightCell / 6 * 5);
                                                }
                                            }
                                        }
                                    }
								}
								//System.out.println(panel.getLayout());
								//todo remove stub with jTextField and textArea
								if (jTextField != null) {
									panel.add(jTextField);
									
									jTextField.grabFocus();
									jTextField.addKeyListener(new KeyListener() {

										@Override
										public void keyPressed(KeyEvent e) {
											// TODO Auto-generated method stub
											
										}

										@Override
										public void keyReleased(KeyEvent e) {
											if (e.getKeyCode() == KeyEvent.VK_ENTER) {
												if (!(abstractBlock instanceof ClassBlock)) {
													abstractBlock.setValue(jTextField.getText());
												} else {
													if (jTextField.getY()>=abstractBlock.getPoint1Y() && 
															jTextField.getY()<abstractBlock.getPoint1Y()+abstractBlock.getHeight()/3) {
														abstractBlock.setValue(jTextField.getText());
													} else {
														if (jTextField.getY()>=abstractBlock.getPoint1Y()+abstractBlock.getHeight()/3 && 
																jTextField.getY()<abstractBlock.getPoint1Y()+abstractBlock.getHeight()*2/3) {
															((ClassBlock)abstractBlock).setFields(jTextField.getText());
														} else {
															((ClassBlock)abstractBlock).setMethods(jTextField.getText());
														}
													}
												}
											} 
											if (e.getKeyCode() == KeyEvent.VK_ENTER ||
													e.getKeyCode() == KeyEvent.VK_ESCAPE) {
												panel.remove(jTextField);
												panel.repaint();
											}
										}

										@Override
										public void keyTyped(KeyEvent e) {
											// TODO Auto-generated method stub
											
										}
										
									});
								} else { // textArea (method field)
									panel.add(textArea);
									
									textArea.grabFocus();
									textArea.addKeyListener(new KeyListener() {

										@Override
										public void keyPressed(KeyEvent e) {
											// TODO Auto-generated method stub
											
										}

										@Override
										public void keyReleased(KeyEvent e) {
											if (e.getKeyCode() == KeyEvent.VK_ESCAPE) {
												if (abstractBlock instanceof ClassBlock) {
													((ClassBlock)abstractBlock).setMethods(textArea.getText());
												}
												panel.remove(textArea);
												panel.repaint();
											}
										}

										@Override
										public void keyTyped(KeyEvent e) {
											// TODO Auto-generated method stub
											
										}
										
									});
								}
								
								
								/*textFrame = new JFrame("Input text");
								textFrame.setLayout(null);
								textFrame.setBounds(200, 600, 250, 150);
								
								jTextField = new JTextField();
								jTextField.setBounds(10, 10, 220, 20);
								textFrame.add(jTextField);
								
								JButton button = new JButton("Ok");
								button.setBounds(10, 50, 220, 50);
								textFrame.add(button);
								button.addActionListener(new ActionListener(){
									@Override
									public void actionPerformed(ActionEvent e) {
										text = jTextField.getText();
										textFrame.dispose();
										abstractBlock.setValue(text);
										panel.repaint();
									}
								});
								textFrame.setVisible(true);
								textFrame.setAlwaysOnTop(true);*/
							} 
						}
					}
				}
			}
			break;
		case MouseEvent.BUTTON2:
			
			break;
		case MouseEvent.BUTTON3:
			
			break;
		}
		panel.repaint();
	}

	@Override
	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseExited(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mousePressed(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
	
}
