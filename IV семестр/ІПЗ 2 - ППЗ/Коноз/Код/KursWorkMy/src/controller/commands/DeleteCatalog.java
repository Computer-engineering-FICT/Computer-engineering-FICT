package controller.commands;

import java.util.List;

import application.ContextUtils;
import application.MainFrame;
import application.Model.Catalog;
import application.Model.Catalog_has_Catalog;
import application.Model.Catalog_has_Goods;
import application.Model.Comment;
import application.Model.Description;
import application.Model.Goods;
import application.Model.GoodsHasDescription;
import controller.Factory.CommandFactory;
import controller.annotations.COMMAND;
import controller.annotations.CONTEXT;
import controller.annotations.PARAMETER;
import dao.FilterStub;
/**
 * Клас реалізовує інтерфейс {@link Command} для операції видалення каталогу.
 * @author Коноз Андрій.
 *
 */
@COMMAND(key = CommandFactory.DELETE_CATALOG)
@CONTEXT(list = {
				@PARAMETER(key = "name", type = String.class),
				@PARAMETER(key = "proprietor", type = MainFrame.class)
				}
		)
public class DeleteCatalog extends Command{
	
	/* (non-Javadoc)
	 * @see controller.commands.Command#run()
	 */
	@Override
	public void run() {
		continfo = ContextUtils.loadContext("Service");
		try{
			
			List<Catalog> catalogList = controller.dao.select(Catalog.class, new FilterStub());
			if (catalogList.size() != 0){
				Catalog cat = null;
				for(Catalog c : catalogList){
					if (context.get("name").equals(c.getName())){
						cat = c;
						break;
					}
				}
				List<Catalog_has_Goods> catHasGoodsList = controller.dao.select(Catalog_has_Goods.class, new FilterStub());
				List<Catalog_has_Catalog> catHasCatList = controller.dao.select(Catalog_has_Catalog.class, new FilterStub());
				for(Catalog_has_Goods g : catHasGoodsList){
					if(g.getCatalogId() == cat.getId()){
						
						Goods goods = new Goods(g.getGoodsId(), 0, 0, 0, 0, "");
						controller.dao.delete(g);
						deleteGoods(g.getGoodsId());
						controller.dao.delete(goods);
						
					}
				}
				for(Catalog_has_Catalog g : catHasCatList){
					if(g.getCatalog2Id() == cat.getId()){
						controller.dao.delete(g);
					}
					
				}
				controller.dao.delete(cat);
				
			}else{
				((MainFrame) context.get("proprietor")).getTitleLabel().setText(continfo.get("DeleteError"));
				
			}
			((MainFrame) context.get("proprietor")).refresh(continfo.get("Root"));
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * Метод видаляє товар за заданим індентифікатором.
	 * @param id індентифікатор товару.
	 */
	private void deleteGoods(int id){
		try{
			List<GoodsHasDescription> goodsHasDescrList = controller.dao.select(GoodsHasDescription.class, new FilterStub());
			List<Comment> commentList = controller.dao.select(Comment.class, new FilterStub());
			for(Comment com : commentList){
				if(com.getGoodId() == id){
					controller.dao.delete(com);
				}
			}
			for(GoodsHasDescription g : goodsHasDescrList){
				if(g.getGoodsId() == id){
					controller.dao.delete(g);
					deleteDescription(g.getDescriptionId());
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * Метод видаляє опис за заданим індентифікатором опису.
	 * @param id індентифікатор опису.
	 */
	private void deleteDescription(int id){
		try {
			List<Description> descriptionList = controller.dao.select(Description.class, new FilterStub());
			for(Description d : descriptionList){
				if(d.getId() == id){
					controller.dao.delete(d);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
