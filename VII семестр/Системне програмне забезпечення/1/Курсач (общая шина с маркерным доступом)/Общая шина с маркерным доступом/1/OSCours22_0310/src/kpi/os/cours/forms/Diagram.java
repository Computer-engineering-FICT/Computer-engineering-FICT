package kpi.os.cours.forms;

import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Rectangle;

import javax.swing.BoxLayout;
import javax.swing.JPanel;
import javax.swing.Scrollable;

public class Diagram extends JPanel implements Scrollable {
	private static final long serialVersionUID = 1L; 

	public static int START_POSITION = 60;
	
	private static final int 	LINE_HEIGHT = 150,
								STEP_SIZE = 20,
								NUMERATION_INTERVAL = 5; 
	
	private int startW = 0, startH = 0;
	
	public Diagram(DiagramData diagData) {
		this.setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));
		
		startW = diagData.getStepCount() * STEP_SIZE;
		startH = diagData.getLines().size() * LINE_HEIGHT;
		
		for (DiagramLineData lineDat : diagData.getLines()) {
			DiagramLine line = new DiagramLine(lineDat, diagData);
			add(line);
		}
		
		add(getLabelLine(diagData));
	}
	
	private JPanel getLabelLine(final DiagramData diagData) {
		JPanel labels = new JPanel() {
			private static final long serialVersionUID = -4898940321096354134L;
			
			//Bottom string with labels
			{
				setMaximumSize(new Dimension(2000, 40));
			}
			
			@Override
			protected void paintComponent(Graphics g) {	
				//Size of one step ( |--size--|--size--|... )
				int drawStepSize = (getWidth() - Diagram.START_POSITION) / 
					(diagData.getStepCount() / diagData.getStepScale());
				if (drawStepSize == 0) drawStepSize = 2;
				
				if (drawStepSize == 0) drawStepSize = 2;
				
				for (int i = 0; 
					i < diagData.getStepCount() / diagData.getStepScale(); 
					i = i + NUMERATION_INTERVAL) 
				{
					g.drawString(Integer.toString(i * diagData.getStepScale()), 
							START_POSITION + i * drawStepSize, 10);
				}
			}
		};
		
		return labels;
	}
	
    public Dimension getPreferredSize() {
        return new Dimension (startW, startH);
    }
    
    @Override
    public Dimension getPreferredScrollableViewportSize() {
        return null;//new Dimension (900,900);
    }

    @Override
    public int getScrollableBlockIncrement(Rectangle visibleRect, int orientation, int direction) {
        return 0;
    }

    @Override
    public boolean getScrollableTracksViewportHeight() {
        return false;
    }

    @Override
    public boolean getScrollableTracksViewportWidth() {
        return false;
    }

    @Override
    public int getScrollableUnitIncrement(Rectangle visibleRect, int orientation, int direction) {
        return 0;
    }
}
