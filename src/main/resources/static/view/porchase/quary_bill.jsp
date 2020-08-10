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
<title>采购信息</title>
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
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/kkpager/jpager.css">
<script type="text/javascript" src="<%=basePath%>view/porchase/listPage.js"></script>
<script type="text/javascript">
        function load() {
        	arrayPage(${pageResult.pages},${pageResult.total});
        }
</script>
</head>

<body onload="load()">
	<div class="x-nav">
		<span class="layui-breadcrumb"> <a>采购管理</a> <a> <cite>采购信息</cite></a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			href="view/porchase/quary_bill.jsp" title="刷新"> <i
			class="layui-icon" style="line-height: 30px">ဂ</i></a>
	</div>
	<div class="x-body">
		<div class="layui-row">
			<form class="layui-form layui-col-md12 x-so" >
				<span>通过时间查询账单：</span> <input class="layui-input"  onClick="WdatePicker()"
							readonly="readonly" value="1900-01-01" 
					name="materialName1" id="porchaseTime1"> <input type="text" name="materialName2" onClick="WdatePicker()"
							readonly="readonly" value="1900-01-01" id="porchaseTime2"
					 autocomplete="off" class="layui-input">
				<button type="button" class="layui-btn" lay-submit="sreach()" lay-filter="sreach" onclick="quaryBill();">
					<i class="layui-icon">&#xe615;</i>
				</button>
				<span>结果为：</span> <input   class="layui-input"  name="ifo" id="ifo"
							readonly="readonly"  >	
			</form>
		</div>
		<!-- 分页部分 -->
		<!-- <div id="kkpager"></div> -->
		<!-- end 分页 -->

	</div>
	<script>
		/*用户-控制*/
		/* function member_stop(obj, id) {
			layer.confirm('确认要停用/启用该用户吗？', function(index) {
				if ($(obj).attr('title') == '启用') {
					//发异步把用户状态进行更改
					$(obj).attr('title', '停用')
					$(obj).find('i').html('&#xe62f;');
					$(obj).parents("tr").find(".td-status").find('span')
							.addClass('layui-btn-disabled').html('已停用');
					layer.msg('停用成功!', {
						icon : 1,
						time : 500
					});
				} else {
					$(obj).attr('title', '启用')
					$(obj).find('i').html('&#xe601;');
					$(obj).parents("tr").find(".td-status").find('span')
							.removeClass('layui-btn-disabled').html('已启用');
					layer.msg('启用成功!', {
						icon : 1,
						time : 500
					});
				}

			});
		} */

		
		
		/*账单查询*/
		 function quaryBill() {
			var porchaseTime1 = $("#porchaseTime1").val();
			var porchaseTime2 = $("#porchaseTime2").val();
			
			$.ajax({
				type : "POST",
				url : "porchaseController/quaryBill.ajax",
				data : {
					porchaseTime1 : porchaseTime1,
					porchaseTime2 : porchaseTime2 
				},
				dataType : "text",
				success : function(result) {
					$("#ifo").val(result);	
				},
				error : function() {
					alert("无法连接服务器，请稍后重试");
				}
			});
		} 
	</script>
</body>
</html>