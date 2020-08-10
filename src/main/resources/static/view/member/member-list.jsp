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
<title>用户管理</title>
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
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<div class="x-nav">
		<span class="layui-breadcrumb"> <a>人员管理</a> <a> <cite>用户管理</cite></a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			href="javascript:location.replace(location.href);" title="刷新"> <i
			class="layui-icon" style="line-height: 30px">ဂ</i></a>
	</div>
	<div class="x-body">
		<div class="layui-row">
			<form class="layui-form layui-col-md12 x-so">
				<span>快速查询：</span>
				<input class="layui-input" placeholder="请输入工号" name="usernumber">
				<input type="text" name="username" placeholder="请输入姓名"
					autocomplete="off" class="layui-input">
				<button class="layui-btn" lay-submit="sreach()" lay-filter="sreach">
					<i class="layui-icon">&#xe615;</i>
				</button>
			</form>
		</div>
		<xblock>
		<button class="layui-btn"
			onclick="x_admin_show('添加用户','view/member/member-add.jsp',500,500)">
			<i class="layui-icon">&#xe608;</i>添加
		</button>
		<span class="x-right" style="line-height: 40px">共有数据：??? 条</span> </xblock>
		<table class="layui-table">
			<thead>
				<tr>
					<th>账号</th>
					<th>工号</th>
					<th>姓名</th>
					<th>电话</th>
					<th>E-mail</th>
					<th>入职时间</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<!-- 数据示例 -->
				<tr>
					<td>xiaoming</td>
					<td>TEST0001</td>
					<td>小明</td>
					<td>15010001000</td>
					<td>xiaoming@163.com</td>
					<td>2017-01-01</td>
					<td class="td-status"><span
						class="layui-btn layui-btn-normal layui-btn-mini">已启用</span></td>
					<td class="td-manage"><a onclick="member_stop(this,'10001')"
						href="javascript:;" title="启用"> <i class="layui-icon">&#xe601;</i>
					</a> <a title="编辑"
						onclick="x_admin_show('编辑','member-edit.html',600,400)"
						href="javascript:;"> <i class="layui-icon">&#xe642;</i>
					</a> <a onclick="x_admin_show('修改密码','member-password.html',600,400)"
						title="修改密码" href="javascript:;"> <i class="layui-icon">&#xe631;</i>
					</a> <a title="删除" onclick="member_del(this,'要删除的id')"
						href="javascript:;"> <i class="layui-icon">&#xe640;</i>
					</a></td>
				</tr>
				<!-- end 数据示例 -->
			</tbody>
		</table>
		<!-- 分页部分 -->
		<div id="kkpager"></div>
		<!-- end 分页 -->

	</div>
	<script>
		/*用户-控制*/
		function member_stop(obj, id) {
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

		}
		
		/*分页控件设置*/
		kkpager.generPageHtml({
			//当前页数
			pno : '1',
			mode : 'link', //可选，默认就是link
			//总页码  
			total : '1',
			//总数据条数  
			totalRecords : '1',
			//链接前部  
			hrefFormer : 'view/member/member-list.jsp',
			//链接尾部  
			hrefLatter : '?pno=',
			//链接算法
			getLink : function(n) {
				return this.hrefFormer + this.hrefLatter + n;
			}

		});
	</script>
</body>
</html>