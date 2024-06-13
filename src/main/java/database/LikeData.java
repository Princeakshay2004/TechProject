package database;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeData {
	private Connection con;

	public LikeData(Connection con) {
		this.con = con;
	}

	
	// To insert Like
	public boolean insertLike(int pid,int uid) {
		
		boolean f=false;
		
		try {	
		String query="insert into liked(pid,uid) values(?,?)";
		PreparedStatement pstmt=this.con.prepareStatement(query);
		pstmt.setInt(1, pid);
		pstmt.setInt(2, uid);
		pstmt.executeUpdate();
		f=true;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return f;
		
	}
	
	// TO Count Post Like
	public int PostLikeCount(int pid)
	{
		int count=0;
		try {
		String query="select count(*) from liked where pid=?";
		PreparedStatement pstmt=this.con.prepareStatement(query);
		pstmt.setInt(1, pid);
		ResultSet set=	pstmt.executeQuery();
		
		if(set.next())
		{
			count=set.getInt("count(*)");
		}

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return count;
	}
	
	// TO show post is liked or not
	public boolean isLikedByUser(int pid,int uid)
	{
		boolean f=false;
		try {
			String query="select * from liked where pid=? and uid=?";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			pstmt.setInt(1, pid);
			pstmt.setInt(2, uid);
			ResultSet set=pstmt.executeQuery();
			
			if(set.next())
			{
				f=true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}	
		return f;
		
	}
	
	// To dislike post
	
	public boolean deleteLike(int pid,int uid)
	{
		boolean f=false;
		
		try {
			String query="delete from liked where pid=? and uid=?";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			pstmt.setInt(1, pid);
			pstmt.setInt(2, uid);
			pstmt.executeUpdate();
			f=true;

		}
		catch (Exception e) {
		e.printStackTrace();
		}
		
		
		
		return false;
		
	}
	
	
}
