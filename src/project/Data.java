package project;

import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.Date;
import java.text.*;

public class Data {
	
	public void GetData( Info avginfo){ 
         //改地址就是我们服务器的地址，后面跟的是相应的数据文件名。
		URL url = null;
		try{
			url = new URL( "http://120.55.67.135/1.csv");
			}
		
		catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
		
		HttpURLConnection connection = null;
		try {
			connection = (HttpURLConnection) url.openConnection();
			}
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
		
		//服务器的常用的两个方法,post,get
		try {
			connection.setRequestMethod( "GET") ;
			} 
		catch (ProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
		
		//链接超时,读取超时，根据自己情况定
		connection.setConnectTimeout(18000) ;
		connection.setReadTimeout(18000) ;
		
		//下面是读取，可以用connection带的方法，获取输入流
		InputStream inStream = null;
		try {
			inStream = connection.getInputStream();
			}
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
		
		BufferedReader reader = null;
			try {
				reader = new BufferedReader(new InputStreamReader(inStream,"GB2312" ));
			} 
			catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				}

			//时间,溶解氧,氨氮,pH,温度,增氧机,加热,异常代码
			//因为得到每行数据是2016/1/7 19:53:22,4.12,0.0169,6.99,22.4,1,0,0这种格式的，所以需要用
			//String 中的split方法处理一下，然后将得到的第三个数据转化为double类型。（item[2]对应的是0.0169这个数据）
			//最后添加到dataPoint中。
			String line;
			DBOperation db=new DBOperation();
			String time=db.readInfo();//读取数据库最后一条数据的时间
			if(time.equals("")||time.equals(null)){
				time="2000-01-01 01:00:00";
			}
			DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置时间格式
			Date Time=new Date();
			try {
				Time = sdf.parse(time);
			} 
			catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			DateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss"); 
			//avginfo=new Info();//保存读取的平均值
			int num=0;
			
			try {
				
				while((line=reader.readLine())!= null){//逐条读取
					++num;
					String item[] = line.split("," );
					
					//信息取出，保存在info
					Info info=new Info();					
					double O2 = Double.parseDouble(item[1]);
					double NHN = Double.parseDouble(item[2]) ;					
					double ph = Double.parseDouble(item[3]);					
					double t = Double.parseDouble(item[4]);					
					int addo = Integer.parseInt(item[5]);					
					int heat = Integer.parseInt(item[6]);					
					int ex = Integer.parseInt(item[7]);
					
					info.set_time(item[0]);
					info.set_O2(O2);
					info.set_NHN(NHN);
					info.set_ph(ph);
					info.set_t(t);
					info.set_addo(addo);
					info.set_heat(heat);
					info.set_ex(ex);
					
					//累加
					avginfo.set_O2(O2+avginfo.get_O2());
					avginfo.set_NHN(NHN+avginfo.get_NHN());
					avginfo.set_ph(ph+avginfo.get_ph());
					avginfo.set_t(t+avginfo.get_t());
					
					try {
						Date ttime=df.parse(item[0]);
						//System.out.println(ttime);
						if(ttime.after(Time)){//判断当前读取信息的日期是否在数据库最后一条信息后
							db.addInfo(info);
						}
							
					}
					catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			catch (NumberFormatException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//取平均
			avginfo.set_O2(avginfo.get_O2()/num);
			avginfo.set_NHN(avginfo.get_NHN()/num);
			avginfo.set_ph(avginfo.get_ph()/num);
			avginfo.set_t(avginfo.get_t()/num);
			
			System.out.println(avginfo.get_O2());
			System.out.println(avginfo.get_NHN());
			System.out.println(avginfo.get_ph());
			System.out.println(avginfo.get_t());
		}

}
