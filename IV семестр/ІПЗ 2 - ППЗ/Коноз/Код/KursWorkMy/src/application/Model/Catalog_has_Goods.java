package application.Model;

import dao.annotation.Primary;
import dao.annotation.Stored;
import dao.annotation.converter.intConverter;

/**
 * ����, ���� ������ ���� ����� ������� "CatalogHasGoods" � ���� �����.
 * @author ����� ����� 
 */
@Stored(name="CATALOG_HAS_GOODS")
public class Catalog_has_Goods {

	/**
	 * {@value} �������� ����.
	 */
	@Primary
	@Stored(name="ID", converter = intConverter.class )
	private int id;
	/**
	 * {@value}�������� ���� ������.
	 */
	@Stored(name="GOODS_ID", converter = intConverter.class )
	private int goodsId;
	/**
	 * {@value} �������� ���� ��������.
	 */
	@Stored(name="CATALOG_ID", converter = intConverter.class )
	private int catalogId;
	@Stored(name = "SHARE_ID", converter = intConverter.class)
	private int shareId;
	
	/**
	 * ������ �����������.
	 */
	public Catalog_has_Goods(){
		
	}
	
	/**
	 * �����������, ���� �������� �� ����.
	 * @param id �������� ����.
	 * @param goodsId �������� ����  ������.
	 * @param catalogId �������� ���� ��������.
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
