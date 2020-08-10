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
<script type="text/javascript" src="<%=basePath%>view/porchase/listPage2.js"></script>
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
			href="porchaseController/showPorchaseByUserName.do" title="刷新"> <i
			class="layui-icon" style="line-height: 30px">ဂ</i></a>
	</div>
	<div class="x-body">
		<div class="layui-row">
			<form class="layui-form layui-col-md12 x-so" method="post" action="porchaseController/showPorchaseByUserName.do">
				<span>快速查询：</span> <input class="layui-input" placeholder="请输入名称"
					name="propertyName"> 
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
		<button class="layui-btn"
			onclick="addPorchaseUI()">
			<i class="layui-icon">&#xe608;</i>添加
		</button>
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
					<c:forEach items="${pageResult.dataList}" var="por">
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
					<c:if test="${por.approveState == '审核中'}">
						 <a title="编辑"
						onclick="updatePorchase('${por.porchaseId}')"
						href="javascript:;"> <i class="layui-icon">&#xe642;</i>
					</a> 
					</c:if>
					
					<!-- <a onclick="x_admin_show('修改密码','member-password.html',600,400)"
						title="修改密码" href="javascript:;"> <i class="layui-icon">&#xe631;</i>
					</a> --> </td>
						
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
	function updatePorchase(porchaseId) {
		
	window.location.href = "porchaseController/updatePorchaseUI.do?porchaseId="+porchaseId+"";

	}

		/*用户-删除*/
		function member_del(obj, id) {
			layer.confirm('确认要删除吗？', function(index) {
				//发异步删除数据
				layer.msg('已删除!', {
					icon : 1,
					time : 500
				});
			});
		}

		/*用户查询*/
		function sreach() {
			var account = $("#username").val();
			var pwd = $("#password").val();
		}

		/*分页控件设置*/
		/* $(function() {
			//生成分页控件  
			kkpager.generPageHtml({
				pno : '1',
				mode : 'click', //设置为click模式
				//总页码  
				total : '10',
				//总数据条数  
				totalRecords : '100',
				//点击页码、页码输入框跳转、以及首页、下一页等按钮都会调用click
				//适用于不刷新页面，比如ajax
				click : function(n) {
					//这里可以做自已的处理
					showPage(n);
					//处理完后可以手动条用selectPage进行页码选中切换
					this.selectPage(n);
				},
				//getHref是在click模式下链接算法，一般不需要配置，默认代码如下
				getHref : function(n) {
					return '#';
				}
			});
			showPage(1);
		})

		function showPage(n) {
			var k = $("#choose").val();
			$.ajax({
				type : "post",
				data : {
					n : n,
				},
				datatype : "text",
				url : "porchaseController/showPorchase.ajax",
				success : function(result) {
					//将字符串变成json
					var tl = eval("(" + result + ")");
					$("#tbox").html("");
					$.each(tl,
							function(n, val) {
								$("#tbox").append(
										"<tr><td>" + val.id + "</td><td>"
												+ val.name + "</td><td>"
												+ val.sex + "</td></tr>");
							});
				},
				error : function() {

				}
			});
		} */
		
		/*账单查询*/
		/*  function quaryBill() {
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
		}  */
		
		function addPorchaseUI(){
			window.location.href = "porchaseController/porchaseAdd.do";
		}
	</script>
</body>
</html>