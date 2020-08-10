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

</script>
</head>

<body >
	<div class="x-nav">
		<span class="layui-breadcrumb"> <a>采购管理</a> <a> <cite>采购信息</cite></a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			href="porchaseController/showPorchase.do" title="刷新"> <i
			class="layui-icon" style="line-height: 30px">ဂ</i></a>
	</div>
	<div class="x-body">
		<div class="layui-row">
			<form class="layui-form layui-col-md12 x-so" method="post" >
				<span>快速查询：</span> <input class="layui-input" placeholder="请输入名称"
					name="propertyName"> <input type="text" name="userName"
					placeholder="请输入采购人姓名" autocomplete="off" class="layui-input">
				<a class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></a>
			</form>
		</div>
		

		<xblock>
		<span class="x-right" style="line-height: 40px">共有数据：<a onclick="test()" id="total">?</a> 条</span> </xblock>
		<table class="layui-table">
			<thead>
				<tr>
					<th>资产名称</th>
					<th>型号</th>
					<th>数量</th>
					<th>申请人</th>
					<th>审核状态</th>
					<th>申请时间</th>
					<th>归还时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id="tbox">
				<!-- 数据示例 -->
			
					
				
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
		var authr=null;
		var depart=null;
		var userName=null;
		var total=0;

		layui.use(['form', 'laypage', 'laydate'], function(){
		  var form = layui.form
		  ,layer = layui.layer
		 ,laypage = layui.laypage
		  ,laydate = layui.laydate;
		  
		  //日期
		  laydate.render({
		    elem: '#date'
		  });
		  laydate.render({
		    elem: '#date1'
		  });
		  

		 
		//自定义验证规则
		form.verify({
		    title: function(value){
		      if(value.length < 5){
		        return '标题至少得5个字符啊';
		      }
		    }
		    ,pass: [/(.+){6,12}$/, '密码必须6到12位']
		    ,content: function(value){
		      layedit.sync(editIndex);
		    }
		});
		//
		////监听指定开关
		  form.on('switch(switchTest)', function(data){
		    layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
		      offset: '6px'
		    });
		    layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
		  });
		  
		  form.on('submit(sreach)', function(data){
		      console.log(data);
		       authr=$("#authr").val();
		       depart=$("#depart").val();
		       userName=$("#userName").val();
		       showPage(-1);
		       laypage.render({
		    		  elem: 'test1'
		    		  ,count: total //数据总数，从服务端得到
		    		  ,limit:1
		    		  ,jump: function(obj, first){
		    		    //obj包含了当前分页的所有参数，比如：
		    		    console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
		    		    console.log(obj.limit); //得到每页显示的条数
		    		    
		    		    //首次不执行
		    		    if(!first){
		    		    	showPage(obj.curr);
		    		    }
		    		  }
		    		});
		      return false;
		    });
		  
		  //监听提交
		  form.on('submit(demo1)', function(data){
		    layer.alert(JSON.stringify(data.field), {
		      title: '最终的提交信息'
		    })
		    return false;
		  });
		  //分页的ajax
		  function showPage(n) {
			$.ajax({
				type : "POST",
				async:false,
				data : {
					n:n	
				},
				dataType : "text",
				url : "applyController/showApply.ajax",
				success : function(result) {
					alert(result);
					var tl = eval("(" + result + ")");
					if(n==-1){
						total=tl.total;
						$("#total").text(total);
					}
					$("#tbox").html("");
					//json遍历
					if(tl.data.length>0){
						$.each(tl.data, function(n,val){
							console.log(n);
							var str="";
						    str+="<tr>";
						    str+="<td>"+val.propertyName+"</td>"
						    str+="<td>"+val.type+"</td>"
						    str+="<td>"+val.propertyNum+"</td>"
						    str+="<td>"+val.userName+"</td>"
						    str+="<td>"+val.applyState+"</td>"
						    str+="<td>"+new Date(val.applyTime).format("yyyy-MM-dd")+"</td>"
						    str+="<td>"+new Date(val.sestoreTime).format("yyyy-MM-dd")+"</td>"
						    str+="<td><a class=\"layui-btn  layui-btn-mini\" onclick=\"x_admin_show('日志预览','roleController/changeUserRole.do?applyId="+val.applyId+"')\" ><i class=\"layui-icon\">&#xe642;</i>编辑</a></td>"
						    str+="</tr>";
							$("#tbox").append(str);
						})
					}else{
						$("#tbox").append("<tr><td colspan=5 align=\"center\">暂时没有数据哦，快去添加一条吧</td></tr>");
					}
					
				},
				error : function() {
					layer.msg('无法连接服务器', {icon: 2});
				}
			});
		}
		  //分页
		  showPage(-1);
		  laypage.render({
			  elem: 'test1'
			  ,count: total //数据总数，从服务端得到
			  ,limit:1
			  ,jump: function(obj, first){
			    //obj包含了当前分页的所有参数，比如：
			    console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
			    console.log(obj.limit); //得到每页显示的条数
			    
			    //首次不执行
			    if(!first){
			    	showPage(obj.curr);
			    }
			  }
			});
		  
		});
		function test() {
			$.ajax({
				type : "POST",
				async:false,
				data : {
					index:null
				},
				dataType : "text",
				url : "applyController/showApply.ajax",
				success : function(result) {
					alert(result);
					console.log(result);
					
					
					
				},
				error : function() {
					layer.msg('无法连接服务器', {icon: 2});
				}
			});
		}
	</script>
</body>
</html>