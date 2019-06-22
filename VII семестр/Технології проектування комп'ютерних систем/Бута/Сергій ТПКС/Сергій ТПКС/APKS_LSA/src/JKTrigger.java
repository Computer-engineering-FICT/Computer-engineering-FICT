

public class JKTrigger {
	
	public static String getJSignal(int Qi, int Qi_plus_1) {
		if ((Qi == 0) & (Qi_plus_1 == 0)) {
			return "0";
		}
		if ((Qi == 0) & (Qi_plus_1 == 1)) {
			return "1";
		}
		if ((Qi == 1) & (Qi_plus_1 == 0)) {
			return "-";
		}
		if ((Qi == 1) & (Qi_plus_1 == 1)) {
			return "-";
		}
		return null;
	}
	
	public static String getKSignal(int Qi, int Qi_plus_1) {
		if ((Qi == 0) & (Qi_plus_1 == 0)) {
			return "-";
		}
		if ((Qi == 0) & (Qi_plus_1 == 1)) {
			return "-";	
		}
		if ((Qi == 1) & (Qi_plus_1 == 0)) {
			return "1";
		}
		if ((Qi == 1) & (Qi_plus_1 == 1)) {
			return "0";
		}
		return null;
	}
}
