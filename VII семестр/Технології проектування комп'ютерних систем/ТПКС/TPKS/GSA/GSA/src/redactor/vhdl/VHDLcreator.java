package redactor.vhdl;

import redactor.gui.graph.mimimisation.KavaiForOneFunction;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


public class VHDLcreator {
    List<KavaiForOneFunction> listOfMimimi;
    String[] header;
    PreparatorForAnd3Form preparatorForAnd3Form;

    public VHDLcreator(List<KavaiForOneFunction> listOfMimimi, String[] header) {
        this.listOfMimimi = listOfMimimi;
        this.header = header;
        preparatorForAnd3Form = new PreparatorForAnd3Form(listOfMimimi, header);
    }

    public void writeToFile(final String path) throws IOException {
        preparatorForAnd3Form.prepareNodes();
        List<And3> listOfNodes = preparatorForAnd3Form.getListOfNodes();


        PrintWriter out = new PrintWriter(new FileOutputStream(path));
        out.println("entity MyEntity is\n" +
                "\tport (");

        for (int i = 4; i < header.length; i++) {
            String current = header[i];

            if (current.contains("T")) {
                out.println("\t\t" + current + " : out bit;");
                out.print("\t\tQ" + current.substring(1) + " : in bit");
                if (i < header.length - 1)
                    out.print(";");
                out.println();

            } else {
                if (current.contains("x") || current.contains("X")) {
                    out.println("\t\t" + current + " : in bit;");
                }
                else out.println("\t\t" + current + " : out bit;");
            }


        }

        out.println("\t);\n" + "end entity MyEntity;\n");
        out.println("");
        out.println("architecture MyArchitecture of MyEntity is");
        out.print("\tsignal ");
        for (int i = 0; i< listOfNodes.size()-1; i++){
            String temp = listOfNodes.get(i).getOutput();
            if (temp.contains("temp")) {
                out.print(temp);
                if (i< listOfNodes.size()-2)
                    out.print(",");
            }
        }
        out.println(" : bit;");
        out.println("begin");

        for (int i = 0; i< listOfNodes.size(); i++){
            And3 current = listOfNodes.get(i);
            out.print("\t" + current.getName() + ": process(");
            for (int k = 0; k<3; k++){
                String temp = current.getConcreteInput(k);
                if (temp != null){
                    if (temp.contains("!"))
                        out.print(temp.substring(1));
                    else out.print(temp);
                    if ((k<2) && (current.getConcreteInput(k+1) != null))
                        out.print(",");
                }

            }
            out.println(")");
            out.println("\tbegin");
            out.print("\t\t" + current.getOutput() + " <= ");

            String sequence = "";
            if (current.isOutputInverted())
                sequence += "not ";
            sequence+="(";

            for (int k = 0; k< 3; k++){
                String temp = current.getConcreteInput(k);
                if (temp != null){
                    if (temp.contains("!")) {
                        sequence += "not ";
                        sequence += temp.substring(1)+" ";
                    }

                    else
                        sequence += temp+" ";

                    if ((k<2) && (current.getConcreteInput(k+1) != null))
                        sequence += "and " ;
                    else sequence += ");" ;
                }

            }
            out.println(sequence);
            out.println("\tend process " + current.getName() + ";");
            out.println("");
        }

        out.println("end architecture MyArchitecture;") ;

        out.flush();
        out.close();
        System.out.println("write vhdl - OK");
    }


}
