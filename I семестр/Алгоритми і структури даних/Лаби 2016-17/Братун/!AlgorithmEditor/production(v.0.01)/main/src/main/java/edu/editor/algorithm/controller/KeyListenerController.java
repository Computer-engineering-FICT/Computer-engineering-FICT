package edu.editor.algorithm.controller;

import java.awt.event.KeyListener;
import java.util.ArrayList;

import edu.editor.algorithm.model.AlgorithmModel;

public class KeyListenerController {
	private ArrayList<KeyListener> list;
	
	public KeyListenerController(AlgorithmModel model) {
		list = new ArrayList<KeyListener>();
	}
	
	public KeyListener getListener(KeyListener l) {
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getClass() == l.getClass()) {
				return list.get(i);
			}
		}
		return null;
	}
}
