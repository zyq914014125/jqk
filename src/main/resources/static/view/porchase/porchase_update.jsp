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
<script type="text/javascript" src="lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="js/xadmin.js"></script>
<script src="<%=basePath%>resources/My97DatePicker/WdatePicker.js"></script>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<div class="x-body">
		<form class="layui-form" method="post" action="porchaseController/updatePorchase.do" >
			<div class="layui-form-item">
				<label for="L_id" class="layui-form-label"> <span
					class="x-red">*</span>资产名称
				</label>
				<div class="layui-input-inline">
					<input name="propertyName" type="text" value="${porchase.propertyName }" id="L_id" autocomplete="off"
						class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">6到20个字符</div>
			</div>
			
			<div class="layui-form-item">
				<label for="L_repass" class="layui-form-label"> <span
					class="x-red">*</span>型号
				</label>
				<div class="layui-input-inline">
					<input name="type" type="text" value="${porchase.type }" id="L_repass"
						autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label for="L_repass" class="layui-form-label"> <span
					class="x-red">*</span>单价
				</label>
				<div class="layui-input-inline">
					<input name="propertyPrece" type="text" value="${porchase.propertyPrece }" id="L_repass"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="L_pass" class="layui-form-label"> <span
					class="x-red">*</span>数量
				</label>
				<div class="layui-input-inline">
					<input name="propertyNum" type="text" value="${porchase.propertyNum }"  id="L_pass"
						autocomplete="off" class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">1到10个字符</div>
			</div>

			<div class="layui-form-item">
				<label for="L_name" class="layui-form-label"> <span
					class="x-red">*</span>采购时间
				</label>
				<div class="layui-input-inline">
					<input name="finishTime" type="text" onClick="WdatePicker()"
						readonly="readonly" value="<fmt:formatDate value="${porchase.finishTime }" type="date"/>" id="L_name"
						autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label for="L_repass" class="layui-form-label"> </label>
				<button class="layui-btn" type="submit"  >
					提交</button>
				<button class="layui-btn" type="button"  onclick="returnUserPorchase()">
					返回</button>
			</div>
			
			<input type="hidden" name="porchaseId" value="${porchase.porchaseId}">
			<input type="hidden" name="propertyTotalprece" value="${porchase.propertyTotalprece}">
			<input type="hidden" name="userName" value="${porchase.userName}">
			<input type="hidden" name="approveState" value="${porchase.approveState}">
			
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
		
		
		function returnUserPorchase(){
			window.location.href = "porchaseController/showPorchaseByUserName.do";
		}
	</script> 
</body>

</html>