<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@page import="java.util.*" %>
<%@page import="project.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/highcharts.js"></script>
<script src="js/highcharts-more.js"></script>
<script src="js/grid.js"></script>
<script src="scrollPic.js"></script>


<%
//Data data=new Data();
Info avginfo=new Info();
//data.GetData(avginfo);
%>
<script type="text/javascript">
var O2=<%=avginfo.get_O2()%>;
var NHN=<%=avginfo.get_NHN()%>;
var ph=<%=avginfo.get_ph()%>;
var t=<%=avginfo.get_t()%>;

var hours=new Array('11时', '12时','13时','14时','15时','16时','17时','18时', '19时','20时','21时','22时', '23时','0时','1时','2时', '3时','4时','5时','6时','7时');
//过去七小时AQI指数
var everyhAQI=new Array(63, 56, 50, 45,64, 58, 63,40,60,43,76,77,43,45,49,56,44,60,70,65,70,54,55,70);
//近一周的AQI指数
var everydayAQI=new Array(45, 108, 120, 64, 58, 113,40);
//每个站点的实时AQI指数
var everyplAQI=new Array(45,35,46,41,40,36,49,39,43,59,38,50);
//每个
var everyplPM=new Array(24,19,26,26,20,23,24,21,30,19,24,23);
var plname=new Array('杭州市','千岛湖','和睦小学','朝晖五区','浙工农大','卧龙桥','下沙','云溪','城厢镇','临平镇','西溪','滨江');
var nowAQI=155;
var waterchoose=111;
var lan_1=100,lan_2=149,lan_3=237;
var stime=1;
var level="优";
var colday=new Array();
var colplAQI=new Array();
var colplPM=new Array();
for(var i=0;i<everydayAQI.length;++i){
	if(everydayAQI[i]<50)
		colday[i]="#F6BD0F";
	else if(everydayAQI[i]<100)
		colday[i]="#AFD8F8";
	else if(everydayAQI[i]<150)
		colday[i]="#AFD800";
	else
		colday[i]="#8BBA00";
}

for(var i=0;i<everyplAQI.length;++i){
	if(everyplAQI[i]<50)
		colplAQI[i]="#F6BD0F";
	else if(everyplAQI[i]<100)
		colplAQI[i]="#AFD8F8";
	else if(everyplAQI[i]<150)
		colplAQI[i]="#AFD800";
	else
		colplAQI[i]="#8BBA00";
}

for(var i=0;i<everyplPM.length;++i){
	if(everyplPM[i]<50)
		colplPM[i]="#F6BD0F";
	else if(everyplPM[i]<100)
		colplPM[i]="#AFD8F8";
	else if(everyplPM[i]<150)
		colplPM[i]="#AFD800";
	else
		colplPM[i]="#8BBA00";
}
var days=new Array('前天', '昨天','明天');
var daysO=new Array(20, 35, 15);
</script>

<style type="text/css">
#allmap{width:980px;height:550px;}
a:link {text-decoration: none}
*{margin:0;padding:0;}
    ul{list-style:none;}
    img{border:0;}
    .scroll{width:1316px;height:254px;}
    .scroll_left,.scroll_right{width:30px; height:50px; background:url(img/icon.png) no-repeat; background:url(img/icon_ie6.png) no-repeat\9; position:absolute; top:33px; z-index:99; cursor:pointer;filter:alpha(opacity=70); opacity:0.7;}
    .scroll_left{background-position:0 -60px; left:4px;}
    .scroll_right{background-position:0 0; left:1330px;}
   
    .pic{width:1256px;height:254px;float:left;}
    .pic ul{display:block;}
    .pic li{float:left;display:inline;width:1256px;text-align:center;}

#choose td{text-align: center;width:80px;font-weight:bold;color:white}
#choose  td:hover{ 
background-color:white;
color:#00008B; 
} 

#fifth{
height:20px;width:1320px;
background-color:	#4169E1;
text-align: center;
margin-left: auto;
margin-right: auto;
float:left;
}

</style>

</head>
<body>    <!-- background="img/back.jpg" -->
 <div id="Layer" style="position:absolute; width:1366px; height:400px; z-index:-1">    
  <img src="img/back05.jpg" height="400px" width="1366px"/>   
</div> 
<div style="width:1316px;margin-left:50px;">
    <div class="scroll">
        <div class="scroll_left" id="LeftArr"></div>
        <div class="pic" id="scrollPic">
        <ul>
            <li><img src="img/NL-1-1.jpg" width="1256" height="254" alt="" /></li>
            <li><img src="img/NL-2-1.jpg" width="1256" height="254" alt="" /></li>
            
        </ul>
        </div>
        <div class="scroll_right" id="RightArr"></div>
    </div>
</div>
<!-- 滚动 -->

<table id="ALL">
<tr id="first"><td style="width:180px;height:40px"></td>
<td style="width:980px;background-color:#6495ED;">
<table id="choose">
<tr style="height:38px"><td><a href="Main.jsp">首页</a> </td>
<td style="width:100px"><a href="W_WZ.jsp">乌镇观测点</a></td>
<td style="width:160px;background-color:white"><span style="color:#00008B;font-weight:bold;">浙江农林大学观测点</span></td> 
<td style="width:78px "><a href="Message.jsp">相关知识</a></td> 
<td><a href="W_NL.jsp">手机版</a></td></tr></table>
</td></tr>

<tr id="second"><td style="height:252px"></td>
<td><div id="chart_1" style="width:400px;height:250px"></div></td>
</tr>


<tr id="three"><td style="height:252px"></td>
<td>
<table ><tr style="height:250px;"><td style="width:530px"><div id="chart_2" style="width:530px;height:250px"></div></td>
<td style="width:430px;"><div id="chart_3" style="width:430px;height:250px"></div></td></tr></table>
</td>
</tr>

<tr id="four"><td style="height:252px"></td>
<td><div id="chart_4" style="width:970px;height:250px"></div></td>
</tr>

<tr id="five"><td style="height:252px"></td>
<td><div id="chart_5" style="width:970px;height:250px"></div></td>
</tr>



<tr id="six"><td style="height:530px"></td>
<td style="width:970px" background="img/NL.png" >
<canvas id="myCanvas" width="960px" height="530px"   >
 </canvas>
<!-- <div style="position:absolute;width:970px;height:530px;left:180px;top:1316px;background-color:blue;" > 
<div id="toolTip" style="position:fixed;background-color:white;" onmouseleave='hideToolTip()'>


 </div>
<table >
<tr ><td style="height:90px;width:368px;"></td>
<td></td>
</tr>
<tr><td style="height:30px;width:368px;">
<td><img  src="img/sBig1.png" height="29px" width="30px" onclick="showToolTip('站点1','水质良好',event);" />   </td>
</tr>
</table>




</div> -->
</td>

</tr>
</table>

<div id="fifth"  style="font-weight:bold;color:white;"> 
    
浙江农林大学

 </div><!-- 第五块 -->
 
 
</body>
<script type="text/javascript"  src="js/main.js"></script>
<script type="text/javascript" src="js/tooltip.js"></script>
<script type="text/javascript">
//图片滚动
window.onload = function(){
    scrollPic();
   wwpaint();
    paint();
}
function scrollPic() {
    var scrollPic = new ScrollPic();
    scrollPic.scrollContId   = "scrollPic"; //内容容器ID
    scrollPic.arrLeftId      = "LeftArr";//左箭头ID
    scrollPic.arrRightId     = "RightArr"; //右箭头ID

    scrollPic.frameWidth     = 1256;//显示框宽度
    scrollPic.pageWidth      = 1256; //翻页宽度

    scrollPic.speed          = 100; //移动速度(单位毫秒，越小越快)
    scrollPic.space          = 100; //每次移动像素(单位px，越大越快)
    scrollPic.autoPlay       = true; //自动播放
    scrollPic.autoPlayTime   = 3; //自动播放间隔时间(秒)

    scrollPic.initialize(); //初始化
}

//画布
function paint(){   var c=document.getElementById("myCanvas");
var context=c.getContext("2d");
context.beginPath();
context.strokeStyle ="blue";
context.moveTo(380,114);context.lineTo(401,115);context.lineTo(432,121);context.lineTo(458,128);
context.lineTo(469,129);context.lineTo(476,134); context.lineTo(489,134); context.lineTo(519,142);
context.lineTo(557,152);context.lineTo(569,153); context.lineTo(600,145); context.lineTo(619,136);
context.lineTo(633,125);context.lineTo(647,110); context.lineTo(663,92); context.lineTo(673,84);
context.lineTo(697,79);context.lineTo(713,81);context.lineTo(725,90);context.lineTo(734,107);
context.lineTo(740,126);context.lineTo(740,135); context.lineTo(733,143); context.lineTo(734,153);
context.lineTo(740,160);context.lineTo(738,176);context.lineTo(730,193);context.lineTo(723,219);
context.lineTo(722,234);context.lineTo(712,257);context.lineTo(706,272);context.lineTo(698,307);
context.lineTo(667,322);context.lineTo(659,330);context.lineTo(653,348);context.lineTo(647,355);
context.lineTo(612,366);context.lineTo(610,357);context.lineTo(603,350); context.lineTo(597,358);
context.lineTo(595,367);context.lineTo(596,375);context.lineTo(589,377);context.lineTo(587,371);
context.lineTo(581,365);context.lineTo(576,363);context.lineTo(574,370);context.lineTo(575,377);
context.lineTo(577,383);context.lineTo(564,391);context.lineTo(559,382);context.lineTo(550,378);
context.lineTo(548,387);context.lineTo(549,394);context.lineTo(553,401);context.lineTo(545,408);
context.lineTo(540,403);context.lineTo(535,400);context.lineTo(529,400);context.lineTo(529,409);
context.lineTo(532,414);context.lineTo(534,419);context.lineTo(527,431);context.lineTo(522,429);
context.lineTo(516,426);context.lineTo(513,426);context.lineTo(513,434);context.lineTo(515,440);
context.lineTo(519,445);context.lineTo(512,459);context.lineTo(508,470);context.lineTo(507,479);
context.lineTo(470,480);context.lineTo(456,459);context.lineTo(441,444);context.lineTo(420,425);
context.lineTo(393,408);context.lineTo(367,397);context.lineTo(336,391);context.lineTo(305,377);
context.lineTo(275,361);context.lineTo(269,340);context.lineTo(266,313);context.lineTo(261,287);
context.lineTo(255,260);context.lineTo(249,245);context.lineTo(236,234);context.lineTo(224,220);
context.lineTo(215,206);context.lineTo(211,192);context.lineTo(214,187);context.lineTo(221,193);
context.lineTo(228,200);context.lineTo(239,214);context.lineTo(254,222);context.lineTo(264,225);
context.lineTo(278,224);context.lineTo(296,217);context.lineTo(310,206);context.lineTo(327,194);
context.lineTo(340,178);context.lineTo(349,161);context.lineTo(355,145);context.lineTo(366,131);
context.lineTo(376,115);context.lineTo(380,114);context.closePath();context.stroke();
var bgimg=new Image()
//bgimg.src="img/111.jpeg"
bgimg.src="img/"+waterchoose+".jpeg"
 	 var pattern = context.createPattern(bgimg, "no-repeat");   
context.fillStyle = pattern;   
context.fill();  
//	context.drawImage(bgimg,0,0);
      
        
 
        
        /*  var grd = context.createLinearGradient(384,110,421,208);   
     
           //添加颜色断点   
           grd.addColorStop(0,"rgb(0,0,"+nowAQI+")");   
          grd.addColorStop(0.5,"rgb(0,0,"+nowAQI_2+")");   
           grd.addColorStop(1,"rgb(0,0,"+nowAQI_3+")");   
           context.fillStyle = grd;   
           context.fill();   
            */
            
         /*     var bgimg = new Image();   
            bgimg.src = "https://a-ssl.duitang.com/uploads/item/201504/25/20150425H5423_yMVni.jpeg";   
          
                var pattern = context.createPattern(bgimg, "repeat");   
                context.fillStyle = pattern;   
                context.fill();   */
              /*   var img=new Image();
                img.src="https://a-ssl.duitang.com/uploads/item/201504/25/20150425H5423_yMVni.jpeg";
                	context.drawImage(img,0,0); */
                
      /*     var grd_2=context.createRadialGradient(275,365,5,275,365,100);
         
        
            grd_2.addColorStop(0,"rgb(0,0,128)");   
            grd_2.addColorStop(0.5,"rgb(65,105,225)");   
            grd_2.addColorStop(1,"rgb(100,149,237)");    
              context.fillStyle = grd_2;   
             context.fill();     */
              
       
          /*    var grd_3 = context.createRadialGradient(718,221,5,718,221,100);
             // var grd_3 = context.createLinearGradient(718,221,680,209);   
           
               grd_3.addColorStop(0,"rgb(0,0,128)");   
               grd_3.addColorStop(0.5,"rgb(65,105,225)");   
               grd_3.addColorStop(1,"rgb(100,149,237)");  
                 context.fillStyle = grd_3;   
                 context.fill();     */
    //最上的晕染             
/*              context.beginPath();
             context.strokeStyle ="rgb(100,149,237)";
             context.moveTo(384,110);
             context.lineTo(474,133);
             context.lineTo(472,153);
             context.lineTo(463,172);
             context.lineTo(447,189);
             context.lineTo(425,201);
             context.lineTo(398,211);
             context.lineTo(376,212);
             context.lineTo(355,207);
             
             context.lineTo(332,188);
             context.lineTo(340,178);
             context.lineTo(349,161);
             context.lineTo(355,145);
             context.lineTo(366,131);
             context.lineTo(376,115);
             
             context.lineTo(384,110);
             context.closePath();
             context.stroke();
             var grd_1=context.createRadialGradient(384,110,5,384,110,100);
             grd_1.addColorStop(0,"rgb(0,0,"+nowAQI+")");   
             grd_1.addColorStop(0.5,"rgb(65,105,225)");   
             grd_1.addColorStop(1,"rgb(100,149,237)");    
               context.fillStyle = grd_1;   
              context.fill();   */
              
          

       
      //另建一个行数循环
            /*   stime++;
              if(stime%2==1)
              	  {lan_1=lan_2=lan_3=0;}
              else
              	  {lan_1=100;lan_2=149;lan_3=237;}
              if(stime==100)
              	  stime=1;
              paint();
              setTimeout('paint()', 500); // 2秒后重复执行  */       
    }   
    
    function wwpaint(){
    	    stime++;
     if(stime%2==1)
        	  {waterchoose=111;}
        else
        	  {waterchoose=222;}
        if(stime==100)
        	  stime=1;  
        paint();
        setTimeout('wwpaint()', 1000); // 2秒后重复执行  */   
    }
    

 
</script>
</html>