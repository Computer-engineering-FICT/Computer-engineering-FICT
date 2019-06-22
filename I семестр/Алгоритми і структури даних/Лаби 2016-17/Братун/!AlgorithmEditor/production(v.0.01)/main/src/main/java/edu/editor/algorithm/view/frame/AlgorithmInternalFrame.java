package edu.editor.algorithm.view.frame;

import java.awt.BorderLayout;
import java.awt.event.KeyListener;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;
import java.io.File;
import java.util.Observable;
import java.util.Observer;

import javax.swing.JInternalFrame;
import javax.swing.JScrollPane;
import javax.swing.WindowConstants;

import edu.editor.algorithm.model.AlgorithmModel;
import edu.editor.algorithm.view.panel.AlgorithmPanel;

public class AlgorithmInternalFrame extends JInternalFrame implements Observer {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6514959467676407536L;
	private static final int xOffSet = 30;
	private static final int yOffSet = 30;
	
	private static int frameCount = 0;
	
	private AlgorithmModel model;
	private AlgorithmPanel panel;
	private JScrollPane scroll;
	private boolean saved = true;
	private String fileName;
	private File file;
	
	public AlgorithmInternalFrame(String title) {
		super(title + " - " + (++frameCount), true, true, true, true);
		
		setDefaultCloseOperation(WindowConstants.DO_NOTHING_ON_CLOSE);
		
		model = new AlgorithmModel();
		model.addObserver(this);
		
		panel = new AlgorithmPanel(model);
		scroll = new JScrollPane(panel);
		
		getContentPane().add(scroll, BorderLayout.CENTER);
		setLocation(xOffSet * frameCount, yOffSet * frameCount);
		
		setSize(800, 600);
	}
	
	public boolean isSaved() {
		return saved;
	}
	
	public void setSaved(boolean saved) {
		this.saved = saved;
	}
	
	@Override
	public void update(Observable o, Object arg) {
		scroll.validate();
		setSaved(false);
	}
	
	@Override
	public synchronized void addMouseListener(MouseListener l) {
		panel.addMouseListener(l);
	}
	
	@Override
	public synchronized void addMouseMotionListener(MouseMotionListener l) {
		panel.addMouseMotionListener(l);
	}
	
	@Override
	public synchronized void addKeyListener(KeyListener l) {
		super.addKeyListener(l);
		
	}
	
	public String getFileName() {
		return fileName;
	}
	
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public File getFile() {
		return file;
	}
	
	public void setFile(File file) {
		this.file = file;
	}
}
