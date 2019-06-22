package com.lab111.labwork9;

import java.util.ArrayList;
import java.util.List;

public class BuildAdress implements Builder {
	public BuildAdress() {
		adress = new ArrayList<String>();
	}

	public List<String> adress;

	public List<String> getAdress() {
		return adress;
	}

	@Override
	public void add(User user) {
		adress.add(user.adress);

	}

}