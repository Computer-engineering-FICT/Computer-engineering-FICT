package app.view;

import java.awt.BorderLayout;
import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JPanel;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;
import javax.swing.border.EmptyBorder;

@SuppressWarnings("serial")
/**
 * Клас що реалізує інтерфейс користувача для відображення списку товарів
 * @author Vova
 *
 */
public class OrderGoodsList extends JDialog {
	/**
	 * панель для елементів графічного інтерфейсу
	 */
	private final JPanel contentPanel = new JPanel();


	/**
	 * Конструктор вікна. Створює та відображає елементи графічного інтерфейсу користувача
	 */
	public OrderGoodsList() {
		setFont(Fonts.getFont());
		setResizable(false);
		setBounds(100, 100, 450, 300);
		getContentPane().setLayout(new BorderLayout());
		contentPanel.setLayout(new FlowLayout());
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		{
			JPanel buttonPane = new JPanel();
			buttonPane.setFont(Fonts.getFont());
			buttonPane.setLayout(new FlowLayout(FlowLayout.RIGHT));
			getContentPane().add(buttonPane, BorderLayout.SOUTH);
			{
				
				JButton okButton = new JButton(Languages.getProperty("okBtn"));
				buttonPane.add(okButton);
				okButton.setFont(Fonts.getFont());
				getRootPane().setDefaultButton(okButton);
			}
			{
				JButton cancelButton = new JButton(Languages.getProperty("cancelBtn"));
				cancelButton.setFont(Fonts.getFont());
				buttonPane.add(cancelButton);
				
			}
		}
	}
	/**
	 * Метод що встановлює стиль вікна
	 * @param className назва стилю
	 */
	public static void setStyle(String className){
		try {
			UIManager.setLookAndFeel(className);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedLookAndFeelException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
