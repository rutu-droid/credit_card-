package com.user;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.channels.FileChannel;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DbConnection;


public class GlobalFunction {
    
    Connection con =null;
      
    Statement st = null;
    PreparedStatement pstmt = null;
    PreparedStatement pstmt1 = null;
    PreparedStatement pstmt2 = null;
    ResultSet rs = null;
    private boolean flag;
        
    public static void copyFile(File sourceFile, File destFile) throws IOException {
    	if (!sourceFile.exists()) {
    		return;
    	}
    	if (!destFile.exists()) {
    		destFile.createNewFile();
    	}
    	FileChannel source = null;
    	FileChannel destination = null;
    	source = new FileInputStream(sourceFile).getChannel();
    	destination = new FileOutputStream(destFile).getChannel();
    	if (destination != null && source != null) {
    		destination.transferFrom(source, 0, source.size());
    	}
    	if (source != null) {
    		source.close();
    	}
    	if (destination != null) {
    		destination.close();
    	}
    }    
    
   public String getFullName(int Userid) throws Exception{
   
       String data="";
       try{
    	 con=DbConnection.getConnection();
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select * from user1 where id='"+Userid+"'");
       if(rs.next()){
       data = rs.getString("Fullname");
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;
       
   }
 
  public String getLatestUserID() throws Exception{
	   
      String data="";
      try{
     	 con=DbConnection.getConnection();

      st = con.createStatement();
      ResultSet rs = st.executeQuery("select id from user1 ORDER BY id DESC LIMIT 1");
      if(rs.next()){
      data = rs.getString("id");
      }
  }catch (SQLException e) {
           System.out.println("Error:" + e);
       } finally {
           if (st != null) {
               st.close();
           }
           if (rs != null) {
               rs.close();
           }
       }
       return data;  
  }
  public static void CreateDirectory(String FolderName)
  {	
	File file = new File("C:\\upload\\"+FolderName);
	if (!file.exists()) {
		if (file.mkdir()) {
			System.out.println("Directory is created!");
		} else {
			System.out.println("Failed to create directory!");
		}
	}
  }
   
      public String getUserEmail(int Userid) throws Exception{
   
       String data="";
       try{
      	 con=DbConnection.getConnection();

       st = con.createStatement();
       ResultSet rs = st.executeQuery("select email from user1 where id='"+Userid+"'");
       if(rs.next()){
       data = rs.getString("email");
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;
       
   }
     
   public boolean checkAdminLogin(String username,String password) throws Exception{
   
       try{
      	 con=DbConnection.getConnection();

       st = con.createStatement();
       ResultSet rs = st.executeQuery("select * from admin where name='"+username+"' and password='"+password+"'");
       if(rs.next()){
       return true;
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return false;       
   }
   
   public boolean VerifySecretCode(int id,String SecretCode) throws Exception{
   
       try{
      	 con=DbConnection.getConnection();

       st = con.createStatement();
       ResultSet rs = st.executeQuery("select * from user1 where id="+id+" and SecretKey='"+SecretCode+"'");
       if(rs.next()){
       return true;
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return false;       
   }
   
   public String getSecretCode(int id) throws Exception{
   
       String data="";
       try{
      	 con=DbConnection.getConnection();

       st = con.createStatement();
       ResultSet rs = st.executeQuery("select SecretKey from user1 where id="+id);
       if(rs.next()){
           data = rs.getString("SecretKey");
       return data;
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;       
   }
   
   public String getQRCode(int id) throws Exception{
	   
       String data="";
       try{
      	 con=DbConnection.getConnection();

       st = con.createStatement();
       ResultSet rs = st.executeQuery("select * from user1 where id="+id);
       if(rs.next()){
           data = rs.getString("QRCode");
       return data;
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;       
   }
   
   
   
}