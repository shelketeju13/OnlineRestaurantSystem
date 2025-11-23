package com.restaurant.dao;

import java.sql.*;

public class AdminDashboardDAO {

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/restaurant_db",
            "root",
            "teju132005"
        );
    }

    // Get Total Users
    public int getTotalUsers() {
        try (Connection con = getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "SELECT COUNT(*) AS total FROM users"
            );
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt("total");
        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }

    // Get Total Menu Items
    public int getTotalMenuItems() {
        try (Connection con = getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "SELECT COUNT(*) AS total FROM menu"
            );
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt("total");
        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }

    // Get Total Orders
    public int getTotalOrders() {
        try (Connection con = getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "SELECT COUNT(*) AS total FROM orders"
            );
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt("total");
        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }

    // Get Total Revenue
    public double getTotalRevenue() {
        try (Connection con = getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "SELECT SUM(total_price) AS revenue FROM orders"
            );
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getDouble("revenue");
        } catch (Exception e) { e.printStackTrace(); }
        return 0.0;
    }
}
