package line_graphics;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.File;
import java.util.ArrayList;
import java.util.Random;

import javax.swing.AbstractAction;
import javax.swing.JColorChooser;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import javax.swing.event.TableModelEvent;
import javax.swing.event.TableModelListener;
import javax.swing.filechooser.FileFilter;

/**
 * Класс по обработке всех возникающих событий и
 * действий
 * @author Бредюк Евгений Владимирович
 * ИО - 73
 * septemberfalltirael@yahoo.com
 * 
 */
public class DActions implements TableModelListener, MouseListener {
	/**
	 * Промежуточный обработчик события закрытия главной формы, отсылает к
	 * closeAction.
	 */
	WindowAdapter closeEditor = new WindowAdapter() {
		public void windowClosing(WindowEvent e) {
			exitAction.actionPerformed(null);
		}
	};

	/**
	 * Создание нового Файла(File\Create)
	 */
	AbstractAction create = new AbstractAction("Create") {
		private static final long serialVersionUID = 862012205645646L;

		public void actionPerformed(ActionEvent event) {
			act.tv.removeAllPoint();
			act.editor.setTitle("Diagram(graphics) ---->  " + start_name);
			act.editor.table.revalidate();
			isChange = false;
		}
	};

	/**
	 * Осуществляет открытие файла (File\Open)
	 */
	AbstractAction openAction = new AbstractAction("Open") {
		/**
		 * 
		 */
		private static final long serialVersionUID = 1L;

		public void actionPerformed(ActionEvent event) {
			JFileChooser chooser = new JFileChooser();
			final ExtensionFileFilter filter = new ExtensionFileFilter();
			filter.addExtension(".csv");
			filter.setDescription("Файлы CSV");
			chooser.setCurrentDirectory(new File("."));
			chooser.setFileFilter(filter);
			int result = chooser.showOpenDialog(editor);
			if (result == JFileChooser.APPROVE_OPTION) {
				curr_name = chooser.getSelectedFile().getAbsolutePath();
				try {
					tv.openFromCSV(curr_name);
					act.editor
							.setTitle("Diagram(graphics) ---->  " + curr_name);
				} catch (InputException e) {
					String mes = e.getMessage();
					JOptionPane.showMessageDialog(act.editor, (Object) mes,
							"!!!Error while opening file!!!",
							JOptionPane.INFORMATION_MESSAGE);
				}
			}
			act.editor.dd.setZoom();
			act.editor.table.revalidate();
			isChange = false;
		}
	};

	/**
	 * Осуществляет сохранение текущего файла (File\Save)
	 */
	AbstractAction save = new AbstractAction("Save") {
		/**
		 * 
		 */
		private static final long serialVersionUID = 65165465454L;

		public void actionPerformed(ActionEvent event) {
			if (curr_name == start_name) {
				save_as.actionPerformed(event);
			} else {
				tv.saveToCSV(curr_name);
			}
		}
	};

	/**
	 * Осуществляет сохранение файла с возможным изменением его имени (File\Save as...)
	 */
	AbstractAction save_as = new AbstractAction("Save as...") {
		/**
		 * 
		 */
		private static final long serialVersionUID = 65165165465465L;

		public void actionPerformed(ActionEvent event) {
			// System.out.println("Save");
			JFileChooser chooser = new JFileChooser();
			final ExtensionFileFilter filter1 = new ExtensionFileFilter();
			filter1.addExtension(".jpg");
			filter1.setDescription("JPEG");
			final ExtensionFileFilter filter2 = new ExtensionFileFilter();
			filter2.addExtension(".csv");
			filter2.setDescription("CSV");
			chooser.setCurrentDirectory(new File("."));
			chooser.addChoosableFileFilter(filter1);
			chooser.addChoosableFileFilter(filter2);
			int result = chooser.showSaveDialog(editor);
			if (result == JFileChooser.APPROVE_OPTION) {
				if (chooser.getFileFilter() == filter2) {
					curr_name = chooser.getSelectedFile().getAbsolutePath()
							+ ".csv";
					tv.saveToCSV(curr_name);
					act.editor
							.setTitle("Diagram(graphics) ---->  " + curr_name);
				}
				;
				if (chooser.getFileFilter() == filter1) {
					editor.dd.saveToJPG(chooser.getSelectedFile()
							.getAbsolutePath()
							+ ".jpg");
				}
				;
			}
		}
	};

	/**
	 * Закрывает приложение
	 */
	AbstractAction exitAction = new AbstractAction("Exit") {
		/**
		 * 
		 */
		private static final long serialVersionUID = 8620122010485892306L;

		public void actionPerformed(ActionEvent event) {
			System.exit(0);
		}
	};

	/**
	 * Добавляет точку
	 */
	AbstractAction addPoint = new AbstractAction("Add point") {
		/**
		 * 
		 */
		private static final long serialVersionUID = -2892057024200312614L;

		public void actionPerformed(ActionEvent event) {
			try {
				int numSelRow = editor.table.getSelectedRow();
				Point newRow = new Point();
				if ((numSelRow < 0) || (numSelRow >= tv.size())) {
					numSelRow = tv.size();
					newRow.setX(Math.random());
					newRow.setY(Math.random());
				} else {
					newRow.setX(tv.getPoint(numSelRow).getX());
					newRow.setY(tv.getPoint(numSelRow).getY());
				}
				tv.addPoint(numSelRow, newRow);
				editor.dd.setSelectedPoint(numSelRow);
				editor.dd.setZoom();
				act.editor.table.revalidate();
			} catch (Exception err) {
				System.out.println("Error");
				err.printStackTrace();
			}
		}
	};

	/**
	 * Удаляет точку
	 */
	AbstractAction removePoint = new AbstractAction("Delete point") {
		/**
		 * 
		 */
		private static final long serialVersionUID = 651465457984L;

		public void actionPerformed(ActionEvent event) {
			try {
				int numSelRow = editor.table.getSelectedRow();
				if ((numSelRow >= 0) && (numSelRow < tv.size())) {
					tv.removePoint(editor.table.getSelectedRow());
					act.editor.table.revalidate();
					editor.dd.setZoom();
				}
			} catch (Exception err) {
				System.out.println("Error");
				err.printStackTrace();
			}
		}
	};

	/**
	 * Сканируем изменение модели данных. Обновляем в связи с этим текущую
	 * точку на диаграмме, в таблице 
	 * 
	 * @see javax.swing.event.TableModelListener#tableChanged(javax.swing.event.TableModelEvent)
	 */
	public void tableChanged(TableModelEvent arg0) {
		act.editor.dd.setZoom();
		if (arg0.getColumn() != -1) {
			act.editor.dd.setSelectedPoint(arg0.getFirstRow());
			act.editor.table.setRowSelectionInterval(arg0.getFirstRow(), arg0
					.getFirstRow());
		}
		isChange = true;
	}

	/**
	 * Название файла по умолчанию.
	 */
	private static String start_name = "untiteled.csv";

	/**
	 * Текущее имя файла.
	 */
	private static String curr_name = "untiteled.csv";

	/**
	 * Экземпляр DActions.
	 */
	public static DActions act = new DActions();

	/**
	 * Экземпляр TableView.
	 */
	public TableView tv;

	/**
	 * Экземпляр главной формы FinalGraphicsEditor.
	 */
	public FinalGraphicsEditor editor;

	/**
	 * Редактирование данных.
	 */
	private boolean isChange = false;

	/**
	 * 
	 * Создается пустая диаграмма.
	 * 
	 * @param args
	 */
	public static synchronized void main(final String[] args) {
		act.tv = new TableView();
		act.editor = new FinalGraphicsEditor("Diagram(graphics) ---->  "
				+ start_name, act);
		act.editor.dd.setIsPaint(true);
		act.tv.addTableModelListener(act);
	}

	/**
	 * При щелчке на диаграмме устанавливает
	 * текущую точку на экране по
	 * выделенной строке таблицы(реализация обратной связи)
	 * 
	 * @see java.awt.event.MouseListener#mouseClicked(java.awt.event.MouseEvent)
	 */
	public void mouseClicked(MouseEvent e) {
		if (e.getComponent().equals(editor.table)) {
			int row[] = editor.table.getSelectedRows();
			if ((row != null) && (row[0] != -1)) {
				editor.dd.setSelectedPoint(row[0]);
			}
			return;
		}
		;
		if (e.getComponent().equals(editor.dd)) {
			int row = editor.dd.getSelectedPoint();
			if (row != -1) {
				act.editor.table.setRowSelectionInterval(row, row);
			}
			return;
		}
	}

	/**
	 * (non-Javadoc)
	 * 
	 * @see java.awt.event.MouseListener#mouseEntered(java.awt.event.MouseEvent)
	 */
	public void mouseEntered(MouseEvent e) {
	}

	/**
	 * (non-Javadoc)
	 * 
	 * @see java.awt.event.MouseListener#mouseExited(java.awt.event.MouseEvent)
	 */
	public void mouseExited(MouseEvent e) {
	}

	/**
	 * (non-Javadoc)
	 * 
	 * @see java.awt.event.MouseListener#mousePressed(java.awt.event.MouseEvent)
	 */
	public void mousePressed(MouseEvent e) {
	}

	/**
	 * (non-Javadoc)
	 * 
	 * @see java.awt.event.MouseListener#mouseReleased(java.awt.event.MouseEvent)
	 */
	public void mouseReleased(MouseEvent e) {
	}
}
