package controller.commands;

import java.util.List;

import application.ContextUtils;
import application.MainFrame;
import application.Model.Catalog;
import controller.Factory.CommandFactory;
import controller.annotations.COMMAND;
import controller.annotations.CONTEXT;
import controller.annotations.PARAMETER;
import dao.FilterStub;
/**
 * Клас реалізовує інтерфейс {@link Command} для операції редагування каталогу.
 * @author Коноз Андрій.
 *
 */
@COMMAND(key = CommandFactory.EDIT_CATALOG)
@CONTEXT(list = {
				@PARAMETER(key = "name", type = String.class),
				@PARAMETER(key = "proprietor", type = MainFrame.class)
				}
		)
public class EditCatalog extends Command{

	/* (non-Javadoc)
	 * @see controller.commands.Command#run()
	 */
	@Override
	public void run() {
		continfo = ContextUtils.loadContext("Service"); 
		try {
			List<Catalog> catalogList = controller.dao.select(Catalog.class, new FilterStub());
			for(Catalog cat : catalogList){
				if(cat.getName().equals(context.get("name"))){
					((MainFrame) context.get("proprietor")).setTipForComponent(continfo.get("CatalogError"));
					return;
				}
			}
			String newName =(String) context.get("name");
			String oldName =(String) ((MainFrame) context.get("proprietor")).getTitleLabel().getText();
			for(Catalog c : catalogList){
				if(c.getName().equals(oldName)){
					c.setName(newName);
					controller.dao.update(c);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		((MainFrame) context.get("proprietor")).refresh();
	}

	

}
