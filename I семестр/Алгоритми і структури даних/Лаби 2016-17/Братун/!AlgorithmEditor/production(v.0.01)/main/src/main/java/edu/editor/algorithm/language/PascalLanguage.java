package edu.editor.algorithm.language;

public class PascalLanguage implements IntLanguage {

	@Override
	public String IOInterpreter(String value) { //todo ?!is still needed?
		if (value.indexOf("in: ") != -1) {
			value = value.replace("in: ", "readln(");
			value += ")";
		}
		if (value.indexOf("in:") != -1) {
			value = value.replace("in:", "readln(");
			value += ")";
		}
		if (value.indexOf("out: ") != -1) {
			value = value.replaceAll("out: ", "writeln('");
			value += "')";
		}
		if (value.indexOf("out:") != -1) {
			value = value.replaceAll("out:", "writeln('");
			value += "')";
		}
		return value;
	}

}
