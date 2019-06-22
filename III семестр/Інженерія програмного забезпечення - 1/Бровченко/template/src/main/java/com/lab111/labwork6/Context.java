package com.lab111.labwork6;

/**
 * Context class uses Strategy interface
 *
 * @author Anastasia Brovchenko
 */
public class Context {

    // Хранимый алгоритм
    private Strategy strategy;

    // Constructor
    public Context() {
    }

    /**
     * Set new strategy
     */
    public void setStrategy(Strategy strategy) {
        this.strategy = strategy;
    }

    /**
     * Do the strategy algorithm
     */
    public void sortByStrategy() {
        strategy.sort(new Object[5]);
    }

}
