package configuration.CompositeStructure;

import java.util.Hashtable;

import configuration.EditFactory.EditFactory;

/**
 * Клас реалізовує інтерфейс {@link CompositeComponent} для
 * об'єкта-композита.
 * @author Коноз Андрій 
 */
public class CompositePropery extends CompositeComponent{
	/**
	 * {@value} зберігає адресу, за якою буде записаний 
	 * об'єкт в разі виклику методу load().
	 */
	private String savePath;
	/**
	 * {@value}зберігає назву об'єкта.
	 */
	private String name;
	/**
	 * {@value}зберігає об'єкти, які агригуються даним об'єктом.
	 */
	private Hashtable<String, CompositeComponent> table = new Hashtable<>();
	
	/**
	 * Конструктор, який створює об'єкт з іменем і адресою збереження.
	 * @param savePath адреса збереження.
	 * @param name назва об'єкта.
	 */
	public CompositePropery(String savePath, String name){
		this.savePath = savePath;
		this.name = name;
	}
	/**
	 * Пустий конструктор, який створює  об'єкт без імені і без 
	 * адреси збереження. Зазвичай використовується для створення
	 * об'єктів, які будуть наповнені інформацією з файла.
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
