package application.Model;

import dao.annotation.Primary;
import dao.annotation.Stored;
import dao.annotation.converter.intConverter;

/**
 * ���� ���� ������ ���� ����� ������� "CatalogHasCatalog" � ���� �����.
 * @author ����� ����� 
 */
@Stored(name="CATALOG_HAS_CATALOG")
public class Catalog_has_Catalog {

	/**
	 * {@value}�������� ����.
	 */
	@Primary
	@Stored(name="ID", converter= intConverter.class)
	private int id;
	/**
	 * {@value}�������� ���� ��������-������.
	 */
	@Stored(name="CATALOG_ID", converter = intConverter.class)
	private int catalogId;
	/**
	 * {@value}�������� ���� �������� � �����.
	 */
	@Stored(name="CATALOG_ID1", converter = intConverter.class)
	private int catalog2Id;
	
	
	
	/**
	 * ������ �����������.
	 */
	public Catalog_has_Catalog(){
		
	}
	
	/**
	 * �����������, ���� �������� �� ����.
	 * @param id ��������� ����.
	 * @param catalogId �������� ���� ��������-������.
	 * @param catalog2Id �������� ���� �������� � �����.
	 */
	public Catalog_has_Catalog(int id, int catalogId, int catalog2Id){
		this.id = id;
		this.catalogId = catalogId;
		this.catalog2Id = catalog2Id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCatalogId() {
		return catalogId;
	}
	public void setCatalogId(int catalogId) {
		this.catalogId = catalogId;
	}
	public int getCatalog2Id() {
		return catalog2Id;
	}
	public void setCatalog2Id(int catalog2Id) {
		this.catalog2Id = catalog2Id;
	}

}
