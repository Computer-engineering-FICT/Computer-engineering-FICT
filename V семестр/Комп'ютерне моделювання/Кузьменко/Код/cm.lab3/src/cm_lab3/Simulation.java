package cm_lab3;

import java.util.Random;

import cm_lab3.Device;
import cm_lab3.Event;
import cm_lab3.EventList;

public class Simulation {

	public static EventList eventList = new EventList();
	public static Random r = new Random();
	public static double time = 0;
	Device[] system = new Device[5];

	public static double timeSolution(double lambda) {
		return (-1 / lambda) * Math.log(r.nextDouble());
	}

	// метод для побудови та налаштування системи
	public void buildSystem() {
		Device processor = new Device(0.25,// середній час розв*язання
				2,// кількість ядер
				6,// початкова кількість задач
				"Процесор" // назва пристроо
				, 1 // ідетнифікатор пристрою
		);
		Device north_bridge = new Device(19, 1, 0, "Північний міст", 2);
		Device south_bridge = new Device(65, 1, 0, "Південний міст", 3);
		Device ram = new Device(0.50, 1, 0, "Оперативна пам*ять", 4);
		Device video_processor = new Device(68, 1, 0, "Відео процесор", 5);

		// налаштуванння зв*язків між пристроями та встановлення імовірностей
		processor.linkDevices(north_bridge, processor);
		processor.linkOutProbability(0.15, 0.85);
		processor.calcNextTime(0);

		north_bridge.linkDevices(processor, south_bridge, ram);
		north_bridge.linkOutProbability(0.1, 0.4, 0.5);

		ram.linkDevices(north_bridge);
		ram.linkOutProbability(1);

		south_bridge.linkDevices(video_processor);
		south_bridge.linkOutProbability(1);

		video_processor.linkDevices(processor);
		video_processor.linkOutProbability(1);

		system[0] = processor;
		system[1] = north_bridge;
		system[2] = south_bridge;
		system[3] = ram;
		system[4] = video_processor;
	}

	// симуляція
	public void simulate() {
		int i = 0;
		while (i<100000) {
			Event event = minTimeEvent();
			event.device.transaction(event);
			statistics(event);
			i++;
		}
		statistics();

	}

	// пошук пристрою з мінімальним часом спрацювання
	private Event minTimeEvent() {
		double minTime = Double.MAX_VALUE;
		Event event = eventList.get(0);

		for (Event evnt : eventList) {
			if (minTime > evnt.timeFinish) {
				minTime = evnt.timeFinish;
				event = evnt;

			}

		}

		return event;
	}

	private void printTopology() {
		for (Device d : system) {
			d.pr();
		}
	}

	double timeOneCore = 0;
	double timeTwoCore = 0;
	double timeNorthBridge = 0;
	double timeSouthBridge = 0;
	double timeRam = 0;
	double timeVideoProcessor = 0;

	// час останньої паралельної частини
	double paralelPart = 0;

	// флаг переривання, процесор простоює
	boolean interuptFlag = false;

	public void statistics(Event event) {
		switch (event.device.id) {
		case 1:
			break;
		case 2:
			timeNorthBridge += event.timeFinish - event.timeStart;
			break;
		case 3:
			timeSouthBridge += event.timeFinish - event.timeStart;
			break;
		case 4:
			timeRam += event.timeFinish - event.timeStart;
			break;
		case 5:
			timeVideoProcessor += event.timeFinish - event.timeStart;
			break;
		default:
			System.err.println("1 Error");
			System.exit(0);
			break;
		}
	}

	private void statistics() {
		printTopology();
		timeOneCore = system[0].resourceProc.allTime
				- system[0].resourceProc.paralelTime;
		timeTwoCore = system[0].resourceProc.paralelTime;

		double alltime=0;
		alltime = timeOneCore+timeTwoCore+timeRam+timeSouthBridge+timeNorthBridge+timeVideoProcessor;
		
		timeOneCore = (timeOneCore / alltime) * 100;
		timeTwoCore = (timeTwoCore / alltime) * 100;
		timeNorthBridge = (timeNorthBridge / alltime) * 100;
		timeRam = (timeRam / time) * 100;
		timeSouthBridge = (timeSouthBridge / alltime) * 100;
		timeVideoProcessor = (timeVideoProcessor / alltime) * 100;
		System.out.println();
		System.out.print("\nЧас моделювання ");
		System.out.printf("% 10.5f", time);
		System.out.print("\n");
		System.out.print("\nОдне ядро          |");
		System.out.printf(" %3.5f", timeOneCore);
		System.out.print(" %\nДва ядра           |");
		System.out.printf(" %3.5f", timeTwoCore);
		System.out.print(" %\nПівнічний міст     |");
		System.out.printf(" %3.5f", timeNorthBridge);
		System.out.print(" %\nПівденний міст     |");
		System.out.printf(" %3.5f", timeSouthBridge);
		System.out.print(" %\nОперативна пам*ять |");
		System.out.printf(" %3.5f", timeRam);
		System.out.print(" %\nВідео процесор     |");
		System.out.printf(" %3.5f", timeVideoProcessor);
		System.out.print(" %\nКількість розв*язаних задач ");
		
		int k =0;
		for (Device d : system) {
			k+=d.countTask;
		}
		System.out.print(k);
	}

}
