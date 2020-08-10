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
<title>在用资产</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/xadmin.css">
<link rel="stylesheet" href="css/kkpager_orange.css">
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
<script type="text/javascript"
	src="<%=basePath%>view/apply/listPage2.js"></script>
<script type="text/javascript">
        function load() {
        	arrayPage(${pageResult.pages},${pageResult.total});
        }
</script>
</head>

<body onload="load()">
	<div class="x-nav">
		<span class="layui-breadcrumb"> <a>我的资产</a> <a> <cite>在用资产</cite></a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			href="applyController/showApplyByUserName.do" title="刷新"> <i
			class="layui-icon" style="line-height: 30px">ဂ</i></a>
	</div>
	<div class="x-body">
		<div class="layui-row">
			<form class="layui-form layui-col-md12 x-so" method="post"
				action="applyController/showApplyByUserName.do">
				
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
		<xblock>
		<button class="layui-btn"
			onclick="x_admin_show('申请报修','maintainController/applyRepairs.do',500,500)">
			<i class="layui-icon">&#xe608;</i>申请报修
		</button>
		<span class="x-right" style="line-height: 40px">共有数据：${userApplysNum }
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
					<c:forEach items="${pageResult.dataList}" var="por">

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
						</c:if>>
									<c:if test="${por.applyState == '同意'}">
						正在使用
						</c:if> <c:if test="${por.applyState == '审核中'}">
						未批准
						</c:if>
							</span></td>
							<td><fmt:formatDate value="${por.applyTime }"
									pattern="yyyy-MM-dd " /></td>
							<td class="td-manage"><c:if test="${por.applyState == '同意'}">
									<a title="归还" class="layui-btn layui-btn-mini"
										onclick="member_stop(this,'${por.applyId}')"
										href="javascript:;"> <i class="layui-icon">&#xe65c;</i>归还
									</a>
								</c:if> <c:forEach items="${mList }" var="m">
									<c:if
										test="${por.propertyName == m.propertyName && por.type==m.type}">
										<c:if test="${m.approveState=='同意' }">
											<button title="维修完成" class="layui-btn layui-btn-mini"
												onclick="maintain_finish(this,'${m.maintainId}')"
												href="javascript:;">
												<i class="layui-icon">&#xe605;</i>维修完成
											</button>
										</c:if>

									</c:if>
								</c:forEach></td>

						</tr>



					</c:forEach>
					<!-- end 数据示例 -->
			</tbody>
		</table>
		<div align="center" id="jpager"></div>


	</div>
	<script>
	/* layui的ajax的联动下拉框 */
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
	
	/*用户-控制*/
	function member_stop(obj,applyId) {
		layer.confirm('确认要归还该资产吗？', function(index) {
			if ($(obj).attr('title') == '归还') {
				//发异步把用户状态进行更改
				$(obj).attr('title', '已归还')
				$(obj).find('i').html('&#xe626;');
				$(obj).parents("tr").find(".td-status").find('span')
						.addClass('layui-btn-disabled').html('已归还');
				layer.msg('归还成功!', {
					icon : 1,
					time : 500
				});
				
				$.ajax({
					type:"post",
					url:"applyController/returnProperty.ajax",
					data:{
						applyId:applyId
					},
					datatype:"text",
					success:function(result){
						$(obj).parents("tr").find(".td-manage").find('a')
						.addClass('layui-btn-disabled').html('<i class="layui-icon">&#xe65c;</i>');
					},
					error:function(){
						alert("无法连接服务器");
					}
				});
			}

		});
	} 
	
	/*提交维修完成*/
	function maintain_finish(obj,maintainId) {
		layer.confirm('确认要提交报告吗？', function(index) {
			if ($(obj).attr('title') == '维修完成') {
				//发异步把用户状态进行更改
				$(obj).attr('title', '已提交')
				$(obj).find('i').html('&#xe626;');
				$(obj).parents("tr").find(".td-status").find('span')
						.addClass('layui-btn-disabled').html('已归还');
				layer.msg('提交成功!', {
					icon : 1,
					time : 500
				});
				
				$.ajax({
					type:"post",
					url:"maintainController/maintainFinish.ajax",
					data:{
						maintainId:maintainId
					},
					datatype:"text",
					success:function(result){
						$(obj).parents("tr").find(".td-manage").find('button')
						.addClass('layui-btn-disabled').html('<i class="layui-icon">&#xe605;</i>');
					},
					error:function(){
						alert("无法连接服务器");
					}
				});
			}

		});
	}
	</script>
</body>
</html>