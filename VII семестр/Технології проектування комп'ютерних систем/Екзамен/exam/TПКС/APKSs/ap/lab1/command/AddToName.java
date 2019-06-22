package lab1.command;

import lab1.Parser;
import lab1.ServiceClass;

/**
 * ���� - ������� �� ��������� �� ���� ������� ��������.
 * 
 * @author Dmytro Pogrebnjuk
 * 
 */
public class AddToName implements Reaction {
	private String _name;

	public AddToName(String name) {
		_name = name;
	}

	@Override
	public void execute() throws Exception {
		ServiceClass.addToName(Parser.getInstance().get_curToken());
	}

	@Override
	public String getName() {
		return _name;
	}

}
