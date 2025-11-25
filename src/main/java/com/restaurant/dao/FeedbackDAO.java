package com.restaurant.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.restaurant.model.Feedback;
import com.restaurant.util.DBUtil;

public class FeedbackDAO {
	
	public List<Feedback> getAllFeedback() {
        List<Feedback> list = new ArrayList<>();

        String sql = "SELECT * FROM feedback ORDER BY submitted_at DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql);
             ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {
                Feedback f = new Feedback(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("subject"),
                    rs.getString("message"),
                    rs.getString("submitted_at"),
                    rs.getString("status")
                );
                list.add(f);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }


    public boolean updateStatus(int id, String status) {
        String sql = "UPDATE feedback SET status=? WHERE id=?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {

            pst.setString(1, status);
            pst.setInt(2, id);

            return pst.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

}
