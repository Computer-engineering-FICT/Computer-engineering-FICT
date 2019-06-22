package lab4;
import java.util.Comparator;

class Student {
    String Name, Surname, Vyz, Age, Weight;

    Student(String name, String surname, String age, String vyz, String weight) {
        this.Name = name;
        this.Surname = surname;
        this.Age = age;
        this.Vyz = vyz;
        this.Weight = weight;

    }

    //Сортування за ім'ям
    protected static Comparator<Student> getCompByName(){
        Comparator comp = new Comparator<Student>(){
            @Override
            public int compare(Student s1, Student s2){
                return s1.Name.compareTo(s2.Name);
            }
        };
        return comp;
    }

    //Сортування за Прізвищем
    protected static Comparator<Student> getCompBySurname(){
        Comparator comp = new Comparator<Student>(){
            @Override
            public int compare(Student s1, Student s2){
                return s1.Surname.compareTo(s2.Surname);
            }
        };
        return comp;
    }

    //Сортування за віком
    protected static Comparator<Student> getCompByAge(){
        Comparator comp = new Comparator<Student>(){
            @Override
            public int compare(Student s1, Student s2){
                return s1.Age.compareTo(s2.Age);
            }
        };
        return comp;
    }

    //Сортування за ВУЗом
    protected static Comparator<Student> getCompByVyz(){
        Comparator comp = new Comparator<Student>(){
            @Override
            public int compare(Student s1, Student s2){
                return s2.Vyz.compareTo(s1.Vyz);
            }
        };
        return comp;
    }

    // Сортування за вагою студента
    protected static Comparator<Student> getCompByWeight(){
        Comparator comp = new Comparator<Student>(){
            @Override
            public int compare(Student s1, Student s2){
                return s2.Weight.compareTo(s1.Weight);
            }
        };
        return comp;
    }

    // Вивід інформації
    @Override
    public String toString() {
        return Name + " " + Surname + ". The age is: " + Age +
                ". The High School is " + Vyz + " and the weight is " + Weight;

    }
}

