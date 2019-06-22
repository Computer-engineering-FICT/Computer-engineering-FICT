package _try;
import java.io.*;
import java.util.*;

public class DoProcessBuilder {
  public static void main(String args[]) throws IOException {
    //args[0] = "cmd";
	args = new String[3];
	args[0] = "cmd";
	args[1] = "/c";
//	args[2] = "d:\\bp\\BIN\\ASD\\bpc d:\\bp\\BIN\\ASD\\asd";
//	args[2] = "bpc asd";
	File file = null;
	if ((file = new File("d:\\bp\\BIN\\ASD\\ASD.exe")).exists()) {
		file.delete();
	}
	/*args[2] = "bpc asd";
	ProcessBuilder pb = new ProcessBuilder(args);
	pb.directory(new File("d:\\bp\\BIN\\ASD"));
	Process process = pb.start();
	args[2] = "asd";
    pb = new ProcessBuilder(args);
    pb.directory(new File("d:\\bp\\BIN\\ASD"));
    process = pb.start();
    InputStream is = process.getInputStream();
    InputStreamReader isr = new InputStreamReader(is);
    BufferedReader br = new BufferedReader(isr);
    String line;
//    System.out.printf("Output of running %s is:\n",
//       Arrays.toString(args));
    while ((line = br.readLine()) != null) {
      System.out.println(line);
    }*/
	Runtime runtime = Runtime.getRuntime();
	args[2] = "bpc asd";
	runtime = Runtime.getRuntime();
	Process process = runtime.exec(args,null,new File("d:\\bp\\BIN\\ASD"));
	InputStream is = process.getInputStream();
    InputStreamReader isr = new InputStreamReader(is);
    BufferedReader br = new BufferedReader(isr);
    String line;
    /*if (br.readLine() != null) {
    	System.out.println("Compiled.");
    }*/
    System.out.printf("Output of running %s is:\n",
        Arrays.toString(args));
    while ((line = br.readLine()) != null) {
      System.out.println(line);
//      System.out.println("A");
    }
//    args = new String[2];
//    args[0] = "cmd";
    args[2] = "asd";
    process = runtime.exec(args,null,new File("d:\\bp\\BIN\\ASD"));
    is = process.getInputStream();
    isr = new InputStreamReader(is);
    br = new BufferedReader(isr);
    System.out.printf("Output of running " + file + ":\n");
    while ((line = br.readLine()) != null) {
      System.out.println(line);
//      System.out.println("A");
    }
    /*File file2 = new File("d:\\bp\\BIN\\ASD\\asd.bat");
    if (file2.canExecute()) {
    	System.out.println("It can!");
    }*/
  }
 }