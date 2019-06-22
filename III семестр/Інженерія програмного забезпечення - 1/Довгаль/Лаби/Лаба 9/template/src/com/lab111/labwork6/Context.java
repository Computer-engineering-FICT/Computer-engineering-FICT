package lab111.labwork6;

/**
 * Класс контекста использующий интерфейс стратегии
 *
 * @author Error_404
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
