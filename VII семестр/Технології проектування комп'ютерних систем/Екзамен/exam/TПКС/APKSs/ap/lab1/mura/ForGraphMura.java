/**
 * 
 */
package lab1.mura;


/**
 * @author Dmytro Pogrebnjuk
 * 
 */
public class ForGraphMura {
	private Mura _toBlock;
	private String _condition;

	public ForGraphMura() {
		_condition = "";
		_toBlock = null;
	}

	/**
	 * @param toBlock
	 *            блок, на який йде з"єднання
	 * @param condition
	 *            умова, потрібна для переходу
	 */
	public ForGraphMura(Mura toBlock, String condition) {
		_toBlock = toBlock;
		_condition = condition;
	}
	/**
	 * @param condition the _condition to set
	 */
	public void set_condition(String condition) {
		_condition = condition;
	}
	/**
	 * @param toBlock the _toBlock to set
	 */
	public void set_toBlock(Mura toBlock) {
		_toBlock = toBlock;
	}
	
	/**
	 * @return the _condition
	 */
	public String get_condition() {
		return _condition;
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		String res = "";
		if (_condition != null && _condition.length() != 0) 
			res += "по умові " + _condition + " до ";
		String res2 = "";
		if (_toBlock == null) {
			res2 = "-";
		} else {
			res2 = "z" + String.valueOf(_toBlock.get_name());
		}
		return  "->" + res + res2;
	}
	/**
	 * @return the _toBlock
	 */
	public Mura get_toBlock() {
		return _toBlock;
	}
}
