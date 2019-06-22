package edu.kpi.memory.data;

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
    
    /** Контроллер памяти. */
    private MemControl control;
    
    /**
     * Стандартный конструктор описателя страничных блоков.
     * @param pTau    Параметр Tau. (все страницы для которых время 
     * последнего доступа меньше <Текущее время> - Tau, считаются кандидатами на
     * замещение.
     * @param n_robin Количество просматриваемых страниц, за одну процедуру служебного обхода.
     * @param memSize размер реальной памяти
     */
    public MemControl(int pTau, int n_robin, int memSize, MemControl control) {
        TAU = pTau;
        N_ROBIN = n_robin;
        pageFaultCount = 0;
        this.control = control;
        pages = new Page[memSize];
        
        clockHand = 0;
    }
    
    /**
     * Вставка страницы. 
     * Если есть свободные страницы - занимается первая попавшаяся. Если
     * свободных страниц нет, то происходит замещение. Указатель адреса 
     * физического адреса страницы и выставление соответствующих битов
     * происходит тут же.
     * @param страницу, которую нужно поместить в память 
     */
    public void includePage(Page page, long currentTime) {
        boolean flag = false;
        
        int minTimePage = clockHand;
        Page currentPage;
        
        for (int i = 0; i < pages.length; i++) {
            currentPage = pages[clockHand]; 
            if ( ( currentPage == null) ||
                    (currentPage.getLastAccessTime() < currentTime - TAU) ) {
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
            turnHand(clockHand);
        } 
        
        /*
         * Если найдена пустая страница, либо страница удовлетворяющая 
         * условию TAU. Если не найденая, то выбираем страницу с минимальным
         * последним временем доступа.
         */
        if (flag) {
           page.setRealAddr(clockHand); 
        } else {
            
        }
    }
    
    /**
     * Служебный обход. Начиная с указателя serviceHand обходятся N_ROUND 
     * страниц. Если у страницы read bit == 1, то этот бит сбрасывается, а 
     * в поле времени последнего доступа записывается текущее время.
     * @param currentTime текущее время
     */
    public void serviceRound(long currentTime) {
        for (int i = 0; i < N_ROBIN; i++) {
            if (pages[serviceHand].isReaded()) {
                pages[serviceHand].setReaded(false);
                pages[serviceHand].setLastAccessTime(currentTime);
            }
            turnHand(serviceHand);
        }
    }
    
    /**
     * Перемещение стрелки на следующий элемент кольцевого списка.
     * @return  номер следующего элемента
     */
    private void turnHand(int hand) {
        hand++;
        if (hand == pages.length) {
            hand = 0;
        }
    }
   
}
