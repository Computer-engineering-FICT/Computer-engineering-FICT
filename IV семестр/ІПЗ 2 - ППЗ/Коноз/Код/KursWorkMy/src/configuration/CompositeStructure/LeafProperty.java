package configuration.CompositeStructure;


import configuration.EditFactory.EditFactory;

/**
 * Клас реалізовує функціонал простого елементу композиту
 * @author Коноз Андрій 
 */
public class LeafProperty extends  CompositeComponent{
	
	/**
	 * {@value} Адреса збереженя файла.
	 */
	private String savePath; 
	
	/**
	 * Конструктор, який ініціалізує адресу збереження і назву елемента.
	 * @param savePath адреса збереження.
	 * @param name назва елемента.
	 */
	public LeafProperty(String savePath, String name){
		this.put("nameOfProperty", name);
		this.savePath = savePath;
	}
	/**
	 * Конструктор ініціалізує адресу збереження.
	 * @param savePath адреса збереження.
	 */
	public LeafProperty(String savePath){
		this.savePath = savePath;
	}
	/**
	 * Пустий конструктор.
	 */
	public LeafProperty(){
		
	}
	
	/* (non-Javadoc)
	 * @see configuration.CompositeStructure.CompositeComponent#getPath()
	 */
	public String getPath(){
		return savePath;
	}
	
	/* (non-Javadoc)
	 * @see configuration.CompositeStructure.CompositeComponent#save()
	 */
	public void save(){
		if(this.containsKey("Composite")){
			
		}else{
			this.put("Composite", "false");
			
		}
		EditFactory.save(this);
	}
	

	/* (non-Javadoc)
	 * @see configuration.CompositeStructure.CompositeComponent#load(java.lang.String)
	 */
	@Override
	public void load(String savePath) {
		this.savePath = savePath;
		LeafProperty temp =(LeafProperty) EditFactory.load(savePath);
		for(Object key : temp.keySet()){
			this.put(key, temp.getProperty((String) key));
		}
		
	}

	/* (non-Javadoc)
	 * @see configuration.CompositeStructure.CompositeComponent#getName()
	 */
	@Override
	public String getName() {
		return this.getProperty("nameOfProperty");
	}
	/* (non-Javadoc)
	 * @see configuration.CompositeStructure.CompositeComponent#getProperties(java.lang.String)
	 */
	@Override
	public CompositeComponent getProperties(String name) {
		CompositeComponent result;
		if (((String) this.get("nameOfProperty")).equals(name))
			result = this;
		else 
			result = null;
		return result;
	}
	/* (non-Javadoc)
	 * @see configuration.CompositeStructure.CompositeComponent#addComponent(configuration.CompositeStructure.CompositeComponent)
	 */
	@Override
	public void addComponent(CompositeComponent comp) {
		
		
	}

}
