package mx.edu.utez.Servlets.movies;

public class BeanMovie {

    private int id;
    private String name;
    private String description;
    private String release_date;
    private double collection;
    private int status;

    public BeanMovie() {
    }

    public BeanMovie(int id, String name, String description, String release_date, double collection, int status) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.release_date = release_date;
        this.collection = collection;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getRelease_date() {
        return release_date;
    }

    public void setRelease_date(String release_date) {
        this.release_date = release_date;
    }

    public double getCollection() {
        return collection;
    }

    public void setCollection(double collection) {
        this.collection = collection;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}
