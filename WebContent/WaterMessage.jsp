<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
var nowAQI=155;
</script>
<style type="text/css">
#allmap{width:980px;height:550px;}
</style>

</head>

<body >
<table id="ALL">
<tr id="biaoti" ><td style="height:50px;width:180px;"></td>
<td style="width:970px;background-color:#EEEEEE;text-align: center;"> 
 <span style="color:black;font-size:40px;font-weight:bold;">  浙江农林大学监测点   </span>  
</td>

</tr>

<tr id="six"><td style="height:530px;width:180px;"></td>
<td style="width:970px" background="img/NL.png" >
<canvas id="myCanvas" width="960px" height="530px"   >
 </canvas>
<div style="position:absolute;width:970px;height:530px;left:194px;top:60px;" > 
<div id="toolTip" style="position:fixed;background-color:white;" onmouseleave='hideToolTip()'>


 </div>
<table >
<tr ><td style="height:90px;width:360px;"></td>
<td></td>
</tr>
<tr><td style="height:30px;width:360px;">
<td><img  src="img/sBig1.png" height="29px" width="30px" onclick="showToolTip('站点1','水质良好',event);" />   </td>
</tr>
</table>




</div>
</td>

</tr>
<table >
</table>
</body>
<script type="text/javascript" src="js/tooltip.js"></script>
<script type="text/javascript">
paint();
function paint(){  
	var c=document.getElementById("myCanvas");
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
                
           var grd_2=context.createRadialGradient(275,365,5,275,365,100);
         
        
            grd_2.addColorStop(0,"rgb(0,0,128)");   
            grd_2.addColorStop(0.5,"rgb(65,105,225)");   
            grd_2.addColorStop(1,"rgb(100,149,237)");    
              context.fillStyle = grd_2;   
             context.fill();     
              
       
          /*    var grd_3 = context.createRadialGradient(718,221,5,718,221,100);
             // var grd_3 = context.createLinearGradient(718,221,680,209);   
           
               grd_3.addColorStop(0,"rgb(0,0,128)");   
               grd_3.addColorStop(0.5,"rgb(65,105,225)");   
               grd_3.addColorStop(1,"rgb(100,149,237)");  
                 context.fillStyle = grd_3;   
                 context.fill();     */
    //最上的晕染             
             context.beginPath();
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
              context.fill();   
              
          

       
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
</script>
</html>