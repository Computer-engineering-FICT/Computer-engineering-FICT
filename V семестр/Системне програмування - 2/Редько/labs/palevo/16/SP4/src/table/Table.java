package table;

import java.util.Vector;

public class Table {
    private Vector<Record> fields;
    private long lastId;
    private int rowCount;
    private boolean isSorted;

    public Table() {

        lastId = 0;
        fields = new Vector<Record>();
        isSorted = true;

    }
    public int getRowCount(){
        return rowCount;
    }
    public long insert(Record record) throws IncorectRecordException {
        if (record != null) {
            lastId++;
            record.key = lastId;
            fields.add(record);
            rowCount++;
            isSorted = false;
            return lastId;
        } else {
            throw new IncorectRecordException();
        }
    }

    public void printTable() {
        System.out.println("----Start table-----");
        for (int i = 0; i < rowCount; i++) {
            fields.get(i).print();
        }
                System.out.println("----End table-----");
    }

    public Record logicSearch(String patern, StringComparator comparator) throws IncorectComparator, IncorectPatern {
        if (patern == null) {
            throw new IncorectPatern();
        }
        if (comparator == null) {
            throw new IncorectComparator();
        }
        int max = 0;
        int pos = -1;
        for (int i = 0; i < rowCount; i++) {
            int c = comparator.compare(patern, fields.get(i).field);
            if (c > max) {
                max = c;
                pos = i;
            }
        }
        if (pos != -1) {
            return fields.get(pos);
        } else {
            return null;
        }
    }

    public boolean delete(long id) {
        if (id > 0) {
            Record r = select(id);
            if (r != null) {
                fields.remove(r);
            } else {
                return false;
            }
            rowCount--;
            return true;
        } else {
            return false;
        }
    }

    public boolean update(Record record) throws IncorectRecordException {
        if (record != null) {
            Record savedRecord = select(record.key);
            if (savedRecord != null) {
                savedRecord.field = record.field;
                isSorted = false;
            } else {
                return false;
            }
            return true;
        } else {
            throw new IncorectRecordException();
        }
    }

    public void sort() {
        Record record;
        for (int i = 0; i < rowCount - 1; i++) {
            for (int j = 0; j < i; j++) {
                if (fields.get(j).key > fields.get(j + 1).key) {
                    record = fields.get(j);
                    fields.remove(j);
                    fields.add(j, fields.get(j + 1));
                    fields.remove(j + 1);
                    fields.add(j + 1, record);
                }
            }
        }
        isSorted = true;
    }

    public Record select(long id) {
        if (id >= 0) {
            for (int i = 0; i < rowCount; i++) {
                if (fields.get(i).key == id) {
                    return fields.get(i);
                }
            }
        }
        return null;
    }

    public int search(String line){
        if(line==null){
            return -1;
        }
        if(line.length()<=0){
            return -1;
        }

        for(int i=0;i<rowCount;i++){
            if(fields.get(i).field.equals(line)){
                return i;
            }
        }
        return -1;
    }

    public Record selectBinary(long id) {
        if (id > 0) {
            if (!isSorted) {
                sort();
            }
            int curentIndex = rowCount / 2;
            int delta = curentIndex;
            boolean flag = false;
            while (!(fields.get(curentIndex).key == id)) {
                if (delta % 2 == 1) {
                    delta = delta / 2 + 1;
                } else {
                    delta = delta / 2;
                }

                System.out.println("delta=" + delta);
                System.out.println("ci=" + curentIndex);
                if (fields.get(curentIndex).key < id) {
                    curentIndex += delta;
                } else {
                    curentIndex -= delta;
                }
                if (delta < 1) {
                    if (!flag) {
                        flag = true;
                        delta = 1;
                    } else {
                        return null;
                    }
                }

            }
            return fields.get(curentIndex);
        } else {
            return null;
        }
    }
}


