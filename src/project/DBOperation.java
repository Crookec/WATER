package project;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Statement;


public class DBOperation {

	private Connection conn;
	
	public DBOperation(){
		
	}
	
	public String readInfo(){//读取最近添加信息的时间
		conn=DBConnection.get_Connection();
		String time=new String();
		try{
			String sql="select 时间 from water";
			Statement st = ( Statement )conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				time=rs.getString("时间");
			}
		}
		catch(SQLException ex)
		{
			System.out.printf("%s",ex.toString());
		}
		finally{
			try{
				conn.close();
			}
			catch( SQLException ex ){
				System.out.println( ex.toString()  );
			}
		}
		return time;
	}
	
	public void addInfo(Info info){//添加信息 时间,溶解氧,氨氮,pH,温度,增氧机,加热,异常代码
		conn = DBConnection.get_Connection();
		try{
			String sql = "insert into water(时间,溶解氧,氨氮,ph,增氧机,加热,异常代码) "
					+ "value('"
					+info.get_time()
					+"','"
					+info.get_O2()
					+"','"
					+info.get_NHN()
					+"','"
					+info.get_ph()
					+"','"
					+info.get_addo()
					+"','"
					+info.get_heat()
					+"','"
					+info.get_ex()
					+"')";
			Statement st = ( Statement ) conn.createStatement();
			st.executeUpdate(sql);	
		}
		catch( SQLException ex ){
			System.out.printf("%s\n", ex.toString() );
		}
		finally{
			try{
				conn.close();
			}
			catch( SQLException ex ){
				System.out.println( ex.toString()  );
			}
		}
	}
}
