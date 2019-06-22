package redactor.vhdl;

/**
 * Created by IntelliJ IDEA.
 * User: Nightingale
 * Date: 11/24/12
 * Time: 7:26 PM
 * To change this template use File | Settings | File Templates.
 */
public class And3 {
    private String name;
    private String[] input;
    private String output;
    private boolean outputInverted = false;
    
    public And3(){
        input = new String[3];
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setConcreteInput(int index, String value){
        input[index] = value;
    }

    public boolean isOutputInverted() {
        return outputInverted;
    }

    public void setOutputInverted(boolean outputInverted) {
        this.outputInverted = outputInverted;
    }


    public String getOutput() {
        return output;
    }

    public void setOutput(String output) {
        this.output = output;
    }

    
    public int returnFreeInput(){
        if (input[0] == null)
            return 0;
        if (input[1] == null)
            return 1;
        if (input[2] == null)
            return 2;

        return -1;
    }

    public String getConcreteInput(int index){
        return input[index];
    }
}
