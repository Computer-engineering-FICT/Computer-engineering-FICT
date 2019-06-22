package com.lab111.labwork9;

public class TableUser {
	public TableUser(User[] users, Builder builder) {
		this.users = users;
		currentBuilder = builder;
	}

	public User[] users;

	public Builder currentBuilder;

	public void CreateProjection() {
		for (int i = 0; i < users.length; i++) {
			currentBuilder.add(users[i]);
		}
	}

	public void setBuilder(Builder builder) {
		currentBuilder = builder;
	}

}