package application.Model;

import dao.annotation.Primary;
import dao.annotation.Stored;
import dao.annotation.converter.intConverter;

/**
 * Клас, який зберігає поля рядка таблиці "CatalogHasGoods" з бази даних.
 * @author Коноз Андрій 
 */
@Stored(name="CATALOG_HAS_GOODS")
public class Catalog_has_Goods {

	/**
	 * {@value} Основний ключ.
	 */
	@Primary
	@Stored(name="ID", converter = intConverter.class )
	private int id;
	/**
	 * {@value}Основний ключ товару.
	 */
	@Stored(name="GOODS_ID", converter = intConverter.class )
	private int goodsId;
	/**
	 * {@value} Основний ключ каталогу.
	 */
	@Stored(name="CATALOG_ID", converter = intConverter.class )
	private int catalogId;
	@Stored(name = "SHARE_ID", converter = intConverter.class)
	private int shareId;
	
	/**
	 * Пустий конструктор.
	 */
	public Catalog_has_Goods(){
		
	}
	
	/**
	 * Конструктор, який ініціалізує всі поля.
	 * @param id основний ключ.
	 * @param goodsId основний ключ  товару.
	 * @param catalogId основний ключ каталогу.
	 */
	public Catalog_has_Goods(int id, int goodsId, int catalogId, int shareId){
		this.id = id;
		this.goodsId = goodsId;
		this.catalogId = catalogId;
		this.shareId = shareId;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	public int getCatalogId() {
		return catalogId;
	}
	public void setCatalogId(int catalogId) {
		this.catalogId = catalogId;
	}

	public int getShareId() {
		return shareId;
	}

	public void setShareId(int shareId) {
		this.shareId = shareId;
	}

}
