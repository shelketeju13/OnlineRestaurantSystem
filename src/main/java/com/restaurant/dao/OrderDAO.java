package com.restaurant.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.restaurant.model.Order;
import com.restaurant.util.DBUtil;

public class OrderDAO {
	public boolean saveOrder(Order order) {
        String sql = "INSERT INTO orders (username, item_name, quantity, address) VALUES (?, ?, ?, ?)";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, order.getUsername());
            ps.setString(2, order.getItemName());
            ps.setInt(3, order.getQuantity());
            ps.setString(4, order.getAddress());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
