package controller.commands;

import java.util.List;

import application.ContextUtils;
import application.MainFrame;
import application.Model.Catalog;
import application.Model.Catalog_has_Goods;
import application.Model.Description;
import application.Model.Goods;
import application.Model.GoodsHasDescription;
import controller.Factory.CommandFactory;
import controller.annotations.COMMAND;
import controller.annotations.CONTEXT;
import controller.annotations.PARAMETER;
import dao.FilterStub;
/**
 * Клас реалізовує інтерфейс {@link Command} для операції створення товару.
 * @author Коноз Андрій.
 *
 */
@COMMAND(key = CommandFactory.CREATE_GOODS)
@CONTEXT(list = {
				@PARAMETER(key = "catalog", type = String.class),
				@PARAMETER(key = "name", type = String.class),
				@PARAMETER(key = "manufactured", type = String.class),
				@PARAMETER(key = "count", type = Integer.class),
				@PARAMETER(key = "price", type = Integer.class),
				@PARAMETER(key = "description", type = String.class),
				@PARAMETER(key = "proprietor", type = MainFrame.class)
				}
		)
public class CreateGoods extends Command{
	
	/* (non-Javadoc)
	 * @see controller.commands.Command#run()
	 */
	@Override
	public void run() {
		List<Goods> goodsList;
		List<Catalog> catalogList;
		continfo = ContextUtils.loadContext("Service");
		int catalogId = -1;
		String name =(String) context.get("name");
		String manufactured =(String) context.get("manufactured");
		int count = ((Integer) context.get("count")).intValue();
		int price = ((Integer) context.get("price")).intValue();
		String description =(String) context.get("description");
	
		try{
			catalogList = controller.dao.select(Catalog.class, new FilterStub());
			goodsList = controller.dao.select(Goods.class, new FilterStub());
			for(Goods goods: goodsList){
				if(goods.getName().equals(name)){
					((MainFrame) context.get("proprietor")).setTipForComponent(continfo.get("GoodsError"));
					return;
				}
			}
			for(Catalog cat : catalogList){
				if(cat.getName().equals(name)){
					((MainFrame) context.get("proprietor")).setTipForComponent(continfo.get("CatalogGoodsError"));
					return;
				}
			}
			for(Catalog cat : catalogList){
				if(cat.getName().equals(context.get("catalog"))){
					catalogId = cat.getId();
					break;
				}
			}
			Description descrp = new Description(0, "", description, manufactured);
			Goods goods = new Goods(0, count, 0, 1, price, name);
			goods = controller.dao.insert(goods);
	    	controller.dao.insert(new Catalog_has_Goods(0, goods.getId(), catalogId, 1));
	    	descrp = controller.dao.insert(descrp);
			controller.dao.insert(new GoodsHasDescription(0, goods.getId(), descrp.getId()));
		}catch(Exception e){
			e.printStackTrace();
		}
		((MainFrame) context.get("proprietor")).refresh();
		
	}


}
