package edu.kpi.memory.data;

/**
 * @author Pustovit Michael, pustovitm@gmail.com</br>
 *  Описатель страницы. Описатели страниц хранятся в списках каждого процесса
 *  и список описывающий "реальную" память, содержит ссылки на страницы.
 *  Каждая страница содержит следующие поля:
 *      - бит присутствия
 *      - адрес соответствующей физической страницы
 *      - бит модификации
 *      - бит обращения
 */
public class Page {
    /** Бит присутствия.    */
    private boolean presenceBit;
    
    /** Бит модификации.    */
    private boolean modificationBit;
    
    /** Бит обращения.      */
    private boolean readBit;
    
    /** Бит свопа.          */
    private boolean swapBit;
    
    /** Адрес страницы физической памяти. */
    private int realMemAddr;
    
    /** Время последнего доступа к странице. */
    private int lastAccessTime;
    
    /** Контроллер памяти. */
    private MemControl control;
    
    /**
     * Номер процесса к которому пренадлежит страница
     */
    private int procID;
    
    /** 
     * Значения поля адреса страничного блока, если данная странице не 
     * представлена в памяти. 
     */
    public static final int PAGE_NOT_PRESENCE = -1;
    
    /**
     * Стандартный конструктор страницы, инициализирующий начальные значения
     * битов.
     * @param control контроллер памяти
     */
    public Page(MemControl control, int procid) {
        presenceBit     = false;
        modificationBit = false;
        readBit         = false;
        swapBit         = false;
        lastAccessTime = 0;
        
        this.control = control;
        this.procID = procid;
    }
    
    /**
     * Доступ к странице.
     * @param read true - чтение со страницы, false - запись на страницу
     * @return true если был страничный промах
     */
    public boolean access(boolean read) {
        readBit = true;
        
        if (!read) {
            modificationBit = true;
        }
        
        if (!presenceBit) {
            control.includePage(this);
            presenceBit = true;
            return true;
        }
        
        return false;
    }
    
    /**
     *  Выгрузка страницы из памяти. 
     */
    public void unload() {
        presenceBit = false;
        readBit = false;
        if (modificationBit) {
            swapBit = true;
        }
    }
    
    //=============Блок геттеров/сеттеров==================
    /**
     * Проверка присутствует ли данная страница в реальной памяти.
     * @return бит присутствия
     */
    public boolean isPresence() {
        return this.presenceBit;
    }
    
    /**
     * Устанвка бита присутствия.
     * @param presence бит присутствия.
     */
    public void setPresence(boolean presence) {
        this.presenceBit = presence;
    }
    
    /**
     * Проверка была ли эта страница модифицированна.
     * @return бит модификации
     */
    public boolean isModified() {
        return this.modificationBit;
    }
    
    /**
     * Установка значения бита модификации.
     * @param presence бит модификации
     */
    public void setModified(boolean presence) {
        this.presenceBit = presence;
    }
    
    public boolean isReaded() {
        return this.readBit;
    }
    
    public void setReaded(boolean readed) {
        this.readBit = readed;
    }
    
    /** 
     * Находится ли эта страница в свопе.
     * @return бит своппирования
     */
    public boolean isSwapped() {
        return this.swapBit;
    }
    
    public void setSwapped(boolean swapped) {
        this.swapBit = swapped;
    }
    
    /**
     * Получение адреса физической страницы соответствующей данной.
     * @return адрес физической страницы соответствующеей данной. Если данная
     * страница не представлена в памяти, то возвращается PAGE_NOT_PRESENCE.
     */
    public int getRealAddr() {
        if (presenceBit) {
            return this.realMemAddr;
        } else {
            return PAGE_NOT_PRESENCE;
        }
    }
    
    /**
     * Установка адреса физической страницы соответствующей данной.
     * @param addr адрес физической страницы соответствующеей данной. Если 
     * данная страница не представлена в памяти, то нужно выставить значение
     * PAGE_NOT_PRESENCE.
     */
    public void setRealAddr(int addr) {
        this.realMemAddr = addr;
    }
    
    /**
     * Получение последнего времени доступа к странице.
     * @return последнее время доступа к странице
     */
    public long getLastAccessTime() {
        return lastAccessTime;
    }
    
    /**
     * Установка последнего времени доступа к странице.
     * @param time последнее время доступа
     */
    public void setLastAccessTime(int time) {
        this.lastAccessTime = time;
    }
    
    public String toString() {
        return         
            "\tProc" + procID +
            " P:" + (presenceBit ? "1" : "0") +
            " M:" + (modificationBit ? "1" : "0") +
            " R:" + (readBit ? "1" : "0") +
            " S:" + (swapBit ? "1" : "0") +
            " Time:" + lastAccessTime;
    }
}

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
    
    /** Оставшееся время жизни процесса. */
    int procLifeTime;
    
    /** Полное время жизни процесса. */
    int averalPLT;
    
    /** Количество страничных промахов для этого процесса. */
    int pageFaultCount;
    
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
            pages[i] = new Page(memControl, id);
        }
        
        workSet = new WorkSet(t_min_wslt, t_max_wslt, n_ws_pages, pages.length); 
        
        procLifeTime = generateRand(t_min_proclt, t_max_proclt);
        averalPLT = procLifeTime;
        pageFaultCount = 0;
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
        if (pages[pageNum].access(randNum < READ)) {
            pageFaultCount++;
        }
        
        workSet.decWSLT();
        procLifeTime--;
        
        return (procLifeTime > 0);
    }
    
    /**
     * Получение случайного числа из диапазона min - max
     * @param min   нижний предел диапазона
     * @param max   верхний предел диапазона
     * @return      случайное число из указанного диапазона
     */
    private int generateRand(int min, int max) {
        Random rand = new Random();
        if (max - min <= 0) {
            return min;
        } else {
            return min + rand.nextInt(max - min);
        }        
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
            "\t pages: " + pages.length + " LT: " + averalPLT + 
            " Page faults: " + pageFaultCount;                       
        return str;
    }
    
    /**
     * @return используемые процессом страницы
     */
    public String printPages() {
        String str = " pages list: \n" ;
        
        for (int i = 0; i < pages.length; i++) {
            if (i % 2 == 1) {
                str += "\t";
            }
            str += "#" + i + ": " + pages[i] + "\t";
            if ((i + 1) % 2 == 0) {
                str += "\n";
            } 
        }
        
        return str;
    }
    
    public String printWS() {
        return workSet.toString();
    }
}

package edu.kpi.memory.data;

import edu.kpi.memory.process.Logging;
import edu.kpi.memory.process.Processor;

/**
 * Кольцевой список страничных блоков (отображающий реальную память).
 * Хранит статический страниц ссылок на описатели страниц. 
 * Реализует процедуру замещения страниц по WS Clock, для этого, помнит где 
 * находится стрелка. Содержит параметр Tau (все страницы для которых время 
 * последнего доступа меньше <Текущее время> - Tau, считаются кандидатами на
 * замещение.
 * Считает общее число страничных промахов.
 * 
 * @author Pustovit Michael, pustovitm@gmail.com 
 */
public class MemControl {
    /**
     * Параметр Tau (все страницы для которых время 
     * последнего доступа меньше <Текущее время> - Tau, считаются кандидатами на
     * замещение.
     */
    private final int TAU;
    
    /**
     * Количество просматриваемых страниц, за одну процедуру служебного обхода.
     */
    private final int N_ROBIN; 
    
    /**
     * Счетчик страничных промахов.
     */
    private int pageFaultCount;
    
    /** 
     * Список описателей страничных плоков. Каждая ячейка этого массива
     * содержит ссылку на страничный описатель, либо на null если данный
     * страничный блок пуст.
     */
    private Page [] pages;
    
    /**
     * Стрелка часов. Указывает на страницу с которой начнется поиск кандидата
     * на замещение.
     */
    private int clockHand;
    
    /**
     * Указатель на страницу, с которой начнется следующий служебный обход.
     */
    private int serviceHand;    
    
    /** Общее количество просмотренных страниц, при поиске кандидата на замещ */
    private int averalSeenPages;
    
    private final Processor processor;
    
    /**
     * Стандартный конструктор описателя страничных блоков.
     * @param pTau    Параметр Tau. (все страницы для которых время 
     * последнего доступа меньше <Текущее время> - Tau, считаются кандидатами на
     * замещение.
     * @param n_robin Количество просматриваемых страниц, за одну процедуру служебного обхода.
     * @param memSize размер реальной памяти
     */
    public MemControl(
            int pTau, 
            int n_robin, 
            int memSize,
            Processor processor) 
    {
        this.TAU = pTau;
        this.N_ROBIN = n_robin;
        this.pageFaultCount = 0;
        this.pages = new Page[memSize];
        this.processor = processor;
        averalSeenPages = 0;
        
        this.clockHand = 0;
    }
    
    /**
     * Вставка страницы. 
     * Если есть свободные страницы - занимается первая попавшаяся. Если
     * свободных страниц нет, то происходит замещение. Указатель адреса 
     * физического адреса страницы и выставление соответствующих битов
     * происходит тут же.
     * @param page страницу, которую нужно поместить в память 
     */
    public void includePage(Page page) {
        pageFaultCount++;
        boolean flag = false;
        
        int minTimePage = clockHand;
        Page currentPage;
        
        for (int i = 0; i < pages.length; i++) {
            currentPage = pages[clockHand]; 
            if ( ( currentPage == null) ||
                    (currentPage.getLastAccessTime() < 
                            processor.getCurrentTime() - TAU) ) {
                flag = true;
                break;
            } 
            
            //Поиск страницы с минимальным последным временем доступа
            if (pages[minTimePage].getLastAccessTime() > 
                    currentPage.getLastAccessTime()) {
                minTimePage = clockHand;
            }
            
            /* 
             * Если текущая страница не подходит для замещения, то переходим 
             * к следующеей.
             */
            clockHand = turnHand(clockHand);
            averalSeenPages++;
        } 
        
        /*
         * Если найдена пустая страница, либо страница удовлетворяющая 
         * условию TAU. Если не найдена, то выбираем страницу с минимальным
         * последним временем доступа.
         */
        if (flag) {           
            Logging.write("Replace in real page " + clockHand + " : " +
                    ((pages[clockHand] != null)?pages[clockHand]:"null") +
                    " replaced by " + page + "\n");
            
           if (pages[clockHand] != null) {
               pages[clockHand].unload();
           }
               
           pages[clockHand] = page;
           page.setRealAddr(clockHand);
           
           clockHand = turnHand(clockHand);
        } else {
            pages[minTimePage] = page;
            page.setRealAddr(minTimePage);
        }
    }
    
    /**
     * Служебный обход. Начиная с указателя serviceHand обходятся N_ROUND 
     * страниц. Если у страницы read bit == 1, то этот бит сбрасывается, а 
     * в поле времени последнего доступа записывается текущее время.
     * @param currentTime текущее время
     */
    public void serviceRound() {
        for (int i = 0; (i < N_ROBIN) && (i < pages.length); i++) {
            if (pages[serviceHand] != null) {
                if (pages[serviceHand].isReaded()) {
                    pages[serviceHand].setReaded(false);
                    pages[serviceHand].setLastAccessTime(processor.getCurrentTime());
                }
                serviceHand = turnHand(serviceHand);
            }
        }
    }
    
    /**
     * Перемещение стрелки на следующий элемент кольцевого списка.
     * @return  номер следующего элемента
     */
    private int turnHand(int hand) {
        hand++;
        if (hand == pages.length) {
            hand = 0;
        }
        return hand;
    }
   
    /**
     * Получение количества страничных промахов.
     * @return количество страничный промахов
     */
    public int getPageFaultCount() {
        return pageFaultCount;
    }
    
    public int getAverageSeenPages() {
        return averalSeenPages /pageFaultCount;
    }
    
    public String toString() {       
        String str = "MemControl:\n";
        
        for (int i = 0; i < pages.length; i++) {
            str += "|| #" + i + ": ";
            if (pages[i] != null) {
                str += pages[i] + "\t";  
            } else {
                str += "null" + "\t";
            }

            if ( (i + 1) % 2 == 0) {
                str += "\n";
            }               
        }
        
        return str;
    }
}

package edu.kpi.memory.data;

import java.util.ArrayList;

/**
 * Круговой список процессов.
 * @author Pustovit Michael, pustovitm@gmail.com
 */
public class ProcessList {
    private ArrayList<Process> processes;
    private int hand;
    
    public ProcessList() {
        processes = new ArrayList<Process>();
        hand = 0;
    }
    
    /**
     * @return общее количемство процессов
     */
    public int getProcCount() {
        return processes.size();
    }
    
    /**
     * Добавление процесса.
     * @param proc добавляемый процесс
     */
    public void addProc(Process proc) {
        processes.add(proc);
    }
    
    /**
     * Получение следующего процесса по кольцевому списку.
     * @return следующий процессs
     */
    public Process getNextProc() {
        hand++;
        if (hand >= processes.size()) {
            hand = 0;
        }
        return processes.get(hand);
    }
    
    /**
     * Удаление процесса.
     * @param proc удаляемый процесс
     */
    public void removeProc(Process proc) {
        processes.remove(proc);
    }
    
    /**
     * Получение процесса с индексом i.
     * @param i индекс процесса
     * @return  процесс с индексом i
     */
    public Process getProcess(int i) {
        return processes.get(i);
    }
    
    public String toString() {
        String str = "";
        for (Process proc : processes) {
            str += proc + "\n";
        }
        return str;
    }
}

package edu.kpi.memory.process;

import java.util.Random;
import java.util.Scanner;

import edu.kpi.memory.data.MemControl;
import edu.kpi.memory.data.Process;
import edu.kpi.memory.data.ProcessList;

/**
 * Блок управления моделированием.
 * @author Pustovit Michael, pustovitm@gmail.com
 */
public class Processor {
    private Parameters param;
    
    private int currentTime;        //текущее время (в сигналах таймера)
    private MemControl control;
    private ProcessList procList;
    private int currentId = 0;        
    
    /**
     * Получение текущего времени.
     * @return текущее время
     */
    public int getCurrentTime() {
        return currentTime;
    }
    
    public Process makeProcess() {
        currentId++;
        return new Process(
                currentId - 1, 
                control, 
                param.N_MIN_PROC_PAGES, 
                param.N_MAX_PROC_PAGES,
                param.T_MIN_WSTL,
                param.T_MAX_WSTL,
                param.N_WS_PAGES, 
                param.T_MIN_PROCLT,
                param.T_MAX_PROCLT);
    }
    
    public Processor(Parameters parameters) {
        this.param = parameters;
        
        control = new MemControl(param.TAU, param.N_ROBIN, param.MEM_SIZE, this);
        procList = new ProcessList();
        
        for (int i = 0; i < param.N_START_PROC_COUNT; i++) {
            procList.addProc(makeProcess());
        }               
    }
    
    /**
     * Попытка создать новый процесс.
     */
    private void tryCreateProcess() {
        Random rand = new Random();
        int r = rand.nextInt(101);
        if (r < param.P_NEW_PROC) {
            procList.addProc(makeProcess());
        }
    }
    
    public void start(int tickCount) {                       
        Process currentProc = procList.getNextProc();
        boolean processContinue;        
        
        for (int i = 1; (i < tickCount) && (procList.getProcCount() > 0); i++) {
            processContinue = currentProc.makeStep();
            
            if (!processContinue) {                
                procList.removeProc(currentProc);                
                if (param.PRINT_END_PROC) {
                    Logging.write("\n*^*Process ended*^* " + currentProc + 
                            " Tics: " + i + "\n\n");
                    
                    if (procList.getProcCount() > 0) {
                        currentProc = procList.getNextProc();
                    } else {
                        continue;
                    }
                }                                
            }
            
            if (i % param.T_TICS_IN_PERIOD == 0) {
                currentTime++;
                control.serviceRound();
            }
            
            if (i % param.T_TICS_PER_PROC == 0) {
                currentProc = procList.getNextProc();
                
                Logging.write("\n===Time:" + currentTime + " tics:" + i 
                        + " start " + currentProc + "\n");
            }
            
            tryCreateProcess();                        
        }
        
        System.out.println("PAGE FAULTS: " + control.getPageFaultCount());
        //System.out.println("AVERAGE SEEN PAGES: " + control.getAverageSeenPages());
    }

    private int menu(Process proc) {
        System.out.println(
                "Menu:\n" + 
                "1. Make next steps\n" +
                "2. Memory dump\n" + 
                "3. Active process dump\n" +
                "4. Process list dump\n" +
                "5. Exit");
        
        Scanner scan = new Scanner(System.in);
        
        int choise = scan.nextInt();
        
        switch (choise) {
            case 1: {
                System.out.println("How many steps: ");
                return scan.nextInt();
            } 
                
            case 2: {
                System.out.println(control);
                return 0;
            }
            
            case 3: {
                System.out.println(proc + "\n" + proc.printPages() + 
                        "\n" + proc.printWS());
                return 0;
            }
            
            case 4: {
                System.out.println(procList);
                return 0;
            }
            
            case 5: return -1;
        }
        
        return -1;
    }
    
    public void start() {                       
        Logging.setConsoleMirror(true);
        Process currentProc = procList.getNextProc();
        boolean processContinue;        
        
        int choise = 0;
        
        int i = 0;
        
        while ( (choise != -1) && (procList.getProcCount() > 0)) {                                                
            for (int j = i; j < i + choise; j++) {
                processContinue = currentProc.makeStep();
                
                if (!processContinue) {                
                    procList.removeProc(currentProc);                
                    if (param.PRINT_END_PROC) {
                        Logging.write("\n*^*Process ended*^* " + currentProc + 
                                " Tics: " + i + j + "\n\n");
                        
                        if (procList.getProcCount() > 0) {
                            currentProc = procList.getNextProc();
                        } else {
                            continue;
                        }
                    }                                
                }
                
                if ((i + j) % param.T_TICS_IN_PERIOD == 0) {
                    currentTime++;
                    control.serviceRound();
                }
                
                if ((i + j) % param.T_TICS_PER_PROC == 0) {
                    currentProc = procList.getNextProc();
                    
                    Logging.write("\n===Time:" + currentTime + " tics:" + (i + j) 
                            + " start " + currentProc + "\n");
                }
                
                tryCreateProcess();                  
            }
            
            i += choise;
            
            System.out.println("PAGE FAULTS: " + control.getPageFaultCount());
            
            choise = menu(currentProc);
            while (choise == 0) {
                choise = menu(currentProc);
            }            
        }    
        
        if (procList.getProcCount() <= 0) {
            System.out.println("Process list is empty");
        }
    }

}

package edu.kpi.memory.process;

public class Parameters {
    public int 
    //====Параметры процессора============
    P_NEW_PROC = 2,             //вероятность появления нового процесса
    N_MAX_PROC_COUNT = 10,      //максимальное количество процессов 
    T_TICS_IN_PERIOD = 100,       //количество тактов между сигналами таймера
    T_TICS_PER_PROC = 40,       //количество тактов на один процесс
    N_START_PROC_COUNT = 50,   //количество потоков на момент старта

    //====Параметры контроллера памяти====
    TAU = 50,                   //параметр TAU
    N_ROBIN = 500,               //количество страниц просматриваемых при 
                                //одном служебном проходе
    MEM_SIZE = 1000,          //количество физических страниц
    
    //====Параметры процессов=============
    T_MIN_PROCLT = 100,          //минимальное время жизни процесса
    T_MAX_PROCLT = 400,          //максимальное время жизни процесса
    N_MIN_PROC_PAGES = 50,      //минимальное количество страниц процесса
    N_MAX_PROC_PAGES = 60,      //максимальное количество страниц прцоесса
    
    T_MIN_WSTL = 40,            //минимальное время жизни рабочего множества
    T_MAX_WSTL = 50,            //максимальное время жизни рабочего множества
    N_WS_PAGES = 5;             //количество страниц в рабочем множестве   
    
    /*
     * Примечание:
     * Минимальное количество страниц в процессе должно быть обязательно больше
     * количества страниц в рабочем множестве (иначе переход на страницу не
     * из рабочего множества будет не возможен).
     */
    
    //====Параметры отображения===========
    public boolean
    PRINT_END_PROC = true;
}

package edu.kpi.memory.process;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;

public class Logging {
    private static PrintWriter writer;
    private static boolean consoleMirror = false;
    
    public static void openLogFile(File file) {
        try {
            writer = new PrintWriter(file);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }
    
    public static void write(String str) {
        writer.write(str);
        if (consoleMirror) {
            System.out.println(str);
        }
    }
    
    public static void closeFile() {
        writer.close();
    }
    
    public static void setConsoleMirror(boolean b) {
        consoleMirror = b;
    }
}

package edu.kpi.memory.process;

import java.io.File;
import java.util.Scanner;

public class Start {

    public static void main(String[] args) {
        Logging.openLogFile(new File("log.txt"));
        Processor proc = new Processor(new Parameters());
        
        System.out.println(
                "Menu:\n" + 
                "1. Auto mode\n" +
                "2. Manual mode\n");
        
        Scanner scan = new Scanner(System.in);
        
        int choise = scan.nextInt();
        
        switch (choise) {
            case 1: 
                System.out.println("How many steps: ");
                proc.start(scan.nextInt());
                break;
                        
            case 2: 
                proc.start();
                break;
        }                        
        
        Logging.closeFile();
    }

}
