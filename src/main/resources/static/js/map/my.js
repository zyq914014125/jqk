//定义文档加载事件
$(function(){
	//运行统计确诊人数函数
	// selectAllcount();
	//运行今日疫情分析函数
	// yiqingfenxi()
	//运行各省的疫情分析
	// yiqingfenxiByName("湖北");
	//运行
	loadMap();
	// //
	// selectConfirmByName("湖北");
	// //
	// selectCuredCountByName("湖北");
	// //
	// selectDeadCountByName("湖北");

});
// //统计确诊人数
// function  selectAllcount(){
// 	$.get("selectConfirmCount.do",function(data){
// 		$("#allcount").text(data);
// 	})
// }

//今日疫情分析
// function yiqingfenxi(){
// 	$.get("yiqingfenxi.do",function(data){
// 		//今日疫情分析，带边框效果的饼图
// 		var pie_fanzui =echarts.init(document.getElementById("pie_fanzui"),'infographic');
// 		option = {
// 		    title : {
// 		        x:'center'
// 		    },
// 		    tooltip : {
// 		        trigger: 'item',
// 		        formatter: "{a} <br/>{b} : {c} ({d}%)"
// 		    },
// 		    legend: {
// 		        orient: 'vertical',
// 		        left: 'left',
// 		        data: ['现有确诊','现有治愈','现有死亡'],
// 		        textStyle: {color: '#fff'}
// 		    },
//
// 			label: {
// 			     normal: {
// 			          textStyle: {
// 			                color: 'red'  // 改变标示文字的颜色
// 			          }
// 			     }
// 			},
// 		    series : [
// 		        {
// 		            name: '今日国内疫情分析',
// 		            type: 'pie',
// 		            radius : '55%',
// 		            center: ['50%', '60%'],
// 		            data:data,
//
// 		            itemStyle: {
// 		                emphasis: {
// 		                    shadowBlur: 10,
// 		                    shadowOffsetX: 0,
// 		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
// 		                }
// 		            }
//
// 		        }
// 		    ]
// 		};
//
// 		pie_fanzui.setOption(option);
// 	})
// }
//定义各省份疫情分析的下拉框触发的函数
// function selectName(){
// 	var name = $("#proNameOne").val();
// 	yiqingfenxiByName(name);
// }
//各省的疫情分析
// function yiqingfenxiByName(name){
// 	$.get("yiqingfenxiByName.do",{"name":name},function(data){
// 		//今日疫情分析，带边框效果的饼图
// 		var pie_yiqing =echarts.init(document.getElementById("pie_yiqing"),'infographic');
// 		option = {
// 			    tooltip: {
// 			        trigger: 'item',
// 			        formatter: '{a} <br/>{b}: {c} ({d}%)'
// 			    },
// 			    legend: {
// 			        orient: 'vertical',
// 			        left: 10,
// 			        data: ['现有确诊','现有治愈','现有死亡'],
// 			        textStyle: {color: '#fff'}
// 			    },
// 			    series: [
// 			        {
// 			            name: '各省的疫情分析',
// 			            type: 'pie',
// 			            radius: ['50%', '70%'],
// 			            avoidLabelOverlap: false,
// 			            label: {
// 			                show: false,
// 			                position: 'center'
// 			            },
// 			            emphasis: {
// 			                label: {
// 			                    show: true,
// 			                    fontSize: '30',
// 			                    fontWeight: 'bold'
// 			                }
// 			            },
// 			            labelLine: {
// 			                show: false
// 			            },
// 			            data: data
// 			        }
// 			    ]
// 			};
//
// 		pie_yiqing.setOption(option);
// 	})
// }
//
//
var china_map =echarts.init(document.getElementById("china_map"),'infographic');
// //新冠性肺炎人口来源分析
function loadMap(){
	$.get("selectInfoAllName.do",function(data){
		var option = {
 				title: {
					textStyle:{color:'#313853'},
					//subtext: '纯属虚构',
					x:'center'
				},
				tooltip : {
					trigger: 'item'
				},
				visualMap: {
					show : false,
					x: 'left',
					y: 'bottom',
					//layoutCenter:['30%','30%'],
					splitList: [
						{start: 0, end:100},{start: 100, end: 300},
						{start: 300, end: 500},{start: 500, end: 800},
						{start: 800, end: 1500},{start: 1500, end: 10000},{start: 10000, end: 100000}
					],
					color: ['red', 'pink','yellow', 'Purple','DarkCyan', 'green', 'Lime']
				},

				series: [{
					name: '疫情',
					type: 'map',
					mapType: 'china',
					roam: true,
					label: {
						normal: {
							show: true
						},
						emphasis: {
							show: false
						}
					},
					data:data
				}]
			};
		console.log(data)
		china_map.setOption(option);
	})
}
//给中国地图定义点击事件
china_map.on('click', function (params) {
		console.log(params)
	   var city = params.city;
		$.get("selectAllConfrimCountByName.do",{"name":city}, function (data) {
             console.log(city)
			 loadChart(city,data);
		})
});
//加载地区地图信息
function loadChart(city,data){
	china_map.showLoading();
	$.get("json/"+city+".json", function (geoJson) {
		console.log(111+geoJson);
		china_map.hideLoading();
	    echarts.registerMap(city, geoJson);
		var option = {			
				title: {
					text: city+'今日疫情',
					textStyle:{color:'#fff'},
					//subtext: '纯属虚构',
					x:'center'
				},
				tooltip : {
					trigger: 'item'
				},
				visualMap: {
					show : false,
					x: 'left',
					y: 'bottom',
					//layoutCenter:['30%','30%'],
					splitList: [ 
						{start: 0, end:100},{start: 100, end: 300},
						{start: 300, end: 500},{start: 500, end: 800},
						{start: 800, end: 1500},{start: 1500, end: 100000},
					],
					color: ['red', 'yellow', 'Purple','DarkCyan', 'green', 'Lime']
				},
				series: [{
					name: city+'今日份疫情',
					type: 'map',
					mapType: city, 
					roam: true,
					label: {
						normal: {
							show: true
						},
						emphasis: {
							show: false
						}
					},
					data:data
				}]
			};
		china_map.setOption(option);
	});
}
// function selectAreaByConofirm(){
// 	var name = $("#confirmArea").val();
// 	selectConfirmByName(name);
// }
//根据省份查询该省的市级城市的 确诊人数
// function selectConfirmByName(name){
// 	$.get("selectConfirmCountByName.do",{"name":name},function(data){
// 		var qufenbu_data =echarts.init(document.getElementById("confirmCount"),'infographic');
// 		console.log(data)
//        option = {
//   //  backgroundColor: '#00265f',
//     tooltip: {
//         trigger: 'axis',
//         axisPointer: { type: 'shadow'}
//     },
//     grid: {
//         left: '0%',
// 		top:'10px',
//         right: '0%',
//         bottom: '4%',
//        containLabel: true
//     },
//     xAxis: [{
//         type: 'category',
//       	data: data.x,
//         axisLine: {
//             show: true,
//          lineStyle: {
//                 color: "rgba(255,255,255,.1)",
//                 width: 1,
//                 type: "solid"
//             },
//         },
//
//         axisTick: {
//             show: false,
//         },
// 		axisLabel:  {
//                 interval: 0,
//                // rotate:50,
//                 show: true,
//                 splitNumber: 15,
//                 textStyle: {
//  					color: "rgba(255,255,255,.6)",
//                     fontSize: '12',
//                 },
//             },
//     }],
//     yAxis: [{
//         type: 'value',
//         axisLabel: {
//            //formatter: '{value} %'
// 			show:true,
// 			 textStyle: {
//  					color: "rgba(255,255,255,.6)",
//                     fontSize: '12',
//                 },
//         },
//         axisTick: {
//             show: false,
//         },
//         axisLine: {
//             show: true,
//             lineStyle: {
//                 color: "rgba(255,255,255,.1	)",
//                 width: 1,
//                 type: "solid"
//             },
//         },
//         splitLine: {
//             lineStyle: {
//                color: "rgba(255,255,255,.1)",
//             }
//         }
//     }],
//     series: [
// 		{
//         type: 'bar',
//         data: data.y,
//         barWidth:'35%', //柱子宽度
//        // barGap: 1, //柱子之间间距
//         itemStyle: {
//             normal: {
//                 color:'red',
//                 opacity: 1,
// 				barBorderRadius: 5,
//             }
//         }
//     }
// 	]
// };
// 		qufenbu_data.setOption(option);
// 	})
// }
// function selectAreaByCured(){
// 	var name = $("#curedArea").val();
// 	selectCuredCountByName(name);
// }
// //
// function selectCuredCountByName(name){
// 	$.get("selectCuredCountByName.do",{"name":name},function(data){
// 		var pie_age =echarts.init(document.getElementById("cureCount"),'infographic');
// 	       option = {
// 	         tooltip: {
// 			        trigger: 'axis',
// 			        axisPointer: {            // 坐标轴指示器，坐标轴触发有效
// 			            type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
// 			        }
// 			    },
// 	           grid: {
// 	                     left:40,
// 	                     right:20,
// 	                     top:30,
// 	                     bottom:0,
// 	                     containLabel: true
// 	                   },
// 	                 xAxis: {
// 	                     type: 'value',
// 	                     axisLine:{
// 	                      lineStyle:{
// 	                        color:'rgba(255,255,255,0)'
// 	                      }
// 	                    },
// 	                    splitLine:{
// 	                      lineStyle:{
// 	                        color:'rgba(255,255,255,0)'
// 	                      }
// 	                    },
// 	                    axisLabel:{
// 	                        color:"rgba(255,255,255,0)"
// 	                    },
// 	                     boundaryGap: [0, 0.01]
// 	                 },
// 	                 yAxis: {
// 	                     type: 'category',
// 	                     axisLine:{
// 	                      lineStyle:{
// 	                        color:'rgba(255,255,255,5)'
// 	                      }
// 	                    },
// 	                    splitLine:{
// 	                      lineStyle:{
// 	                        color:'rgba(255,255,255,1)'
// 	                      }
// 	                    },
// 	                    axisLabel:{
// 	                        color:"rgba(255,255,255,5)"
// 	                    },
// 	                     data: data.x
// 	                 },
// 	                 series: [
// 	                     {
// 	                         name: '2011年',
// 	                         type: 'bar',
// 	                         barWidth :20,
// 	                         itemStyle: {
// 	                             normal: {
// 	                                 color:'blue',
// 	                                 opacity: 1,
// 	                 				barBorderRadius: 5,
// 	                             }
// 	                         },
// 	                         data: data.y
// 	                     }
// 	                 ]
// 	             };
// 	       pie_age.setOption(option);
// 	})
// }
// function selectAreaByDead(){
// 	var name = $("#deadArea").val();
// 	selectDeadCountByName(name);
// }
//
// function selectDeadCountByName(name){
// 		$.get("selectDeadCountByName.do",{"name":name},function(data){
// 				var pie_age =echarts.init(document.getElementById("deadCount"),'infographic');
// 	       option = {
// 	         tooltip: {
// 			        trigger: 'axis',
// 			        axisPointer: {            // 坐标轴指示器，坐标轴触发有效
// 			            type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
// 			        }
// 			    },
// 	           grid: {
// 	                     left:40,
// 	                     right:20,
// 	                     top:30,
// 	                     bottom:0,
// 	                     containLabel: true
// 	                   },
//
// 	                 xAxis: {
// 	                     type: 'value',
// 	                     axisLine:{
// 	                      lineStyle:{
// 	                        color:'rgba(255,255,255,0)'
// 	                      }
// 	                    },
// 	                    splitLine:{
// 	                      lineStyle:{
// 	                        color:'rgba(255,255,255,0)'
// 	                      }
// 	                    },
// 	                    axisLabel:{
// 	                        color:"rgba(255,255,255,0)"
// 	                    },
// 	                     boundaryGap: [0, 0.01]
// 	                 },
// 	                 yAxis: {
// 	                     type: 'category',
// 	                     axisLine:{
// 	                      lineStyle:{
// 	                        color:'rgba(255,255,255,5)'
// 	                      }
// 	                    },
// 	                    splitLine:{
// 	                      lineStyle:{
// 	                        color:'rgba(255,255,255,1)'
// 	                      }
// 	                    },
// 	                    axisLabel:{
// 	                        color:"rgba(255,255,255,5)"
// 	                    },
// 	                     data: data.x
// 	                 },
// 	                 series: [
// 	                     {
// 	                         name: '2011年',
// 	                         type: 'bar',
// 	                         barWidth :20,
// 	                         itemStyle: {
// 	                             normal: {
// 	                                 color:'blue',
// 	                                 opacity: 1,
// 	                 				barBorderRadius: 5,
// 	                             }
// 	                         },
// 	                         data: data.y
// 	                     }
// 	                 ]
// 	             };
// 	       pie_age.setOption(option);
// 		})
//
// }