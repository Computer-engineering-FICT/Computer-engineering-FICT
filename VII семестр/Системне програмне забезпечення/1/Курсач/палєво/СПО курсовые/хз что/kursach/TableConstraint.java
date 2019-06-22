package kursach;

import java.awt.Insets;

/**
 * Предназначен для создания установок для ячейки компоновщика TableLayout.
 * (Intended to create settings for a cell of a layout manager TableLayout.)
 */
public class TableConstraint implements Cloneable
{
        /** Номер колонки, по-умолчанию 0. (Column number. Default value is '0'.) */
    public int col = 0;
        /** Номер ряда, по-умолчанию 0. (Row number. Default value is '0'.) */
    public int row = 0;
        /** Количество занимаемых колонок, по-умолчанию 1. (Amount of occupied columns. Default value is '1'.) */
    public int colspan = 1;
        /** Количество занимаемых рядов, по-умолчанию 1. (Amount of occupied rows. Default value is '1'.) */
    public int rowspan = 1;
        /** Отступы от границ ячейки, по-умолчанию {0, 0, 0, 0}. (Padding of a cell. Default value is {0, 0, 0, 0}.) */
    public java.awt.Insets padding;

   /**
    * Конструктор. (Constructor.)
    */
    public TableConstraint()
    {
        this( new Insets( 0,0,0,0 ) );
    }

   /**
    * Конструктор. (Constructor.)
    *
    * @param padding отступы (insets).
    */
    public TableConstraint( Insets padding )
    {
        this( 0, 0, 1, 1, padding );
    }

   /**
    * Конструктор. (Constructor.)
    *
    * @param row ряд (row).
    * @param col колонка (column).
    */
    public TableConstraint( int row, int col )
    {
        this( row, col, 1, 1, new Insets( 0,0,0,0 ) );
    }

   /**
    * Конструктор. (Constructor.)
    *
    * @param row ряд (row).
    * @param col колонка (column).
    * @param padding отступы (insets).
    */
    public TableConstraint( int row, int col, Insets padding )
    {
        this( row, col, 1, 1, padding );
    }

   /**
    * Конструктор. (Constructor.)
    *
    * @param row ряд (row).
    * @param col колонка (column).
    * @param rowspan высота (количество занимаемых ячеек в высоту)
    *       (height - amount of occupied cells in height).
    * @param colspan ширина (количество занимаемых ячеек в ширину)
    *       (width - amount of occupied cells in width).
    */
    public TableConstraint( int row, int col, int rowspan, int colspan )
    {
        this( row, col, rowspan, colspan, new Insets( 0,0,0,0 ) );
    }

   /**
    * Конструктор. (Constructor.)
    *
    * @param row ряд (row).
    * @param col колонка (column).
    * @param rowspan высота (количество занимаемых ячеек в высоту)
    *       (height - amount of occupied cells in height).
    * @param colspan ширина (количество занимаемых ячеек в ширину)
    *       (width - amount of occupied cells in width).
    * @param padding отступы (insets).
    */
    public TableConstraint( int row, int col, int rowspan, int colspan, Insets padding )
    {
        this.padding = padding;
        this.col = col;
        this.row = row;
        this.colspan = colspan;
        this.rowspan = rowspan;
    }

   /**
    * Возвращает строковое представление объекта. (Returns an object as a string.)
    *
    * @return string
    */
    public String toString()
    {
        StringBuffer ps = new StringBuffer();

        ps.append( row );
        ps.append( ',' );
        ps.append( col );
        ps.append( ',' );
        ps.append( rowspan );
        ps.append( 'x' );
        ps.append( colspan );
        ps.append( ',' );
        ps.append( "padding=" );
        ps.append( '{' );
        ps.append( padding.top );
        ps.append( ',' );
        ps.append( padding.left );
        ps.append( ',' );
        ps.append( padding.bottom );
        ps.append( ',' );
        ps.append( padding.right );
        ps.append( '}' );

        return( getClass().getName() + "[" + ps.toString() + "]" );
    }
}
