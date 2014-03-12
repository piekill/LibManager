/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package library;
import java.sql.*;
/**
 *
 * @author jesse
 */
public class GetConn{
    Connection conn=null;
    public GetConn(){
              this.connect();
    }

    public Connection getConn(){
            return this.conn;
    }
    public boolean connect(){
           try{
       DriverManager.registerDriver(new org.gjt.mm.mysql.Driver());
    conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/lib","root","123");
      }catch(Exception ex){
           ex.printStackTrace();
     return false;
      }
      return true;
    }
}
