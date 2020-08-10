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
			<!-- 页面左侧（树形结构）部分 -->
			<div class="col-md-2">
				<div class="panel panel-default">
					<div class="panel-heading">组织结构</div>
					<div class="panel-body fullhight">
						<!-- 这里放置左侧内容主体 -->
						<div>
							<ul id="companytree" class="ztree"></ul>
						</div>
						<!-- end 左侧内容 -->
					</div>
				</div>
			</div>
			<!-- end 左侧 -->
			<!-- 页面右侧（详细信息）部分 -->
			<div class="col-md-10">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">详细信息</h3>
					</div>
					<div class="panel-body fullhight">
						<!-- 这里放置右侧内容主体 -->
						<span class="message-title">基本信息</span>
						<hr />
						<table>
							<tr>
								<th width="100px">用户账号</th>
								<td width="270px;" id="accountNumber">XXXXX</td>
								<th width="100px">入职时间</th>
								<td width="270px;" id="userEntrytime">2017-01-01</td>
							</tr>
							<tr>
								<th>姓名</th>
								<td id="userName">XXX</td>
								<th>学历</th>
								<td id="userDiploma">本科</td>
							</tr>
							<tr>
								<th>出生日期</th>
								<td id="userBirthday">00000000</td>
								<th>状态</th>
								<td>已启用</td>
							</tr>
							<tr>
								<th>性别</th>
								<td id="userSex">男</td>
							</tr>
							<tr>
								<th>所在部门</th>
								<td id="userDepartement">模拟部门</td>
							</tr>
							<tr>
								<th>职务</th>
								<td id="userPosition">部门经理</td>
							</tr>
						</table>
						<br /> <span class="message-title">联系方式</span>
						<hr />
						<table>
							<tr>
								<th width="100px">电话</th>
								<td width="300px;" id="userTelephone">XXXXX</td>
							</tr>
							<tr>
								<th>Email</th>
								<td id="userEmail">xxxxxx@xx.com</td>
							</tr>
							<tr>
								<th>地址</th>
								<td id="userAddress">00000000</td>
							</tr>
							
						</table>
						<!-- end 右侧内容 -->
					</div>
				</div>
			</div>
			<!-- end 右侧 -->
		</div>
	</div>
</body>
</html>