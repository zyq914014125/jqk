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
			href="porchaseController/showPorchase.do" title="刷新"> <i
			class="layui-icon" style="line-height: 30px">ဂ</i></a>
	</div>
	<div class="x-body">
		<div class="layui-row">
			<form class="layui-form layui-col-md12 x-so" method="post" action="porchaseController/showPorchase.do">
				<span>快速查询：</span> <input class="layui-input" placeholder="请输入名称"
					name="propertyName"> <input type="text" name="userName"
					placeholder="请输入采购人姓名" autocomplete="off" class="layui-input">
				<button type="submit" class="layui-btn" lay-submit="sreach()" lay-filter="sreach">
					<i class="layui-icon">&#xe615;</i>
				</button>
			</form>
		</div>
		
	<!-- 	<div class="layui-row">
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
		</div> -->
		<xblock>
		<span class="x-right" style="line-height: 40px">共有数据：${porchasesNum } 条</span> </xblock>
		<table class="layui-table">
			<thead>
				<tr>
					<th>资产名称</th>
					<th>型号</th>
					<th>数量</th>
					<th>单价</th>
					<th>总价</th>
					<th>申请人</th>
					<th>审核状态</th>
					<th>申请时间</th>
					<th>采购时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<!-- 数据示例 -->
				<tr>
					<c:forEach items="${pageResult.dataList}" var="por" varStatus="index">
				<tr>
					<td>${por.propertyName }</td>
					<td>${por.type }</td>
					<td>${por.propertyNum }</td>
					<td>${por.propertyPrece }</td>
					<td>${por.propertyTotalprece }</td>
					<td>${por.userName }</td>
					<td class="td-status"><span
						
						<c:if test="${por.approveState == '同意'}">
						class="layui-btn layui-btn-normal layui-btn-mini"
						</c:if>
						
						<c:if test="${por.approveState == '审核中'}">
						class="layui-btn layui-btn-normal layui-btn-mini layui-btn-disabled"
						</c:if>
						
						>
						<c:if test="${por.approveState == '同意'}">
						已启用
						</c:if>
						<c:if test="${por.approveState == '审核中'}">
						未批准
						</c:if>
						</span></td>
					<td><fmt:formatDate value="${por.applyTime }"
							pattern="yyyy-MM-dd " /></td>
					
					<td><fmt:formatDate value="${por.finishTime }"
							pattern="yyyy-MM-dd " /></td>
					
					
					<td class="td-manage"> 
						 <a class="layui-btn layui-btn-mini" onclick="member_stop(this,'${por.porchaseId}'
								  )"
						href="javascript:;" 
						<c:if test="${por.approveState == '同意'}">
						title="启用"
						</c:if>
						<c:if test="${por.approveState == '审核中'}">
						 title="未批准"
						</c:if>
						
						> <c:if test="${por.approveState == '同意'}">
						<i class="layui-icon">&#xe627;</i>同意
						</c:if>
						
						<c:if test="${por.approveState == '审核中'}">
						<i class="layui-icon">&#xe626;</i>停用
						</c:if>
						</a>
					  <a title="删除"  class="layui-btn  layui-btn-mini layui-btn-danger" onclick="member_del(this,'${por.porchaseId}')"
						href="javascript:;"> <i class="layui-icon">&#xe640;</i>删除
						</a>
					</td>
						
				</tr>
			</c:forEach>
					
				
				<!-- end 数据示例 -->
			</tbody>
		</table>
		<div align="center" id="jpager"></div>
		<!-- 分页部分 -->
		<!-- <div id="kkpager"></div> -->
		<!-- end 分页 -->

	</div>
	<script>
		/*用户-控制*/
		function member_stop(obj,porchaseId) {
			layer.confirm('确认要停用/启用该采购吗？', function(index) {
				if ($(obj).attr('title') == '启用') {
					//发异步把用户状态进行更改
					$(obj).attr('title', '未批准')
					$(obj).find('i').html('&#xe626;');
					$(obj).parents("tr").find(".td-status").find('span')
							.addClass('layui-btn-disabled').html('未批准');
					layer.msg('停用成功!', {
						icon : 1,
						time : 500
					});
					
					$.ajax({
						type:"post",
						url:"porchaseController/updateState.ajax",
						data:{
							porchaseId:porchaseId
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
					$(obj).find('i').html('&#xe627;');
					$(obj).parents("tr").find(".td-status").find('span')
							.removeClass('layui-btn-disabled').html('已启用');
					layer.msg('启用成功!', {
						icon : 1,
						time : 500
					});
					
					$.ajax({
						type:"post",
						url:"porchaseController/updateStateDo.ajax",
						data:{
							porchaseId:porchaseId
						},
						datatype:"text",
						success:function(result){
							
						},
						error:function(){
							alert("无法连接服务器");
						}
					});
				}

			});
		} 

		/*用户-删除*/
		function member_del(obj, porchaseId) {
			layer.confirm('确认要删除吗？', function(index) {
				//发异步删除数据
				layer.msg('已删除!', {
					icon : 1,
					time : 500
				});
				window.location.href = "porchaseController/deletePorchase.do?porchaseId="+porchaseId+"";
				
			});
		}

		
		
	
	</script>
</body>
</html>