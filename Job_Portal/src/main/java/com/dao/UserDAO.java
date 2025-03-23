package com.dao;

import java.security.spec.PSSParameterSpec;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAO {
	private Connection connection;
	
	public UserDAO(Connection connection) {
		super();
		this.connection = connection;
	}
	
	public boolean addUser(User u) {
		boolean f = false;
		try {
			String sqlString = "insert into user(name,qualification,email,password,role) values(?,?,?,?,?)";
			PreparedStatement pStatement = connection.prepareStatement(sqlString);
			pStatement.setString(1, u.getName());
			pStatement.setString(2, u.getQualification());
			pStatement.setString(3, u.getEmail());
			pStatement.setString(4, u.getPassword());
			pStatement.setString(5, "user");
			
			int i = pStatement.executeUpdate();
			if (i==1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public User login(String em,String pw) {
		User u= null;
		try {
			String sql = "select * from user where email = ? and password = ?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, pw);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				u = new User();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setQualification(rs.getString(5));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
				u.setRole(rs.getString(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return u;
	}
	
	public boolean updateUser(User u) {
		boolean f = false;
		try {
			String sql = "update user set name = ?,qualification = ?,email = ?,password = ? where id = ?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getQualification());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getPassword());
			ps.setInt(5, u.getId());
			
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
}