package com.lab111.labwork9;

import java.util.ArrayList;
import java.util.List;

public class BuildPhone implements Builder {
	public BuildPhone(){
		phone=new ArrayList<String>();
	}
	public List<String> phone;

	public void add(User user) {
		phone.add(user.phone);
	}

	public List<String> getPhones() {
		return phone;
	}
}