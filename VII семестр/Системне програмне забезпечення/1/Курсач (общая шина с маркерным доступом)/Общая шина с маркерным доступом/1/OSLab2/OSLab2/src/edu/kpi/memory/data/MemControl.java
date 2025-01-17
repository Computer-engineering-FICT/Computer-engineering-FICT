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
