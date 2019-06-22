package line_graphics;

import java.awt.BorderLayout;
import java.awt.Cursor;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Color;
import java.awt.Image;

import java.awt.event.KeyEvent;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;
import java.awt.image.BufferedImage;
import java.awt.image.PixelGrabber;
import java.io.FileOutputStream;
import java.math.BigDecimal;
import java.math.RoundingMode;

import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JRootPane;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JToolBar;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

/**
 * Класс реализует отрисовку диаграммы
 * на основе модели данных 
 * TableView.
 * @author Бредюк Егений Владимирович
 * ИО - 73
 * septemberfalltirael@yahoo.com
 */
class DPainter extends JComponent implements MouseListener,
    MouseMotionListener {
  /**
   * 
   */
  private static final long serialVersionUID = -3833025795344674068L;
  /**
   * Цвет меток.
   */
  private Color table_element_col = Color.BLACK;
  /**
   * Цвет линий.
   */
  private Color lineColor = Color.BLACK;
  /**
   * Цвет фона.
   */
  private Color foneColor = Color.WHITE;
  /**
   * Цвет точек.
   */
  private Color pointColor = Color.BLACK;
  /**
   * Цвет выбранной точки.
   */
  private Color selectedPointColor = Color.PINK;
  /**
   * Цвет сетки.
   */
  private Color gridColor = Color.black;
  /**
   * Номер выбранной точки.
   */
  private int selectedPoint = -1;
  /**
   * Возвращает текущую выбраную точку.
   * @return номер точки
   */
  public int getSelectedPoint() {
    return selectedPoint;
  }
  /**
   * Координата верхнего угла
   */
  private int top_value;
  /**
   * Координата верхнего угла 
   */
  private int graphicLeft;
  /**
   * Вспомогательная переменная.
   */
  private boolean isDown = false;
  /**
   * Вспомогательная переменная.
   */
  private int lastX;
  /**
   * Вспомогательная переменная.
   */
  private int lastY;
  /**
   * Координаты при выделении точки.
   */
  private int firstX;
  /**
   * Координаты при выделении точки.
   */
  private int firstY;
  /**
  Вспомогательная переменная.
   */
  private int numNewPoint;
  /**
   * Ширина графика.
   */
  private int wight;
  /**
   * Высота области графика.
   */
  private int height;
  /**
   * Масштабный коефициент 
   */
  private double zoomX;
  /**
   * Масштабный коефициент
   */
  private double zoomY;
  /**
   * Округление.
   */
  private double maxX;
  /**
   * Округление.
   */
  private double maxY;
  /**
   * Округление.
   */
  private double minX;
  /**
   * Округление.
   */
  private double minY;
  /**
   * Число линий сетки.
   */
  private int numLinesX = 10;
  /**
   * Число линий сетки.
   */
  private int numLinesY = 10;
  /**
   * Размер точек.
   */
  private int pointSize = 2;
  /**
   * Параметр округления
   */
  private final int UP = 0;
  /**
   * Параметр округления
   */
  private final int DOWN = 1;
  /**
   * Модель данных TableView,
   */
  private TableView points;
  /**
   * Графический буфер диаграммы.
   */
  private Image mImg = null;
  /**
   * Статус рисования. Указывает
   */
  private boolean isPaint = false;
  /**
   * Было ли начато перемещение точки.
   */
  private boolean isMoving = false;
  /**
   * Конструктор.
   * 
   * @param points
   *            - модель данных
   */
  public DPainter(final TableView points) {
    this.points = points;
    addMouseListener(this);
    addMouseMotionListener(this);
    setBackground(Color.ORANGE);
  }
  /**
   * Устанавливает размер и координаты диаграммы.
   * @param x - координата x
   * @param y - координата y
   * @param width - ширина
   * @param height - высота
   * 
   */
  public void setBounds(int x, int y, int width, int height){
    super.setBounds(x, y, width, height);
    setZoom();
  }
  /**
   * Устанавливает значение размеров
   * диаграммы, производит масштабирование,
   * когда новый размер отличается
   * от предыдущего.
   * @param x - координата верхнего левого угла
   * @param y - координата верхнего левого угла
   * 
   * @param newDiagramW
   *            - ширина
   * @param newDiagramH
   *            - высота
   * @return результат масштабирования
   * (было ли проведено)
   */
  public boolean setDiagramWH(int x, 
      int y,
      final int newDiagramW,
      final int newDiagramH) {
    if ((getWidth() != newDiagramW) 
        || (getHeight() != newDiagramH)) {
      setBounds(x, y, newDiagramW, newDiagramH);
      setZoom();
      return true;
    } else {
      repaint();
      return false;
    }
  }
  /**
   * Устанавливает текущую
   * выделенную точку.
   * Вызывает перерисовку буфера
   * изображения и вывод его на экран
   * 
   * @param point
   *            - индекс выделенной точки
   */
  public void setSelectedPoint(final int point) {
    selectedPoint = point;
    drawDiagram();
    repaint();
  }
  /**
   * Преобразовывает текущее значение
   * в условных единицах в значение
   * координаты в пикселах.
   * 
   * @param x - значение координаты в
   * условных единицах
   * @return значение в пикселах
   */
  private double xToPixDoubleX(final double x) {
    return (x - minX) * zoomX + graphicLeft;
  }
  /**
   * Преобразовывает текущее значение
   * в условных единицах в значение
   * координаты в пикселах.
   * 
   * @param y - значение координаты в
   * условных единицах
   * @return значение в пикселах
   */
  private double yToPixDoubleY(final double y) {
    return top_value + height - (y - minY) * zoomY;
  }
  /**
   * Преобразовывает текущую координату
   * в пикселах значение координаты
   * 
   * @param x
   *            - значение координаты в пикселах
   * @return значение в условных единицах
   * измерения
   */
  private double PixXToDoubleX(final double x) {
    return (x - graphicLeft) / zoomX + minX;
  }
  /**
   * Преобразовывает текущую координату
   * в пикселах 
   * 
   * @param y - значение координаты в пикселах
   * @return значение в условных единицах
   * измерения
   */
  private double PixYToDoubleY(final double y) {
    return (top_value + height - y) / zoomY + minY;
  }
  /**
   * Устанавливает параметры масштаба
   * диаграммы 
   */
  public final void setZoom() {
    maxX = getTruncVal(getMaxX(), UP);
    maxY = getTruncVal(getMaxY(), UP);
    minX = getTruncVal(getMinX(), DOWN);
    minY = getTruncVal(getMinY(), DOWN);
    double dX = Math.abs(maxX - minX);
    double dY = Math.abs(maxY - minY);
    wight = (int) (getWidth() * 0.7);
    height = (int) (getHeight() * 0.8);
    graphicLeft = (int) (getWidth() * 0.2);
    top_value = (int) (getHeight() * 0.1);
    if ((dX != 0) && (dY != 0)) {
      zoomX = (double) (wight) / dX;
      zoomY = (double) (height) / dY;
    } else {
      zoomX = 0;
      zoomY = 0;
    }
    drawDiagram();
    repaint();
  }
  /**
   * Устанавливает статус отрисовки.
   * 
   * @param newState
   *            - новый статус
   */
  public void setIsPaint(final boolean newState) {
    isPaint = newState;
    if (isPaint) {
      setZoom();
      drawDiagram();
    }
    repaint();
  }
  /**
   * Рисует в области диаграммы ее изображение,
   */
  public void paint(final Graphics g) {
    if ((isPaint) && (mImg != null)) {
      g.drawImage(mImg, 0, 0, null);
    } else {
      super.paint(g);
    }
  }

  /**
   * Рисует точку XOR цветом в графический
   * буфер диаграммы.
   * 
   * @param pixX
   *            - координата x в пикселах
   * @param pixY
   *            - координата y в пикселах
   * @param stateXOR - указывает следует ли
   *  выводить изображение. Употребляется для
   *  устранения мерцания, когда
   *  производится стирание точки
   *  (рисование поверх) флаг
   *  ставится в false, тоесть точка как бы
   *  не пропадает на экране
   */
  public void drawXORPoint(final int pixX,
      final int pixY, final boolean stateXOR) {
    Graphics gImg = mImg.getGraphics();
    gImg.setXORMode(Color.white);
    gImg.fillRect(pixX - pointSize, pixY - pointSize, 2 * pointSize,
        2 * pointSize);
    if ((mImg != null) && (stateXOR)) {
      getGraphics().drawImage(mImg, 0, 0, null);
    }
  }
  /**
   * Рисует в данном графическом
   * сетку
   * 
   * @param g - графический контекст
   */
  private void drawGrid(final Graphics g) {
    double masX = (double) wight / numLinesX;
    double masY = (double) height / numLinesY;
    double stepX = (double) (maxX - minX) / numLinesX;
    double stepY = (double) (maxY - minY) / numLinesY;
    for (int i = numLinesY; i >= 0; i--) {
      g.setColor(gridColor);
      g.drawLine(graphicLeft, (int) (i * masY + top_value),
          (int) (numLinesX * masX + graphicLeft),
          (int) (i * masY + top_value));
      g.setColor(table_element_col);
      g.drawString(Double.valueOf(truncToTwoDigit(maxY - stepY * i))
          .toString(), (int) (0.05 * getWidth()),
          (int) (i * masY + top_value));
    }
    for (int i = 0; i < (numLinesX + 1); i++) {
      g.setColor(gridColor);
      g.drawLine((int) (i * masX + graphicLeft), top_value, (int) (i
          * masX + graphicLeft),
          (int) (numLinesY * masY + top_value));
      g.setColor(table_element_col);
      g.drawString(Double.valueOf(truncToTwoDigit(stepX * i + minX))
          .toString(), (int) (i * masX + graphicLeft),
          (int) (0.95 * getHeight()));
    }
  }

  /**
   * Рисует в данном графическом
   * контексте точки диаграммы
   * последовательно
   * соединенные отрезками, при условии,
   * что количество точек <> 0.
   * 
   * @param g - графический контекст
   */
  private void drawPoints(final Graphics g) {
    if (points.size() != 0) {
      int px, py, cx, cy;
      px = (int) xToPixDoubleX(points.getPoint(0).getX());
      py = (int) yToPixDoubleY(points.getPoint(0).getY());
      for (int i = 1; i < points.size(); i++) {
        cx = (int) xToPixDoubleX(points.getPoint(i).getX());
        cy = (int) yToPixDoubleY(points.getPoint(i).getY());
        g.setColor(lineColor);
        g.drawLine(px, py, cx, cy);
        px = cx;
        py = cy;
      }
      g.setColor(pointColor);
      // прорисовка точек
      for (int i = 0; i < points.size(); i++) {
        px = (int) xToPixDoubleX(points.getPoint(i).getX());
        py = (int) yToPixDoubleY(points.getPoint(i).getY());
        g.fillRect(px - pointSize, py - pointSize, 2 * pointSize,
            2 * pointSize);
      }
      for (int i = 0; i < points.size(); i++) {
        if (i == selectedPoint) {
          g.setColor(selectedPointColor);
          px = (int) xToPixDoubleX(points.getPoint(selectedPoint)
              .getX());
          py = (int) yToPixDoubleY(points.getPoint(selectedPoint)
              .getY());
          g.fillRect(px - pointSize, py - pointSize, 2 * pointSize,
              2 * pointSize);
        }
      }

    }
  }

  /**
   * Отрисовывает фон графической
   * области диаграммы в данном графическом
   * контексте.
   * 
   * @param g
   *            - графический контекст
   */
  private void drawFone(final Graphics g) {
    g.setColor(foneColor);
    g.fillRect(graphicLeft, top_value, wight, height);
  }

  /**
   * Отрисовывает диаграмму в буфере,
   * позиционирует диаграмму
   * и устанавливает размер.
   */
  public void drawDiagram() {
    if (isPaint) {
      Graphics gImg = null;
      Dimension dmImg = null;
      Dimension dm = getSize();
      int wndWidth = dm.width;
      int wndHeight = dm.height;
      if (((dmImg == null)
          || (dmImg.width != wndWidth)
          || (dmImg.height != wndHeight))
          && (wndWidth != 0)
          && (wndHeight != 0)) {
        dmImg = new Dimension(wndWidth, wndHeight);
        mImg = createImage(wndWidth, wndHeight);
        gImg = mImg.getGraphics();
        try {
          drawFone(gImg);
          drawGrid(gImg);
          drawPoints(gImg);
        } catch (Exception e) {
          e.printStackTrace();
          System.out.println("Массив чисел пуст");
        }
      }
    }
  }

  /**
   * Возвращает максимальное значение X,
   * если данные пусты, то результат 0.
   * 
   * @return максимум X
   */
  public double getMaxX() {
    if (points.size() != 0) {
      double max = points.getPoint(0).getX();
      for (int i = 1; i < points.size(); i++) {
        double cur = points.getPoint(i).getX();
        if (max < cur) {
          max = cur;
        }
      }
      return max;
    } else {
      return 0;
    }
  }

  /**
   * Возвращает максимальное значение Y,
   * если данные пусты результат 0.
   * 
   * @return максимум Y
   */
  public double getMaxY() {
    if (points.size() != 0) {
      double max = points.getPoint(0).getY();
      for (int i = 1; i < points.size(); i++) {
        double cur = points.getPoint(i).getY();
        if (max < cur) {
          max = cur;
        }
      }
      return max;
    } else {
      return 0;
    }
  }

  /**
   * Возвращает минимальное значение X,
   * если данные пусты результат 0.
   * 
   * @return минимум X
   */
  public double getMinX() {
    if (points.size() != 0) {
      double min = points.getPoint(0).getX();
      for (int i = 1; i < points.size(); i++) {
        double cur = points.getPoint(i).getX();
        if (min > cur) {
          min = cur;
        }
      }
      return min;
    } else {
      return 0;
    }
  }

  /**
   * Возвращает минимальное значение Y,
   * если данные пусты результат 0.
   * 
   * @return минимум Y
   */
  public double getMinY() {
    if (points.size() != 0) {
      double min = points.getPoint(0).getY();
      for (int i = 1; i < points.size(); i++) {
        double cur = points.getPoint(i).getY();
        if (min > cur) {
          min = cur;
        }
      }
      return min;
    } else {
      return 0;
    }
  }

  /**
   * Производит округление действительного
   * значения до 2 значащих цифр, ко
   * второй цифре добавляет 2.
   * Например 6548.5451 округлится до 6700.
   * 
   * @param x - исходное число
   * @param ptr - параметр округления 
   * @return округленное число
   */
  private double getTruncVal(double x, int ptr) {
    boolean sing = false;
    if (x < 0) {
      sing = true;
      x = -x;
    }
    if (x != 0) {
      int p = (int) Math.log10(x);
      if (p < 0) {
        p--;
      }
      BigDecimal bd = new BigDecimal(x);
      bd = bd.movePointLeft(p);
      bd = bd.setScale(1, RoundingMode.HALF_UP);
      switch (ptr) {
      case UP: {
        if (sing) {
          bd = bd.subtract(new BigDecimal(0.2));
        } else {
          bd = bd.add(new BigDecimal(0.2));
        }
        break;
      }
      case DOWN: {
        if (sing) {
          bd = bd.add(new BigDecimal(0.2));
        } else {
          bd = bd.subtract(new BigDecimal(0.2));
        }
        break;
      }
        default:
          break;
      }
      bd = bd.movePointRight(p);
      if (sing) {
        bd = bd.negate(); 
      }
      return bd.doubleValue();
    } else {
      return 0; 
    }
  }
 
  /**
   * Округлить до двух значащих цифр
   * @param x - действительное число
   * @return округленное число
   */
  public double truncToTwoDigit(double x) {
    boolean sing = false;
    if (x < 0) {
      sing = true;
      x = -x;
    }
    if (x != 0) {
      int p = (int) Math.log10(x);
      BigDecimal bd = new BigDecimal(x);
      bd = bd.movePointLeft(p);
      bd = bd.setScale(2, RoundingMode.HALF_UP);
      bd = bd.movePointRight(p);
      if (sing)
        bd = bd.negate();
      return bd.doubleValue();
    } else
      return 0;
  }

  /**
   * Обработка нажатия мыши.
   * 
   * @param e
   *            - событие
   */
  public void mousePressed(final MouseEvent e) {
    numNewPoint = findPoint(e.getX(), e.getY());
    if (numNewPoint != -1) {
      setSelectedPoint(numNewPoint);
      isDown = true;
      isMoving = false;
      firstX = e.getX();
      firstY = e.getY();
    } else
      setSelectedPoint(-1);
  }

  /**
   * Завершение процесса перетаскивания точки.
   * @see java.awt.event.MouseListener#mouseReleased(java.awt.event.MouseEvent)
   */
  public void mouseReleased(MouseEvent e) {
    if ((isDown)&&(isMoving)) {
      isDown = false;
      isMoving = false;
      try {
        points.getPoint(numNewPoint).setX(PixXToDoubleX(e.getX()));
        points.getPoint(numNewPoint).setY(PixYToDoubleY(e.getY()));
      } catch (NullPointerException err){
        err.printStackTrace();
      }
      setZoom();
    } else isDown = false;
  }

  /** (non-Javadoc)
   * @see java.awt.event.MouseListener#mouseEntered(java.awt.event.MouseEvent)
   */
  public void mouseEntered(MouseEvent e) {}

  /** (non-Javadoc)
   * @see java.awt.event.MouseListener#mouseExited(java.awt.event.MouseEvent)
   */
  public void mouseExited(MouseEvent e) {}

  /**
   * (non-Javadoc)
   * @see java.awt.event.MouseListener#mouseClicked(java.awt.event.MouseEvent)
   */
  public void mouseClicked(MouseEvent e) {}
  
  /**
   * Процес перетаскивания точки.
   * @see java.awt.event.MouseMotionListener#mouseDragged(java.awt.event.MouseEvent)
   */
  public void mouseDragged(MouseEvent e) {
    if (isDown) {
      int newX = e.getX();
      int newY = e.getY();
      if (!isMoving) {
        int dx = Math.abs(newX-firstX);
        int dy = Math.abs(newY-firstY);
        if ((dx > pointSize / 2)
            || (dy > pointSize / 2)) {
          isMoving = true;
          lastX = e.getX();
          lastY = e.getY();
          drawXORPoint(e.getX(), e.getY(), true);
        }
      } else {
        drawXORPoint(lastX, lastY, false);
        drawXORPoint(newX, newY, true);
        lastX = e.getX();
        lastY = e.getY();       
      }
    }
  }

  /**
   * Перемещение мыши. 
   * @see java.awt.event.MouseMotionListener#mouseMoved(java.awt.event.MouseEvent)
   */
  public void mouseMoved(MouseEvent e) {
    if (findPoint(e.getX(), e.getY()) != -1) {
      setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
    } else
      setCursor(Cursor.getDefaultCursor());
  }

  /**
   * Выполняет поиск точки по заданным координатам
   * 
   * @param pixX
   *            - координата X в пикселах
   * @param pixY
   *            - координата Y в пикселах
   * @return номер точки или -1, если точка не найдена. Нумерация точек с
   *         нуля.
   */
  private int findPoint(int pixX, int pixY) {
    int res = -1;
    for (int i = 0; i < points.size(); i++) {
      double pointPixX = xToPixDoubleX(points.getPoint(i).getX());
      double pointPixY = yToPixDoubleY(points.getPoint(i).getY());
      if (((pointPixX - pointSize < pixX) && (pixX < pointPixX
          + pointSize))
          && ((pointPixY - pointSize < pixY) && (pixY < pointPixY
              + pointSize))) {
        res = i;
      }
    }
    return res;
  }
  /**
   * Сохраняет изображение диаграммы, как картинку.
   * @param filename - имя файла
   */
  public void saveToJPG(String filename){

    BufferedImage bimg = null;
    int w = mImg.getWidth(null);
    int h = mImg.getHeight(null);
    int [] pixels = new int[w * h];
    PixelGrabber pg = new PixelGrabber(mImg,0,0,w,h,pixels,0,w);
    try { 
      pg.grabPixels(); 
    } 
    catch(InterruptedException ie) { 
      ie.printStackTrace();
    }

    bimg = new BufferedImage(w,h,BufferedImage.TYPE_INT_RGB);
    bimg.setRGB(0,0,w,h,pixels,0,w);

    try{
      FileOutputStream fos = new FileOutputStream(filename);
      JPEGImageEncoder jpeg = JPEGCodec.createJPEGEncoder(fos);
      jpeg.encode(bimg);
      fos.close();    
    }
    catch (Exception e) {
      e.printStackTrace();
    }
  }
}

/**
 * Панель,
 * которая содержит меню, кнопки,
 * информационную панель и диаграмму.
 * @author Бредюк Евегний Владимирович
 * ИО - 73
 * septemberfalltirael@yahoo.com
 */
public final class FinalGraphicsEditor extends JFrame {
  /**
   * 
   */
  private static final long serialVersionUID = -4666522506690498389L;
  /**
   * Минимальный размер.
   */
  private Dimension mini = new Dimension(550, 400);
  /**
   * Размер таблицы по умолчанию.
   */
  private Dimension tableDimension = new Dimension(150,100);
  /**
   * Стартовый размер.
   */
  private Dimension startDimension = new Dimension(600, 430);
  /**
   * Таблица данных, элемент формы.
   */
  public JTable table;
  /**
   * Скрол бар для таблицы.
   */
  public JScrollPane tableScrollPane;
  /**
   * Ссылка на экземпляр класса DPainter,
   * рисующего диаграмму на экране.
   */
  public DPainter dd;
  /**
   * Кнопка добавить точку.
   */
  private JButton btnAdd = new JButton("+");
  /**
   * Кнопка удалить точку.
   */
  private JButton btnSub = new JButton("-");
  
  /**
   * Ссылка на экземпляр DiagramProcessor,
   * предоставляющего логику программы.
   */
  DActions act;

  /**
   * Конструктор.
   * @param s - Название формы
   * @param act - DActions управляющий логикой
   */
  @SuppressWarnings("deprecation")
  public FinalGraphicsEditor(String s, DActions act) {
    super(s);
    this.act = act;
    setSize(startDimension);
    setMinimumSize(mini);
      setUndecorated(true);
      getRootPane().setWindowDecorationStyle(JRootPane.FRAME);
    setLayout(new BorderLayout());
    dd = new DPainter(act.tv);
    table = new JTable(act.tv);
    tableScrollPane = new JScrollPane(table);
    btnSub.addActionListener(act.removePoint);
    table.addMouseListener(act);
    dd.addMouseListener(act);
    addWindowListener(act.closeEditor);
    createMenu();
    tableScrollPane.setPreferredSize(new Dimension(150,100));
    add(dd, BorderLayout.CENTER);
    add(tableScrollPane, BorderLayout.WEST);
    show();
  }
  /**
   * Процедура создает многоуровневое
   * главное меню и привязывает
   * его к методам класса
   * DActions.
   */
  private void createMenu() {
  // создание меню
    JMenuBar menubar = new JMenuBar();
    JMenu menuFile = new JMenu("File...");
    menuFile.setMnemonic(KeyEvent.VK_A);
    menuFile.add(act.create);
    menuFile.add(act.openAction);
    menuFile.addSeparator();
    menuFile.add(act.save);
    menuFile.add(act.save_as);
    menuFile.addSeparator();
    menuFile.add(act.exitAction);
    menubar.add(menuFile);
// дейстыия над точками
    JMenu menuPoint = new JMenu("Point actions...");
    menuPoint.setMnemonic(KeyEvent.VK_N);
    menuPoint.add(act.addPoint);
    menuPoint.add(act.removePoint);
    menubar.add(menuPoint);
    setJMenuBar(menubar);
  }
}
