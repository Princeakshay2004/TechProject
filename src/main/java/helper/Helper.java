package helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {

	// 1) To delete File
	public static boolean deleteFile(String path)
	{
		boolean f=false;
		
		try {
		File file=new File(path);
		file.delete();
		f=true;
		}
		catch(Exception e)
		{
			e.printStackTrace();

		}
		
		return f;	
	}
	
	// 2) To save new file
	
	public static  boolean saveFile(InputStream io,String path)
	{
		boolean f=false;
		try {
			byte b[]=new byte[io.available()];
			io.read(b);
			FileOutputStream fos=new FileOutputStream(path);
			fos.write(b);
			fos.flush();
			fos.close();
			f=true;			
		}
		catch(Exception e)
		{
			System.out.println("error in file saving");
			e.printStackTrace();
		}	
		return f;		
	}
	
	
}
