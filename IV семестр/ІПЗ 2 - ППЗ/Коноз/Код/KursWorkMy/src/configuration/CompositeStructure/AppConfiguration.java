package configuration.CompositeStructure;

/**
 * ���� ����� ���������� ��'����, ���� ���� �������� ������������
 * �񳺿 ��������. ������� ������������ �������� ������� ������ ���� �
 * ������� ���������, �� ��� ��������� ������ ����� ��� ������������
 * ������� ������. �� ������������ ���� �������� ����������.
 * @author ����� ����� 
 */
public class AppConfiguration extends CompositeComponent {

	/**
	 * appConfig ������ ������ ��������� ��'���� {@link CompositeComponent}
	 */
	private static AppConfiguration appConfig;
	/**
	 * *{@value} composComp ������ � ��� ����� ���������� ���������, ���
	 * ���� ����������������� ��'����� {@link AppConfiguration}
	 */

	private static CompositeComponent composComp;

	/**
	 * ������ �����������
	 */
	private AppConfiguration() {

	}

	/**
	 * ����������, ���� � ����� ��������� ������ ��'���-�����
	 * ���������-������������.
	 * 
	 * @param comp
	 *            ����� ���������-������������
	 */
	private AppConfiguration(CompositeComponent comp) {
		composComp = comp;
	}

	/**
	 * ����� ���������� ����� �������� ������������. �� ������������� ��������
	 * �������� �����.
	 * 
	 * @param comp
	 *            ����� �������� ������������.
	 */
	public static void setAppConfiguration(CompositeComponent comp) {
		composComp = comp;
	}

	/**
	 * ��������� �����, ���� ������� ������ �� ������ ��'���
	 * {@link CompositeComponent}
	 * 
	 * @return ������ �� ��'��� {@link CompositeComponent}
	 */
	public static AppConfiguration getAppConfiguration() {
		if (appConfig == null) {
			appConfig = new AppConfiguration();
		}
		return appConfig;
	}

	/**
	 * ��������� �����, ���� ������ � ����� ��������� ����� ��������
	 * ������������ � ������� ������ �� ��'��� ���� {@link CompositeComponent},
	 * ���� ���������� �� �������� ��������.
	 * 
	 * @param comp
	 *            ����� �������� ������������.
	 * @return ������� ��'��� ���� {@link CompositeComponent}, ���� ����������
	 *         �� �������� ��������.
	 */
	public static AppConfiguration getAppConfiguration(CompositeComponent comp) {
		if (appConfig == null) {
			appConfig = new AppConfiguration(comp);
		}
		setAppConfiguration(comp);
		return appConfig;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see configuration.CompositeStructure.CompositeComponent#save()
	 */
	@Override
	public void save() {
		composComp.save();

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * configuration.CompositeStructure.CompositeComponent#load(java.lang.String
	 * )
	 */
	@Override
	public void load(String savePath) {
		composComp.load(savePath);

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see configuration.CompositeStructure.CompositeComponent#getPath()
	 */
	@Override
	public String getPath() {
		return composComp.getPath();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see configuration.CompositeStructure.CompositeComponent#getName()
	 */
	@Override
	public String getName() {
		return composComp.getName();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * configuration.CompositeStructure.CompositeComponent#getProperties(java
	 * .lang.String)
	 */
	@Override
	public CompositeComponent getProperties(String name) {
		return composComp.getProperties(name);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see configuration.CompositeStructure.CompositeComponent#addComponent(
	 * configuration.CompositeStructure.CompositeComponent)
	 */
	@Override
	public void addComponent(CompositeComponent comp) {
		composComp.addComponent(comp);

	}

}
