package client;
import dao.DAOProxy;
import dao.MySqlDAO;
import domain.*;

public class Demo {

	public static void main(String[] args) throws ClassNotFoundException {
		
/*		Category userCat1 = new Category(1, "User");
		Category userCat2 = new Category(2, "Admin");

		User user1 = new User(1, "John Smith", userCat1);
		User user2 = new User(2, "Michael Jackson", userCat2);
		
		Message msg = new Message(1, "HELLO!", user1, user2);
		//msg.setText("BYE!");

		MySqlDAO.getDAO().create(userCat1);
		MySqlDAO.getDAO().create(userCat2);
		
		MySqlDAO.getDAO().create(user1);
		MySqlDAO.getDAO().create(user2);
		
		MySqlDAO.getDAO().create(msg);*/
		
/*		MySqlDAO.getDAO().delete(userCat2);	
		MySqlDAO.getDAO().delete(msg);
		MySqlDAO.getDAO().update(msg);*/
		
		//Message msg = MySqlDAO.getDAO().retrieve(Message.class, 2);
		Message msg = DAOProxy.getDAOProxy().retrieve(Message.class, 2);
		
		System.out.println(msg);
		
		//Category userCat1 = new Category(1, "User");
		//System.out.println(userCat1.getClass().getMethod(name, parameterTypes));
	}
}
