package com.dao;

import java.security.KeyStore.PrivateKeyEntry;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import com.entity.Jobs;

public class JobDAO {
	private Connection connection;

	public JobDAO(Connection connection) {
		super();
		this.connection = connection;
	}
	
	public boolean addJobs(Jobs j) {
		boolean f = false;
		try {
			
			String sql= "insert into job(title,description,category,status,location) values(?,?,?,?,?)";
			
			PreparedStatement pStatement = connection.prepareStatement(sql);
			pStatement.setString(1,j.getTitle());
			pStatement.setString(2, j.getDescription());
			pStatement.setString(3, j.getCategory());
			pStatement.setString(4, j.getStatus());
			pStatement.setString(5, j.getLocation());
			
			int i = pStatement.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List<Jobs> getAllJobs(){

		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j = null;
		
		try {
			String sqlString = "Select * from job order by id desc";
			PreparedStatement ps = connection.prepareStatement(sqlString);
			ResultSet rs = ps.executeQuery();
			while (rs.next()){
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+"");
				
				list.add(j);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Jobs getJobById(int id){

		Jobs j = null;
		
		try {
			String sqlString = "Select * from job where id = ?";
			PreparedStatement ps = connection.prepareStatement(sqlString);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+"");
			}
				
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return j;
	}
	
	public boolean updateJob(Jobs j) {
		boolean f = false;
		try {
			
			String sql= "update job set title=?,description=?,category=?,status=?,location=? where id = ?";
			
			PreparedStatement pStatement = connection.prepareStatement(sql);
			
			pStatement.setString(1,j.getTitle());
			pStatement.setString(2, j.getDescription());
			pStatement.setString(3, j.getCategory());
			pStatement.setString(4, j.getStatus());
			pStatement.setString(5, j.getLocation());
			pStatement.setInt(6, j.getId());
			
			int i = pStatement.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean deleteJobs(int id) {
		
		boolean f = false;
		try {
			String sqlString = "delete from job where id = ?";
			PreparedStatement pStatement = connection.prepareStatement(sqlString);
			pStatement.setInt(1, id);
			
			int i = pStatement.executeUpdate();
			if (i==1) {
				f  = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
}
