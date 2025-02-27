package Bean;

public class DriverBean {
    private String name;
    private String address;
    private String nicNo;
    private String imagePath;

    public DriverBean(String name, String address, String nicNo, String imagePath) {
        this.name = name;
        this.address = address;
        this.nicNo = nicNo;
        this.imagePath = imagePath;
    }

    // Getters and Setters
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNicNo() {
        return nicNo;
    }

    public void setNicNo(String nicNo) {
        this.nicNo = nicNo;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
}
