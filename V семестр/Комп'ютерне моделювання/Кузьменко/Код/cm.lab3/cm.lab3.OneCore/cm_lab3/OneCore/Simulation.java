package cm_lab3.OneCore;

import java.util.Random;

import cm_lab3.OneCore.Device;
import cm_lab3.OneCore.Event;
import cm_lab3.OneCore.EventList;

public class Simulation {

	public static EventList eventList = new EventList();
	public static Random r = new Random();
	public static double time = 0;
	Device[] system = new Device[7];

	

	// ����� ��� �������� �� ������������ �������
	public void buildSystem() {
		Device processor = new Device(1,// ������� ��� ����*������
				1,// ������� ����
				5,// ��������� ������� �����
				"��������" // ����� ��������
				, 1 // ������������� ��������
		);
		Device north_bridge = new Device(1.5, 1, 0, "ϳ������ ���", 2);
		Device south_bridge = new Device(2.0, 1, 0, "ϳ������� ���", 3);
		Device ram = new Device(4.0, 1, 0, "���������� ���*���", 4);
		Device video_processor = new Device(40.0, 1, 0, "³��� ��������", 5);
		Device graph_processor = new Device(0.5, 1, 0, "��������� ��������", 6);
		Device audio_processor = new Device(35.0, 1, 0, "���� ��������", 7);

		// ������������� ��*���� �� ���������� �� ������������ �����������
		processor.linkDevices(north_bridge, processor);
		processor.linkOutProbability(0.3, 0.7);
		processor.calcNextTime(0);

		north_bridge.linkDevices(processor, south_bridge,graph_processor, ram);
		north_bridge.linkOutProbability(0.15, 0.25, 0.25,0.35);


		south_bridge.linkDevices(north_bridge,audio_processor,video_processor);
		south_bridge.linkOutProbability(0.25,0.35,0.4);
		
		ram.linkDevices(north_bridge);
		ram.linkOutProbability(1);

		video_processor.linkDevices(processor);
		video_processor.linkOutProbability(1);

		graph_processor.linkDevices(north_bridge);
		graph_processor.linkOutProbability(1.0);
		
		audio_processor.linkDevices(processor);
		audio_processor.linkOutProbability(1.0);
		
		system[0] = processor;
		system[1] = north_bridge;
		system[2] = south_bridge;
		system[3] = ram;
		system[4] = video_processor;
		system[5] = graph_processor;
		system[6] = audio_processor;
	}

	// ���������
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

	// ����� �������� � ��������� ����� �����������
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
	double timeNorthBridge = 0;
	double timeSouthBridge = 0;
	double timeRam = 0;
	double timeVideoProcessor = 0;
	double timeGraphProc=0;
	double timeAudioProc=0;

	// ��� �������� ���������� �������
	double paralelPart = 0;

	// ���� �����������, �������� ��������
	boolean interuptFlag = false;

	public void statistics(Event event) {
		switch (event.device.id) {
		case 1:
			timeOneCore += event.timeFinish - event.timeStart;
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
		case 6:
			timeGraphProc += event.timeFinish - event.timeStart;
			break;
		case 7:
			timeAudioProc += event.timeFinish - event.timeStart;
			break;
		default:
			System.err.println("1 Error");
			System.exit(0);
			break;
		}
	}

	private void statistics() {
		printTopology();
		
		double alltime=0;
		alltime = timeOneCore+timeRam+timeSouthBridge+timeNorthBridge+timeVideoProcessor+timeGraphProc+timeAudioProc;
		
		timeOneCore = (timeOneCore / alltime) * 100;
		timeNorthBridge = (timeNorthBridge / alltime) * 100;
		timeRam = (timeRam / alltime) * 100;
		timeSouthBridge = (timeSouthBridge / alltime) * 100;
		timeVideoProcessor = (timeVideoProcessor / alltime) * 100;
		timeGraphProc = (timeGraphProc / alltime) * 100;
		timeAudioProc = (timeAudioProc / alltime) * 100;
		
		
		System.out.println();
		System.out.print("\n��� ����������� ");
		System.out.printf("% 10.5f", time);
		System.out.print("\n");
		System.out.print("\n��������             |");
		System.out.printf(" %3.5f", timeOneCore);
		System.out.print(" %\nϳ������ ���     |");
		System.out.printf(" %3.5f", timeNorthBridge);
		System.out.print(" %\nϳ������� ���     |");
		System.out.printf(" %3.5f", timeSouthBridge);
		System.out.print(" %\n���������� ���*��� |");
		System.out.printf(" %3.5f", timeRam);
		System.out.print(" %\n³��� ��������     |");
		System.out.printf(" %3.5f", timeVideoProcessor);
		System.out.print(" %\n��������� �������� |");
		System.out.printf(" %3.5f", timeGraphProc);
		System.out.print(" %\n���� ��������     |");
		System.out.printf(" %3.5f", timeAudioProc);
		System.out.print(" %\nʳ������ ����*������ ����� ");
		
		int k =0;
		for (Device d : system) {
			k+=d.countTask;
		}
		System.out.print(k);
	}

}
