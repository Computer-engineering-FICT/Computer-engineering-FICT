package com.lab111.labwork7;

import java.util.HashMap;
import java.util.Map;

/**
 * Class that implements a tool box in a graphics editor. Acts as 'client'
 * in a command pattern scenario
 * @author freil
 *
 */
public class Toolbox {

	private Tool tools[];
	private Map<String, Tool> toolsByName;
	private DrawingContext context;

	public Toolbox() {
		toolsByName = new HashMap<String, Tool>();
	}

	public Toolbox(Tool tools[]) {
		this();
		this.tools = tools;
		for (Tool tool : tools) {
			toolsByName.put(tool.getName(), tool);
		}
	}

	public void selectTool(int index) {
		if (index < 0 || index >= tools.length)
			return;
		context.selectTool(tools[index]);
	}
	
	public void selectTool(String name) {
		Tool tool = toolsByName.get(name);
		if (tool == null)
			return;
		context.selectTool(tool);
	}
	
	public void setTools(Tool tools[]) {
		this.tools = tools;
		for (Tool tool : tools) {
			toolsByName.put(tool.getName(), tool);
		}
	}

	/**
	 * @param context the context to set
	 */
	public void setContext(DrawingContext context) {
		this.context = context;
	}

}
