package csv;

import java.io.IOException;
import java.io.File;
import java.io.FileInputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.ObjectInputStream;

/**
 * ���� ��� ���������� ������ ��������.
 *
 * @author ������ �����
 */
final class TestIO {
    /**
     * @param repeats
     * ����� ������� �������� ���������� ���� �����
     */
    private static byte repeats = 3;
    /**
     * @see ����������� ����� �� �� ����������,
     * ��������� ��� ���������� CheckStyle
     */
    private TestIO() {
    }
    /**
     * @param args
     *          ��������� �������� ������
     * @throws IOException
     *          ������� ��� ����� �� ������/�������
     * @throws ClassNotFoundException
     *          ����������, ��� ����� �� ��, �� ���� �� ������� ������
     * @throws CSVParseException
     *          ������� �������� ��� ����� �������
     */
    public static void main(final String[] args) throws IOException,
            ClassNotFoundException, CSVParseException {
        int bytesAvailable = System.in.available();
        if (bytesAvailable > 0) {
            byte[ ] data = new byte[bytesAvailable];
            System.in.read(data);
        }

        CSVProcessor csv = new CSVProcessor();
        File serF = new File("serialized.dat");
        if (serF.exists()) {
            try {
                ObjectInputStream inObj =
                              new ObjectInputStream(new FileInputStream(serF));
                csv = (CSVProcessor) inObj.readObject();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            BufferedReader input = new BufferedReader(new InputStreamReader(
                    System.in));
            for (byte i = 0; i < repeats; i++) {
                System.out.println("������ ��'� CSV-�����");
                String path = "";
                try {
                    path = input.readLine();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                try {
                    csv = new CSVProcessor(path);
                    i = repeats;
                } catch (IOException e1) {
                    if (i < 2) {
                        e1.toString();
                    } else {
                        System.out.println(
                        "CSV-���� �� ��������, ���������� �������� ���������");
                        return;
                    }
                }
            }
        }
        System.out.println("���� ������������ ��'���� ArrayList � HashMap:");
        System.out.println(csv);
    }
}

