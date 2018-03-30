<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
<base href="<%=basePath %>" />
	<link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

	$(function(){
		var url="${url}";
		var title="${title}";
		if(url!="" && title!=""){
			add_tab(url,title);
		}
	});

	function add_tab(url,title){
		var b = $('#tt').tabs('exists',title);
		if(!b){
			$('#tt').tabs('add',{    
			    title:title,    
			    href:url,    
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
	}
</script>
<title>Insert title here</title>
</head>
<body class="easyui-layout">
    <div data-options="region:'north',border:false" style="height:60px;background:#B3DFDA;padding:10px">north region</div>
	<div data-options="region:'west',split:true,title:'West'" style="width:150px;padding:10px;">
		<div class="easyui-accordion" style="width:120px">
		欢迎来到后台管理<hr>
			<div title="商品管理" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;">
				<h3 style="color:#0099FF;"></h3>
				<p><a href="javascript:add_tab('goto_spu.do','商品信息管理')">商品信息管理</a><br></p>
				<p><a href="javascript:add_tab('goto_attr.do','商品属性管理')">商品属性管理</a><br></p>
				<p><a href="javascript:add_tab('goto_sku.do','商品库存单元管理')">商品库存单元管理</a><br></p>
			</div>
		</div>
		<div class="easyui-accordion" style="width:120px">
		    <div title="缓存管理管理" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;">
				<h3 style="color:#0099FF;"></h3>
				<p>商品缓存管理<br><br></p>
			</div>
		</div>
	</div>
	<div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width:100px;padding:10px;">east region</div>
	<div data-options="region:'south',border:false" style="height:50px;background:#A9FACD;padding:10px;">south region</div>
	<div data-options="region:'center',title:'Center'">
		<!-- 内嵌的选项卡页面 -->
		<div id="tt" class="easyui-tabs" style="width:700px;height:400px">
			
		</div>
	</div>
	
	
</body>
</html>