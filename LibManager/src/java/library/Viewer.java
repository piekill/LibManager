/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package library;
import java.sql.*;
import java.util.*;

/**
 *
 * @author jesse
 */
public class Viewer {
       private Connection conn=null;
    private Statement stmt=null;
    private ResultSet rs=null;
    private ResultSetMetaData rsmd=null;

    private String sqlStr;

    private int rowCount;

    private int pageCount;

    private int pageSize;

    private int columnCount;
    private int irows;
    public void initialize(String sqlStr,int pageSize,int showPage)
    {
            this.sqlStr=sqlStr;
      this.irows=pageSize*(showPage-1);
      this.pageSize=pageSize;
      try
      {
          GetConn Data=new library.GetConn();
          this.conn=Data.getConn();
       this.stmt=this.conn.createStatement();
       this.rs=this.stmt.executeQuery(this.sqlStr);
       this.rsmd=this.rs.getMetaData();
       if(this.rs!=null)
       {
          this.rs.last();
       this.rowCount=this.rs.getRow();
       this.rs.first();
       this.columnCount=this.rsmd.getColumnCount();
       this.pageCount=(this.rowCount-1)/this.pageSize+1;
       this.rs.close();
       this.stmt.close();
       }
       this.sqlStr=this.sqlStr+" limit "+this.irows+","+this.pageSize;
       this.stmt=this.conn.createStatement();
       this.rs=this.stmt.executeQuery(this.sqlStr);
       }catch(Exception ex)
    {
              ex.printStackTrace();
        }
    }
    public Vector<Object> getPage()
    {
           Vector<Object> vData=new Vector<Object>();
     try
     {
         if(this.rs!=null)
      {

         while(this.rs.next())
      {
             String[] sData=new String[this.columnCount];
          for(int j=0;j<this.columnCount;j++)
       {
               sData[j]=this.rs.getString(j+1);
          }
          vData.addElement(sData);
        }
        this.rs.close();
        this.stmt.close();
        this.conn.close();
       }
      }catch(Exception ex)
      {
          ex.printStackTrace();
      }
            return vData;
  }


     public int getPageCount()
     {
             return this.pageCount;
     }

     public int getRowCount()
     {
             return this.rowCount;
     }
}
