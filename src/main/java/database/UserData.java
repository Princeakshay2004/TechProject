package database;

import java.sql.*;

import entity.User;

public class UserData {

	private Connection con;

	public UserData(Connection con) {
		super();
		this.con = con;
	}

	// step 1: method to insert to database

	public boolean saverUser(User user) {
		boolean f = false;

		try {
			// user --> database
			String query = "insert into user(name,mobile,email,password,gender)values(?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getMobile_no());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getPassword());
			pstmt.setString(5, user.getGender());

			pstmt.executeUpdate();

			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	// step 2: Login user by username and password
	
	public User getUserByEmailAndPassword(String email,String password)
	{
			User user=null;
			try {
				String query= "select * from user where email=?  and password=?"; 
				PreparedStatement pstmt = this.con.prepareStatement(query);
				pstmt.setString(1,email);
				pstmt.setString(2, password);
				
				ResultSet set=pstmt.executeQuery();
				
				if(set.next())
				{
					user =new User();
					user.setName(set.getString("name"));
					user.setId(set.getInt("id"));
					user.setPassword(set.getString("password"));
					user.setMobile_no(set.getString("mobile"));
					user.setEmail(set.getString("email"));
					user.setGender(set.getString("gender"));
					user.setProfile(set.getString("profile"));
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
			return user;
			
	}

	
	// update any user
	
	public boolean updateUser(User user)
	{
		boolean f=false;
		
		try {
			String query="update user set name=?,mobile=?,email=?,password=?,gender=?,profile=? where id=?";
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setString(1,user.getName());
			pstmt.setString(2,user.getMobile_no());
			pstmt.setString(3,user.getEmail());
			pstmt.setString(4,user.getPassword());
			pstmt.setString(5,user.getGender());
			pstmt.setString(6,user.getProfile());
			pstmt.setInt(7,user.getId());

			pstmt.executeUpdate();
			f=true;

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
		
	}
	
	// get User By PostId
	public User getUserByUserId(int userId)
	{	
		User user=null;
		try 
		{
			String query="select * from user where id=?";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			pstmt.setInt(1, userId);
			ResultSet set=pstmt.executeQuery();		
			if(set.next())
			{
			user =new User();
			user.setName(set.getString("name"));
			user.setId(set.getInt("id"));
			user.setPassword(set.getString("password"));
			user.setMobile_no(set.getString("mobile"));
			user.setEmail(set.getString("email"));
			user.setGender(set.getString("gender"));
			user.setProfile(set.getString("profile"));
			
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return user;
		
	}
	
	

}
