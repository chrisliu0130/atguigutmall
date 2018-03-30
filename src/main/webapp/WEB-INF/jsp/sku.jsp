<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
</head>
<body class="easyui-layout">
		sku信息管理
	<hr>
	
	一级:<select id="sku_class_1_select" onchange="get_class_2(this.value)"><option>请选择</option></select>
	二级:<select id="sku_class_2_select" ><option>请选择</option></select><br>
	查询<br>
	<a href="javascript:goto_sku_add();">添加</a><br>
	删除<br>
	编辑<br>
	
	<script type="text/javascript">
		$(function (){
			//页面加载完函数
			$.getJSON("js/json/class_1.js",function(data){
				$(data).each(function(i,json){
					$("#sku_class_1_select").append("<option value="+json.id+">"+json.flmch1+"</option>");
				});
			});
		});
		
		function get_class_2(class_1_id){
			$.getJSON("js/json/class_2_"+class_1_id+".js",function(data){
				$("#sku_class_2_select").empty();
				$(data).each(function(i,json){
					$("#sku_class_2_select").append("<option value="+json.id+">"+json.flmch2+"</option>");
				});
			});
			
			
		}
		
		function goto_sku_add(){
			var class_1_id=$("#sku_class_1_select").val();
			var class_2_id=$("#sku_class_2_select").val();
		
			/* window.location.href="goto_sku_add.do?flbh1="+class_1_id+"&flbh2="+class_2_id; */
			add_tab("goto_sku_add.do?flbh1="+class_1_id+"&flbh2="+class_2_id,"库存单元信息");
		}
</script>
</body>
</html>