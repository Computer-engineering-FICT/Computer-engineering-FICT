import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

import javax.swing.JFrame;



public class AnimationKG extends JFrame {


	/**
	 * Create the frame.
	 */
	public AnimationKG() {
		setTitle("Lab4 KG");
		AnimationPane pane = new AnimationPane();
		add(pane);
		Executor executor = Executors.newSingleThreadExecutor();
		executor.execute(pane);
		
		pack();
		
		
	}

}
