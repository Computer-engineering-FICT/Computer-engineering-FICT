package edu.kpi.memory.data;

import java.util.HashSet;
import java.util.Random;

/**
 * @author Pustovit Michael, pustovitm@gmail.com
 *  Процесс, хранит в себе ссылки на описатели всех используемых страниц.
 *  Содержит поля об оставшемся времени выполнения.
 *  Реализует функции создания рабочего множества.
 */
public class Process {
    /** Ссылки на описатели используемых страниц. */
    private Page pages [];
    
    /** Страницы которые в данный момент находятся в рабочем множестве. */
    private Page workSet [];
    
    /** Время жизни процесса. */
    long lifeTime;
    
    /**
     * Стандартный конструктор процесса.
     * @param memSize       Общий размер требуемой памяти (в страницах)
     * @param workSetSize   Размер рабочего множества
     */
    public Process(int memSize, int workSetSize) {
        pages   = new Page [memSize];
        
        for (int i = 0; i < memSize; i++) {
            pages[i] = new Page();
        }
        
        workSet = new Page [workSetSize]; 
        
        
    }
    
    private class WorkSet {
        /** Время жизни рабочего множества. */
        long lifeTime;
        
        /** Страницы рабочего множества. */
        private HashSet<Integer> pages;
        
        /**
         * Стандартный конструктор рабочего множества.
         * @param size Размер рабочего множества
         * @param proc Процесс для которого создается рабочее множество
         */
        public WorkSet(int size, Process proc) {
            pages = new HashSet<Integer>();
            
            int randNum;
            Random rand = new Random();
            
            for (int i = 0; i < size; i++) {
                randNum = rand.nextInt();
                
                if (!pages.contains(randNum)) {
                    pages.add(randNum); 
                }
            }
        }
    }
}
