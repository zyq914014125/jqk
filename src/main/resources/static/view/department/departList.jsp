<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>组织结构</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/xadmin.css">
<link rel="stylesheet" href="css/zTreeStyle/zTreeStyle.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/cutsom-style.css">
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="js/xadmin.js"></script>
<script type="text/javascript" src="js/jquery.ztree.all.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="view/organization/organization-list.js"></script>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
	<style>
		.panel-heading{
			text-align: center;
		}
	</style>
<body>
     <div class="x-nav">
		<span class="layui-breadcrumb"> <a>人员管理</a> <a> <cite>组织管理</cite></a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			href="javascript:location.replace(location.href);" title="刷新"> <i
			class="layui-icon" style="line-height: 30px">ဂ</i></a>
	</div>
	<div class="x-body">
		<div class="row">
			
			
			<c:forEach items="${DwAs}" var="DWA">
				<div class="col-md-4"  >
				<div class="panel panel-default">
				<div class="panel-heading">${DWA.departName } <div  style="float: right;"><a><i onclick="x_admin_show('修改','manageEmeController/toDeparInfo.do?departId=${DWA.departId}')"  class="layui-icon">&#xe642;</i></a>
						<a  onclick="delUser('${DWA.departId}','${DWA.departName }')" name="close" ><i class="layui-icon">&#xe640;</i></a>
					</div> </div>
					<div class="panel-body">
					<span class="message-title">${DWA.departDesc }</span>
						<hr />
					<table>
						
						<tr>
							<th width="100px">部门权限 </th>
					 		<td>
								<span> ${DWA.authrs} </span>
							</td>
						</tr>	
					</table>
					</div>
				</div>
			</div>
			</c:forEach>
			
			<div class="col-md-4 layui-anim layui-anim-scale" id="add">
				<div class="panel panel-default">
					<div class="panel-heading">添加新的部门</div>
					<div class="panel-body" style="height: 110px;">
							<div style="text-align: center;cursor: pointer;" onclick="x_admin_show('添加新部门','manageEmeController/toDepartAdd.do')">
								<i class="layui-icon" style="font-size: 80px; color: #1E9FFF;">&#xe61f;</i>  
							</div>
					</div>
				</div>
			</div>
			<!-- end 左侧 -->
			<!-- 页面右侧（详细信息）部分 -->
			
			<!-- end 右侧 -->
		</div>
	</div>
	<script type="text/javascript">
	function delUser(departId,departName){
		layer.msg('确定删除吗？', {
			  time: 0 //不自动关闭
			  ,btn: ['确定删除','取消返回']
			  ,yes: function(index){
				  $.ajax({
						type : "POST",
						async:false,
						data : {
							departId:departId
						},
						dataType : "text",
						url : "manageEmeController/delDepart.ajax",
						success : function(result) {
							console.log(result);
							layer.msg(departName+"已解散",{
			              		icon : 1,
			               		time: 500,
			               	},function () {
			               		location.replace(location.href)
			                    
			                 });
							
						},
						error : function() {
							
							layer.msg('无法连接服务器', {icon: 2});
						}
					});
			  }
			});
	}
		function addNewPannel(){
			var str="<div class=\"col-md-4 layui-anim layui-anim-scale \"><div class=\"panel panel-default\" >"
				str+="<div class=\"panel-heading\">后勤服务部 <a  onclick=\"removeNode(this,6666)\" style=\"float: right;\">删除</a></div>"
				str+="<div class=\"panel-body\">"
				str+="<span class=\"message-title\">服务于公司的后勤</span><hr />"
				str+="<table>"
				str+="<tr><th width=\"100px\">部门权限 </th><td>xx管理、xx管理</td></tr>"
				str+="</table>"	
				str+="</div></div></div>"			
				$("#add").before(str);
		}
		$(function(){
			$("a[name='xclose']").click(function(){
    		$(this).parent().parent().remove();
    		console.log($(this).text())
			});
		})
		function removeNode(obj,id){
			//it.parent.parent.remove();
			var parent=$(obj).parent().parent().parent();
			console.log(id)
			parent.remove();
			
		}
	</script>
</body>
</html>