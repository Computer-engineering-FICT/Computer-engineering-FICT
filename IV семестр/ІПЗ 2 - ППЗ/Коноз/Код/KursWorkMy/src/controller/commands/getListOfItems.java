package controller.commands;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import javax.swing.JTable;
import javax.swing.ListSelectionModel;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import application.ContextUtils;
import application.MainFrame;
import application.Model.Catalog;
import application.Model.Catalog_has_Catalog;
import application.Model.Catalog_has_Goods;
import application.Model.Goods;
import controller.ContextForCommand;
import controller.Controller;
import controller.Factory.CommandFactory;
import controller.annotations.COMMAND;
import controller.annotations.CONTEXT;
import controller.annotations.PARAMETER;
import dao.FilterStub;
/**
 *  лас, €кий реал≥зуЇ команду виб≥рки товар≥в ≥ каталог≥в з заданого корен€.
 * @author  оноз јндр≥й 
 */
@COMMAND(key = CommandFactory.GET_LIST_OF_ITEM)
@CONTEXT(list = {
				@PARAMETER(key = "node", type = String.class),
				@PARAMETER(key = "proprietor", type = MainFrame.class)
				}
		)
public class getListOfItems extends Command{

	/**
	 * {@value} таблиц€ з новою ≥нформац≥Їю, €кою буде зам≥нена стара таблиц€ в головному в≥кн≥.
	 */
	JTable table;
	/* (non-Javadoc)
	 * @see controller.commands.Command#run()
	 */
	@Override
	public void run() {
		continfo = ContextUtils.loadContext("Service");
		String realnode;
		if(context.get("node").equals(continfo.get("Root"))){
			
			realnode = "Root";
		}else{
			realnode =(String) context.get("node");
		}
		((MainFrame) context.get("proprietor")).setTipForComponent("");
		try{
			boolean isStop = false;
			List<Goods> isenought = controller.dao.select(Goods.class, new FilterStub());
			
			for(Goods g : isenought){
				if(g.getName().equals(realnode)){
					
					isStop = true;
					break;
				}
			}

			if(!isStop)	{	
				List<Catalog_has_Catalog> result = new LinkedList<Catalog_has_Catalog>();
				String catalogNames [][];
				List<Catalog> catalogList = controller.dao.select(Catalog.class, new FilterStub());
				List<Catalog_has_Catalog> catHasCat = controller.dao.select(Catalog_has_Catalog.class, new FilterStub());
				int idRoot = 0;
				for (Catalog cat : catalogList){
					if (cat.getName().equals(realnode)){
						idRoot = cat.getId();
					}
				}
				for(Catalog_has_Catalog cat: catHasCat){
					if(cat.getCatalogId() == idRoot){
						result.add(cat);
					}
				}
				catalogNames = new String [result.size()][1];
				int i = 0;
				
				for(Catalog_has_Catalog cat: result){
					for(Catalog ob : catalogList){
						if(ob.getId() == cat.getCatalog2Id()){
							catalogNames[i][0] = ob.getName();
							i++;
						}
					}
				}
				
				if(catalogNames.length != 0){
					String names [] = {continfo.get("Directories")};
					table = new JTable(catalogNames, names);
					table.setFillsViewportHeight(true);
					table.getSelectionModel().setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
					if(realnode.equals("Root")){
						((MainFrame) context.get("proprietor")).setButtonsEnabled(true, false, false, false, false, false, true, false, false,false);
					}else{
						((MainFrame) context.get("proprietor")).setButtonsEnabled(true, true, false, false, false, false, true, true, false, false);
					}
						setTable();
					
				}else{
					i = 0;
					List<Catalog_has_Goods> catGoodsList = controller.dao.select(Catalog_has_Goods.class, new FilterStub());
					List<Goods> goodsList = controller.dao.select(Goods.class, new FilterStub());
					String matr [][];
					
						Iterator<Catalog_has_Goods> iter = catGoodsList.iterator();
						Catalog_has_Goods ob;
						while(iter.hasNext()){
							ob = iter.next();
							
							if (ob.getCatalogId() != idRoot){
								iter.remove();
							}
						}
						if(catGoodsList.size() == 0){
							table = new JTable();
							table.setFillsViewportHeight(true);
							((MainFrame) context.get("proprietor")).setButtonsEnabled(true, true, true, true, false, false, true, true, false,false);
							setTable();
						} else{
							matr = new String [catGoodsList.size()][4];
							for(Catalog_has_Goods g : catGoodsList){
									for(Goods goods : goodsList){
										if(g.getGoodsId() == goods.getId()){
											matr[i][0] = goods.getName();
											matr[i][1] = Integer.toString(goods.getPrice());
											matr[i][2] = Integer.toString(goods.getMark());
											matr[i][3] = Integer.toString(goods.getNumberOfgoods());
											i++;
											}
									
								}
							}
								String [] names = {continfo.get("NameOfGoods"),continfo.get("Price"),continfo.get("Popularity"),continfo.get("NumberOfGoods")};
								table = new JTable(matr, names);
								
								table.setFillsViewportHeight(true);
								table.getColumnModel()
								.getColumn(0).setPreferredWidth(350);
								table.getSelectionModel().setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
								table.setRowSelectionInterval(0, 0);
								((MainFrame) context.get("proprietor")).setButtonsEnabled(false, true, true, true, true, false, true, true, true, false);
								setTable();
						}
					}
					
				}
				
				
		
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
	}
	
	/**
	 * ћетод, €кий проводить зам≥ну таблиц≥ в головному в≥кн≥.
	 */
	private void setTable(){
		table.getSelectionModel().addListSelectionListener(new ListSelectionListener() {
			
			@Override
			public void valueChanged(ListSelectionEvent e) {
				int y = table.getSelectedRow();
				String node =(String) table.getValueAt(y, 0);
				ContextForCommand context = new ContextForCommand();
				context.put("node", node);
				context.put("proprietor", getListOfItems.this.context.get("proprietor"));
				Controller.getController().execute(context, CommandFactory.GET_LIST_OF_ITEM);
				
			}
		});
		
		((MainFrame) context.get("proprietor")).getTitleLabel().setText((String) context.get("node"));
		((MainFrame) context.get("proprietor")).getScrolPane().setViewportView(table);
	}
	
	

}
