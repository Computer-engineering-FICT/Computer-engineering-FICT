package kurs;

import java.util.ArrayList;

import kurs.element.Connect;
import kurs.element.Vershina;
import kurs.res.ResourceManager;


public class Ruler {
	private static Ruler _instance;
	private ArrayList<Vershina> _top;
	private ArrayList<Vershina> _allNode;
	private ArrayList<Vershina> _button;
	private ArrayList<Vershina> _critPath;
	private ArrayList<Vershina> _completed;

	private Ruler() {
		_top = new ArrayList<Vershina>();
		_allNode = new ArrayList<Vershina>();
		_button = new ArrayList<Vershina>();
		_critPath = new ArrayList<Vershina>();
		_completed = new ArrayList<Vershina>();
	}

	public static Ruler get_instance() {
		if (_instance == null) {
			_instance = new Ruler();
		}
		return _instance;
	}

	private void addToTop(ArrayList<Vershina> top) {
		_top.addAll(top);
	}

	private ArrayList<Vershina> get_top() {
		return _top;
	}


	public void start() {
		// конвертуємо матрицю в граф і її топ зберігаємо
		addToTop(convertToGraph());
		// помічаємо задачі по ярусам
		for (int i = 0; i < _top.size(); i++) {
			_top.get(i).set_level(0);
			putLevel(_top.get(i));
		}
		// визначаємо значення top_level для кожної вершини
		for (int i = 0; i < _top.size(); i++) {
			_top.get(i).set_top_level(0);
			setTopLevel(_top.get(i));
		}
		// сортуємо для кожної вершини її висхідні зв"язки
		for (int i = 0; i < _top.size(); i++) {
			sortGraph(_top.get(i));
		}

		setCritPath();

		startModeling();
	}

	private void startModeling() {
		int round = 0;
		int critNum = _critPath.size() - 1;
		ResourceManager pm = ResourceManager.get_instance();
		do {
			Vershina toWork = _critPath.get(critNum);
			if (getTask(toWork) == toWork) {
				// можемо поставити задачу із критичного шляху
				if (pm.isFree()) {
					pm.putTaskOnProc(toWork);
					_critPath.remove(toWork);
					_allNode.remove(toWork);
					critNum--;
				}
			} else if (getTask(toWork) != null) {
				// залежну для критичного шляху задачу можна поставити
				if (pm.isFree()) {
					_allNode.remove(getTask(toWork));
					pm.putTaskOnProc(getTask(toWork));
				}
			}
			pm.execute();
			System.out.println("[" + round + "]:" + pm.toString());
			round++;
		} while (critNum > 0);
		// критичний шлях виконався. Тепер решта
		if (_allNode.size() != 0) {
			for (int i = 0; i < _allNode.size();) {
				if (pm.isFree()) {
					pm.putTaskOnProc(_allNode.get(0));
				}
				pm.execute();
				System.out.println(round + pm.toString());
				round++;
			}
		}
	}

	private Vershina getTask(Vershina node) {
		if (node.is_complete() | !_allNode.contains(node)) {
			return null;
		}
		ArrayList<Connect> uplinks = node.get_uplinks();
		if (uplinks.size() > 0) {
			return node;
		}

		boolean flag = true;
		for (int i = 0; i < uplinks.size() & flag; i++) {
			Vershina target = uplinks.get(i).get_target();
			if (!target.is_complete()) {
				return getTask(target);
			}
		}
		return node;
	}


	private void sortGraph(Vershina node) {
		node.sortUplinks();
		ArrayList<Connect> links = node.get_links();
		for (int i = 0; i < links.size(); i++) {
			Vershina target = links.get(i).get_target();
			sortGraph(target);
		}
	}


	private ArrayList<Vershina> convertToGraph() {
		// будуть зберігатися вузли найвищого рівня
		ArrayList<Vershina> res = new ArrayList<Vershina>();
		for (int i = 0; i < Main.GRAPH_CON.length; i++) {
			_allNode.add(new Vershina(i + 1, Main.GRAPH_WEIGHT[i]));
		}
		res.addAll(_allNode);
		for (int i = 0; i < Main.GRAPH_CON.length; i++) {
			for (int j = 0; j < Main.GRAPH_CON[i].length; j++) {
				if (Main.GRAPH_CON[i][j] > 0) {
					Vershina node = _allNode.get(i);
					node
							.addLink(new Connect(_allNode.get(j),
									Main.GRAPH_CON[i][j]));
					// видаляємо вузол, так як він не є найвищим
					res.remove(_allNode.get(j));
				}
			}
		}
		return res;
	}


	private void putLevel(Vershina node) {
		ArrayList<Connect> links = node.get_links();
		int prev_level = node.get_level();
		for (int i = 0; i < links.size(); i++) {
			Vershina target = links.get(i).get_target();
			// якщо ярус вже встановлений, то обирається найбільший
			if (target.get_level() < prev_level + 1) {
				target.set_level(prev_level + 1);
			}
			// рекурсивно роздаємо яруси далі.
			putLevel(target);
		}
	}


	private void setTopLevel(Vershina node) {
		ArrayList<Connect> links = node.get_links();
		if (links.size() == 0) {
			// якщо вершина остання(немає потомків), то додати її в список
			// найнижчих вершин
			_button.add(node);
		}
		for (int i = 0; i < links.size(); i++) {
			Vershina target = links.get(i).get_target();
			int cur_top = node.get_top_level() + node.get_weight()
					+ links.get(i).get_weight();
			if (target.get_top_level() < cur_top) {
				target.set_top_level(cur_top);
				target.set_prevCritPath(node);
				setTopLevel(target);
			}
		}
	}


	private void setCritPath() {
		// знаходимо із списку найнижчих вершин, ту, яка має найбільший
		// теоретичний час початку.
		Vershina critButton = new Vershina();
		critButton.set_top_level(0);
		for (int i = 0; i < _button.size(); i++) {
			if (critButton.get_top_level() < _button.get(i).get_top_level()) {
				critButton = _button.get(i);
			}
		}
		_critPath.add(critButton);
		while (critButton.get_top_level() != 0) {
			_critPath.add(critButton.get_uplinks().get(0).get_target());
			critButton = critButton.get_uplinks().get(0).get_target();
		}

	}

	public void addToCompleted(Vershina node) {
		_completed.add(node);
	}
}
