package os_course;

import java.util.ArrayList;
import java.util.Random;

public class GraphGenerator {

    Integer[][] matrix; int count; Integer[][] verticles;

    public GraphGenerator(int parseInt) {
        count = parseInt;
    }

    public Object[][] nextRandomMatrix() {
        matrix = new Integer[count][count];
        verticles = new Integer[1][count];
        
        Random rand = new Random();

        int razr = 45; // степень НЕразрежённости (из 100)
        int count2 = razr * (count * count) / 100;//количество ненулевых значений
        int[] buffer = new int[count];

        for (int i2 = 0; i2 < count; i2++) {
                verticles[0][i2] = rand.nextInt(25);
                for (int j2 = 0; j2 < count; j2++) {
                        matrix[i2][j2] = 0;
                }
        }

        ArrayList<String> itWas = new ArrayList<String>();
        for (int i = 0; i < count2; i++) {
                int x = rand.nextInt(count);
                int y = rand.nextInt(count);
                if (itWas.contains(x + ":" + y)) i--;
                else { matrix[x][y] = rand.nextInt(12); itWas.add(x + ":" + y); }
        }

        //ДОПОЛНЯЕМ ЧТОЛИ
        for (int i = 0; i < count; i++) {
                boolean flag = false;
                for (int j = 0; j < count; j++) {
                        if (matrix[i][j] == 1) flag = true;
                }
                if (!flag) matrix[i][rand.nextInt(count)] = 1;
        }

        for (int i = 0; i < count; i++) {
            //1.	Находим сумму элементов в строке
            //			(можно не искать, считаем уже, что фильтр поискал и нашел)
            for (int i2 = 0; i2 < count; i2++) {
                    for (int j2 = 0; j2 < count; j2++) {
                            buffer[i2] += matrix[i2][j2];
                    }
            }
            //2.	Находим строку с мин. Суммой элементов и переставляем эту строку, со строкой, соотв. Номеру итерации
            int maxSumm = -1; int place = 0;
            for (int j = i; j < count; j++) {
                    if (maxSumm < buffer[j]) {
                            maxSumm = buffer[j]; place = j;
                    }
            }
            for (int i2 = 0; i2 < count; i2++) {
                    Integer buff = matrix[i][i2];
                    matrix[i][i2] = matrix[place][i2];
                    matrix[place][i2] = buff;
            }

            //3.	Находим сумму элементов в столбцах.
            for (int j1 = 0; j1 < count; j1++) {
                    for (int j2 = 0; j2 < count; j2++) {
                            buffer[j1] += matrix[j2][j1];
                    }
            }

            //4.	Находим столбец, который содержит в строке, соотв. Номеру итерации 1 и имеет макс. Сумму
            maxSumm = -1; place = 0;
            for (int j = i; j < count; j++) {
                    if (maxSumm < buffer[j]) {
                            maxSumm = buffer[j]; place = j;
                    }
            }

            //5.	Переставляем этот столбец со столбцом, соотв. Номеру итерации
            for (int i2 = 0; i2 < count; i2++) {
                    Integer buff = matrix[i2][i];
                    matrix[i2][i] = matrix[i2][place];
                    matrix[i2][place] = buff;
            }
        }

            //теперь надо очистить все нахрен столбцы
        for (int i = 0; i < matrix.length; i++) {
            for (int j = i; j < matrix.length; j++) {
                    matrix[j][i] = 0;
            }
        }

        for (int i = 1; i < matrix.length - 1; i++) {
            boolean flag = false;
            for (int j = i; j >= 0; j--) {
                    if (matrix[j][i] == 1) flag = true;
            }
            if (!flag) matrix[i - 1][i] = rand.nextInt(12);
        }

        return matrix;
    }

    public Object[][] getVerticles() {
        return verticles;
    }

}
