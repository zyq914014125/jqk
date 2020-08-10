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
<title>申请报修</title>
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
</head>

<body>
	<div class="x-body">
		<font color="red">${ifo }</font>
		<form class="layui-form" method="post"
			action="maintainController/maintainAdd.do">
			<div class="layui-form-item">
				<label for="L_id" class="layui-form-label"> <span
					class="x-red">*</span>名称
				</label>
				<div class="layui-input-inline">
					<select name="propertyName" id="quiz1" lay-filter="myselect" >
						<option value="" selected="selected">请选择资产名字</option>
						<c:forEach items="${propertyList}" var="por">
							<option value="${por.propertyName }">${por.propertyName }</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label"> <span class="x-red">*</span>型号
				</label>
				<div class="layui-input-inline">
					<select name="type" id="quiz2" >
						<option selected="selected">请选择型号</option>
						<option value="">Y650</option>
						<option value="">N100</option>
						<option value="">K350</option>
					</select>
				</div>
			</div>

			<div class="layui-form-item">
				<label for="L_pass" class="layui-form-label"> <span
					class="x-red">*</span>预计花费
				</label>
				<div class="layui-input-inline">
					<input name="maintainCost" type="text" id="L_pass"
						autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label for="L_repass" class="layui-form-label"> </label>
				<button class="layui-btn" type="submit">提交</button>
				<button class="layui-btn" type="button" onclick="returnUserApply()">
					重置</button>
			</div>
		</form>
	</div>
	<script>
		/* layui.use('laydate', function() {
			var laydate = layui.laydate;
			//执行一个laydate实例
			laydate.render({
				elem : '#L_entry' //指定元素
			});
		}); */
		/* 	function addmember() {
				 
					//提交信息……
					// 获得frame索引
					var index = parent.layer.getFrameIndex(window.name);
					//关闭当前frame
					parent.layer.close(index);
				});
			} */

		function returnUserApply() {
			window.location.href = "maintainController/applyRepairs.do";
		}
		/* layui的ajax联动菜单实现 */
		layui.use([ 'layer', 'form' ], function() {
			var layer = layui.layer, form = layui.form;
			form.on('select(myselect)', function(data) {
				var propertyName = $("#quiz1").val();
				$.ajax({
					type : 'POST',
					url : 'applyController/returnType.do',
					data : {
						"propertyName" : propertyName
					},
					dataType : 'json',
					success : function(allproperty) {
						var str = "";
						$("#quiz2").empty();
						str += "<option>请选择型号</option>"
						$("#quiz2").html(str);

						for (var i = 0; i < allproperty.length; i++) {
							var property = allproperty[i];
							$("#quiz2").append(
									"<option >" + property.type + "</option>");
							form.render('select');
							$("#quiz2").get(0).selectedIndex = 0;
						}
					},
					error : function(msg) {
						alert("无法连接服务器");
					}
				});
			});

		});
	</script>
</body>

</html>