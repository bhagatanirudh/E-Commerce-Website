package com.eazydeals.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.eazydeals.entities.Wishlist;

public class WishlistDao {
	private Connection con;

	public WishlistDao(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean addToWishlist(Wishlist w) {
		boolean flag = false;
		try {
			String query = "insert into wishlist(iduser, idproduct) values(?,?)";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, w.getUserId());
			psmt.setInt(2, w.getProductId());
			
			psmt.executeUpdate();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	public boolean getWishlist(int uid, int pid) {
		boolean flag = false;
		try {
			String query = "select * from wishlist where iduser = ? and idproduct = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, uid);
			psmt.setInt(2, pid);
			
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public List<Wishlist> getListByUserId(int uid){
		List<Wishlist> list = new ArrayList<Wishlist>();
		try {
			String query = "select * from wishlist where iduser = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, uid);
			
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				Wishlist wishlist = new Wishlist();
				wishlist.setWishlistId(rs.getInt("idwishlist"));
				wishlist.setUserId(rs.getInt("iduser"));
				wishlist.setProductId(rs.getInt("idproduct"));
				
				list.add(wishlist);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public void deleteWishlist(int uid, int pid) {
		try {
			String query = "delete from wishlist where iduser = ? and idproduct = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, uid);
			psmt.setInt(2, pid);
			
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
