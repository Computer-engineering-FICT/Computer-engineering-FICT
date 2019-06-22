package com.sulyma.lab111.labwork3;

public class Edge implements Area {
    private int x, y;

    public Edge(int x, int y) {
        this.x = x;
        this.y = y;
    }

    /**
     * Override "getSize" which outputs a string.
     *
     * @return size.
     */
    @Override
    public int getSize() {
        //System.out.println("Edge. Method getSize with parameters: x=" + this.x + ", y=" + this.y);
        return this.x + this.y;
    }
}