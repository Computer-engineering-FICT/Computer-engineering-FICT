package Lab4;

import java.awt.Graphics;
import java.awt.image.*;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.swing.JPanel;

public class ImagePanel extends JPanel{

	private BufferedImage image;

    public ImagePanel() {
       try {                
          image = ImageIO.read(new File("D:\\AMOlab4.png"));
       } catch (IOException ex) {
       }
    }

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        g.drawImage(image, 0, 0, null);            
    }
	

}
