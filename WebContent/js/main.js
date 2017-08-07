/**
 *
 * Active Charts using Highcharts demonstration
 *
 * Licensed under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 * 
 * Copyright 2012, Script Tutorials
 * http://www.script-tutorials.com/
 */

var chart1, chart2,chart3,chart4,chart5;
// Once DOM (document) is finished loading
$(document).ready(function() {

	//过去七天AQI指数
    chart3 = new Highcharts.Chart({
     chart: {
        renderTo: 'chart_3',
        type: 'column',
     },
     title: {
        text: '数值平均值',
        align:'left'
     },
     xAxis: {
     	//tickInterval:4,
    	 tickmarkPlacement:'on',
        categories: ['溶解氧', '氨氮', 'ph', '水温']
     },
     yAxis: {
        title: {
           text: ''
        }
     },
     plotOptions: {
         column: {
             dataLabels: {
                 //enabled: true
             },
             //enableMouseTracking: false
             stickyTracking:false,//鼠标移动到点上才有提示框           
         }
     },
     series: [{
        data: [{'color':colday[0],'y':O2},{'color':colday[1],'y':NHN},{'color':colday[2],'y':ph},{'color':colday[3],'y':t}],
        showInLegend: false
     }],
     tooltip:{
    	 /*formatter: function() {
    		 var degree;
    		 if(this.y<50)
    			 degree="优";
    		 else if(this.y<100)
    			 degree="良";
    		 else if(this.y<150)
    			 degree="轻度污染";
    		 else
    			 degree="重度污染";
    		 return this.x+'<br></br>'+'AQI指数：'+this.y+'<br></br>空气质量类别：'+degree;
    	},*/
    	snap:0,
    	hideDelay:0
     },
     credits:{
         enabled:false 
    }
    });

    
    // 过去24小时AQI指数
    chart2 = new Highcharts.Chart({
        chart: {
           renderTo: 'chart_2',
           type: 'line',
        },
        title: {
           text: '杭州市过去24小时AQI指数',
           align:'left'
        },
        xAxis: {
        	tickInterval:4,
        	tickmarkPlacement:'on',
        	categories: hours
        },
        yAxis: {
           title: {
              text: ''
           }
        },
        plotOptions: {
            line: {
                dataLabels: {
                    //enabled: true
                },
                //enableMouseTracking: false
                stickyTracking:false,
                snap:0
                
            }
        },
        series: [{
           data: everyhAQI,
           showInLegend: false
        }],
        tooltip:{
       	 formatter: function() {
       		 var degree;
       		 if(this.y<50)
       			 degree="优";
       		 else if(this.y<100)
       			 degree="良";
       		 else if(this.y<150)
       			 degree="轻度污染";
       		 else
       			 degree="重度污染";
       		 return this.x+'<br></br>'+'AQI指数：'+this.y+'<br></br>空气质量类别：'+degree;
       	},
       	hideDelay:0,
        
        },
        credits:{
            enabled:false 
       }
       });
    
    //实时空气质量
    chart1 = new Highcharts.Chart({
	    chart: {
	    	renderTo: 'chart_1',
	        type: 'gauge',
            height:250
	    },
	    
	    title: {
	        text: '2016年6月22日10时空气质量状况',
	        align:'left'
	    },
	    
	    pane: {
	        startAngle: -90,
	        endAngle: 90,
            background: null,
            center:['50%','80%'],
            size:200
	    },
        
        
        labels:{
            style:{
                color:"#ff0000"
            },
            items:[{
                html:'0',
                style: { 
					left: '35px',
					top: '140px'
				}
            },{
                html:'50',
                style: { 
					left: '40px',
					top: '100px'
				}
            },{
                html:'100',
                style: { 
					left: '50px',
					top: '60px'
				}
            },{
                html:'150',
                style: { 
					left: '90px',
					top: '25px'
				}
            },{
                html:'200',
                style: { 
					left: '130px',
					top: '5px'
				}
            },{
                html:'300',
                style: { 
					left: '220px',
					top: '5px'
				}
            },{
                html:'500',
                style: { 
					left: '330px',
					top: '140px'
				}
            }]
        },
	       
	    // the value axis
	    yAxis: {
	        min: 0,
	        max: 500,
            tickPixelInterval: 0,
            
            title:{
                text:level,
                 style: {
                    color: '#ffA500',
                    fontSize: '14px',
                },
                y:80
            },
	        plotBands: [{
	            from: 0,
	            to: 50,
	            color: '#7fff00', // green
                innerRadius: '100%',      
                outerRadius: '135%',
            },{
	            from: 50,
	            to: 100,
	            color: '#ffff00', // yellow
                innerRadius: '100%',      
                outerRadius: '135%'
	        }, {
	            from: 100,
	            to: 150,
	            color: '#ffa500', // red
                innerRadius: '100%',      
                outerRadius: '135%'
	        },{
	            from: 150,
	            to: 200,
	            color: '#ff0000', // red
                innerRadius: '100%',      
                outerRadius: '135%'
	        },{
	            from: 200,
	            to: 300,
	            color: '#9932CC', // red
                innerRadius: '100%',      
                outerRadius: '135%'
	        },{
	            from: 300,
	            to: 500,
	            color: '#8b008b', // red
                innerRadius: '100%',      
                outerRadius: '135%'
	        }] ,
	    },
	
	    series: [{
	        data: [nowAQI],
            dataLabels: {
                y:-40
            }
	    }],
        
        tooltip:{
            enabled:false,
        },
        
        plotOptions: { 
            gauge: { 
                dial: {//仪表盘指针 
                    radius: '110%', 
                    rearLength: '0%', 
                    backgroundColor: 'silver', 
                    baseWidth: 10, 
                    topWidth: 1, 
                    baseLength: '60%' 
                } 
            } 
        },
        
        credits:{
            enabled:false // 禁用版权信息
       }
       });
    
    //站点AQI实时数据
    chart4 = new Highcharts.Chart({
        chart: {
           renderTo: 'chart_4',
           type: 'column',
        },
        title: {
           text: '06月22日10时 站点AQI实时数据',
           align:'left'
        },
        xAxis: {
        	//tickInterval:4,
       	 tickmarkPlacement:'on',
           categories:plname
        },
        yAxis: {
           title: {
              text: ''
           }
        },
        plotOptions: {
            column: {
                colors:colplAQI,  //自定义的颜色
                colorByPoint:true,//给每个点分配颜色
                dataLabels: {
                    //enabled: true
                },
                //enableMouseTracking: false,鼠标操作无反应
                stickyTracking:false,//鼠标移动到点上才有提示框       
            }
        },
        series: [{
           data:everyplAQI,
           showInLegend: false
        }],
        tooltip:{
       	 formatter: function() {
       		 var degree;
       		 if(this.y<50)
       			 degree="优";
       		 else if(this.y<100)
       			 degree="良";
       		 else if(this.y<150)
       			 degree="轻度污染";
       		 else
       			 degree="重度污染";
       		 return this.x+'<br></br>'+'AQI指数：'+this.y+'<br></br>空气质量类别：'+degree;
       	},
       	snap:0,
    	hideDelay:0
        },
        credits:{
            enabled:false 
       }
       });
    
    //站点PM2.5实时浓度
    chart5 = new Highcharts.Chart({
        chart: {
           renderTo: 'chart_5',
           type: 'column',
        },
        title: {
           text: '06月22日10时 站点PM2.5实时浓度(单位:ug/m3)',
           align:'left'
        },
        xAxis: {
        	//tickInterval:4,
       	 tickmarkPlacement:'on',
           categories: ['杭州市','千岛湖','和睦小学','朝晖五区','浙工农大','卧龙桥','下沙','云溪','城厢镇','临平镇','西溪','滨江']
        },
        yAxis: {
           title: {
              text: ''
           }
        },
        plotOptions: {
            column: {
                colors:colplPM,  //自定义的颜色
                colorByPoint:true,//给每个点分配颜色
                dataLabels: {
                    //enabled: true
                },
                //enableMouseTracking: false,鼠标操作无反应
                stickyTracking:false,//鼠标移动到点上才有提示框       
            }
        },
        series: [{
           data:everyplPM,
           showInLegend: false
        }],
        tooltip:{
       	 formatter: function() {
       		 var degree;
       		 if(this.y<50)
       			 degree="优";
       		 else if(this.y<100)
       			 degree="良";
       		 else if(this.y<150)
       			 degree="轻度污染";
       		 else
       			 degree="重度污染";
       		 return this.x+'<br></br>'+'AQI指数：'+this.y+'<br></br>空气质量类别：'+degree;
       	},
       	snap:0,
    	hideDelay:0
        },
        credits:{
            enabled:false 
       }
       });
    
    
    //站点PM2.5实时浓度
    chart6 = new Highcharts.Chart({
        chart: {
           renderTo: 'chart_6',
           type: 'line',
        },
        title: {
           text: '氧气浓度',
           align:'left'
        },
        xAxis: {
        	tickInterval:1,
        	tickmarkPlacement:'on',
        	categories: days
        },
        yAxis: {
           title: {
              text: ''
           }
        },
        plotOptions: {
            line: {
                dataLabels: {
                    //enabled: true
                },
                //enableMouseTracking: false
                stickyTracking:false,
                snap:0
                
            }
        },
        series: [{
           data: daysO,
           showInLegend: false
        }],
//        tooltip:{
//       	 formatter: function() {
//       		 var degree;
//       		 if(this.y<50)
//       			 degree="优";
//       		 else if(this.y<100)
//       			 degree="良";
//       		 else if(this.y<150)
//       			 degree="轻度污染";
//       		 else
//       			 degree="重度污染";
//       		 return this.x+'<br></br>'+'AQI指数：'+this.y+'<br></br>空气质量类别：'+degree;
//       	},
//       	hideDelay:0,
//        
//        },
        credits:{
            enabled:false 
       }
       });
    
});

