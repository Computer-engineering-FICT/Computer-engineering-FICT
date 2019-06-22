package lab1.command;

import lab1.ServiceClass;
import lab1.Main.TypeOfBlock;

/**
 * Клас - реакція початку деякого блоку.
 * 
 * @author Dmytro Pogrebnjuk
 * 
 */
public class StartBlock implements Reaction {
	private String _name;
	private TypeOfBlock _type;

	/**
	 * @param name
	 *            ім"я реакції
	 * @param type
	 *            тип блоку, початок якого характеризує дана реакція.
	 */
	public StartBlock(String name, TypeOfBlock type) {
		_name = name;
		_type = type;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see lab1.command.Reaction#execute()
	 */
	@Override
	public void execute() throws Exception {
		if (ServiceClass.get_curBlock() == TypeOfBlock.condition) {
			if (_type.compareTo(TypeOfBlock.up) != 0
					/*& _type.compareTo(TypeOfBlock.down) != 0*/) {
				System.out.println(ServiceClass.get_curBlock());
				System.out.println(_type + " " + TypeOfBlock.up);
				throw new Exception("After condition must be UP");
			}
		}
		ServiceClass.set_curBlock(_type);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see lab1.command.Reaction#getName()
	 */
	@Override
	public String getName() {
		return _name;
	}

}
