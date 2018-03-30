<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<title>Insert title here</title>
</head>
<body >
	spu信息管理
	<hr>
	
	一级:<select id="class_1_select" onchange="get_class_2(this.value)" onchange="get_tm(this.value)"><option>请选择</option></select>
	二级:<select id="class_2_select" ><option>请选择</option></select>
	品牌<select id="tm_select"><option>请选择</option></select>  <br>
	查询<br>
	<a href="javascript:goto_spu_add();">添加</a><br>
	<!-- <p><a href="javascript:add_tab('goto_spu_add','添加商品信息')">添加</a><br></p> -->
	删除<br>
	编辑<br>
	<script type="text/javascript">
	$(function (){
		//页面加载完函数
		$.getJSON("js/json/class_1.js",function(data){
			$(data).each(function(i,json){
				$("#class_1_select").append("<option value="+json.id+">"+json.flmch1+"</option>");
			});
		});
	});
	
	function get_class_2(class_1_id){
		$.getJSON("js/json/class_2_"+class_1_id+".js",function(data){
			$("#class_2_select").empty();
			$(data).each(function(i,json){
				$("#class_2_select").append("<option value="+json.id+">"+json.flmch2+"</option>");
			});
		});
		
		get_tm(class_1_id);
	}
	
	function get_tm(class_1_id){
		$.getJSON("js/json/tm_class_1_"+class_1_id+".js",function(data){
			$("#tm_select").empty();
			$(data).each(function(i,json){
				$("#tm_select").append("<option value="+json.id+">"+json.ppmch+"</option>");
			});
		});
	}
	
	function goto_spu_add(){
		var class_1_id=$("#class_1_select").val();
		var class_2_id=$("#class_2_select").val();
		var tm_id=$("#tm_select").val();
		
		/* window.location.href="goto_spu_add.do?flbh1="+class_1_id+"&flbh2="+class_2_id+"&pp_id="+tm_id; */
		add_tab("goto_spu_add.do?flbh1="+class_1_id+"&flbh2="+class_2_id+"&pp_id="+tm_id,"添加商品信息");
	}
	/*	我为什么要加这个呢？
 	function add_tab(url,title){
		var class_1_id=$("#class_1_select").val();
		var class_2_id=$("#class_2_select").val();
		var tm_id=$("#tm_select").val();
		
			var b = $('#tt').tabs('exists',title);
			if(!b){
				$('#tt').tabs('add',{    
				    title:title,    
				    href:"goto_spu_add.do?flbh1="+class_1_id+"&flbh2="+class_2_id+"&pp_id="+tm_id,    
				    closable:true,    
				    tools:[{    
				        iconCls:'icon-mini-refresh',    
				        handler:function(){    
				            alert('refresh');    
				        }    
				    }]    
				}); 
			}else {
				$('#tt').tabs('select',title);
			}
		} */
</script>
</body>
</html>