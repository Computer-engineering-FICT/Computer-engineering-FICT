package edu.editor.algorithm.controller;

import java.awt.event.MouseListener;
import java.io.Serializable;
import java.util.ArrayList;

import edu.editor.algorithm.controller.listener.mouse.*;
import edu.editor.algorithm.model.AlgorithmModel;
import edu.editor.algorithm.view.panel.AlgorithmPanel;

public class MouseListenerController implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -7052653802668917543L;
	private ArrayList<MouseListener> list;
	
	public MouseListenerController(AlgorithmPanel panel, AlgorithmModel model) {
		list = new ArrayList<MouseListener>();
		list.add(new BeginMouseListener(panel));
		list.add(new ConditionMouseListener(panel));
		list.add(new ConnectorMouseListener(panel));
		list.add(new EndMouseListener(panel));
		list.add(new EndMethodMouseListener(panel));
		list.add(new InputMouseListener(panel));
		list.add(new OutputMouseListener(panel));
		list.add(new OperatorMouseListener(panel));
		list.add(new ComplexOperatorMouseListener(panel));
		list.add(new ConnectionMouseListener(panel));
		list.add(new BlockMouseListener(panel));
		list.add(new TextMouseListener(panel));
        list.add(new ClassMouseListener(panel));
        list.add(new AbstractClassMouseListener(panel));
        list.add(new InterfaceMouseListener(panel));
        list.add(new BeginMethodMouseListener(panel));        
        list.add(new BeginActivityMouseListener(panel));
        list.add(new EndActivityMouseListener(panel));
        list.add(new StartTimerMouseListener(panel));
        list.add(new StopTimerMouseListener(panel));
	}
	
	public MouseListener getListener(MouseListener l) {
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getClass() == l.getClass()) {
				return list.get(i);
			}
		}
		return null;
	}
}
