package lab1_8;

import java.awt.Point;
import java.awt.geom.Path2D;

public class Arrow2D {

	public static Path2D getArrow(Point Begin, Point End, int barb, double angle) {
		
        angle = Math.toRadians(angle);
        double basic_angle = Math.atan((End.getX()-Begin.getX())/(End.getY()-Begin.getY()));
        Path2D.Double path = new Path2D.Double();
        
        path.moveTo(Begin.getX(), Begin.getY());
        path.lineTo(End.getX(), End.getY());
        
        if (Begin.getY()>End.getY()) {
        
        	path.moveTo(End.getX(), End.getY());
        	path.lineTo(End.getX()+barb*Math.sin(basic_angle+angle), End.getY()+barb*Math.cos(basic_angle+angle));
        
        	path.moveTo(End.getX(), End.getY());
        	path.lineTo(End.getX()+barb*Math.sin(basic_angle-angle), End.getY()+barb*Math.cos(basic_angle-angle));
        }
        else {
        	
        	path.moveTo(End.getX(), End.getY());
        	path.lineTo(End.getX()-barb*Math.sin(basic_angle+angle), End.getY()-barb*Math.cos(basic_angle+angle));
        
        	path.moveTo(End.getX(), End.getY());
        	path.lineTo(End.getX()-barb*Math.sin(basic_angle-angle), End.getY()-barb*Math.cos(basic_angle-angle));
        }

        return path;
	}
}
