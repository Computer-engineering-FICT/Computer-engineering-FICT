package kpi.os.cours.forms;

import java.awt.Dimension;
import java.awt.Graphics;

import javax.swing.BoxLayout;
import javax.swing.JPanel;

public class Diagram extends JPanel {
	private static final long serialVersionUID = 1L; 

	public static int START_POSITION = 60;
	
	public Diagram(DiagramData diagData) {
		this.setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));
		
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
					i++) 
				{
					g.drawString(Integer.toString(i * diagData.getStepScale()), 
							START_POSITION + i * drawStepSize, 10);
				}
			}
		};
		
		return labels;
	}
}
