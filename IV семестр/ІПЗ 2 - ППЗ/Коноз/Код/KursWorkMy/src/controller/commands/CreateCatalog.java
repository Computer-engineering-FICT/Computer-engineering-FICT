package controller.commands;

import java.util.List;
import application.ContextUtils;
import application.MainFrame;
import application.Model.Catalog;
import application.Model.Catalog_has_Catalog;
import controller.Factory.CommandFactory;
import controller.annotations.COMMAND;
import controller.annotations.CONTEXT;
import controller.annotations.PARAMETER;
import dao.FilterStub;

/**
 * Клас реалізовує інтерфейс {@link Command} для операції створення каталогу.
 * @author Коноз Андрій.
 *
 */
@COMMAND(key = CommandFactory.CREATE_CATALOG)
@CONTEXT(list = {
				@PARAMETER(key = "name", type = String.class),
				@PARAMETER(key = "proprietor", type = MainFrame.class)
				}
		)
public class CreateCatalog extends Command{


	/* (non-Javadoc)
	 * @see controller.commands.Command#run()
	 */
	@Override
	public void run() {
		continfo = ContextUtils.loadContext("Service");
		String rootName = ((MainFrame) context.get("proprietor")).getTitleLabel().getText();
		if(rootName.equals(continfo.get("Root"))){
			rootName = "Root";
		}
		try{
			List<Catalog> catalogList = controller.dao.select(Catalog.class, new FilterStub());
			for(Catalog cat : catalogList){
				if(cat.getName().equals(context.get("name"))){
					((MainFrame) context.get("proprietor")).setTipForComponent(continfo.get("CatalogError"));
					return;
				}
				
			}
			Catalog catalog = new Catalog(0,(String) context.get("name"));
			catalog = controller.dao.insert(catalog);
			
			for(Catalog cat : catalogList){
				if(cat.getName().equals(rootName))
					controller.dao.insert(new Catalog_has_Catalog(0, cat.getId(), catalog.getId()));
			}
			((MainFrame) context.get("proprietor")).refresh();
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
