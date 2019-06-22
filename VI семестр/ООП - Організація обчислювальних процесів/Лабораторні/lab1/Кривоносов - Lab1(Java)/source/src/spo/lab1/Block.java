package spo.lab1;

/**
 * Created by alexey on 07.04.16.
 */
public class Block {
    public static final int DESCRIPTOR_SIZE = 2;
    private int header;
    private int prevSize;
    //"Вказівник" = зміщення дескриптора (заголовку) в області пам'яті
    private int offset;

    private Block(int header, int prevSize, int offset) {
        this.header = header;
        this.prevSize = prevSize;
        this.offset = offset;
    }

    public Block(int size, boolean free, int prevSize, int offset) {
        if(size < 0) {
            size = 0;
        }
        this.header = size;
        this.prevSize = prevSize;
        this.offset = offset;
        makeFree(free);
    }

    public boolean isFree() {
        return (header >= 0);
    }

    public void makeFree(boolean free) {
        if(free) {
            header = getSize();
        } else {
            header = -getSize();
        }
    }

    /**
     * @return розмір тіла блоку (без урахування розміру дескриптора)
     */
    public int getSize() {
        return Math.abs(header);
    }

    public int getPrevSize() {
        return prevSize;
    }
    //
    public int getOffset() {
        return offset;
    }

    public int getBegin() {
        return (offset + DESCRIPTOR_SIZE);
    }

    public int getNextOffset() {
        return (offset + DESCRIPTOR_SIZE + this.getSize());
    }

    public int getPreviousOffset() {
        return (offset - (DESCRIPTOR_SIZE + prevSize));
    }

    /**
     * @param memory - масив, який представляє пам'ять
     * @param offset - "вказівник" на блок = зміщення дескриптора (заголовку) в області пам'яті
     * @return блок по його "вказівнику"
     */
    public static Block read(int[] memory, int offset) {
        return new Block(memory[offset], memory[offset + 1], offset);
    }

    public static boolean rewrite = true;
    public int record(int[] memory) {
        memory[offset] = header;
        memory[offset + 1] = prevSize;
        if (rewrite) {
            for (int i = 0; i < getSize(); i++) {
                memory[offset + 2 + i] = (i + 1) * 100;
            }
        }
        return (DESCRIPTOR_SIZE + this.getSize());
    }

    public Block divide(int size) {
        Block left = new Block(size, prevSize, offset);
        //Встановлюємо новий дескриптор правої частини
        header = getSize() - (DESCRIPTOR_SIZE + size);
        prevSize = size;
        offset += DESCRIPTOR_SIZE + size;
        return left;
    }

    public static Block merge(Block left, Block right) {
        return new Block(left.getSize() + DESCRIPTOR_SIZE + right.getSize(), left.isFree(), left.prevSize, left.offset);
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Block other = (Block) obj;
        if (header != other.header)
            return false;
        if (offset != other.offset)
            return false;
        if (prevSize != other.prevSize)
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "{offset = " + offset + ", size = " + (Math.abs(header) + DESCRIPTOR_SIZE) + "(" + header + "),  prevSize = " + prevSize +  "}";
    }


}

