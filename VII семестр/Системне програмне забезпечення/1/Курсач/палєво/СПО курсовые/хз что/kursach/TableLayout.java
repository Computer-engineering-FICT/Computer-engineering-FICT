package kursach;

import java.awt.Component;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.Insets;
import java.awt.Point;
import java.awt.Rectangle;

/**
 * The layout manager is submitted as the grid which has an opportunity to create rubber columns and rows.
 * (Менеджер компоновки в виде сетки с возможностью задания резиновых колонок и рядов.)
 */
public class TableLayout
implements java.awt.LayoutManager2
{
        // Constant of the undefined size in a grid. (Константа неопределенного размера в сетке.)
    public final static double UNDEFINED_SIZE = 0.0;

        // Empty insets. (Пустые отступы.)
    protected final static Insets emptyInsets = new Insets(0,0,0,0);

        /** расстояние между ячейками таблицы */
    protected int gap = 0;
        /** минимальные размеры ячейки */
    protected Dimension minSize = new Dimension( 4, 4 );
        /** Table of cells. (Таблица ячеек.) */
    protected Cell[][] table;
        /** Amount of rows of a grid. (Количество рядов сетки.) */
    protected int rowCount = 0;
        /** Amount of columns of a grid. (Количество колонок сетки.) */
    protected int columnCount = 0;
        /** List of sizes of rows. (Список размеров рядов.) */
    protected Item rows[];
        /** List of sizes of columns. (Список размеров колонок). */
    protected Item columns[];

   /**
    * Constructor.
    */
    public TableLayout()
    {
        this( 0, 0 );
    }

   /**
    * Constructor.
    *
    * @param int columnCount  the amount of columns (количество колонок).
    * @param int rows  the amount of rows (количество рядов).
    */
    public TableLayout( int columnCount, int rowCount )
    {
        setSize( columnCount, rowCount );
    }

   /**
    * Constructor.
    *
    * @param int columnCount  the amount of columns (количество колонок).
    * @param int rows  the amount of rows (количество рядов).
    */
    public TableLayout( double[] columns, double[] rows )
    {
        setSize( columns.length, rows.length );
        setColumns( columns );
        setRows( rows );
    }

   /**
    * Клонирует список размеров.
    * @param list исходный список.
    * @return клон списка.
    * @exception CloneNotSupportedException если произошла ошибка клонирования.
    */
    private Item[] clone( Item[] list )
    throws CloneNotSupportedException
    {
        Item[] clonedList = new Item[ list.length ];
        Item clonedItem = null;

        for( int n = 0; n < list.length; n++ )
        {
            clonedItem = (Item) list[ n ].clone();
            clonedList[ n ] = clonedItem;
        }

        return clonedList;
    }

   /**
    * Устанавливает расстояние между ячейками таблицы.
    * @param value новое значение.
    * @exception IllegalArgumentException если значение отрицательное.
    */
    public void setGap( int value )
    {
        if( gap != value )
        {
            if( value < 0 )
            {
                throw new IllegalArgumentException("gap can't be negative");
            }
            gap = value;
        }
    }

   /**
    * Возвращает расстояние между ячейками таблицы.
    * @return значение.
    */
    public int getGap()
    {
        return gap;
    }

   /**
    * Устанавливает минимальные размеры ячейки.
    * @param value новое значение.
    */
    public void setMinimumSize( Dimension value )
    {
        minSize = value;
    }

   /**
    * Возвращает минимальные размеры ячейки.
    * @return значение или null, если размеры не указаны.
    */
    public Dimension getMinimumSize()
    {
        return minSize;
    }

        /* specified by java.awt.LayoutManager2 */
    public void addLayoutComponent( Component c, Object constraints )
    {
        if( constraints instanceof TableConstraint )
        {
            setComponentConstraints( c, (TableConstraint) constraints );
        }
    }

        /* specified by java.awt.LayoutManager2 */
    public void removeLayoutComponent( Component c )
    {
        Point pos = getPosition( c );

        if( pos != null )
        {
            clearComponentCell( pos.x, pos.y );
        }
    }

        /* specified by java.awt.LayoutManager2 */
    public synchronized void layoutContainer( Container container )
    {
            // Initiates the grid by real sizes. (Проинициализировать сетку реальными размерами.)
        initGrid( container );

        Insets cInsets = container.getInsets();
        Cell cell;
        CompCell ccell;

        for( int col = 0; col < columnCount; col++ )
        {
            for( int row = 0; row < rowCount; row++ )
            {
                cell = table[ col ][ row ];

                if( cell != null && !(cell instanceof RefCell) )
                // If the cell is occupied and is not the reference (если ячейка занята и не является ссылкой).
                {
                    ccell = (CompCell)cell;
                        // Set the sizes for the component. (Установить размеры компоненту.)
                    ccell.component.setBounds
                    (
                        cInsets.left + ccell.padding.left + columns[ col ].position,
                        cInsets.top + ccell.padding.top + rows[ row ].position,
                        getFragmentSize( columns, col, ccell.colspan ) - (ccell.padding.left + ccell.padding.right),
                        getFragmentSize( rows, row, ccell.rowspan ) - (ccell.padding.top + ccell.padding.bottom)
                    );
                }
            }
        }
    }

    protected int getMinWidth()
    {
        return minSize != null ? minSize.width : 0;
    }

    protected int getMinHeight()
    {
        return minSize != null ? minSize.height : 0;
    }

   /**
    * Initiates a grid by real sizes. (Инициализирует сетку реальными размера.)
    *
    * @param Container container  the container (контейнер).
    */
    protected void initGrid( Container container )
    {
        Dimension size = container.getSize();

        Insets insets = container.getInsets();
        if( insets != null )
        {
            size.width -= (insets.left + insets.right);
            size.height -= (insets.top + insets.bottom);
        }
        else
        {
            insets = emptyInsets;
        }

        layoutItems( rows, size.height, getMinHeight() );
        layoutItems( columns, size.width, getMinWidth() );
    }

   /**
    * Инициализирует список элементов (рядов,колонок) реальными размерами.
    * @param items список элементов.
    * @param srcSize исходный размер для расстановки элементов.
    */
    protected void layoutItems( Item[] items, int srcSize, int minSize )
    {
        if( items.length == 0 )
        {
            return;
        }

        int tmpTotal = 0;
        int undefCount = 0;
        int visibleCount = 0;
        double percent = 0;
        int totalGap = gap * (getVisibleCount( items ) - 1);
        int availSize = srcSize - getTotalFixedSize( items ) - totalGap;
        Item item = null;

        for( int n = 0; n < items.length; n++ )
        {
            item = items[ n ];

            if( item.visible )
            {
                if( item.isUndefined() )
                {
                    undefCount++;
                }
                else
                if( item.isPercentage() )
                {
                    percent = item.value;
                    item.size = (int) Math.max( Math.round( availSize * percent ), minSize );

                    tmpTotal += item.size;
                }
                else
                {
                    item.size = (int) Math.max( item.value, minSize );

                    tmpTotal += item.size;
                }
            }
            else
            {
                item.size = 0;
            }
        }

        int undefAvail = srcSize - totalGap - tmpTotal;
        int undefSize = Math.max( undefCount != 0 ? (undefAvail / undefCount) : undefAvail, minSize );
        int totalSize = totalGap;
        int position = 0;

        for( int n = 0; n < items.length; n++ )
        {
            item = items[ n ];

            if( item.visible )
            {
                if( item.isUndefined() )
                {
                    item.size = undefSize;
                }

                item.position = position;

                position += item.size + gap;
                totalSize += item.size;
            }
        }

        validateItems( items, srcSize, totalSize );
    }

   /**
    * Производит корректировку размеров элементов.
    * @param items список элементов.
    * @param availSize доступный размер.
    * @param totalSize общий размер всех елементов с учетом расстояния
    *                  между элементами (рядами,колонками).
    */
    protected void validateItems( Item[] items, int availSize, int totalSize )
    {
//        if( totalSize >= availSize )
//        {
//            return;
//        }

        int diff = availSize - totalSize;

        Item item = null;
        int index = items.length - 1;

        while( index >= 0 )
        {
            item = items[ index ];
            if( item.visible && (item.isPercentage() || item.isUndefined()) )
            {
                item.size += diff;
                int delta = diff;
                if( item.size < 0 )
                {
                    delta += -item.size;
                    item.size = 0;
                }

                // Adjust subsequent items
                int tmpIndex = index + 1;
                int lastIndex = items.length - 1;
                while( tmpIndex <= lastIndex )
                {
                    item = items[ tmpIndex ];
                    if( item.visible )
                    {
                        item.position += delta;
                    }
                    tmpIndex++;
                }
                break;
            }
            index--;
        }
    }

        /* specified by java.awt.LayoutManager2 */
    public void addLayoutComponent( String stName, Component c ){}

        /* specified by java.awt.LayoutManager2 */
    public void invalidateLayout( Container c ){}

        /* specified by java.awt.LayoutManager2 */
    public float getLayoutAlignmentX( Container c )
    {
        return( 0.5f );
    }

        /* specified by java.awt.LayoutManager2 */
    public float getLayoutAlignmentY( Container c )
    {
        return( 0.5f );
    }

        /* specified by java.awt.LayoutManager2 */
    public Dimension maximumLayoutSize( Container c )
    {
        return( new Dimension( Integer.MAX_VALUE, Integer.MAX_VALUE ) );
    }

        /* specified by java.awt.LayoutManager2 */
    public Dimension minimumLayoutSize( Container c )
    {
        Dimension size = new Dimension();

        size.width = getTotalFixedSize( columns );
        size.height = getTotalFixedSize( rows );

        int undefinedRowsCount = getUndefinedSizeCount( rows, true );
        int undefinedColsCount = getUndefinedSizeCount( columns, true );

        if( minSize != null )
        {
            if( undefinedRowsCount > 0 )
            {
                size.height += minSize.height * undefinedRowsCount;
            }
            if( undefinedColsCount > 0 )
            {
                size.width += minSize.width * undefinedColsCount;
            }
        }

        if( gap > 0 )
        {
            size.width += gap * (getVisibleCount( columns ) - 1);
            size.height += gap * (getVisibleCount( rows ) - 1);
        }

        Insets insets = c.getInsets();
        if( insets != null )
        {
            size.width += (insets.left + insets.right);
            size.height += (insets.top + insets.bottom);
        }

        return size;
    }

        /* specified by java.awt.LayoutManager2 */
    public Dimension preferredLayoutSize( Container c )
    {
        return minimumLayoutSize( c );
    }

   /**
    * Sets the size of the table. All previous settings are lost.
    * (Устанавливает размер таблицы. Все предыдущие установки теряются.)
    *
    * @param int columnCount  the amount of columns (количество колонок).
    * @param int rowCount  the amount of rows (количество рядов).
    */
    public void setSize( int columnCount, int rowCount )
    {
        this.columnCount = columnCount;
        this.rowCount = rowCount;

        createGrid();
    }

   /**
    * Returns a size of a grid. (Возвращает размер сетки.)
    *
    * @return Dimension  the size (размер).
    */
    public Dimension getSize()
    {
        return( new Dimension( columnCount, rowCount ) );
    }

   /**
    * Sets the sizes of the columns from the list of values.
    * (Устанавливает размеры колонок из списка значений.)
    * @param ArrayList aValues  the array of values (массив значений).
    */
    public void setColumns( double[] values )
    {
//        int length = values.size();
//        if( columns == null )
//        {
            createColumns( values.length );
//        }
        if( rows != null )
        {
            Cell tempTable[][] = new Cell[0][0];
            if( table != null )
            {
                tempTable = (Cell[][])table.clone();
            }
            table = new Cell[ values.length ][ rows.length ];
            for( int i = 0; i < table.length && i < tempTable.length; i++ )
            {
                for( int j = 0; j < table[i].length && j < tempTable[i].length; j++ )
                {
                    table[i][j] = tempTable[i][j];
                }
            }
        }
        for( int n = 0; n < values.length; n++ )
        {
            setColumnWidth( n, values[n] );
        }
    }

   /**
    * Вернуть список колонок.
    * @return возвращает список колонок.
    */
    public Item[] getColumns()
    {
        return columns;
    }

   /**
    * Sets the sizes of the rows from the list of values.
    * (Устанавливает размеры рядов из списка значений.)
    * @param ArrayList aValues  the array of values (массив значений).
    */
    public void setRows( double[] values )
    {
//        int length = values.size();
//        if( rows == null )
//        {
            createRows( values.length );
//        }
        if( rows != null )
        {
            Cell tempTable[][] = new Cell[0][0];
            if( table != null )
            {
                tempTable = (Cell[][])table.clone();
            }
            table = new Cell[ columns.length ][ values.length ];
            for( int i = 0; i < table.length && i < tempTable.length; i++ )
            {
                for( int j = 0; j < table[i].length && j < tempTable[i].length; j++ )
                {
                    table[i][j] = tempTable[i][j];
                }
            }
        }
        for( int n = 0; n < values.length; n++ )
        {
            setRowHeight( n, values[n] );
        }
    }

   /**
    * Вернуть список рядков.
    * @return возвращает список рядков.
    */
    public Item[] getRows()
    {
        return rows;
    }

   /**
    * Sets a width of a column. (Устанавливает ширину колонки.)
    *
    * @param int col  the column (колонка).
    * @param value the value (значение).
    */
    public void setColumnWidth( int col, double value )
    {
        columns[col].value = value;
    }

   /**
    * Sets a flag of visibility of a column. (Устанавливает флаг видимости колонки.)
    *
    * @param int col  the index of the column (индекс колонки).
    * @param boolean value  the flag (флаг).
    */
    public void setColumnVisible( int col, boolean value )
    {
        if( columns[col].visible != value )
        {
            columns[col].visible = value;

            for( int n = 0; n < rowCount; n++ )
            {
                Cell cell = table[col][n];
                if( cell != null && (cell instanceof CompCell) )
                {
                    CompCell ccell = (CompCell)cell;
                    if( ccell.colspan == 1 )
                    {
                        ccell.component.setVisible( value );
                    }
                }
            }
        }
    }

   /**
    * Sets a height of a row. (Устанавливает высоту ряда.)
    *
    * @param int row  the row (ряд).
    * @param value the value (значение).
    */
    public void setRowHeight( int row, double value )
    {
        rows[ row ].value = value;
    }

   /**
    * Sets a flag of visibility of a row. (Устанавливает флаг видимости ряда.)
    *
    * @param int row  the index of the row (индекс ряда).
    * @param boolean value  the flag (флаг).
    */
    public void setRowVisible( int row, boolean value )
    {
        if( rows[ row ].visible != value )
        {
            rows[ row ].visible = value;

            for( int n = 0; n < columnCount; n++ )
            {
                Cell cell = table[n][row];
                if( cell != null && (cell instanceof CompCell) )
                {
                    CompCell ccell = (CompCell)cell;
                    if( ccell.rowspan == 1 )
                    {
                        ccell.component.setVisible( value );
                    }
                }
            }
        }
    }

   /**
    * Returns a width of a specified column. (Возвращает ширину указанной колонки.)
    *
    * @param int col  the index of the column (индекс колонки).
    * @return the wdth (ширина).
    */
    public double getColumnWidth( int col )
    {
        return( columns[ col ].value );
    }

   /**
    * Returns a width of a specified column in pixels.
    * (Возвращает текущую ширину указанной колонки в пикселах.)
    *
    * @param int col  the index of the column (индекс колонки).
    * @return the wdth (ширина).
    */
    public int getRealColumnWidth( int col )
    {
        return( columns[ col ].size );
    }

   /**
    * Flag of visibility of a column. (Возвращает флаг видимости колонки.)
    *
    * @param int col  the index of the column (индекс колонки).
    * @return boolean  <true> if the column is visible (если колонка видима).
    */
    public boolean isColumnVisible( int col )
    {
        return columns[col].visible;
    }

   /**
    * Returns a height of a specified row. (Возвращает высоту указанного ряда.)
    *
    * @param int row  the index of the row (индекс ряда).
    * @return the height (высота).
    */
    public double getRowHeight( int row )
    {
        return( rows[ row ].value );
    }

   /**
    * Returns a current height of a specified row in pixels.
    * (Возвращает текущую высоту указанного ряда в пикселах.)
    *
    * @param int row  the index of the row (индекс ряда).
    * @return the height (высота).
    */
    public int getRealRowHeight( int row )
    {
        return( rows[ row ].size );
    }

   /**
    * Flag of visibility of a row. (Возвращает флаг видимости ряда.)
    *
    * @param row  the index of the row (индекс ряда).
    * @return boolean  <true> if the row is visible (если ряд видим).
    */
    public boolean isRowVisible( int row )
    {
        return rows[ row ].visible;
    }

   /**
    * Sets the settings for the component. (Устанавливает установки для компонента.)
    *
    * @param Component c  the component (компонент).
    * @param TableConstraint fgc  the settings of the component (установки компонента для сетки).
    */
    public void setConstraints( Component c, TableConstraint fgc )
    {
        Point p = getPosition( c );

        if( p != null )
        {
            CompCell ccell = getComponentCell( p.x, p.y );

            for( int n = 0; n < ccell.colspan; n++ )
            {
                for( int m = 0; m < ccell.rowspan; m++ )
                {
                    table[ p.x + n ][ p.y + m ] = null;
                }
            }
        }

        setComponentConstraints( c, fgc );
    }

   /**
    * Returns the settings of the componental cell in the specified position.
    * If the cell is the link to other cell then the settings of the real
    * componental cell will be returned.
    * (Возвращает установки компонентой ячейки в указанной позиции.
    * Если ячейка является ссылкой на другую ячейку,
    * то будут возвращены установки реальной компонентной ячейки.)
    *
    * @param int col  the column (колонка).
    * @param int row  the row (ряд).
    * @return TableConstraint  the settings or NULL if the cell is empty
    *                          (установки или null, если ячейка пустая).
    */
    public TableConstraint getConstraints( int col, int row )
    {
        CompCell ccell = getComponentCell( col, row );
        return (ccell != null) ? (new TableConstraint( row, col, ccell.rowspan, ccell.colspan, ccell.padding )) : null;
    }

   /**
    * Returns the settings of the componental cell for the specified component.
    * (Возвращает установки компонентной ячейки для указанного компонента.)
    *
    * @param Component c  the component (компонент).
    * @return TableConstraint  the settings or NULL if the component is not found in the grid
    *                          (установки или null, если компонент не найден в сетке).
    */
    public TableConstraint getConstraints( Component c )
    {
        Point p = getPosition( c );

        if( p == null )
        {
            return( null );
        }

        CompCell ccell = getComponentCell( p.x, p.y );
        return (ccell != null) ? (new TableConstraint( p.y, p.x, ccell.colspan, ccell.rowspan, ccell.padding )) : null;
    }

   /**
    * Returns an amount of rows. (Возвращает количество рядов.)
    *
    * @return int  the amount of rows (количество рядов).
    */
    public int getRowCount()
    {
        return rowCount;
    }

   /**
    * Returns an amount of columns. (Возвращает количество колонок.)
    *
    * @return int  the amount of columns (количество колонок).
    */
    public int getColumnCount()
    {
        return columnCount;
    }

   /**
    * Returns a component on the specified coordinates.
    * (Возвращает компонент по указанным координатам.)
    *
    * @param int col  the column (колонка).
    * @param int row  the row (ряд).
    * @return Component  the component (компонент).
    */
    public Component getAt( int col, int row )
    {
        CompCell ccell = getComponentCell( col, row );
        return( ccell != null ? ccell.component : null );
    }

   /**
    * Returns a location of a component. (Возвращает местоположение компонента.)
    *
    * @param Component c  the component (компонент).
    * @return Point  the point of the location or NULL if the component is not found
    *                (точка положения или null если компонент не найден).
    */
    public Point getPosition( Component c )
    {
        Point p = null;
        boolean found = false;

        for( int col = 0; col < columnCount && !found; col++ )
        {
            for( int row = 0; row < rowCount && !found; row++ )
            {
                if( !isEmptyCell( col, row ) )
                {
                    if( c == getAt( col, row ) )
                    {
                        p = new Point( col, row );
                        found = true;
                        break;
                    }
                }
            }
        }
        return( p );
    }

   /**
    * Returns a component to the left from the specified component.
    * (Возвращает компонент слева от указанного.)
    *
    *
    * @param Component c  the component (компонент).
    * @return Component  the component or NULL.
    */
    public Component getLeft( Component c )
    {
        Component left = null;
        Point p = getPosition( c );

        if( p != null )
        {
            boolean found = false;
            Component tmp = null;

            while( p.x >= 0 && !found )
            {
                tmp = getAt( p.x, p.y );

                if( tmp != c )
                {
                    left = tmp;
                    found = true;
                }
                p.x--;
            }
        }
        return left;
    }

   /**
    * Returns a component to the right from the specified component.
    * (Возвращает компонент справа от указанного.)
    *
    * @param Component c  the component (компонент).
    * @return Component  the component or NULL.
    */
    public Component getRight( Component c )
    {
        Component right = null;
        Point p = getPosition( c );

        if( p != null )
        {
            boolean found = false;
            Component tmp = null;

            while( p.x != columnCount && !found )
            {
                tmp = getAt( p.x, p.y );

                if( tmp != c )
                {
                    right = tmp;
                    found = true;
                }
                p.x++;
            }
        }
        return right;
    }

   /**
    * Returns a component above from specified.
    * (Возвращает компонент сверху от указанного.)
    *
    * @param Component c  the component (компонент).
    * @return Component  the component or NULL.
    */
    public Component getUp( Component c )
    {
        Component up = null;
        Point p = getPosition( c );

        if( p != null )
        {
            boolean found = false;
            Component tmp = null;

            while( p.y >= 0 && !found )
            {
                tmp = getAt( p.x, p.y );

                if( tmp != c )
                {
                    up = tmp;
                    found = true;
                }
                p.y--;
            }
        }
        return up;
    }

   /**
    * Returns a component which there is lower from specified.
    * (Возвращает компонент снизу от указанного.)
    *
    * @param Component c  the component (компонент).
    * @return Component  the component or NULL.
    */
    public Component getDown( Component c )
    {
        Component down = null;
        Point p = getPosition( c );

        if( p != null )
        {
            boolean found = false;
            Component tmp = null;

            while( p.y != rowCount && !found )
            {
                tmp = getAt( p.x, p.y );

                if( tmp != c )
                {
                    down = tmp;
                    found = true;
                }
                p.y++;
            }
        }
        return down;
    }

   /**
    * Returns a cell of a component.
    * (Возвращает ячейку компонента.)
    *
    * @param int col  the column (колонка).
    * @param int row  the row (ряд).
    * @return CCell  the cell or NULL if there is no cell in a specified position
    *               (ячейка или null если в данной позиции нет ячейки).
    */
    protected CompCell getComponentCell( int col, int row )
    {
        Cell cell = table[ col ][ row ];
        if( cell != null )
        {
            return (cell instanceof RefCell) ? ((RefCell)cell).ref : (CompCell)cell;
        }
        return null;
    }

   /**
    * Returns a flag which defines whether a grid cell is a reference to a component.
    * (Возвращает признак того является ли ячейка сетки ссылкой на компонент.)
    *
    * @param int col  the column (колонка).
    * @param int row  the row (ряд).
    * @return boolean  <true> if the grid cell is the reference (если это ссылка).
    */
    public boolean isReferencedCell( int col, int row )
    {
        Cell cell = table[ col ][ row ];
        return cell != null && (cell instanceof RefCell);
    }

   /**
    * Returns a flag which defines whether a cell is empty.
    * (Возвращает признак того является ли ячейка сетки пустой.)
    *
    * @param int col  the column (колонка).
    * @param int row  the row (ряд).
    * @return boolean  <true> if the cell is empty (если ячейка пуста).
    */
    public boolean isEmptyCell( int col, int row )
    {
        return( table[ col ][ row ] == null );
    }

   /**
    * Creates a grid according to the specified sizes.
    * (Создает сетку исходя из заданных размеров.)
    */
    private void createGrid()
    {
        rows = new Item[ rowCount ];
        columns = new Item[ columnCount ];

        for( int n = 0; n < rows.length; n++ )
        {
            rows[ n ] = createItem();
        }

        for( int n = 0; n < columns.length; n++ )
        {
            columns[ n ] = createItem();
        }

        table = new Cell[ columnCount ][ rowCount ];
    }

   /**
    * Creates a grid of columns proceeding from the specified sizes.
    * (Создает сетку колонок исходя из заданных размеров.)
    *
    * @param int length  the size (размер).
    */
    public void createColumns( int length )
    {
        this.columnCount = length;
        columns = new Item[ length ];

        for( int n = 0; n < length; n++ )
        {
            columns[n] = createItem();
        }
    }

   /**
    * Creates a grid of rows proceeding from the specified sizes.
    * (Создает сетку рядов исходя из заданных размеров.)
    *
    * @param int length  the size (размер).
    */
    public void createRows( int length )
    {
        this.rowCount = length;
        rows = new Item[ length ];

        for( int n = 0; n < length; n++ )
        {
            rows[n] = createItem();
        }
    }

   /**
    * Returns an amount of columns with undefined sizes.
    * (Возвращает количество колонок с неопределенным размером.)
    *
    * @return int  the amount of columns (количество колонок).
    */
    public int getUndefinedColumnCount()
    {
        return( getUndefinedSizeCount( columns, false ) );
    }

   /**
    * Returns an amount of rows with undefined sizes.
    * (Возвращает количество рядов с неопределенным размером.)
    *
    * @return int  the amount of rows (количество рядов).
    */
    public int getUndefinedRowCount()
    {
        return( getUndefinedSizeCount( rows, false ) );
    }

   /**
    * Returns a flag which defines: whether a column is rubber.
    * (Возвращает флаг того, является ли колонка резиновой.)
    *
    * @param int col  the index of the column (индекс колонки).
    * @return boolean  <true> if the column has an undefined size
    *                 (если колонка имеет неопределенный размер).
    */
    public boolean isColumnUndefined( int col )
    {
        return( columns[ col ].isUndefined() );
    }

   /**
    * Returns a flag which defines: whether a row is rubber.
    * (Возвращает флаг того является ли ряд резиновый.)
    *
    * @param int row  index of the row (индекс ряда).
    * @return boolean  <true> if the row has an undefined size
    *                  (если ряд имеет неопределенный размер).
    */
    public boolean isRowUndefined( int row )
    {
        return( rows[ row ].isUndefined() );
    }

   /**
    * Returns a flag which defines: whether the column size of in percents is specified.
    * (Возвращает флаг того является ли размер колонки заданным в процентах.)
    *
    * @param int col  the index of the column (индекс колонки).
    * @return boolean  <true> if the size is specified in percents
    *                  (если размер задан в процентах).
    */
    public boolean isColumnWidthInPercents( int col )
    {
        return( columns[ col ].isPercentage() );
    }

   /**
    * Returns a flag which defines: whether the row size of in percents is specified.
    * (Возвращает флаг того, является ли размер ряда заданным в процентах.)
    *
    * @param int row  the index of the row (индекс ряда).
    * @return boolean  <true> if the size is specified in percents
    *                  (если размер задан в процентах).
    */
    public boolean isRowHeightInPercents( int row )
    {
        return( rows[ row ].isPercentage() );
    }

   /**
    * Returns an amount of undefined sizes.
    * (Возвращает количество неопределенных размеров.)
    *
    * @param Item[] list  the list of sizes (список размеров).
    * @return  the amount of undefined sizes (количество неопределенных размеров).
    */
    private int getUndefinedSizeCount( Item[] list, boolean checkVisible )
    {
        int count = 0;
        for( int n = 0; n < list.length; n++ )
        {
            if( list[ n ].isUndefined() && (checkVisible ? list[ n ].visible : true) )
            {
                count++;
            }
        }
        return( count );
    }

   /**
    * Returns a total size of all fixed sizes.
    * (Возвращает суммарный размер всех фиксированных размеров.)
    *
    * @param Item[] list  list of sizes (список размеров).
    * @return int  the total size (суммарный размер).
    */
    protected int getTotalFixedSize( Item[] list )
    {
        int size = 0;
        for( int n = 0; n < list.length; n++ )
        {
            if( list[ n ].visible && list[ n ].isFixed() )
            {
                size += (int)list[ n ].value;
            }
        }
        return( size );
    }

   /**
    * Sets properties of a cell. (Устанавливает свойства ячейки.)
    *
    * @param Component comp  the component (компонент).
    * @param TableConstraint constraints  the properties (свойства).
    */
    protected void setComponentConstraints( Component comp, TableConstraint constraints )
    {
        CompCell cell = new CompCell( comp, constraints.padding );
        cell.colspan = constraints.colspan;
        cell.rowspan = constraints.rowspan;
        setComponentCell( constraints.col, constraints.row, cell );
    }

   /**
    * Sets a cell in a specified position. (Устанавливает ячейку в указанную позицию.)
    *
    * @param int col the column (колонка).
    * @param int row the row (ряд).
    * @param cell the cell (ячейка).
    */
    private void setComponentCell( int col, int row, CompCell cell )
    {
        if( table != null )
        {
            if( cell.colspan > 1 || cell.rowspan > 1 )
            {
                Cell c = null;
                for( int tmpCol = 0; tmpCol < cell.colspan; tmpCol++ )
                {
                    for( int tmpRow = 0; tmpRow < cell.rowspan; tmpRow++ )
                    {
                        c = new RefCell( cell );
                        c.row = row + tmpRow;
                        c.col = col + tmpCol;
                        table[ c.col ][ c.row ] = c;
                    }
                }
            }
            cell.row = row;
            cell.col = col;
            table[ col ][ row ] = cell;
        }
    }

   /**
    * Clears a cell in a specified position. (Очищает ячейку в укзанной позиции.)
    *
    * @param int col  the column (колонка).
    * @param int row  the row (ряд).
    */
    private void clearComponentCell( int col, int row )
    {
        table[ col ][ row ] = null;
    }

    public Cell getCell( int col, int row )
    {
        return table[ col ][ row ];
    }

    public boolean isEmptyArea( Component excludedComponent, TableConstraint fgc )
    {
        return( isEmptyArea( excludedComponent, fgc.col, fgc.row, fgc.colspan, fgc.rowspan ) );
    }

    public boolean isEmptyArea( Component excludedComponent, int col, int row, int width, int height )
    {
        Cell cell = null;

        for( int n = 0; n < width; n++ )
        {
            for( int m = 0; m < height; m++ )
            {
                cell = table[ col + n ][ row + m ];
                if( cell != null )
                {
                    CompCell ccell = null;
                    if( cell instanceof RefCell )
                    {
                        ccell = ((RefCell)cell).ref;
                        return (ccell.component == excludedComponent);
                    }
                    else
                    {
                        ccell = (CompCell)cell;
                        return (ccell.component == excludedComponent);
                    }
                }
            }
        }
        return true;
    }

   /**
    * Returns bounds of a cell. (Возвращает границы ячейки.)
    *
    * @param Container container  the container (контейнер).
    * @param int col  the column (колонка).
    * @param int row  the row (ряд).
    * @return Rectangle  the bounds of the cell (границы ячейки).
    */
    public Rectangle getCellBounds( Container container, int col, int row )
    {
        Rectangle r = new Rectangle();
        Cell cell = table[ col ][ row ];
        Insets cInsets = container.getInsets();
        Insets insets = null;
        int colspan = 1;
        int rowspan = 1;

        if( cell != null && !(cell instanceof RefCell) )
        {
            CompCell ccell = (CompCell)cell;
            insets = (ccell.padding != null) ? ccell.padding : emptyInsets;
            colspan = ccell.colspan;
            rowspan = ccell.rowspan;
        }
        else
        {
            insets = emptyInsets;
        }

        r.x         = cInsets.left + getOffsetForColumn( col ) + insets.left;
        r.y         = cInsets.top + getOffsetForRow( row ) + insets.top;
        r.width     = getFragmentSize( columns, col, colspan ) - (insets.left + insets.right);
        r.height    = getFragmentSize( rows, row, rowspan ) - (insets.top + insets.bottom);

        return( r );
    }

   /**
    * Returns a location of a left top corner of a grid cell.
    * (Возвращает положение левого верхнего угла ячейки сетки.)
    *
    * @param Container container  the container (контейнер).
    * @param int col  the column (колонка).
    * @param int row  the row (ряд).
    * @return Point  the coordinates of the left top corner of the grid cell
    *                (координаты левого верхнего угла ячейки).
    */
    public Point getCellLocation( Container container, int col, int row )
    {
        Point p = new Point();
        Insets cInsets = container.getInsets();
        p.x = cInsets.left + getOffsetForColumn( col );
        p.y = cInsets.top + getOffsetForRow( row );
        return( p );
    }

   /**
    * Returns a current size of the grid cell. (Возвращает текущий размер ячейки сетки.)
    *
    * @param Container container  the container (контейнер).
    * @param int col  the column (колонка).
    * @param int row  the row (ряд).
    * @return Dimension  the size of the cell (размер ячейки).
    */
    public Dimension getCellSize( Container container, int col, int row )
    {
        Dimension size = new Dimension();
        Cell cell = table[ col ][ row ];
        int colspan = 1;
        int rowspan = 1;

        size.width = getFragmentSize( columns, col, colspan );
        size.height = getFragmentSize( rows, row, rowspan );

        return( size );
    }

   /**
    * Returns a size of a grid fragment in pixels. The fragment is a section occupied by elements.
    * (Возвращает размер фрагмента сетки в пикселах. Фрагментом является участок, занимаемый одним и более элементами.)
    *
    * @param Item[] list - the list of the elements (список элементов).
    * @param int from - the start element (начальный элемент).
    * @param int count - the amount of occupied elements (количество занимаемых элементов).
    * @return int - the size in pixels (размер в пикселах).
    */
    protected int getFragmentSize( Item[] list, int from, int count )
    {
        int size = 0;
        int visibleCount = 0;
        for( int to = from + count; from < to; from++ )
        {
            if( list[ from ].visible )
            {
                size += list[ from ].size;
                visibleCount++;
            }
        }
        size += gap * (visibleCount - 1);
        return size;
    }

    public int getRowFragmentSize( int from, int count )
    {
        int size = getFragmentSize( rows, from, count );
        return size;
    }

    public int getColumnFragmentSize( int from, int count )
    {
        int size = getFragmentSize( columns, from, count );
        return size;
    }

    public int getVisibleRowCount()
    {
        return getVisibleCount( rows );
    }

    public int getVisibleColumnCount()
    {
        return getVisibleCount( columns );
    }

   /**
    * Возвращает количество видимых элементов.
    * @param list список элементов.
    * @return количество видимых элементов.
    */
    protected int getVisibleCount( Item[] list )
    {
        int count = 0;
        for( int n = 0; n < list.length; n++ )
        {
            if( list[ n ].visible )
            {
                count++;
            }
        }
        return( count );
    }

   /**
    * Returns a displacement for a specified column. (Возвращает смещение для указанной колонки.)
    *
    * @param int col  the column (колонка).
    * @return int the displacement for the specified column (смещение для указанной колонки).
    */
    private int getOffsetForColumn( int col )
    {
        int pos = 0;
        for( int n = 0; n < col; n++ )
        {
            pos += columns[ n ].size + gap;
        }
        return( pos );
    }

   /**
    * Returns a displacement for a row. (Возвращает смещение для ряда.)
    *
    * @param int row  the row (ряд).
    * @return int  the displacement for the row (смещение для ряда).
    */
    private int getOffsetForRow( int row )
    {
        int pos = 0;
        for( int n = 0; n < row; n++ )
        {
            pos += rows[ n ].size + gap;
        }
        return( pos );
    }

   /**
    * Создает экземпляр элемента списка размеров.
    * @return элемент.
    */
    protected Item createItem()
    {
        return new Item();
    }

   /**
    * Outputs parameters of the manager of configuration in the standard stream of an output.
    * (Выводит параметры менеджера компоновки в стандартный поток вывода.)
    */
    public void list()
    {
        list( System.out );
    }

   /**
    * Outputs the parameters of the manager of configuration in the specified stream of an output.
    * (Выводит параметры менеджера компоновки в указанный поток вывода.)
    *
    * @param java.io.PrintStream pstream - the output stream (поток).
    */
    public void list( java.io.PrintStream pstream )
    {
        pstream.println( "" + this.toString() );

        for( int r = 0; r < rowCount; r++ )
        {
            String str = "";

            for( int c = 0; c < columnCount; c++ )
            {
                str = "[" + c + "," + r + "] = " + table[ c ][ r ];

                pstream.println( str );
            }
        }

        pstream.println( "" );
    }

    public void listRows( java.io.PrintStream pstream )
    {
        list( rows, pstream );
    }

    public void listColumns( java.io.PrintStream pstream )
    {
        list( columns, pstream );
    }

    protected void list( Item[] list, java.io.PrintStream pstream )
    {
        for( int n = 0; n < list.length; n++ )
        {
            pstream.println( "" + n + ": " + list[ n ] );
        }
    }

   /**
    * Returns an object as a string. (Возвращает строковое представление объекта.)
    *
    * @return String - the string (строка).
    */
    public String toString()
    {
        return( getClass().getName() + " " + hashCode() + " [" + paramString() + "]" );
    }

   /**
    * Returns a string of parameters of an object. (Возвращает строку параметров объекта.)
    *
    * @return String - the string of parameters (строка параметров).
    */
    protected String paramString()
    {
        StringBuffer ps = new StringBuffer();
        ps.append( columnCount );
        ps.append( 'x' );
        ps.append( rowCount );
        return ps.toString();
    }

    /**
     * Class is intended for a storage of an information on an element of a table, row, column.
     * (Класс для хранения информации о элементе таблицы, ряде или колонке.)
     */
    public static class Item
    implements java.lang.Cloneable
    {
            // Start position of the element.  (Координата, с которой начинается элемент.)
        public int position = 0;
            // Real size in pixels. (Реальный размер в пикселах.)
        public int size = 0;
            // Value of a size. (Значение размера.)
        public double value = TableLayout.UNDEFINED_SIZE;
            // Flag of the visibility of an element. (Флаг того, является ли элемент видимым.)
        public boolean visible = true;

        public boolean isFixed()
        {
            return( value > 1F );
        }

        public boolean isPercentage()
        {
            return( value > 0.0 && value < 1.0 );
        }

        public boolean isUndefined()
        {
            return( value <= 0.0 );
        }

        public Object clone()
        throws CloneNotSupportedException
        {
            return super.clone();
        }

       /**
        * Returns an object as a string. (Возвращает строковое представление объекта.)
        *
        * @return String - the string (строка).
        */
        public String toString()
        {
            return( getClass().getName() + "[" + paramString() + "]" );
        }

       /**
        * Returns a string of parameters of an object. (Возвращает строку параметров объекта.)
        *
        * @return String - the string of parameters (строка параметров).
        */
        protected String paramString()
        {
            String ps = "";
            ps += ",value=" + value;
            ps += ",size=" + size;
            ps += ",visible=" + visible;
            return( ps );
        }
    }

    public static abstract class Cell
    {
        protected int row = -1;
        protected int col = -1;

        public int getRow()
        {
            return row;
        }

        public int getCol()
        {
            return col;
        }

       /**
        * Returns an object as a string. (Возвращает строковое представление объекта.)
        * @return String - the string (строка).
        */
        public String toString()
        {
            return( getClass().getName() + "[" + paramString() + "]" );
        }

       /**
        * Returns a string of parameters of an object. (Возвращает строку параметров объекта.)
        * @return String - the string of parameters (строка параметров).
        */
        protected String paramString()
        {
            StringBuffer ps = new StringBuffer();
            ps.append("row=" + row);
            ps.append(",col=" + row);
            return ps.toString();
        }
    }

    public static class RefCell extends Cell
    {
            // Reference to a cell. (Ссылка на ячейку.)
        protected CompCell ref;

        protected RefCell( CompCell ref )
        {
            this.ref = ref;
        }

        public CompCell getRef()
        {
            return ref;
        }

       /**
        * Returns a string of parameters of an object. (Возвращает строку параметров объекта.)
        * @return String - the string of parameters (строка параметров).
        */
        protected String paramString()
        {
            StringBuffer ps = new StringBuffer( super.paramString() );
            ps.append(",ref=" + ref);
            return ps.toString();
        }
    }

    /**
     * Class is intended for saving of an information on a cell.
     * (Класс для хранения информации о ячейке.)
     */
    public static class CompCell extends Cell
    {
            // Indents from margins of a cell. (Отступы от границ ячейки.)
        protected Insets padding = null;
            // Component pegged to a grid cell. (Компонент привязанный к ячейке сетки.)
        protected Component component = null;
            // Amount of cells occupied by a given cell on the horizontal. (Количество ячеек занимаемых данной ячейкой по горизонтали.)
        protected int colspan = 0;
            // Amount of cells occupied by a given cell on the vertical. (Количество ячеек занимаемых данной ячейкой по вертикали.)
        protected int rowspan = 0;

        protected CompCell( Component comp, Insets padding )
        {
            component = comp;
            this.padding = padding;
        }

        public Component getComponent()
        {
            return component;
        }

        public int getColSpan()
        {
            return colspan;
        }

        public int getRowSpan()
        {
            return rowspan;
        }

        public Insets getPadding()
        {
            return padding;
        }

       /**
        * Returns a string of object parameters. (Возвращает строку параметров объекта.)
        * @return - the string of parameters (строка параметров).
        */
        protected String paramString()
        {
            StringBuffer ps = new StringBuffer( super.paramString() );
            ps.append( "," + colspan + "x" + rowspan );
            if( padding != null )
            {
                ps.append( ",padding={" + padding.top +
                                    "," + padding.left +
                                    "," + padding.bottom +
                                    "," + padding.right + "}" );
            }
            ps.append( ",component=" + component);
            return ps.toString();
        }
    }
}
