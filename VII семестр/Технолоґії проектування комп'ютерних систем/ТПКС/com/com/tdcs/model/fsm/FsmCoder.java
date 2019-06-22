package com.tdcs.model.fsm;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;

public class FsmCoder {
	private HashSet<Integer> usedCodes;
	private int codeLength;
	private List<Integer> stack;

	private List<State> states;
	private int index;

	public static void code(List<State> states, int additionalStatesIndex) {
		FsmCoder coder = new FsmCoder();
		coder.usedCodes = new HashSet<Integer>();
		coder.stack = new ArrayList<Integer>();
		coder.codeLength = 1;
		coder.states = states;
		coder.index = additionalStatesIndex;
		State state = states.get(0);
		coder.usedCodes.add(0);
		state.setCoding(0);
		coder.codeNext(state);

		for (State st : states) {
			st.setCodeSize(coder.codeLength);
		}
	}

	private void codeNext(State state) {
		int code = state.getCoding();
		for (Transistion t : state.getTransistions()) {
			State next = t.getNext();

			if (next.getCoding() < 0) {

				int nextCode = -1;

				do {
					stack = new ArrayList<Integer>();
					nextCode = findNextCode(code, 0);
					if (nextCode < 0)
						codeLength++;

				} while (nextCode < 0);

				usedCodes.add(nextCode);
				next.setCoding(nextCode);

				if (stack.size() > 1) {
					for (Integer c : stack) {
						if (c != nextCode) {
							usedCodes.add(c);
							State st = new State(index++);
							st.setCoding(c);
							t.insert(st);
							states.add(st);
						}
					}
				}

				codeNext(next);
			} else {
				for (Integer c : findWay(code, next.getCoding())) {
					if (c != next.getCoding()) {
						System.out.println(""+c);
						usedCodes.add(c);
						State st = new State(index++);
						st.setCoding(c);
						t.insert(st);
						states.add(st);
					}
				}
			}
		}
	}

	private List<Integer> findWay(int from, int to) {
		LinkedList<Integer> way = new LinkedList<Integer>();
		int mask = from ^ to;
		int mm = 0;
		int t = 1;
		do {
			if ((mask & t) != 0) {
				mm |= t;
				way.add(to ^ mm);
			}

			t <<= 1;
		} while ((mask ^ mm) != 0);

		if (!codesContains(way, 0))
			return way;

		int pos = 0;
		way.addFirst(to);
		//way.addLast(from);

		while (codesContains(way, 1 << pos)) {
			pos++;
		}

		for (int i = 0; i < way.size(); i++) {
			way.set(i, way.get(i) ^ (1 << pos));
		}

		codeLength = pos+1;

		return way;
	}

	private boolean codesContains(List<Integer> codes, int patch) {
		for (int code : codes) {
			if (usedCodes.contains(code ^ patch))
				return true;
		}

		return false;
	}

	private int findNextCode(int code, int mask) {
		int next;
		int newMask;
		for (int i = 0; i < codeLength; i++) {
			if (((mask >> i) & 0x01) == 0) {
				newMask = mask ^ (1 << i);
				next = newMask ^ code;
				if (!usedCodes.contains(next)) {
					stack.add(next);
					return next;
				}
			}
		}

		for (int i = 0; i < codeLength; i++) {
			if (((mask >> i) & 0x01) == 0) {
				newMask = mask ^ (1 << i);
				next = findNextCode(code, newMask);

				if (next >= 0) {
					stack.add(code ^ mask);
					return next;
				}
			}
		}

		return -1;
	}
}
