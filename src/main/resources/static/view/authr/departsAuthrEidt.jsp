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
  <div class="x-body">
        <form id="form1" class="layui-form layui-form-pane">
                <div class="layui-form-item">
                    <label for="name" class="layui-form-label">
                        <span class="x-red">*</span>部门名称
                    </label>
                    <div class="layui-input-inline">
                        <input readonly value="${depart.departName }" type="text" id="name" name="name" required="" lay-verify="required"
                        autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="name" class="layui-form-label">
                        <span class="x-red">*</span>部门描述
                    </label>
                    <div class="layui-input-inline">
                        <input readonly value="${depart.departDesc }" type="text" id="name" name="name" required="" lay-verify="required"
                        autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">
                        权限信息
                    </label>
                    <table  class="layui-table layui-input-block">
                        <tbody>
                            <tr>
                                <td>
                                   	当前部门权限
                                </td>
                                <td>
                                
                                    <div class="layui-input-block">
                                    <c:forEach items="${AllAuthrs}" var="AllAuthr">
                                    	<input name="roles" type="checkbox" value="${AllAuthr.authorityId }" 
                                    	<c:forEach items="${authrs}" var="authr">
                                    		<c:if test="${authr.authorityId==AllAuthr.authorityId }">checked</c:if>
                                    	</c:forEach>
                                    	lay-skin="primary" title="${AllAuthr.authorityDescription }">
                                    </c:forEach>
                                    
                                  
                                    </div>
                                </td>
                            </tr>
                         
                        </tbody>
                    </table>
                </div>
               <div class="layui-form-item" style="text-align: center;">
         
              <a  class="layui-btn"  lay-filter="add" lay-submit="">
                 	 确定修改
              </a>
              <a class="layui-btn layui-btn-normal" onclick="javascript:history.go(-1);" style="text-align:center">返回</a>
          </div>
            </form>
    </div>

	</body>
<script type="text/javascript">

  

layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  
  //日期
  laydate.render({
    elem: '#date'
  });
  laydate.render({
    elem: '#date1'
  });
  
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
 
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
  
  //监听提交
	form.on('submit(add)', function(data){
           console.log(data);
           $.ajax({
       		type : "POST",
       		data : $('#form1').serialize(),
       		dataType : "text",
       		url :"roleController/submitDepartRole.ajax?departId=${depart.departId }",
       		success : function(result) {
       		 //发异步，把数据提交给php
                layer.msg("修改成功",{
             		icon : 1,
              		time: 500,
              	},function () {
                    // 获得frame索引
                    history.go(-1);
                });
       		},
       		error : function() {
       			layer.msg('无法连接服务器', {icon: 2});
       		}
       	});   
           return false;
         });
       //监听提交
  
  
});

</script>
</html>


