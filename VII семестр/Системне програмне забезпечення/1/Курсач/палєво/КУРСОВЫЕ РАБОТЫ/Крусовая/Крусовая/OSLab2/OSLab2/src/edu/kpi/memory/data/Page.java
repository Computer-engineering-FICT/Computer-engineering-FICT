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
