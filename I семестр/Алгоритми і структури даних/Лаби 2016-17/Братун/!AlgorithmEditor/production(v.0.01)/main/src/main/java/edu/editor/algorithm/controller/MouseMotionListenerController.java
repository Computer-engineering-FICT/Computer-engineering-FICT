package edu.editor.algorithm.controller;

import java.awt.event.MouseListener;
import java.util.ArrayList;

import edu.editor.algorithm.model.AlgorithmModel;

public class MouseMotionListenerController {
	private ArrayList<MouseListener> list;
	
	public MouseMotionListenerController(AlgorithmModel model) {
		list = new ArrayList<MouseListener>();
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
