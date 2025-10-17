package com.restaurant.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.restaurant.model.User;

public class UserDAO {
	private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant_db", "root", "teju132005");
    }

    // Register user
    public boolean registerUser(User user) {
        try (Connection con = getConnection()) {
            PreparedStatement check = con.prepareStatement("SELECT * FROM users WHERE username=?");
            check.setString(1, user.getUsername());
            ResultSet rs = check.executeQuery();
            if (rs.next()) return false; 

            PreparedStatement ps = con.prepareStatement("INSERT INTO users(username, password) VALUES(?, ?)");
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean validateUser(User user) {
        try (Connection con = getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ResultSet rs = ps.executeQuery();
            return rs.next(); // user exists
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}


