package com.gui;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.Image;
import java.awt.Toolkit;
import java.util.ArrayList;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JSplitPane;
import javax.swing.JTabbedPane;
import javax.swing.SwingConstants;
import javax.swing.SwingUtilities;
import javax.swing.UIManager;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;

import com.main.AppSettings;
import com.main.Main;

/**
 * Клас головного вікна.
 *
 * @author Куцовол Віктор
 */

public class MainFrame extends JFrame {
    /**
     * serialVersionUID.
     */
    private static final long serialVersionUID = -6097807245108559922L;

    /**
     * Масив моделей діаграм.
     */
    private ArrayList<DiagramModel> models = new ArrayList<DiagramModel>();

    /**
     * Поточна модель діаграми.
     */
    private DiagramModel currentModel;

    /**
     * Панель таблиці.
     */
    private TablePanel tablePanel;

    /**
     * Панель діаграми.
     */
    private DiagramPanel diagramPanel;

    /**
     * Панель вкладок.
     */
    private JTabbedPane jtp;

    /**
     * Дія, що відкриває файл у новій вкладці.
     */
    private OpenAction openInNewTabAction;

    /**
     * Дія, що відкриває файл у поточній вкладці.
     */
    private OpenAction openInCurrentTabAction;

    /**
     * Дія, що закриває файл.
     */
    private CloseAction closeAction;

    /**
     * Дія, що закриває усі файли.
     */
    private CloseAction closeAllAction;

    /**
     * Дія, що виконує закриття програми.
     */
    private ExitAction exitAction;

    /**
     * Дія, що виконує додавання нового рядка перед поточним.
     */
    private AddNewRowAction addNewRowBeforeAction;

    /**
     * Дія, що виконує додавання нового рядка після поточного.
     */
    private AddNewRowAction addNewRowAfterAction;

    /**
     * Дія, що виконує видалення рядка.
     */
    private RemoveRowAction removeRowAction;

    /**
     * Дія, що виконує зберігання у цьому ж файлі.
     */
    private SaveAction saveAction;

    /**
     * Дія, що виконує зберігання в іншому файлі.
     */
    private SaveAction saveAsAction;

    /**
     * Дія, що виконує створення нового файлу.
     */
    private NewFileAction newFileAction;

    /**
     * Дія, що виконує зберігання діагрми у файлі формату JPEG.
     */
    private SaveDiagramAsImageAction saveDiagramAsImageAction;

    /**
     * Дія, що виконує зміну стилю вікна.
     */
    private ChangeLookAndFeelAction changeLookAndFeelAction;

    /**
     * Дія, що виконує зміну відокремлювача CSV файлу.
     */
    private ChangeDelimiterAction changeDelimiterAction;

    /**
     * Конструктор.
     */
    public MainFrame() {
        final double heightPercent = 0.9;
        final double widthPercent = 0.9;
        Toolkit kit = Toolkit.getDefaultToolkit();
        Dimension screenSize = kit.getScreenSize();
        int screenHeight = screenSize.height;
        int screenWidth = screenSize.width;
        setSize((int) (screenWidth * widthPercent),
                (int) (screenHeight * heightPercent));
        Image img = kit.getImage(Main.class.getResource("img/main.png"));
        setIconImage(img);

        try {
            UIManager.setLookAndFeel((String) AppSettings.getInstance().get(
                    "LookAndFeel"));
            SwingUtilities.updateComponentTreeUI(this);
        } catch (Exception ex) {
            System.out.println("Помилка встановлення стилю");
            JOptionPane.showOptionDialog(this, "Помилка встановлення стилю",
                    "Помилка", JOptionPane.CLOSED_OPTION,
                    JOptionPane.ERROR_MESSAGE, null, null, null);
        }

        currentModel = null;
        openInNewTabAction = new OpenAction(this,
                "Відкрити файл у новій вкладці...", true);
        openInCurrentTabAction = new OpenAction(this, "Відкрити файл...",
                false);
        closeAction = new CloseAction(this, "Закрити", false);
        closeAllAction = new CloseAction(this, "Закрити все", true);
        exitAction = new ExitAction(this, "Вихід");
        saveAction = new SaveAction(this, "Зберегти", false);
        saveAsAction = new SaveAction(this, "Зберегти як...", true);
        addNewRowAfterAction = new AddNewRowAction(this,
                "Додати новий після даного", true);
        addNewRowBeforeAction = new AddNewRowAction(this,
                "Додати новий перед даним", false);
        removeRowAction = new RemoveRowAction(this, "Видалити");
        newFileAction = new NewFileAction(this, "Новий");
        saveDiagramAsImageAction = new SaveDiagramAsImageAction(this,
                "Зберегти діаграму як зображення...");
        changeLookAndFeelAction = new ChangeLookAndFeelAction(this,
                "Змінити стиль...");
        changeDelimiterAction = new ChangeDelimiterAction(this,
                "Змінити відокремлювач CSV файлу...");

        setLayout(new BorderLayout());
        setJMenuBar(new DiagramViewerMenu(this));
        add(new DiagramViewerToolBar(this), BorderLayout.NORTH);
        diagramPanel = new DiagramPanel(this);
        tablePanel = new TablePanel(this);
        jtp = new JTabbedPane(SwingConstants.TOP, JTabbedPane.
                SCROLL_TAB_LAYOUT);
        jtp.addChangeListener(new ChangeListener() {
            public void stateChanged(final ChangeEvent e) {
                if (jtp.getSelectedIndex() == -1) {
                    currentModel = null;
                } else {
                    currentModel = models.get(jtp.getSelectedIndex());
                    diagramPanel.setModel(currentModel);
                    tablePanel.setModel(currentModel);
                    JSplitPane jsp = new JSplitPane(
                            JSplitPane.HORIZONTAL_SPLIT, true, new JScrollPane(
                                    tablePanel), diagramPanel);
                    jtp.setComponentAt(jtp.getSelectedIndex(), jsp);
                    if (currentModel.getTable()[0].length == 1) {
                        removeRowAction.setEnabled(false);
                    } else {
                        removeRowAction.setEnabled(true);
                    }
                }
            }
        });
        add(jtp);
        setExtendedState(JFrame.MAXIMIZED_BOTH);
    }

    /**
     * Повертає поточну модель.
     *
     * @return поточну модель діаграми
     */
    public final DiagramModel getCurrentModel() {
        return currentModel;
    }

    /**
     * Встановлює поточну модель діаграми.
     *
     * @param model
     *            поточна модель діаграми
     */
    public final void setCurrentModel(final DiagramModel model) {
        currentModel = model;
    }

    /**
     * Повертає масив моделей діаграми.
     *
     * @return масив моделей діаграми
     */
    public final ArrayList<DiagramModel> getModels() {
        return models;
    }

    /**
     * Повертає панель таблиці.
     *
     * @return панель таблиці
     */
    public final TablePanel getTablePanel() {
        return tablePanel;
    }

    /**
     * Повертає панель діаграми.
     *
     * @return панель діаграми
     */
    public final DiagramPanel getDiagramPanel() {
        return diagramPanel;
    }

    /**
     * Повертає панель вкладок.
     *
     * @return панель вкладок
     */
    public final JTabbedPane getJtp() {
        return jtp;
    }

    /**
     * Повертає дію, що відкриває файл у новій вкладці.
     *
     * @return дію, що відкриває файл у новій вкладці
     */
    public final OpenAction getOpenInNewTabAction() {
        return openInNewTabAction;
    }

    /**
     * Повертає дію, що відкриває файл у поточній вкладці.
     *
     * @return дію, що відкриває файл у поточній вкладці
     */
    public final OpenAction getOpenInCurrentTabAction() {
        return openInCurrentTabAction;
    }

    /**
     * Повертає дію, що закриває файл.
     *
     * @return дію, що закриває файл
     */
    public final CloseAction getCloseAction() {
        return closeAction;
    }

    /**
     * Повертає дію, що закриває усі файли.
     *
     * @return дію, що закриває усі файли
     */
    public final CloseAction getCloseAllAction() {
        return closeAllAction;
    }

    /**
     * Повертає дію, що виконує закриття програми.
     *
     * @return дію, що виконує закриття програми
     */
    public final ExitAction getExitAction() {
        return exitAction;
    }

    /**
     * Повертає дію, що виконує додавання нового рядка перед поточним.
     *
     * @return дію, що виконує додавання нового рядка перед поточним
     */
    public final AddNewRowAction getAddNewRowBeforeAction() {
        return addNewRowBeforeAction;
    }

    /**
     * Повертає дію, що виконує додавання нового рядка після поточного.
     *
     * @return дію, що виконує додавання нового рядка після поточного.
     */
    public final AddNewRowAction getAddNewRowAfterAction() {
        return addNewRowAfterAction;
    }

    /**
     * Повертає дію, що виконує видалення рядка.
     *
     * @return дію, що виконує видалення рядка
     */
    public final RemoveRowAction getRemoveRowAction() {
        return removeRowAction;
    }

    /**
     * Повертає дію, що виконує зберігання у цьому ж файлі.
     *
     * @return дію, що виконує зберігання у цьому ж файлі
     */
    public final SaveAction getSaveAction() {
        return saveAction;
    }

    /**
     * Повертає дію, що виконує зберігання в іншому файлі.
     *
     * @return дію, що виконує зберігання в іншому файлі
     */
    public final SaveAction getSaveAsAction() {
        return saveAsAction;
    }

    /**
     * Повертає дію, що виконує створення нового файлу.
     *
     * @return дію, що виконує створення нового файлу
     */
    public final NewFileAction getNewFileAction() {
        return newFileAction;
    }

    /**
     * Повертає дію, що виконує зберігання діагрми у файлі формату JPEG.
     *
     * @return дію, що виконує зберігання діагрми у файлі формату JPEG
     */
    public final SaveDiagramAsImageAction getSaveDiagramAsImageAction() {
        return saveDiagramAsImageAction;
    }

    /**
     * Повертає дію, що виконує зміну стилю вікна.
     *
     * @return дію, що виконує зміну стилю вікна
     */
    public final ChangeLookAndFeelAction getChangeLookAndFeelAction() {
        return changeLookAndFeelAction;
    }

    /**
     * Повертає дію, що виконує зміну відокремлювача CSV файлу.
     *
     * @return дію, що виконує зміну відокремлювача CSV файлу
     */
    public final ChangeDelimiterAction getChangeDelimiterAction() {
        return changeDelimiterAction;
    }

}
