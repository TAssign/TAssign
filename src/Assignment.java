import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

public class Assignment {

    private String name;
    private String description;
    private LocalDate dueDate;
    private LocalTime dueTime;
    private ArrayList<Task> subtasks;
    private Course course;
    private Weight weight;

    private boolean complete;
    private double potentialPoints;
    private double actualPoints;

    public Assignment(String name, String description, LocalDate dueDate, LocalTime dueTime, Course course, Weight weight, double potentialPoints) {
        this.name = name;
        this.description = description;
        this.dueDate = dueDate;
        this.dueTime = dueTime;
        this.subtasks = new ArrayList<Task>();
        this.course = course;
        this.weight = weight;
        this.potentialPoints = potentialPoints;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public LocalDate getDueDate() {
        return dueDate;
    }

    public LocalTime getDueTime() {
        return dueTime;
    }

    public Course getCourse() {
        return course;
    }

    public Weight getWeight() {
        return weight;
    }

    public double gePotentialPoints() {
        return potentialPoints;
    }

    public double getActualPoints() {
        return actualPoints;
    }

    public double isComplete() {
        return complete;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setDueDate(LocalDate dueDate) {
        this.dueDate = dueDate;
    }

    public void setDueTime(LocalTime dueTime) {
        this.dueTime = dueTime;
    }

    public void addSubtask(Task task) {
        subtasks.add(task);
    }

    public void setWeight(Weight weight) {
        this.weight = weight;
    }

    public void setPotentialPoints(double potentialPoints) {
        this.potentialPoints = potentialPoints;
    }

    public void complete() {
        complete = true;
    }

    public void incomplete() {
        complete = false;
    }
}
