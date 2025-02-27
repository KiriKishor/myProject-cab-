package Bean;

public class AdminViewBookingsBean {
    private int bookingNumber;
    private String username;
    private String mobileNo;
    private String startingPoint;
    private String finishingPoint;
    private double distance;

    public AdminViewBookingsBean() {
    }

    public AdminViewBookingsBean(int bookingNumber, String username, String mobileNo, String startingPoint, String finishingPoint, double distance) {
        this.bookingNumber = bookingNumber;
        this.username = username;
        this.mobileNo = mobileNo;
        this.startingPoint = startingPoint;
        this.finishingPoint = finishingPoint;
        this.distance = distance;
    }

    // Getters and Setters
    public int getBookingNumber() { return bookingNumber; }
    public void setBookingNumber(int bookingNumber) { this.bookingNumber = bookingNumber; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getMobileNo() { return mobileNo; }
    public void setMobileNo(String mobileNo) { this.mobileNo = mobileNo; }

    public String getStartingPoint() { return startingPoint; }
    public void setStartingPoint(String startingPoint) { this.startingPoint = startingPoint; }

    public String getFinishingPoint() { return finishingPoint; }
    public void setFinishingPoint(String finishingPoint) { this.finishingPoint = finishingPoint; }

    public double getDistance() { return distance; }
    public void setDistance(double distance) { this.distance = distance; }
}
