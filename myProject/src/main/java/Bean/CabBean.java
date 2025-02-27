package Bean;

public class CabBean {
    private String model;
    private String cabNumber;
    private int numSeats;
    private String imagePath;

    public CabBean(String model, String cabNumber, int numSeats, String imagePath) {
        this.model = model;
        this.cabNumber = cabNumber;
        this.numSeats = numSeats;
        this.imagePath = imagePath;
    }

    // Getters and Setters
    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getCabNumber() {
        return cabNumber;
    }

    public void setCabNumber(String cabNumber) {
        this.cabNumber = cabNumber;
    }

    public int getNumSeats() {
        return numSeats;
    }

    public void setNumSeats(int numSeats) {
        this.numSeats = numSeats;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
}
