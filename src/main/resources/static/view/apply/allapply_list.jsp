<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>

<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>申请审批</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/xadmin.css">
<link rel="stylesheet" href="css/kkpager_orange.css">
<link rel="stylesheet" href="lib/layui/css/layui.css">
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="js/xadmin.js"></script>
<script type="text/javascript" src="js/kkpager.min.js"></script>
<script src="<%=basePath%>resources/My97DatePicker/WdatePicker.js"></script>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<%-- 分页相关 --%>
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>js/kkpager/jpager.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>js/kkpager/jpager.css">
<script type="text/javascript" src="<%=basePath%>view/apply/listPage.js"></script>
<script type="text/javascript">
        function load() {
        	arrayPage(${pageResult.pages},${pageResult.total});
        }
</script>
</head>

<body onload="load()">
	<div class="x-nav">
		<span class="layui-breadcrumb"> <a>流程管理</a> <a> <cite>申请批准</cite></a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			href="applyController/showAllapply.do" title="刷新"> <i
			class="layui-icon" style="line-height: 30px">ဂ</i></a>
	</div>
	<div class="x-body">
		<div class="layui-row">
			<form class="layui-form layui-col-md12 x-so" method="post"
				action="applyController/showAllapply.do">
					<span>快速查询：</span>
					<div class="layui-input-inline">
						<select name="propertyName" id="quiz1" lay-filter="myselect">
							<option value="" selected="selected">请选择资产名字</option>
							<c:forEach items="${propertyList}" var="por">
								<option value="${por.propertyName }">${por.propertyName }</option>
							</c:forEach>
						</select>
					</div>
					<div class="layui-input-inline">
						<select name="type" id="quiz2">
							<option value="">请选择型号</option>
							<option value="杭州">杭州</option>
							<option value="宁波" disabled="">宁波</option>
							<option value="温州">温州</option>
							<option value="温州">台州</option>
							<option value="温州">绍兴</option>
						</select>
					</div>
						<button type="submit" class="layui-btn" lay-submit="sreach()"
							lay-filter="sreach">
							<i class="layui-icon">&#xe615;</i>
						</button>
			</form>
		</div>

		<xblock> <span class="x-right" style="line-height: 40px">共有数据：${applysNum }
			条</span> </xblock>
		<table class="layui-table">
			<thead>
				<tr>
					<th>资产名称</th>
					<th>型号</th>
					<th>数量</th>
					<th>申请人</th>
					<th>审核状态</th>
					<th>申请时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<!-- 数据示例 -->
				<tr>
					<c:forEach items="${pageResult.dataList}" var="por"
						varStatus="index">
						<tr>
							<td>${por.propertyName }</td>
							<td>${por.type }</td>
							<td>${por.propertyNum }</td>
							<td>${por.userName }</td>
							<td class="td-status"><span
								<c:if test="${por.applyState == '同意'}">
						class="layui-btn layui-btn-normal layui-btn-mini"
						</c:if>
								<c:if test="${por.applyState == '审核中'}">
						class="layui-btn layui-btn-normal layui-btn-mini layui-btn-disabled"
						</c:if>
								<c:if test="${por.applyState == '使用完'}">
						class="layui-btn layui-btn-normal layui-btn-mini layui-btn-disabled"
						</c:if>>
									<c:if test="${por.applyState == '同意'}">
						已启用
						</c:if> <c:if test="${por.applyState == '审核中'}">
						未批准
						</c:if> <c:if test="${por.applyState == '使用完'}">
						使用完
						</c:if>
							</span></td>
							<td><fmt:formatDate value="${por.applyTime }"
									pattern="yyyy-MM-dd " /></td>

							<td class="td-manage"><c:if test="${por.applyState == '同意'}">
									<a class="layui-btn layui-btn-mini"
										onclick="member_stop(this,'${por.applyId}'
								  )"
										href="javascript:;"
										<c:if test="${por.applyState == '同意'}">
						title="启用"
						</c:if>
										<c:if test="${por.applyState == '审核中'}">
						 title="未批准"
						</c:if>>
										<c:if test="${por.applyState == '同意'}">
											<i class="layui-icon">&#xe627;</i>停用
									</c:if> <c:if test="${por.applyState == '审核中'}">
											<i class="layui-icon">&#xe626;</i>启动
									</c:if>
									</a>

								</c:if> <c:if test="${por.applyState == '审核中'}">
									<a class="layui-btn layui-btn-mini"
										onclick="member_stop(this,'${por.applyId}'
								  )"
										href="javascript:;"
										<c:if test="${por.applyState == '同意'}">
						title="启用"
						</c:if>
										<c:if test="${por.applyState == '审核中'}">
						 title="未批准"
						</c:if>>
										<c:if test="${por.applyState == '同意'}">
											<i class="layui-icon">&#xe627;</i>同意
									</c:if> <c:if test="${por.applyState == '审核中'}">
											<i class="layui-icon">&#xe626;</i>停用
									</c:if>
									</a>
								</c:if> <a title="删除"
								class="layui-btn  layui-btn-mini layui-btn-danger"
								onclick="member_del(this,'${por.applyId}')" href="javascript:;">
									<i class="layui-icon">&#xe640;</i>删除
							</a></td>

						</tr>
					</c:forEach>
					<!-- end 数据示例 -->
			</tbody>
		</table>
		<div align="center" id="jpager"></div>
	</div>
	<script>
	/* 根据名字查询型号 */

		/* $.ajax({
			type : "post", // 提交方式
			url : "applyController/returnPropertyName.ajax", // 访问路径
			dataType : "json", // 返回值类型，只要不是String 一般都为json
			data : {
			},
			success : function(propertys) // 括号里为返回的数据
			{	
				if (propertys !== null) {
					var str = "";
					$("#quiz1").html("");
					str += "<option>请选择资产名字</option>"
					$("#quiz1").html(str);

					for (var i = 0; i < propertys.length; i++) {
						var property = propertys[i];
						if (i==1) {
							$("#quiz1").append("<option selected='selected'> " + property.propertyName + "</option>");
						}else {
							$("#quiz1").append("<option> " + property.propertyName + "</option>");
						}
					}
				} else {
					alert("没有申请记录！！");
				}
			},
			error : function(msg) {
				alert("无法连接服务器");
			}
		}); */
		
		layui.use(['layer', 'form'], function(){
			  var layer = layui.layer
			  ,form = layui.form;
			  form.on('select(myselect)', function(data){
				 var propertyName=$("#quiz1").val();
			  $.ajax({
	                 type: 'POST',
	                 url: 'applyController/returnType.do',
	                 data: {
	                	 "propertyName" : propertyName
	                 },
	                 dataType:  'json',
	                 success: function(allproperty){
	                		var str = "";
	    					$("#quiz2").empty();
	    					str += "<option>请选择型号</option>"
	    					$("#quiz2").html(str);

	    					for (var i = 0; i < allproperty.length; i++) {
	    						var property = allproperty[i];
	    						$("#quiz2").append("<option >" + property.type + "</option>");
	    						form.render('select');
	    						 $("#quiz2").get(0).selectedIndex=0;
	    					}
	                 },
	                 error : function(msg) {
		    				alert("无法连接服务器");
		    			}   
	         }); 
	});
	
		});

		 /*  $("#quiz1").change(function(){  
	        	var propertyName=$("#quiz1").val();
	    		
	    		$.ajax({
	    			type : "post", // 提交方式
	    			url : "applyController/returnType.do", // 访问路径
	    			dataType : "json", // 返回值类型，只要不是String 一般都为json
	    			data : {
	    				// 后台方法的参数
	    				"propertyName" : propertyName

	    			},
	    			success : function(propertys) // 括号里为返回的数据
	    			{
	    				alert(propertys);
	    				var allproperty = $.extend(true, [], propertys);
	    				if (allproperty !== null) {
	    					var str = "";
	    					$("#quiz2").empty();
	    					str += "<option>请选择型号</option>"
	    					$("#quiz2").html(str);

	    					for (var i = 0; i < allproperty.length; i++) {
	    						var property = allproperty[i];
	    						$("#quiz2").append("<option>" + property.type + "</option>");
	    					}
	    				} else {
	    					alert("没有该资产！！");
	    				}
	    			},
	    			error : function(msg) {
	    				alert("无法连接服务器");
	    			}
	    		});
	    		
		  }); */
	

	
	
	/* $(function(){  
        //触发的下拉框chang事件  
      
        }); */
	
	/* 	function doNest() {
		
	} */
		/*用户-控制*/
		function member_stop(obj,applyId) {
			layer.confirm('确认要批准该申请吗？', function(index) {
				if ($(obj).attr('title') == '启用') {
					//发异步把用户状态进行更改
					$(obj).attr('title', '未批准')
					$(obj).find('i').html('&#xe626;');
					$(obj).parents("tr").find(".td-status").find('span')
							.addClass('layui-btn-disabled').html('未批准');
					layer.msg('申请失败!', {
						icon : 1,
						time : 500
					});
					
					$.ajax({
						type:"post",
						url:"applyController/updateStateDo.ajax",
						data:{
							applyId:applyId
						},
						datatype:"text",
						success:function(result){
							
						},
						error:function(){
							alert("无法连接服务器");
						}
					});
				} else {
					$(obj).attr('title', '启用')
					
					
					$.ajax({
						type:"post",
						url:"applyController/updateState.ajax",
						data:{
							applyId:applyId
						},
						datatype:"text",
						success:function(result){
							if(result=="库存不足"){
								$(obj).parents("tr").find(".td-status").find('span')
								.addClass('layui-btn-disabled').html('未批准');
								layer.msg('库存不够，启用失败!', {
									icon : 1,
									time : 500
								});
							}else {
								$(obj).find('i').html('&#xe627;');
								$(obj).parents("tr").find(".td-status").find('span')
								.removeClass('layui-btn-disabled').html('已启用');
								layer.msg('申请成功!', {
									icon : 1,
									time : 500
								});
							}
						},
						error:function(){
							alert("无法连接服务器");
						}
					});
				}

			});
		} 

		/*用户-删除*/
		function member_del(obj, applyId) {
			layer.confirm('确认要删除吗？', function(index) {
				//发异步删除数据
				layer.msg('已删除!', {
					icon : 1,
					time : 500
				});
				window.location.href = "applyController/deleteApply.do?applyId="+applyId+"";
				
			});
		}

	</script>
</body>
</html>