package com.lab111.labwork9;

import java.util.ArrayList;
import java.util.List;

public class BuildIdName implements Builder {
	public BuildIdName() {
		name = new ArrayList<String>();
	}

	public List<String> name;

	public void add(User user) {
		name.add(user.name);
	}

	public List<String> getNames() {
		return name;
	}

}