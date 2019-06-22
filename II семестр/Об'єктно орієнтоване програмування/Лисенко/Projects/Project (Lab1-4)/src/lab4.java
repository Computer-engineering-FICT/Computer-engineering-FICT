/*
C11 = 6116 % 11 = 0 => Визначити клас студент, який складається як мінімум з 5-и полів.
 */
import java.util.Arrays;
import java.util.Comparator;

public class lab4 {
    static class Student {
        String firstname;
        String lastname;
        int age;
        int course;
        String group;

        Student(String firstname,String lastname,int age,int course,String group){
            this.firstname = firstname;
            this.lastname = lastname;
            this.age = age;
            this.course = course;
            this.group = group;
        }
    }

    static class SortName implements Comparator<Student> {
        @Override
        public int compare(Student s1, Student s2) {
            int ret = s1.firstname.compareToIgnoreCase(s2.firstname);
            if (ret == 0) {
                return s1.lastname.compareToIgnoreCase(s2.lastname);
            }
            return ret;
        }
    }

    static class SortAge implements Comparator<Student> {
        @Override
        public int compare(Student s1, Student s2) {
            return s2.age - s1.age;
        }
    }

    public static void main(String[] args) {
        Student[] students = new Student[4];
        students[0] = new Student("Dmytro", "Lysenko", 17, 1, "IO-61");
        students[1] = new Student("Petro", "Petrov", 19, 2, "IO-51");
        students[2] = new Student("Ivan", "Ivanov", 18, 1, "IO-61");
        students[3] = new Student("Petro", "Ivanov", 20, 3, "IP-41");

        Arrays.sort(students, new SortName());
        System.out.println("Sort by name:");
        System.out.printf("%-10s%-10s%-4s%-8s%-5s\n", "Firstname", "Lastname", "Age", "Course", "Group");
        for (Student i: students) {
            System.out.printf("%-10s%-10s%-4d%-8d%-5s\n", i.firstname, i.lastname, i.age, i.course, i.group);
        }

        Arrays.sort(students, new SortAge());
        System.out.println("\nSort by age:");
        System.out.printf("%-10s%-10s%-4s%-8s%-5s\n", "Firstname", "Lastname", "Age", "Course", "Group");
        for (Student i: students) {
            System.out.printf("%-10s%-10s%-4d%-8d%-5s\n", i.firstname, i.lastname, i.age, i.course, i.group);
        }

    }
}
