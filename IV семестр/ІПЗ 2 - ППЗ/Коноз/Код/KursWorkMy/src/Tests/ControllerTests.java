package Tests;

import static org.junit.Assert.*;

import org.junit.Test;

import application.Autorization;

import controller.ContextForCommand;
import controller.Factory.CommandFactory;
import controller.Validator.Validator;
import controller.commands.Command;

public class ControllerTests {

	@Test
	public void commandFactoryTest() {
		ContextForCommand context = new ContextForCommand();
		context.put("login", "andriy");
		context.put("password", "1234");
		context.put("proprietor", new Autorization());
		Command com = CommandFactory.getCommand("Autorization");
		com.setContext(context);
		com.run();
		
	}
	
	@Test
	public void Validatortest() {
		ContextForCommand context = new ContextForCommand();
		context.put("login", "andriy");
		context.put("password", "1234");
		context.put("proprietor", new Autorization());
		Command com = CommandFactory.getCommand("Autorization");
		assertTrue(Validator.isValid(com, context));
	}
	
	@Test
	public void getListOfitemtest() {
		fail("Not yet implemented");
	}
	
	@Test
	public void ewtest() {
		fail("Not yet implemented");
	}
	
	@Test
	public void eqtest() {
		fail("Not yet implemented");
	}

}
