package com.diuk.pt.labwork2;

import java.util.Collection;

public class Main {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Normal6Generator gen = new Normal6Generator();
		Collection<Double> numb = gen.generate(20, 3, 5000);
		System.out.println("����������� ���������� M = "+DiscreteOperations.M(numb));
		System.out.println("�������� D = "+DiscreteOperations.D(numb));
		System.out.println("������������������� ��������� Q = "+DiscreteOperations.Q(numb));
	}

}
