package controller.commands;


import java.util.List;
import application.Model.Comment;
import application.Model.Description;
import application.Model.Goods;
import application.Model.GoodsHasDescription;
import application.Model.Profile;
import controller.Factory.CommandFactory;
import controller.annotations.COMMAND;
import controller.annotations.CONTEXT;
import controller.annotations.PARAMETER;
import dao.FilterStub;

/**
 * Клас реалізовує інтерфейс {@link Command} для операції відкриття детального перегляду товару.
 * @author Коноз Андрій.
 *
 */
@COMMAND(key = CommandFactory.OPEN_GOODS)
@CONTEXT(list = {
				@PARAMETER(key = "name", type = String.class),
				@PARAMETER(key = "proprietor", type = application.OpenGoods.class)
				}
		)
public class OpenGoods extends Command {

	/* (non-Javadoc)
	 * @see controller.commands.Command#run()
	 */
	@Override
	public void run() {
		try {
			
			List<Goods> goodsList = controller.dao.select(Goods.class, new FilterStub());
			List<GoodsHasDescription> goodsdescrList = controller.dao.select(GoodsHasDescription.class, new FilterStub());
			List<Comment> commentsList = controller.dao.select(Comment.class, new FilterStub());
			Goods goods = null;
			Description descr = null;
			String name = (String) context.get("name");
			for(Goods g: goodsList){
				if(g.getName().equals(name)){
					goods = g;
					break;
				}
			}
			for(Comment com: commentsList){
				if(com.getGoodId() != goods.getId()){
					controller.dao.delete(com);
				}
			}
			for(GoodsHasDescription g: goodsdescrList){
				if(g.getGoodsId() == goods.getId()){
					descr = (Description) controller.dao.read(Description.class, g.getDescriptionId());
					break;
				}
			}
			prepareContextAndSend(goods, descr, commentsList);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void prepareContextAndSend(Goods g, Description descr, List<Comment> commentList){
		StringBuffer comments = new StringBuffer("");
		try {
			if(commentList.size() != 0){
				comments.append("<html>");
				for (Comment comment : commentList) {
					comments.append("User: " + ((Profile) controller.dao.read(Profile.class, comment.getProfileId())).getLogin() + "<br>");
					comments.append(comment.getComment() + "<br><br>");
				}
		}
		
		((application.OpenGoods) context.get("proprietor")).setInformation(g, descr, comments.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	

}
