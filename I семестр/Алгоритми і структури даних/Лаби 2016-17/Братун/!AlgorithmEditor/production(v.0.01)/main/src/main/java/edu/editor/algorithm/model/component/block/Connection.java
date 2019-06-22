package edu.editor.algorithm.model.component.block;

import java.awt.Graphics2D;
import java.io.Serializable;
import java.util.Properties;

import edu.editor.algorithm.model.component.AbstractComponent;
import edu.editor.algorithm.view.panel.AlgorithmPanel;


public class Connection extends AbstractComponent implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7610434690463895328L;

	private Properties lineProperties = new Properties();
	
	// Properties name
	
	// Line properties name
	private final String START_BLOCK = "START_BLOCK";
	private final String END_BLOCK = "END_BLOCK";
	
	private int[] connArrayX = null;
	private int[] connArrayY = null;
	
	public Connection(AbstractBlock startBlock, AbstractBlock endBlock) {
		setStartBlock(startBlock);
		setEndBlock(endBlock);
		setSelected(true);
	}
	
	public final AbstractBlock getStartBlock() {
		return (AbstractBlock)lineProperties.get(START_BLOCK);
	}
	
	public final void setStartBlock(final AbstractBlock startBlock) {
		lineProperties.put(START_BLOCK, startBlock);
	}
	
	public final AbstractBlock getEndBlock() {
		return (AbstractBlock)lineProperties.get(END_BLOCK);
	}
	
	public final void setEndBlock(final AbstractBlock startBlock) {
		lineProperties.put(END_BLOCK, startBlock);
	}
	
	@Override
	public boolean contains(int x, int y) {
		int x1,x2,y1,y2 = 0;
		//TODO copying of code in the method draw()
		AbstractBlock startBlock = getStartBlock();
		if (startBlock instanceof Condition) {
			if (startBlock.getOutputConnection() == this) {
				x1 = startBlock.getPoint1X();
			} else {
				x1 = startBlock.getPoint2X();
			}
			y1 = startBlock.getCenterY();
		} else {
			if (startBlock instanceof ClassBlock) {
				x1 = startBlock.getCenterX();
				y1 = startBlock.getPoint1Y();		
			} else {
				x1 = startBlock.getCenterX();
				y1 = startBlock.getPoint2Y();				
			}
		}
		
		AbstractBlock endBlock = getEndBlock();
		if (endBlock instanceof Connector) {
			if (endBlock.getInputConnection() == this) {
				x2 = endBlock.getPoint1X();
			} else {
				x2 = endBlock.getPoint2X();
			}
			y2 = endBlock.getCenterY();
		} else {
			if (startBlock instanceof ClassBlock) {
				x2 = endBlock.getCenterX();
				y2 = endBlock.getPoint2Y();	
			} else {
				x2 = endBlock.getCenterX();
				y2 = endBlock.getPoint1Y();
			}
		}
		
		if (connArrayX == null || connArrayX.length == 0) {
			return contains(x1, y1, x2, y2, x, y);
		} else {
			if (contains(x1, y1, connArrayX[0], connArrayY[0], x, y)) {
				return true;
			}
			for (int i = 1; i < connArrayX.length; i++) {
				if (contains(connArrayX[i - 1], connArrayY[i - 1], connArrayX[i], connArrayY[i], x, y)) {
					return true;
				}
			}
			if (contains(connArrayX[connArrayX.length - 1], connArrayY[connArrayY.length - 1], x2, y2, x, y)) {
				return true;
			}
			return false;
		}
		
	}
	
	private boolean contains(int x1, int y1, int x2, int y2, int x, int y) {
		if (x1 != x2) {
			double k = (y1 - y2) / (double) (x1 - x2);
			double b = 0.0;
			if (k == 0) {
				b = y1;
			} else {
				b = y1 - (y1 - y2) / (double)(x1 - x2) * x1;
			}
			
			if (Math.abs(y - (int) (k * x + b)) < AlgorithmPanel.heightCell / 2) {
				if ((y - y1) * (y - y2) < 0 || 
						(y1 == y2 && Math.abs(y - y1) < AlgorithmPanel.heightCell / 2 && (x - x1) * (x - x2) <= 0)) {
					return true;
				}
			} 
		} else {
			if (Math.abs(x - x1) < AlgorithmPanel.widthCell / 2 &&
					(y - y1) * (y - y2) <= 0) {
				return true;
			}
		}
		
		return false;
	}

	@Override
	public void draw(Graphics2D g2d) {
		int x1,x2,y1,y2 = 0;
		//TODO copying of code in the method contains()
		/*if (getStartBlock() instanceof Condition) {
			if (getStartBlock().getOutputConnection() == this) {
				x1 = getStartBlock().getPoint1X();
			} else {
				x1 = getStartBlock().getPoint2X();
			}
			y1 = getStartBlock().getCenterY();
		} else {
			x1 = getStartBlock().getCenterX();
			y1 = getStartBlock().getPoint2Y();
		}
		if (getEndBlock() instanceof Connector) {
			if (getEndBlock().getInputConnection() == this) {
				x2 = getEndBlock().getPoint1X();
			} else {
				x2 = getEndBlock().getPoint2X();
			}
			y2 = getEndBlock().getCenterY();
		} else {
			x2 = getEndBlock().getCenterX();
			y2 = getEndBlock().getPoint1Y();
		}*/
		AbstractBlock startBlock = getStartBlock();
		if (startBlock instanceof Condition) {
			if (startBlock.getOutputConnection() == this) {
				x1 = startBlock.getPoint1X();
			} else {
				x1 = startBlock.getPoint2X();
			}
			y1 = startBlock.getCenterY();
		} else {
			if (startBlock instanceof ClassBlock) {
				x1 = startBlock.getCenterX();
				y1 = startBlock.getPoint1Y();		
			} else {
				x1 = startBlock.getCenterX();
				y1 = startBlock.getPoint2Y();				
			}
		}
		
		AbstractBlock endBlock = getEndBlock();
		if (endBlock instanceof Connector) {
			if (endBlock.getInputConnection() == this) {
				x2 = endBlock.getPoint1X();
			} else {
				x2 = endBlock.getPoint2X();
			}
			y2 = endBlock.getCenterY();
		} else {
			if (startBlock instanceof ClassBlock) {
				x2 = endBlock.getCenterX();
				y2 = endBlock.getPoint2Y();	
			} else {
				x2 = endBlock.getCenterX();
				y2 = endBlock.getPoint1Y();
			}
		}
		if (connArrayX == null || connArrayX.length == 0) {
			g2d.drawLine(x1,y1,x2,y2);
			drawArrow(x1, y1, x2, y2, g2d);
		} else {
			g2d.drawLine(x1,y1,connArrayX[0], connArrayY[0]);
			g2d.fillOval(connArrayX[0] - AlgorithmPanel.widthCell / 6, connArrayY[0] - AlgorithmPanel.heightCell / 6, 
					AlgorithmPanel.widthCell / 3, AlgorithmPanel.heightCell / 3);
			for (int i = 1; i < connArrayX.length; i++) {
				g2d.drawLine(connArrayX[i - 1], connArrayY[i - 1], connArrayX[i], connArrayY[i]);
				g2d.fillOval(connArrayX[i] - AlgorithmPanel.widthCell / 6, connArrayY[i] - AlgorithmPanel.heightCell / 6, 
						AlgorithmPanel.widthCell / 3, AlgorithmPanel.heightCell / 3);
			}
			g2d.drawLine(connArrayX[connArrayX.length - 1], connArrayY[connArrayY.length - 1], x2, y2);
			drawArrow(connArrayX[connArrayX.length - 1], connArrayY[connArrayY.length - 1], x2, y2, g2d);
		}
		
	}
	
	protected void drawArrow(int x1, int y1, int x2, int y2, Graphics2D g2d) {
		int a = 10;
		double alpha = 0.5;
		double beta = 0.0;
		int x0 = 0;
		int y0 = 0;
		int x00 = 0;
		int y00 = 0;
		if (x1 != x2) {
			if (x1 > x2) {
				beta = Math.atan((y2 - y1) / (double)(x1 - x2));
				x0 = x2 + (int)(Math.cos(alpha + beta) * a);
				y0 = y2 - (int)(Math.sin(alpha + beta) * a);
				x00 = x2 + (int)(Math.cos(beta - alpha) * a);
				y00 = y2 - (int)(Math.sin(beta - alpha) * a);
				
			} else {
				beta = Math.atan((y2 - y1) / (double)(x2 - x1));
				x0 = x2 - (int)(Math.cos(beta - alpha) * a);
				y0 = y2 - (int)(Math.sin(beta - alpha) * a);
				x00 = x2 - (int)(Math.cos(alpha + beta) * a);
				y00 = y2 - (int)(Math.sin(alpha + beta) * a);
			}
		} else {
			beta = Math.PI / 2;
			x0 = x2 + (int)(Math.cos(alpha + beta) * a);
			x00 = x2 + (int)(Math.cos(beta - alpha) * a);
			if (y1 > y2) {
				y0 = y2 + (int)(Math.sin(alpha + beta) * a);
				y00 = y2 + (int)(Math.sin(beta - alpha) * a);
			} else {
				y0 = y2 - (int)(Math.sin(alpha + beta) * a);
				y00 = y2 - (int)(Math.sin(beta - alpha) * a);
			}
		}
		g2d.drawLine(x0, y0, x2, y2);
		g2d.drawLine(x00, y00, x2, y2);
	}

	@Override
	public boolean isSelected(int x1, int y1, int x2, int y2) {
		int X1,X2,Y1,Y2 = 0;
		if (getStartBlock() instanceof Condition) {
			if (getStartBlock().getOutputConnection() == this) {
				X1 = getStartBlock().getPoint1X();
			} else {
				X1 = getStartBlock().getPoint2X();
			}
			Y1 = getStartBlock().getCenterY();
		} else {
			X1 = getStartBlock().getCenterX();
			Y1 = getStartBlock().getPoint2Y();
		}
		if (getEndBlock() instanceof Connector) {
			if (getEndBlock().getInputConnection() == this) {
				X2 = getEndBlock().getPoint1X();
			} else {
				X2 = getEndBlock().getPoint2X();
			}
			Y2 = getEndBlock().getCenterY();
		} else {
			X2 = getEndBlock().getCenterX();
			Y2 = getEndBlock().getPoint1Y();
		}
		
		if (connArrayX == null || connArrayX.length == 0) {
			return contains(X1, Y1, X2, Y2, x1, y1, x2, y2);
		} else {
			if (contains(X1, Y1, connArrayX[0], connArrayY[0], x1, y1, x2, y2)) {
				return true;
			}
			for (int i = 1; i < connArrayX.length; i++) {
				if (contains(connArrayX[i - 1], connArrayY[i - 1], connArrayX[i], connArrayY[i], x1, y1, x2, y2)) {
					return true;
				}
			}
			if (contains(connArrayX[connArrayX.length - 1], connArrayY[connArrayY.length - 1], X2, Y2, x1, y1, x2, y2)) {
				return true;
			}
			return false;
		}
	}

	private boolean contains(int X1, int Y1, int X2, int Y2, int x1, int y1, int x2, int y2) {
		if ((x1 - X1) * (x2 - X1) < 0 && (x1 - X2) * (x2 - X2) < 0) {
			if ((y1 - Y1) * (y2 - Y1) < 0 && (y1 - Y2) * (y2 - Y2) < 0) {
				return true;
			}
		}
		return false;
	}
	
	public void setConnArrayX(int[] connArrayX) {
		this.connArrayX = connArrayX;
	}

	public int[] getConnArrayX() {
		return connArrayX;
	}

	public void setConnArrayY(int[] connArrayY) {
		this.connArrayY = connArrayY;
	}

	public int[] getConnArrayY() {
		return connArrayY;
	}
	
	public void moveByOffSet(int x, int y) {
		if (connArrayX != null) {
			for (int i = 0; i < connArrayX.length; i++) {
				connArrayX[i] += x;
				connArrayY[i] += y;
			}
		}
	}
	
	public int getZigzagPoint(int x, int y) {
		int result = -1;
		if (connArrayX != null) {
			for (int i = 0; i < connArrayX.length; i++) {
				if (Math.abs(connArrayX[i] - x) <= AlgorithmPanel.widthCell / 3 &&
						Math.abs(connArrayY[i] - y) <= AlgorithmPanel.heightCell / 3) {
					return i;
				}
			}
		}
		return result;
	}
	
	public void moveZigzagPointLeft(int point) {
		if (AlgorithmPanel.widthCell % 2 == 0) {
			connArrayX[point] -= AlgorithmPanel.widthCell / 2;
		} else {
			if (connArrayX[point] % AlgorithmPanel.widthCell == 0) {
				connArrayX[point] -= AlgorithmPanel.widthCell / 2 + 1;
			} else {
				connArrayX[point] -= AlgorithmPanel.widthCell / 2;
			}
		}
	}
	
	public void moveZigzagPointRight(int point) {
		if (AlgorithmPanel.widthCell % 2 == 0) {
			connArrayX[point] -= AlgorithmPanel.widthCell / 2;
		} else {
			if (connArrayX[point] % AlgorithmPanel.widthCell == 0) {
				connArrayX[point] += AlgorithmPanel.widthCell / 2;
			} else {
				connArrayX[point] += AlgorithmPanel.widthCell / 2 + 1;
			}
		}
	}
	
	public void moveZigzagPointUp(int point) {
		if (AlgorithmPanel.heightCell % 2 == 0) {
			connArrayY[point] -= AlgorithmPanel.heightCell / 2;
		} else {
			if (connArrayY[point] % AlgorithmPanel.heightCell == 0) {
				connArrayY[point] -= AlgorithmPanel.heightCell / 2 + 1;
			} else {
				connArrayY[point] -= AlgorithmPanel.heightCell / 2;
			}
		}
	}
	
	public void moveZigzagPointDown(int point) {
		if (AlgorithmPanel.heightCell % 2 == 0) {
			connArrayY[point] -= AlgorithmPanel.heightCell / 2;
		} else {
			if (connArrayY[point] % AlgorithmPanel.heightCell == 0) {
				connArrayY[point] += AlgorithmPanel.heightCell / 2;
			} else {
				connArrayY[point] += AlgorithmPanel.heightCell / 2 + 1;
			}
		}
	}
}
