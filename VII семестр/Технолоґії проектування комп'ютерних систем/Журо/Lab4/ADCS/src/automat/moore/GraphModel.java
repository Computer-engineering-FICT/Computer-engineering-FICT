package automat.moore;

import java.awt.*;

public class GraphModel {

    private static final Color DEFAULT_BACKGROUND_COLOR = Color.WHITE;
    private static final Color DEFAULT_STATE_COLOR = Color.CYAN;
    private static final Color DEFAULT_LINES_COLOR = Color.BLACK;
    private static final Color DEFAULT_TEXT_COLOR = Color.BLACK;

    private static final Font DEFAULT_FONT = new Font("Sans Serif", Font.PLAIN, 14);

    private static final int DEFAULT_STATE_RADIUS = 50;
    private static final int DEFAULT_ARROW_WIDTH = 20;
    private static final double DEFAULT_ARROW_ANGLE = 0.5;
    private static final int DEFAULT_DISTANCE = 70;

    private int stateDiametr;
    private int arrowWidth;
    private double arrowAngle;
    private int distance;

    private Font font;

    private MooreAutomat automat;

    private Color stateColor;
    private Color backgroundColor;
    private Color linesColor;
    private Color textColor = DEFAULT_TEXT_COLOR;

    public GraphModel(MooreAutomat automat) {
        this.automat = automat;
        stateColor = DEFAULT_STATE_COLOR;
        backgroundColor = DEFAULT_BACKGROUND_COLOR;
        linesColor = DEFAULT_LINES_COLOR;
        stateDiametr = DEFAULT_STATE_RADIUS;
        textColor = DEFAULT_TEXT_COLOR;
        font = DEFAULT_FONT;
        arrowWidth = DEFAULT_ARROW_WIDTH;
        arrowAngle = DEFAULT_ARROW_ANGLE;
        distance = DEFAULT_DISTANCE;
    }

    public MooreAutomat getAutomat() {
        return automat;
    }

    public void setAutomat(MooreAutomat automat) {
        this.automat = automat;
    }

    public Font getFont() {
        return font;
    }

    public void setFont(Font font) {
        this.font = font;
    }

    public Color getStateColor() {
        return stateColor;
    }

    public void setStateColor(Color stateColor) {
        this.stateColor = stateColor;
    }

    public Color getBackgroundColor() {
        return backgroundColor;
    }

    public void setBackgroundColor(Color backgroundColor) {
        this.backgroundColor = backgroundColor;
    }

    public Color getLinesColor() {
        return linesColor;
    }

    public void setLinesColor(Color linesColor) {
        this.linesColor = linesColor;
    }

    public int getStateDiametr() {
        return stateDiametr;
    }

    public void setStateDiametr(int stateDiametr) {
        this.stateDiametr = stateDiametr;
    }

    public Color getTextColor() {
        return textColor;
    }

    public void setTextColor(Color textColor) {
        this.textColor = textColor;
    }

    public int getArrowWidth() {
        return arrowWidth;
    }

    public void setArrowWidth(int arrowWidth) {
        this.arrowWidth = arrowWidth;
    }

    public double getArrowAngle() {
        return arrowAngle;
    }

    public void setArrowAngle(double arrowAngle) {
        this.arrowAngle = arrowAngle;
    }

    public int getDistance() {
        return distance;
    }

    public void setDistance(int distance) {
        this.distance = distance;
    }
    
}
