<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>" />
<meta charset="UTF-8">
<title>企业资产管理系统</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/xadmin.css">
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layui/layui.js"
	charset="utf-8"></script>
<script type="text/javascript" src="js/xadmin.js"></script>
</head>
<body>
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">权限管理</a>
        <a>
          <cite>职工权限分配</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <div class="layui-row">
        <form id="filter" method="post" class="layui-form layui-col-md12 x-so">
          <div class="layui-input-inline">
            <select id="depart" name="depart">
              <option value="">员工所在部门</option>
              <option value="人力资源部">人力资源部</option>
              <option value="后勤服务部">后勤服务部</option>   
            </select>
          </div>
          <div class="layui-input-inline">
            <select id="authr" name="authr">
              <option value="">员工拥有权限</option>
              <option value="职工管理">职工管理</option>
              <option value="权限管理">权限管理</option>
              <option value="个人资产">个人资产</option>
              <option value="流程管理">流程管理</option>
              <option value="资金核算">资金核算</option>
              <option value="库存管理">库存管理</option>
            </select>
          </div>
          
          <input type="text" id="userName" name="userName"  placeholder="员工姓名" autocomplete="off" class="layui-input">
          <a class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></a>
        </form>
      </div>
      <xblock>
        <button class="layui-btn" onclick="x_admin_show('添加用户','./order-add.html')"><i class="layui-icon"></i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：<a onclick="test()" id="total">?</a> 条</span>
      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
            <th>姓名</th>
            <th>所属部门</th>
            <th>职位</th>
            <th>加入时间</th>
            <th >操作</th>
            </tr>
        </thead>
        <tbody id="roles">
          <tr>          
            <td>老王:18925139194</td>
            <td>7829.10</td>
            <td>7854.10</td>
           
            <td>2017-08-17 18:22</td>
            <td class="td-manage">
              <a title="编辑"  onclick="x_admin_show('编辑','roleEdit.html',600,400)" href="javascript:;">
                <i class="layui-icon">&#xe642;</i>
              </a>
            </td>
          </tr>
        </tbody>
      </table>
      <div id="test1" style="text-align:center"></div>
		
    </div>

	</body>
<script type="text/javascript">

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
			authr:authr,
			depart:depart,
			userName:userName,
			index:n
			
		},
		dataType : "text",
		url : "roleController/getUserRole.ajax",
		success : function(result) {
			console.log(result);
			var tl = eval("(" + result + ")");
			if(n==-1){
				total=tl.total;
				$("#total").text(total);
			}
			$("#roles").html("");
			//json遍历
			if(tl.data.length>0){
				$.each(tl.data, function(n,val){
					console.log(n);
					var str="";
				    str+="<tr>";
				    str+="<td>"+val.userName+"</td>"
				    str+="<td>"+val.userDepartement+"</td>"
				    str+="<td>"+val.userPosition+"</td>"
				    str+="<td>"+new Date(val.userEntrytime).format("yyyy-MM-dd hh:mm")+"</td>"
				    str+="<td><a class=\"layui-btn  layui-btn-mini\" onclick=\"x_admin_show('日志预览','roleController/changeUserRole.do?userId="+val.userId+"')\" ><i class=\"layui-icon\">&#xe642;</i>编辑</a></td>"
				    str+="</tr>";
					$("#roles").append(str);
				})
			}else{
				$("#roles").append("<tr><td colspan=5 align=\"center\">暂时没有数据哦，快去添加一条吧</td></tr>");
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
		url : "roleController/getUserRole.ajax",
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
</html>