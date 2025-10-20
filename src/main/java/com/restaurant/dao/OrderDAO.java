package com.restaurant.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.restaurant.model.Order;
import com.restaurant.util.DBUtil;

public class OrderDAO {
    public boolean saveOrder(Order order) {
        boolean success = false;

        String sql = "INSERT INTO orders (username, item_name, quantity, address, total_price) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, order.getUsername());
            ps.setString(2, order.getItemName());
            ps.setInt(3, order.getQuantity());
            ps.setString(4, order.getAddress());
            ps.setDouble(5, order.getQuantity() * order.getPrice()); 

            int rows = ps.executeUpdate();
            success = rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

}
