import java.util.Scanner;

class Read {

    private Scanner read = new Scanner(System.in);

    float readFloat() {
        while (!read.hasNextFloat()) {
            read.next();
        }
        return read.nextFloat();
    }

    int readInt() {
        while (!read.hasNextInt()) {
            read.next();
        }
        return read.nextInt();
    }

    char readChar() {
        char ch = 0;
        boolean isChar = false;
        do {
            if (read.hasNextInt()) {
                int tmpInt = read.nextInt();
                if (0 <= tmpInt && tmpInt < 65536) {
                    ch = (char) tmpInt;
                    isChar = true;
                } else {
                    read.next();
                }
            } else
                read.next();
        } while(!isChar);
        return ch;
    }

}
