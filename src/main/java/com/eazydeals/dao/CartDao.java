package com.eazydeals.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.eazydeals.entities.Cart;

public class CartDao {

	private Connection con;

	public CartDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean addToCart(Cart cart) {
		boolean flag = false;
		try {
			String query = "insert into cart(uid, pid, quantity) values(?,?,?)";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, cart.getUserId());
			psmt.setInt(2, cart.getProductId());
			psmt.setInt(3, cart.getQuantity());

			psmt.executeUpdate();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public List<Cart> getCartListByUserId(int uid) {
		List<Cart> list = new ArrayList<Cart>();
		try {
			String query = "select * from cart where uid = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, uid);

			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				Cart cart = new Cart();
				cart.setCartId(rs.getInt("id"));
				cart.setUserId(rs.getInt("uid"));
				cart.setProductId(rs.getInt("pid"));
				cart.setQuantity(rs.getInt("quantity"));

				list.add(cart);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int getQuantity(int uid, int pid) {
		int qty = 0;
		try {
			String query = "select * from cart where uid = ? and pid = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, uid);
			psmt.setInt(2, pid);

			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				qty = rs.getInt("quantity");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return qty;
	}

	public int getQuantityById(int id) {
		int qty = 0;
		try {
			String query = "select * from cart where id = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, id);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				qty = rs.getInt("quantity");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return qty;
	}

	public void updateQuantity(int id, int qty) {

		try {
			String query = "update cart set quantity = ? where id = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, qty);
			psmt.setInt(2, id);

			psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void removeProduct(int cid) {
		try {
			String query = "delete from cart where id = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, cid);

			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void removeAllProduct() {
		try {
			String query = "delete from cart";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int getIdByUserIdAndProductId(int uid, int pid) {
		int cid = 0;
		try {
			String query = "select * from cart where uid = ? and pid = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, uid);
			psmt.setInt(2, pid);

			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				cid = rs.getInt("id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cid;
	}

	public int getCartCountByUserId(int uid) {
		int count = 0;
		try {
			String query = "select count(*) from cart where uid=?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, uid);

			ResultSet rs = psmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public int getProductId(int cid) {
		int pid = 0;
		try {
			String query = "select pid from cart where id=?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, cid);
			ResultSet rs = psmt.executeQuery();
			rs.next();
			pid = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pid;
	}
}
