package automat.functions;

class BoolFunction {

    private static final String AND = "and";
    private static final String OR = "or";
    private static final String NAND = "nand";
    private static final String NOR = "nor";
    private static final String NOT = "not";

    public static String getBoolFunctionString(int f) {
        String result = "";
        switch (f) {
            case 0: {
                result = AND;
                break;
            }
            case 1: {
                result = OR;
                break;
            }
            case 2: {
                result = NAND;
                break;
            }
            case 3: {
                result = NOR;
                break;
            }
            case 4: {
                result = NOT;
                break;
            }
        }
        return result;
    }

}
