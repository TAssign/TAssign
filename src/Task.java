public class Task {

    private String name;
    private boolean complete;

    public Task(String name, boolean complete) {
        this.name = name;
        this.complete = complete;
    }

    public String getName() {
        return name;
    }

    public boolean isComplete() {
        return complete;
    }

    public void complete() {
        complete = true;
    }

    public void incomplete() {
        complete = false;
    }
}
