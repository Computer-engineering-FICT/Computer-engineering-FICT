package com.lab111.labwork3;

/**
 * Interface for single and group elements.
 * Realise patern "Composite". Its a component part.
 *
 * @author Anastasia Brovchenko
 */
public interface Graphic {

    /**
     * Prints position X/Y of all selected figure.
     */
    public void draw();

    /**
     * Shifts a figure on <code>ptsX</code>/<code>ptsY</code> points to the right/up if <code>pts</code>
     * is more than 0, to the left/down, if <code>ptsX</code>/<code>ptsy</code> less than 0.
     * @param ptsX defines on how many points to shift on X scale a figure and the direction of its shift
     * @param ptsY defines on how many points to shift on Y scale a figure and the direction of its shift
     */
    public void shiftSizeXY(int ptsX, int ptsY);
    
    /**
     * Increases/reduces the figure sizes by the <code>gain</code> of percent.
     * @param gain defines on how many percent to increase/reduce the figure sizes.
     */
    public void changeSize(double gain);

}
