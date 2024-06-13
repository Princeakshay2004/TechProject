package database;

import java.sql.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import entity.Category;
import entity.Post;

public class PostData {

	 Connection con;

	public PostData(Connection con) {
		super();
		this.con = con;
	}
	
	 public ArrayList<Category> getAllCategory(){
		ArrayList<Category> list=new ArrayList<Category>();
		 
		try {
			String query="select * from categories";
			Statement pstmt=this.con.createStatement();
			ResultSet set=pstmt.executeQuery(query);
			while(set.next())
			{
				int cid=set.getInt("cid");
				String name=set.getString("name");
				String description=set.getString("description");
				Category c=new Category(cid,name,description);
				list.add(c);				
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
 
		 return list;
		 
	 }
	
	 
	 // To save Post
	public boolean savePost(Post p)
	{
		boolean f=false;
		
		try {
			
			String query="insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			pstmt.setString(1, p.getpTitle());
			pstmt.setString(2,p.getpContent());
			pstmt.setString(3,p.getpCode());
			pstmt.setString(4,p.getpPic());
			pstmt.setInt(5,p.getCatId());
			pstmt.setInt(6,p.getUserId());
			
			pstmt.executeUpdate();
			f=true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		return f;
		
	}
	
	
	// To get all post
	public List<Post> getAllPost(){		
		List<Post>list=new ArrayList<>();
		// fetch all post
		try {
			String query="select * from posts";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			ResultSet set=pstmt.executeQuery();
			
			while(set.next())
			{
				
				int pid=set.getInt("pid");
				String pTitle=set.getString("pTitle");
				String pContent=set.getString("pContent");
				String pCode=set.getString("pCode");
				String pPic=set.getString("pPic");
				Timestamp date=set.getTimestamp("pDate");
				int catId= set.getInt("catId");
				int userId=set.getInt("userId");
				
				Post post=new Post(pid,pTitle,pContent,pCode,pPic,date,catId,userId);
				
				list.add(post);
			}
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}	
		return list;		
	}
	
	// To get Post by id
	public List<Post> getPostByCatId(int catId)
	{
		List<Post>list=new ArrayList<>();
		// fetch all post by id
		try {
			String query="select * from posts where catId=?";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			pstmt.setInt(1, catId);
			ResultSet set=pstmt.executeQuery();
			
			while(set.next())
			{
				
				int pid=set.getInt("pid");
				String pTitle=set.getString("pTitle");
				String pContent=set.getString("pContent");
				String pCode=set.getString("pCode");
				String pPic=set.getString("pPic");
				Timestamp date=set.getTimestamp("pDate");
				int userId=set.getInt("userId");
				
				Post post=new Post(pid,pTitle,pContent,pCode,pPic,date,catId,userId);
				
				list.add(post);
			}
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;	
		
	}
	
	 // Get post by postId
	public Post getPostByPostId(int postId)
	{
		Post post=null;
		try {
			String query="select *from posts where pid=?";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			pstmt.setInt(1, postId);
			ResultSet set=pstmt.executeQuery();
			if(set.next())
			{
			
				int pid=set.getInt("pid");
				String pTitle=set.getString("pTitle");
				String pContent=set.getString("pContent");
				String pCode=set.getString("pCode");
				String pPic=set.getString("pPic");
				int catId=set.getInt("catId");
				Timestamp date=set.getTimestamp("pDate");
				int userId=set.getInt("userId");
				
				post=new Post(pid,pTitle,pContent,pCode,pPic,date,catId,userId);
				
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return post;
		
	}
	
	
	
}
