package com.lab111.labwork3;

import java.util.ArrayList;
import java.util.List;

/**
 * Class for group of objects.
 * Realise pattern "Composite". Its a composite part.
 *
 * @author Anastasia Brovchenko
 */
public class CompositeFigure implements Graphic {

    /**
     * Collection of selected figures, which you allocate on your graphic redactor GUI.
     */
    private List<Graphic> selectedFigures = new ArrayList<Graphic>();

    @Override
    public void shiftSizeXY(int ptsX, int ptsY) {
        for (Graphic graphic : selectedFigures) {
            graphic.shiftSizeXY(ptsX,ptsY);
        }
    }

    @Override
    public void changeSize(double gain) {
        for (Graphic graphic : selectedFigures) {
            graphic.changeSize(gain);
        }
    }

    /**
     * Prints positions of all selected/allocated figures. This method works,
     * when you check figure position in your graphic redactor GUI.
     */
    @Override
    public void draw() {
        for (Graphic graphic : selectedFigures) {
            graphic.draw();
        }
    }

    /**
     * Adds the figure to the composition. This method works,
     * when a certain figure gets to area that you allocate.
     */
     public void add(Graphic graphic) {
        selectedFigures.add(graphic);
    }

    /**
     * Remove the figure from the composition. This method works,
     * when a certain figure leaves from area that you allocate.
     */
    public void remove(Graphic graphic) {
        selectedFigures.remove(graphic);
    }

}
