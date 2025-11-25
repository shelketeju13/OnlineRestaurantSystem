package com.restaurant.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
    
    public List<Order> getAllOrders() {

        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM orders ORDER BY order_date DESC";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Order o = new Order(
                    rs.getInt("id"),
                    rs.getString("username"),
                    rs.getString("item_name"),   
                    rs.getInt("quantity"),
                    rs.getString("address"),
                    rs.getDouble("total_price"), 
                    rs.getString("status")
                );

                list.add(o);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }



    
    public boolean updateOrderStatus(int id, String status) {
        String sql = "UPDATE orders SET status=? WHERE id=?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, status);
            ps.setInt(2, id);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

}