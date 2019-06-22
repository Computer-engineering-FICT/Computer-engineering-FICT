package com.lab111;

import java.util.List;

import com.lab111.labwork9.*;

public final class TestMain {

	/**
	 * Constructor.
	 * 
	 */
	private TestMain() {
		super();
	}

	/**
	 * Invokes at application startup.
	 * 
	 * @param args
	 *            Parameters from command line
	 */
	public static void main(final String[] args) {
		User[] users=new User[3];
		users[0]=new User("����","343434","������� 1");
		users[1]=new User("����","23-53-12","������ 10");
		users[2]=new User("����","+388888888","�������� ������ 10");
		System.out.println("�������");
		for (int i = 0; i < users.length; i++) {
			System.out.println(users[i].name+"  "+users[i].phone+"  "+users[i].adress);
		}
		System.out.println();
		BuildIdName builderName=new BuildIdName();
		BuildPhone builderPhone=new BuildPhone();
		BuildAdress builderAddress=new BuildAdress();
		
		TableUser table=new TableUser(users, builderName);
		System.out.println("�������� ����");
		table.CreateProjection();
		List<String> name=builderName.getNames();
		for (String string : name) {
			System.out.println(string);
		}
		System.out.println();
		System.out.println("�������� ���������");
		table.setBuilder(builderPhone);
		table.CreateProjection();
		List<String> phone=builderPhone.getPhones();
		for (String string : phone) {
			System.out.println(string);
		}
		System.out.println();
		System.out.println("�������� �������");
		table.setBuilder(builderAddress);
		table.CreateProjection();
		List<String> address=builderAddress.getAdress();
		for (String string : address) {
			System.out.println(string);
		}
	}

}
