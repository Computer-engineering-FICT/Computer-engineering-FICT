package cm_lab3;

import static cm_lab3.Simulation.*;
import cm_lab3.Event;

public class Resource {
	private Event oneCore = null;
	private Event twoCore = null;

	public double allTime = 0;
	public double paralelTime = 0;
	private double startWork = 0;

	public void add(Event e) {
		if (oneCore == null && twoCore == null) {
			startWork = time;
		}

		if (oneCore == null && twoCore == null) {
			// ���� 0 �����, ������� ���� ������
		} else {
			// ���� 1 ������ ������� �� ����
			if (e.timeStart < oneCore.timeFinish) {
				paralelTime += oneCore.timeFinish - e.timeStart;
			}
		}

		if (oneCore == null) {
			oneCore = e;
		} else {
			twoCore = e;
		}
	}

	public void remove(Event e) {

		if (oneCore != null && twoCore != null) {
			// ���� 2 ������ �������� ���� ������
		} else {
			// ���� ���� ������, ���຺���� 0 �����
		}

		if (oneCore.equals(e)) {
			oneCore = twoCore;
			twoCore = null;
		} else {
			twoCore = null;
		}

		if (oneCore == null && twoCore == null) {
			allTime += time - startWork;
		}

	}

	public int size() {
		if (oneCore == null && twoCore == null) {
			return 0;
		} else {
			if ((oneCore == null && twoCore != null)
					|| (oneCore != null && twoCore == null)) {
				return 1;
			} else {
				return 2;
			}
		}

	}
}
