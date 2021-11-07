public class Student {

    private String name;
    private double gpa;
    private int credits;

    public Student(String name, double gpa, int credits) {
        this.name = name;
        this.gpa = gpa;
        this.credits = credits;
    }

    public String getName() {
        return name;
    }

    public double getGpa() {
        return gpa;
    }

    public int getCredits() {
        return credits;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setGpa(double gpa) {
        this.gpa = gpa;
    }

    public void setCredits(int credits) {
        this.credits = credits;
    }
}
