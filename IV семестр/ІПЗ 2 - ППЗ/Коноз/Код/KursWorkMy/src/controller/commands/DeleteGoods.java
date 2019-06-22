package controller.commands;

import java.util.List;

import application.MainFrame;
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
 * Клас реалізовує інтерфейс {@link Command} для операції видалення товару.
 * @author Коноз Андрій.
 *
 */
@COMMAND(key = CommandFactory.DELETE_GOODS)
@CONTEXT(list = {
				@PARAMETER(key = "name", type = String.class),
				@PARAMETER(key = "proprietor", type = MainFrame.class)
				}
		)
public class DeleteGoods extends Command{

	
	/* (non-Javadoc)
	 * @see controller.commands.Command#run()
	 */
	@Override
	public void run() {
		try {
			List<Goods> goodsList;
			List<Catalog_has_Goods> catalogList;
			List<Comment> commentList;
			List<GoodsHasDescription> goodsDescrList;
			List<Description> descrList;
			int goodsId = 0;
			String name =(String) context.get("name");
			goodsList = controller.dao.select(Goods.class, new FilterStub());
			catalogList = controller.dao.select(Catalog_has_Goods.class, new FilterStub());
			commentList = controller.dao.select(Comment.class, new FilterStub());
			goodsDescrList = controller.dao.select(GoodsHasDescription.class, new FilterStub());
			descrList = controller.dao.select(Description.class, new FilterStub());
			for(Goods g : goodsList){
				if(g.getName().equals(name)){
					goodsId = g.getId();
				}
			}
			for(Catalog_has_Goods c: catalogList){
				if(c.getGoodsId() == goodsId){
					controller.dao.delete(c);
				}
			}
			
			for(Comment com : commentList){
				if(com.getGoodId() == goodsId){
					controller.dao.delete(com);
				}
			}
			for(GoodsHasDescription g : goodsDescrList){
				if(g.getGoodsId() == goodsId){
					controller.dao.delete(g);
					for(Description d : descrList){
						if(d.getId() == g.getDescriptionId()){
							controller.dao.delete(d);
						}
					}
				}
			}
			controller.dao.delete(new Goods(goodsId, 0, 0, 1, 0, ""));
			((MainFrame)context.get("proprietor")).refresh();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}



}
