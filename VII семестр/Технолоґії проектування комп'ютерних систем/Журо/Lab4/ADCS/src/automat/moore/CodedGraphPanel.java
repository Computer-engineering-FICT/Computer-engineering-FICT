package automat.moore;

import java.awt.*;
import java.awt.font.FontRenderContext;
import java.awt.geom.Rectangle2D;
import java.util.ArrayList;

public class CodedGraphPanel extends GraphPanel {

    public CodedGraphPanel(GraphModel model) {
        super(model);
        this.model.setAutomat(new CodedMooreAutomat(this.model.getAutomat()));
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
            int stateSelfConnectorX = stateCenterX;
            int stateSelfConnectorY;
            if (stateCenterY < getHeight() / 2) {
                stateSelfConnectorY = currentY;
            }
            else {
                stateSelfConnectorY = currentY + model.getStateDiametr();
            }
            stateSelfConnectors.add(new Point(stateSelfConnectorX, stateSelfConnectorY));
            drawState(g2, currentX, currentY, model.getStateDiametr(), automat.getStateNames()[i], automat.getyNumbers()[i]);
            angle += temp;
        }
        CodedMooreAutomat codedAutomat = (CodedMooreAutomat) automat;
        String[] stateCodes = codedAutomat.getStateCodes();
        g2.setColor(model.getTextColor());
        g2.setFont(model.getFont());
        FontRenderContext context = g2.getFontRenderContext();
        for (int i = 0; i < stateCodes.length; i++) {
            Rectangle2D bounds = g2.getFont().getStringBounds(stateCodes[i], context);
            if ((stateSelfConnectors.get(i).getX() <= (getWidth() / 2)) && (stateSelfConnectors.get(i).getY() < (getHeight() / 2))) {
                g2.drawString(stateCodes[i], (int) (stateSelfConnectors.get(i).getX() - 1.25 * bounds.getX()), (int) stateSelfConnectors.get(i).getY());
            }
            else {
                if ((stateSelfConnectors.get(i).getX() <= (getWidth() / 2)) && (stateSelfConnectors.get(i).getY() >= (getHeight() / 2))) {
                    g2.drawString(stateCodes[i], (int) (stateSelfConnectors.get(i).getX() - 1.25 * bounds.getX()), (int) (stateSelfConnectors.get(i).getY() - bounds.getY()));
                }
                else {
                    if ((stateSelfConnectors.get(i).getX() > (getWidth() / 2)) && (stateSelfConnectors.get(i).getY() >= (getHeight() / 2))) {
                        g2.drawString(stateCodes[i], (int) (stateSelfConnectors.get(i).getX() + 0.25 * bounds.getX()), (int) (stateSelfConnectors.get(i).getY() - bounds.getY()));
                    }
                    else {
                        g2.drawString(stateCodes[i], (int) (stateSelfConnectors.get(i).getX() + 0.25 * bounds.getX()), (int) stateSelfConnectors.get(i).getY());
                    }
                }
            }
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
                        drawArrowLine(g2, lineX, lineY, automat.getxNumbers()[connectionMatrix[i][j]],
                                automat.getxValues()[connectionMatrix[i][j]]);
                    }
                }
            }
        }
    }
    
}
