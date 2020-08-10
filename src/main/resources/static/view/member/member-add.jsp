<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<title>添加用户</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/xadmin.css">
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layui/layui.js"
	charset="utf-8"></script>
<script type="text/javascript" src="js/xadmin.js"></script>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<div class="x-body">
		<form class="layui-form">
			<div class="layui-form-item">
				<label for="L_id" class="layui-form-label"> <span
					class="x-red">*</span>账号
				</label>
				<div class="layui-input-inline">
					<input type="text" id="L_id" autocomplete="off" class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">6到20个字符</div>
			</div>
			<div class="layui-form-item">
				<label for="L_pass" class="layui-form-label"> <span
					class="x-red">*</span>密码
				</label>
				<div class="layui-input-inline">
					<input type="password" id="L_pass" autocomplete="off"
						class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">6到16个字符</div>
			</div>
			<div class="layui-form-item">
				<label for="L_repass" class="layui-form-label"> <span
					class="x-red">*</span>确认密码
				</label>
				<div class="layui-input-inline">
					<input type="password" id="L_repass" autocomplete="off"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="L_name" class="layui-form-label"> <span
					class="x-red">*</span>姓名
				</label>
				<div class="layui-input-inline">
					<input type="text" id="L_name" autocomplete="off"
						class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">输入真实姓名</div>
			</div>
			<div class="layui-form-item">
				<label for="L_number" class="layui-form-label"> <span
					class="x-red">*</span>工号
				</label>
				<div class="layui-input-inline">
					<input type="text" id="L_number" autocomplete="off"
						class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">该员工所属工号</div>
			</div>
			<div class="layui-form-item">
				<label for="L_sex" class="layui-form-label"> <span
					class="x-red">*</span>性别
				</label>
				<div class="layui-input-inline">
					<select id="L_sex">
						<option value="男">男</option>
						<option value="女">女</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label for="L_phone" class="layui-form-label">电话 </label>
				<div class="layui-input-inline">
					<input type="text" id="L_phone" autocomplete="off"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="L_email" class="layui-form-label">E-mail </label>
				<div class="layui-input-inline">
					<input type="text" id="L_email" autocomplete="off"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="L_entry" class="layui-form-label">入职时间 </label>
				<div class="layui-input-inline">
					<input class="layui-input" placeholder="入职时间"
						id="L_entry">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="L_education" class="layui-form-label">学历 </label>
				<div class="layui-input-inline">
					<select id="L_education">
						<option value="专科">专科</option>
						<option value="学士">学士</option>
						<option value="硕士">硕士</option>
						<option value="博士">博士</option>
						<option value="其他">其他</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label for="L_home" class="layui-form-label">住址 </label>
				<div class="layui-input-inline">
					<input type="text" id="L_home" autocomplete="off"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="L_repass" class="layui-form-label"> </label>
				<button class="layui-btn" type="button" onclick="addmember()">
					增加</button>
			</div>
		</form>
	</div>
	<script>
		layui.use('laydate', function() {
			var laydate = layui.laydate;
			//执行一个laydate实例
			laydate.render({
				elem : '#L_entry' //指定元素
			});
		});
		function addmember() {
			layer.alert("增加成功", {
				icon : 6
			}, function() {
				//提交信息……
				// 获得frame索引
				var index = parent.layer.getFrameIndex(window.name);
				//关闭当前frame
				parent.layer.close(index);
			});
		}
	</script>
</body>

</html>