package com.tdcs.compiler;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.tdcs.document.Error;
import com.tdcs.model.Condition;
import com.tdcs.model.Element;
import com.tdcs.model.Jump;
import com.tdcs.model.Link;
import com.tdcs.model.Operator;
import com.tdcs.model.Reference;

public class LogicAlgorithmParser {
	private static final int INDEX_BEGIN = -1;
	private static final int INDEX_END = -2;
	private static final Pattern pattern = Pattern
			.compile("([Y]{1}([0-9]+|[be]))|([x↑↓]{1}[0-9]+)|[w]{1}");

	private static final Pattern tokenPattern = Pattern
			.compile("^[Yx↑↓w]{1}|[0-9]+|[be]");

	public static List<Element> parse(String algorithm) throws SyntaxException {
		int position = 0;
		Matcher match = pattern.matcher(algorithm);
		List<Element> elements = new ArrayList<Element>();

		while (match.find()) {
			if (position != match.start()) {
				throw new SyntaxException(new Error(algorithm.substring(
						position, match.start()), position, match.start()));
			}

			String token = match.group();
			Matcher tokenMatch = tokenPattern.matcher(token);

			tokenMatch.find();
			char op = tokenMatch.group().charAt(0);
			int index = 0;

			if (tokenMatch.find()) {
				switch (tokenMatch.group().charAt(0)) {
				case 'b':
					index = INDEX_BEGIN;
					break;
				case 'e':
					index = INDEX_END;
					break;
				default:
					index = Integer.parseInt(tokenMatch.group());
				}
			}

			switch (op) {
			case 'Y':
				elements.add(new Operator(index, match.start(), match.end()));
				break;
			case 'x':
				elements.add(new Condition(index, match.start(), match.end()));
				break;
			case '↑':
				elements.add(new Link(index));
				break;
			case '↓':
				elements.add(new Reference(index));
				break;
			case 'w':
				elements.add(new Jump());
				break;
			}

			position = match.end();
		}

		if (position != algorithm.length()) {
			throw new SyntaxException(new Error(algorithm.substring(position,
					algorithm.length()), position, algorithm.length()));
		}

		return elements;
	}

	public static String print(List<Element> elements) {
		String text = "";
		for (int i = 0; i < elements.size(); i++) {
			Element element = elements.get(i);
			text += element;
		}
		return text;
	}
}