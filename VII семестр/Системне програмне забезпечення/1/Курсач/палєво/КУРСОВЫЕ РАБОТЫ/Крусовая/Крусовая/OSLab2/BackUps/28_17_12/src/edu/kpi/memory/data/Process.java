package edu.kpi.memory.data;

import java.util.ArrayList;
import java.util.Random;

/**
 * @author Pustovit Michael, pustovitm@gmail.com
 *  Процесс, хранит в себе ссылки на описатели всех используемых страниц.
 *  Содержит поля об оставшемся времени выполнения.
 *  Реализует функции создания рабочего множества.
 */
public class Process {
    private int id;
    
    /** Ссылки на описатели используемых страниц. */
    private Page pages [];
    
    /** Страницы которые в данный момент находятся в рабочем множестве. */
    private WorkSet workSet;
    
    /** Время жизни процесса. */
    int procLifeTime;    
       
    /** 
     * Диапазоны для случайного рассчета - операция чтение/запись,
     * из рабочего множества/не из рабочего множества
     */
    private static final int    READ =      50, 
                                WRITE =     50,
                                WORKSET =   90,
                                NWORKSET =  10;
    
    /**
     * Стандартный конструктор процесса.
     * @param id                Номер процесса
     * @param memControl        Контроллер памяти
     * @param n_min_proc_pages  Минимальное  количество страниц в процессе
     * @param n_max_proc_pages  Максимальное количество страниц в процессе
     * @param t_min_proclt      Минимальное время жизни процесса
     * @param t_max_proclt      Максимальное время жизни процесса
     * @param t_min_wslt        Минимальное время жизни рабочего множества
     * @param t_max_wslt        Максимальное время жизни рабочего множества
     * @param n_ws_pages        Количество страниц в рабочем множестве
     */
    public Process(
            int id,
            MemControl  memControl,
            int n_min_proc_pages,
            int n_max_proc_pages,
            int t_min_wslt, 
            int t_max_wslt,
            int n_ws_pages,
            int t_min_proclt, 
            int t_max_proclt) 
    {
        this.id = id;
        pages   = new Page [generateRand(n_min_proc_pages, n_max_proc_pages)];
        
        for (int i = 0; i < pages.length; i++) {
            pages[i] = new Page(memControl);
        }
        
        workSet = new WorkSet(t_min_wslt, t_max_wslt, n_ws_pages, pages.length); 
        
        procLifeTime = generateRand(t_min_proclt, t_max_proclt);        
    }
    
    /**
     * Сделать шаг процесса (выделение процессу одного такта)
     * @return  true -  процесс продолжает работу, <br>
     *          false - процесс завершил работу 
     */
    public boolean makeStep() {
        int randNum = (new Random()).nextInt(WORKSET + NWORKSET);
        int pageNum;
        
        if (randNum < WORKSET) {
            pageNum = workSet.getRandomPageNum();
        } else {
            pageNum = (new Random()).nextInt(pages.length);
            while (workSet.contains(pageNum)) {
                pageNum = (new Random()).nextInt(pages.length);
            }
        }
        
        randNum = (new Random()).nextInt(READ + WRITE);      
        pages[pageNum].access(randNum < READ);
        
        workSet.decWSLT();
        procLifeTime--;
        
        return (procLifeTime <= 0);
    }
    
    /**
     * Получение случайного числа из диапазона min - max
     * @param min   нижний предел диапазона
     * @param max   верхний предел диапазона
     * @return      случайное число из указанного диапазона
     */
    private int generateRand(int min, int max) {
        Random rand = new Random();
        return min + rand.nextInt(max - min);
    }
    
    /**
     * Рабочее множество, которое содержит номера страниц которые в данный
     * момент находятся в рабочем множестве.
     * @author Pustovit Michael, pustovitm@gmail.com
     */
    private class WorkSet {       
        /** Максимальное и минимальное время жизни рабочего множества. */
        private final int T_MIN_WSTL, T_MAX_WSTL;
        
        /** Количество страниц в рабочем множестве. */
        private final int N_WS_PAGES;
        
        private final int ALLPAGE_COUNT;
        
        /** Время жизни рабочего множества. */
        int wsLifeTime;
        
        /** Страницы рабочего множества. */
        private ArrayList<Integer> pages;
               
        /**
         * Стандартный конструктор рабочего множества.
         * @param t_min_wslt    Минимальное время жизни рабочего множества
         * @param t_max_wslt    Максимальное время жизни рабочего множества
         * @param n_ws_pages Размер рабочего множества
         * @param averalPageCount Общее количество страниц в процессе
         */
        public WorkSet(
                int t_min_wslt, 
                int t_max_wslt,
                int  n_ws_pages,
                int averalPageCount) 
        {
            this.T_MIN_WSTL     = t_min_wslt;
            this.T_MAX_WSTL     = t_max_wslt;
            this.N_WS_PAGES     = n_ws_pages;
            this.ALLPAGE_COUNT  = averalPageCount;
            
            generateNewWs();
        }
        
        /**
         * Генерация нового рабочего множества.
         */
        private void generateNewWs() {
            pages = new ArrayList<Integer>();            
            
            int randNum;
            Random rand = new Random();
            
            while (pages.size() < N_WS_PAGES) {
                randNum = rand.nextInt(ALLPAGE_COUNT);
                
                if (!pages.contains(randNum)) {
                    pages.add(randNum); 
                }
            }
            
            wsLifeTime = generateRand(T_MIN_WSTL, T_MAX_WSTL);
        }
        
        /**
         * Уменьшение времени жизни рабочего множества. Если оно достигло 
         * нулевого значения - генерация нового множества.
         */
        public void decWSLT() {
            wsLifeTime--;
            
            if (wsLifeTime <= 0) {
                generateNewWs();
            }
        }        
        
        /**
         * Проверка содержит ли рабочее множество страницу с номером pageNum
         * @param pageNum   номер проверяемой страницы
         * @return  содержит ли рабочее множество страницу с номером pageNum        
         */
        public boolean contains(int pageNum) {
            return pages.contains(pageNum);
        }
        
        /** 
         * @return Случайный номер страницы из рабочего множества.
         */
        public int getRandomPageNum() {
            return pages.get( (new Random()).nextInt(pages.size()) );
        }
        
        public String toString() {
            String str = "WS: ";
            
            for (Integer page : pages) {
                str += page + " ";
            }
            
            return str;
        }
    }
    
    public String toString() {
        String str = "";
        
        str += "Proc #" + id + 
        "\t pages: " + pages.length +
        " pages list: \n";
        
        for (int i = 0; i < pages.length; i++) {
            if (i % 2 == 1) {
                str += "\t";
            }
            str += "#" + i + ": " + pages[i] + "\t";
            if ((i + 1) % 2 == 0) {
                str += "\n";
            } 
        }
        
        str += "\n" + workSet;
        
        return str;
    }
}
