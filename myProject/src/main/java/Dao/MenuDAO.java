package Dao;

import java.sql.*;
import java.util.*;
import Bean.DriverBean;
import Bean.CabBean;

public class MenuDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/cab";
    private static final String USER = "root";
    private static final String PASSWORD = "123456789";

    private static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public static List<DriverBean> getDrivers() {
        List<DriverBean> drivers = new ArrayList<>();
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM drivers");
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                DriverBean driver = new DriverBean();
                driver.setId(rs.getInt("id"));
                driver.setName(rs.getString("name"));
                driver.setAddress(rs.getString("address"));
                driver.setNicNo(rs.getString("nic_no"));
                driver.setImage(rs.getString("image"));
                drivers.add(driver);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return drivers;
    }

    public static List<CabBean> getCabs() {
        List<CabBean> cabs = new ArrayList<>();
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM cabs");
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                CabBean cab = new CabBean();
                cab.setId(rs.getInt("id"));
                cab.setModel(rs.getString("model"));
                cab.setCabNumber(rs.getString("cab_number"));
                cab.setSeats(rs.getInt("seats"));
                cab.setImage(rs.getString("image"));
                cabs.add(cab);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cabs;
    }
}