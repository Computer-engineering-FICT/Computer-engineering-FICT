package configuration.CompositeStructure;

import java.util.Hashtable;

import configuration.EditFactory.EditFactory;

/**
 * ���� �������� ��������� {@link CompositeComponent} ���
 * ��'����-���������.
 * @author ����� ����� 
 */
public class CompositePropery extends CompositeComponent{
	/**
	 * {@value} ������ ������, �� ���� ���� ��������� 
	 * ��'��� � ��� ������� ������ load().
	 */
	private String savePath;
	/**
	 * {@value}������ ����� ��'����.
	 */
	private String name;
	/**
	 * {@value}������ ��'����, �� ����������� ����� ��'�����.
	 */
	private Hashtable<String, CompositeComponent> table = new Hashtable<>();
	
	/**
	 * �����������, ���� ������� ��'��� � ������ � ������� ����������.
	 * @param savePath ������ ����������.
	 * @param name ����� ��'����.
	 */
	public CompositePropery(String savePath, String name){
		this.savePath = savePath;
		this.name = name;
	}
	/**
	 * ������ �����������, ���� �������  ��'��� ��� ���� � ��� 
	 * ������ ����������. �������� ��������������� ��� ���������
	 * ��'����, �� ������ �������� ����������� � �����.
	 */
	public CompositePropery(){
		
	}

	/* (non-Javadoc)
	 * @see configuration.CompositeStructure.CompositeComponent#addComponent(configuration.CompositeStructure.CompositeComponent)
	 */
	@Override
	public void addComponent(CompositeComponent comp){
		table.put(comp.getName(), comp);
	}
	/* (non-Javadoc)
	 * @see configuration.CompositeStructure.CompositeComponent#getProperties(java.lang.String)
	 */
	@Override
	public CompositeComponent getProperties(String name){
		CompositeComponent result = null;
		if (this.name.equals(name)){
			result = this;
		
		}else{
			for(String key : table.keySet()){
				result = table.get(key).getProperties(name);
				if (result != null){
					break;
				}
			}
		}
		return result;
		
	}
	/* (non-Javadoc)
	 * @see configuration.CompositeStructure.CompositeComponent#save()
	 */
	@Override
	public void save() {
		LeafProperty saveComp = new LeafProperty(savePath);
		saveComp.put("nameOfProperty", name);
		int i = 0;
		for(String key : table.keySet()){
			saveComp.put(Integer.toString(i), table.get(key).getPath());
			table.get(key).save();
			i++;
		}
		saveComp.put("Composite", "true");
		saveComp.save();
		
	}

	/* (non-Javadoc)
	 * @see configuration.CompositeStructure.CompositeComponent#load(java.lang.String)
	 */
	@Override
	public void load(String savePath) {
		this.savePath = savePath;
		LeafProperty temp = (LeafProperty) EditFactory.load(savePath);
		CompositeComponent ob;
		if (temp.get("Composite").equals("true")){
			name = temp.getName();
			temp.remove("nameOfProperty");
			temp.remove("Composite");
			for(Object key : temp.keySet()){
				ob = EditFactory.load(temp.getProperty((String) key));
				if (ob.getProperty("Composite").equals("true")){
					CompositePropery prop = new CompositePropery();
					prop.load(temp.getProperty((String) key));
					table.put(ob.getName(), prop);
				}else{
					table.put(ob.getName(), ob);
					ob.load(temp.getProperty((String) key));
				}
			}
			
			
		} else{
			temp.remove("Composite");
			table.put(temp.getName(), temp);
		}
	}

	/* (non-Javadoc)
	 * @see configuration.CompositeStructure.CompositeComponent#getPath()
	 */
	@Override
	public String getPath() {
		return savePath;
	}

	/* (non-Javadoc)
	 * @see configuration.CompositeStructure.CompositeComponent#getName()
	 */
	@Override
	public String getName() {
		return name;
	}

	

}
