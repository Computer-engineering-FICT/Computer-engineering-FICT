package automat.moore;

import javax.swing.*;
import java.awt.*;
import java.awt.font.FontRenderContext;
import java.awt.geom.Rectangle2D;
import java.util.ArrayList;

/**
 * Created by IntelliJ IDEA.
 * User: Zak
 * Date: 16.10.2010
 * Time: 14:15:17
 * To change this template use File | Settings | File Templates.
 */
public class GraphPanel extends JPanel {

    protected GraphModel model;

    public GraphPanel(GraphModel model) {
        super();
        this.model = model;
        setBackground(this.model.getBackgroundColor());
    }

    public GraphModel getModel() {
        return model;
    }

    public void setModel(GraphModel model) {
        this.model = model;
    }

    protected void drawState(Graphics2D g2, int x, int y, int radius, String name, int[] yNumbers) {
        g2.setColor(model.getStateColor());
        g2.fillOval(x, y, radius, radius);
        g2.setColor(model.getLinesColor());
        g2.drawLine(x, y + (radius / 2), x + radius, y + (radius / 2));
        g2.setColor(model.getTextColor());
        g2.setFont(model.getFont());
        FontRenderContext context = g2.getFontRenderContext();
        Rectangle2D bounds = g2.getFont().getStringBounds(name, context);
        g2.drawString(name, (int) (x + (radius - bounds.getWidth()) / 2) ,
                (int) (y + (radius / 2 + bounds.getHeight()) / 2));
        StringBuilder builder = new StringBuilder();
        if (yNumbers != null) {
            for (int i = 0; i < yNumbers.length; i++) {
                builder.append("Y");
                builder.append(String.valueOf(yNumbers[i]));
            }
        } else {
            builder.append("-");
        }
        bounds = g2.getFont().getStringBounds(builder.toString(), context);
        g2.drawString(builder.toString(), (int) (x + (radius - bounds.getWidth()) / 2),
                (int) (y + radius / 2 + (radius / 2 + bounds.getHeight()) / 2));
    }

    protected void drawArrowLine(Graphics2D g2, int[] x, int[] y, int[] xNumbers, boolean[] xValues) {
        g2.setColor(model.getLinesColor());
        g2.drawPolyline(x, y, x.length);
        double temp = Math.atan2(x[x.length - 2] - x[x.length - 1], y[y.length - 2] - y[y.length - 1]);
        g2.drawLine(x[x.length - 1], y[y.length - 1],
                (int) (x[x.length - 1] + model.getArrowWidth() * Math.sin(temp + model.getArrowAngle())),
                (int) (y[y.length - 1] + model.getArrowWidth() * Math.cos(temp + model.getArrowAngle())));
        g2.drawLine(x[x.length - 1], y[y.length - 1],
                (int) (x[x.length - 1] + model.getArrowWidth() * Math.sin(temp - model.getArrowAngle())),
                (int) (y[y.length - 1] + model.getArrowWidth() * Math.cos(temp - model.getArrowAngle())));
        g2.setColor(model.getTextColor());;
        g2.setFont(model.getFont());
        StringBuilder builder = new StringBuilder();
        if (xNumbers != null) {
            for (int i = 0; i < xNumbers.length; i++) {
                if (!xValues[i]) {
                    builder.append("not");
                }
                builder.append("X");
                builder.append(String.valueOf(xNumbers[i]));
            }
        } else {
            builder.append("-");
        }
        FontRenderContext context = g2.getFontRenderContext();
        Rectangle2D bounds = g2.getFont().getStringBounds(builder.toString(), context);
        int textX = (int) (x[0] + (x[1] - x[0] - bounds.getX()) / 2);
        int textY = (int) (y[0] + (y[1] - y[0] - bounds.getY()) / 2 + 5);
        g2.drawString(builder.toString(), textX, textY);
    }

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D g2 = (Graphics2D) g;
        int centerX = (getWidth() - model.getStateDiametr()) / 2;
        int centerY = (getHeight() - model.getStateDiametr()) / 2;
        int currentX;
        int currentY;
        MooreAutomat automat = model.getAutomat();
        double temp = 2 * Math.PI / automat.getStateNames().length;
        double angle = 0;
        int radius;
        if (getWidth() > getHeight()) {
            radius = (getHeight() - 2 * model.getDistance()) / 2;
        }
        else {
            radius = (getWidth() - 2 * model.getDistance()) / 2;
        }
        ArrayList<Point> stateConnectors = new ArrayList<Point>();
        ArrayList<Point> stateSelfConnectors = new ArrayList<Point>();
        for (int i = 0; i < model.getAutomat().getStateNames().length; i++) {
            currentX = (int) (centerX + radius * Math.sin(angle));
            currentY = (int) (centerY + radius * Math.cos(angle));
            int stateCenterX = currentX + model.getStateDiametr() / 2;
            int stateCenterY = currentY + model.getStateDiametr() / 2;
            int stateConnectorX = (int) (stateCenterX + model.getStateDiametr() / 2 * Math.sin(angle + Math.PI));
            int stateConnectorY = (int) (stateCenterY + model.getStateDiametr() / 2 * Math.cos(angle + Math.PI));
            stateConnectors.add(new Point(stateConnectorX, stateConnectorY));
            //int stateSelfConnectorX = (int) (stateCenterX + model.getStateDiametr() / 2 * Math.sin(angle));
            //int stateSelfConnectorY = (int) (stateCenterY + model.getStateDiametr() / 2 * Math.cos(angle));
            // Temporary!!!
            // |
            // v
            int stateSelfConnectorX = stateCenterX;
            int stateSelfConnectorY;
            if (stateCenterY < getHeight() / 2) {
                stateSelfConnectorY = currentY;
            }
            else {
                stateSelfConnectorY = currentY + model.getStateDiametr();
            }
            // ^
            // |
            // Temporary!!!
            stateSelfConnectors.add(new Point(stateSelfConnectorX, stateSelfConnectorY));
            drawState(g2, currentX, currentY, model.getStateDiametr(), automat.getStateNames()[i], automat.getyNumbers()[i]);
            angle += temp;
        }
        int[][] connectionMatrix = automat.getConnectionMatrix();
        for (int i = 0; i < connectionMatrix.length; i++) {
            for (int j = 0; j < connectionMatrix[i].length; j++) {
                if (connectionMatrix[i][j] > -1) {
                    if (i != j) {
                        int[] lineX = new int[2];
                        int[] lineY = new int[2];
                        lineX[0] = (int) stateConnectors.get(i).getX();
                        lineX[1] = (int) stateConnectors.get(j).getX();
                        lineY[0] = (int) stateConnectors.get(i).getY();
                        lineY[1] = (int) stateConnectors.get(j).getY();
                        drawArrowLine(g2, lineX, lineY, automat.getxNumbers()[connectionMatrix[i][j]],
                                automat.getxValues()[connectionMatrix[i][j]]);
                    }
                    else {
                        int[] lineX;
                        int[] lineY;
                        // Temporary!!!
                        // |
                        // v
                        if ((stateConnectors.get(i).getX() <= (getWidth() / 2)) && (stateConnectors.get(i).getY() < (getHeight() / 2))) {
                            lineX = new int[6];
                            lineY = new int[6];
                            lineX[0] = (int) stateConnectors.get(i).getX();
                            lineY[0] = (int) stateConnectors.get(i).getY();
                            lineX[1] = (int) stateConnectors.get(i).getX();
                            lineY[1] = (int) stateConnectors.get(i).getY() + model.getStateDiametr() * 2 / 3;
                            lineX[2] = (int) stateConnectors.get(i).getX() - 3 * model.getStateDiametr() / 2;
                            lineY[2] = lineY[1];
                            lineX[3] = lineX[2];
                            lineY[3] = (int) stateConnectors.get(i).getY() - 3 * model.getStateDiametr() / 2;
                            lineX[4] = (int) stateSelfConnectors.get(i).getX();
                            lineY[4] = lineY[3];
                            lineX[5] = (int) stateSelfConnectors.get(i).getX();
                            lineY[5] = (int) stateSelfConnectors.get(i).getY();
                        }
                        else {
                            if ((stateConnectors.get(i).getX() <= (getWidth() / 2)) && (stateConnectors.get(i).getY() >= (getHeight() / 2))) {
                                lineX = new int[6];
                                lineY = new int[6];
                                lineX[0] = (int) stateConnectors.get(i).getX();
                                lineY[0] = (int) stateConnectors.get(i).getY();
                                lineX[1] = (int) stateConnectors.get(i).getX();
                                lineY[1] = (int) stateConnectors.get(i).getY() - model.getStateDiametr() * 2 / 3;
                                lineX[2] = (int) stateConnectors.get(i).getX() - 3 * model.getStateDiametr() / 2;
                                lineY[2] = lineY[1];
                                lineX[3] = lineX[2];
                                lineY[3] = (int) stateConnectors.get(i).getY() + 3 * model.getStateDiametr() / 2;
                                lineX[4] = (int) stateSelfConnectors.get(i).getX();
                                lineY[4] = lineY[3];
                                lineX[5] = (int) stateSelfConnectors.get(i).getX();
                                lineY[5] = (int) stateSelfConnectors.get(i).getY();
                            }
                            else {
                                if ((stateConnectors.get(i).getX() > (getWidth() / 2)) && (stateConnectors.get(i).getY() >= (getHeight() / 2))) {
                                    lineX = new int[6];
                                    lineY = new int[6];
                                    lineX[0] = (int) stateConnectors.get(i).getX();
                                    lineY[0] = (int) stateConnectors.get(i).getY();
                                    lineX[1] = (int) stateConnectors.get(i).getX();
                                    lineY[1] = (int) stateConnectors.get(i).getY() - model.getStateDiametr() * 2 / 3;
                                    lineX[2] = (int) stateConnectors.get(i).getX() + 3 * model.getStateDiametr() / 2;
                                    lineY[2] = lineY[1];
                                    lineX[3] = lineX[2];
                                    lineY[3] = (int) stateConnectors.get(i).getY() + 3 * model.getStateDiametr() / 2;
                                    lineX[4] = (int) stateSelfConnectors.get(i).getX();
                                    lineY[4] = lineY[3];
                                    lineX[5] = (int) stateSelfConnectors.get(i).getX();
                                    lineY[5] = (int) stateSelfConnectors.get(i).getY();
                                }
                                else {
                                    lineX = new int[6];
                                    lineY = new int[6];
                                    lineX[0] = (int) stateConnectors.get(i).getX();
                                    lineY[0] = (int) stateConnectors.get(i).getY();
                                    lineX[1] = (int) stateConnectors.get(i).getX();
                                    lineY[1] = (int) stateConnectors.get(i).getY() + model.getStateDiametr() * 2 / 3;
                                    lineX[2] = (int) stateConnectors.get(i).getX() + 3 * model.getStateDiametr() / 2;
                                    lineY[2] = lineY[1];
                                    lineX[3] = lineX[2];
                                    lineY[3] = (int) stateConnectors.get(i).getY() - 3 * model.getStateDiametr() / 2;
                                    lineX[4] = (int) stateSelfConnectors.get(i).getX();
                                    lineY[4] = lineY[3];
                                    lineX[5] = (int) stateSelfConnectors.get(i).getX();
                                    lineY[5] = (int) stateSelfConnectors.get(i).getY();
                                }
                            }
                        }
                        // ^
                        // |
                        // Temporary!!!
                        drawArrowLine(g2, lineX, lineY, automat.getxNumbers()[connectionMatrix[i][j]],
                                automat.getxValues()[connectionMatrix[i][j]]);
                    }
                }
            }
        }
    }

}
