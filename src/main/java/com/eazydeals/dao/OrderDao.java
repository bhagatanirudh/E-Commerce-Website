package com.eazydeals.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.eazydeals.entities.Order;

public class OrderDao {
	
	private Connection con;
	public OrderDao(Connection con) {
		super();
		this.con = con;
	}
	
	public int insertOrder(Order order) {
		int id = 0;
		try {
			String query = "insert into `order`(orderid, status, paymentType, userId) values(?, ?, ?, ?)";
			PreparedStatement psmt = this.con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
			
			psmt.setString(1, order.getOrderId());
			psmt.setString(2, order.getStatus());
			psmt.setString(3, order.getPayementType());
			psmt.setInt(4, order.getUserId());
			
			int affectedRows = psmt.executeUpdate();

	        if (affectedRows == 0) {
	            throw new SQLException("Insertion failed, no rows affected.");
	        }
	        try (ResultSet generatedKeys = psmt.getGeneratedKeys()) {
	            if (generatedKeys.next()) {
	                id = generatedKeys.getInt(1);
	            }
	            else {
	                throw new SQLException("Insertion failed, no ID obtained.");
	            }
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}
	public List<Order> getAllOrderByUserId(int uid){
		List<Order> list = new ArrayList<Order>();
		try {
			String query = "select * from `order` where userId = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, uid);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				Order order = new Order();
				order.setId(rs.getInt("id"));
				order.setOrderId(rs.getString("orderid"));
				order.setStatus(rs.getString("status"));
				order.setDate(rs.getTimestamp("date"));
				order.setPayementType(rs.getString("paymentType"));
				order.setUserId(uid);

				list.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public Order getOrderById(int id){
		Order order = new Order();
		try {
			String query = "select * from `order` where id = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, id);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				order.setId(rs.getInt("id"));
				order.setOrderId(rs.getString("orderid"));
				order.setStatus(rs.getString("status"));
				order.setDate(rs.getTimestamp("date"));
				order.setPayementType(rs.getString("paymentType"));
				order.setUserId(rs.getInt("userId"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return order;
	}
	public List<Order> getAllOrder(){
		List<Order> list = new ArrayList<Order>();
		try {
			String query = "select * from `order`";
			Statement statement = this.con.createStatement();
			ResultSet rs = statement.executeQuery(query);
			while (rs.next()) {
				Order order = new Order();
				order.setId(rs.getInt("id"));
				order.setOrderId(rs.getString("orderid"));
				order.setStatus(rs.getString("status"));
				order.setDate(rs.getTimestamp("date"));
				order.setPayementType(rs.getString("paymentType"));
				order.setUserId(rs.getInt("userId"));
				
				list.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public void updateOrderStatus(int oid, String status) {
		try {
			String query = "update `order` set status = ? where id = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setString(1, status);
			psmt.setInt(2, oid);

			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
