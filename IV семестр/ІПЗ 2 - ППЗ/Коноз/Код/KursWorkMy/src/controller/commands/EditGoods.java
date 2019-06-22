package controller.commands;

import java.util.List;

import application.ContextUtils;
import application.MainFrame;
import application.Model.Catalog;
import application.Model.Description;
import application.Model.Goods;
import controller.Factory.CommandFactory;
import controller.annotations.COMMAND;
import controller.annotations.CONTEXT;
import controller.annotations.PARAMETER;
import dao.FilterStub;
/**
 * Клас реалізовує інтерфейс {@link Command} для операції редагування товару.
 * @author Коноз Андрій.
 *
 */
@COMMAND(key = CommandFactory.EDIT_GOODS)
@CONTEXT(list = {
				@PARAMETER(key = "goods", type = Goods.class),
				@PARAMETER(key = "description", type = Description.class),
				@PARAMETER(key = "proprietor", type = MainFrame.class)
				}
		)
public class EditGoods extends Command{

	/* (non-Javadoc)
	 * @see controller.commands.Command#run()
	 */
	@Override
	public void run() {
		continfo = ContextUtils.loadContext("Service"); 
		try {
			int problemWithName = 0;
			int problemWithId  = 0;
			List<Goods> goodsList = controller.dao.select(Goods.class, new FilterStub());
			List<Description> descrList = controller.dao.select(Description.class, new FilterStub());
			List<Catalog> catList = controller.dao.select(Catalog.class, new FilterStub());
			
			for(Goods g: goodsList){
				if(g.getName().equals(((Goods) context.get("goods")).getName()))
					if(g.getId() != ((Goods) context.get("goods")).getId())
						problemWithName++;
			}
			for(Catalog cat: catList){
				if(cat.getName().equals(((Goods) context.get("goods")).getName())){
					problemWithName++;
				}
			}
			if(problemWithName != 0){
				((MainFrame) context.get("proprietor")).setTipForComponent(continfo.get("DublicateError"));
				return;
			}
			
			problemWithId = -1;
			for(Description d: descrList){
				if(d.getId() == ((Description) context.get("description")).getId())
					problemWithId++;
			}
			if(problemWithId != 0){
				((MainFrame) context.get("proprietor")).setTipForComponent(continfo.get("DublicateError"));
				return;
			}
			controller.dao.update((Goods) context.get("goods"));
			controller.dao.update((Description) context.get("description"));
	        ((MainFrame) context.get("proprietor")).refresh();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


}
