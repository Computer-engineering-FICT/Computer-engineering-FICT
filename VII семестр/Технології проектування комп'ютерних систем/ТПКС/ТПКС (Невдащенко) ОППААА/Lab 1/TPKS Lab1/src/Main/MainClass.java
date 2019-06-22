package Main;

import java.awt.EventQueue;

public class MainClass {

	public static void main(String[] args) {
		//create thread with frame
		EventQueue.invokeLater(new Runnable() {
			@Override
			public void run() {
				AppFrame fr = new AppFrame();
				fr.setDefaultCloseOperation(fr.EXIT_ON_CLOSE);
				fr.setVisible(true);
			}
		});

	}

}