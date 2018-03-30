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
<title>Insert title here</title>

</head>
<body>
	<!-- 属性信息管理 -->
	<hr>
	一级:<select id="attr_class_1_select" onchange="get_attr_class_2(this.value)"><option>请选择</option></select>
	二级:<select id="attr_class_2_select" onchange="get_attr_list(this.value)"><option>请选择</option></select><br>
	查询<br>
	<a href="javascript:goto_attr_add()">添加</a><br>
	删除<br>
	编辑<br>
	<hr>
	<div id="attrListInner" class="easyui-datagrid">
		
	</div>
	
	<script type="text/javascript">
			$(function (){
				//页面加载完函数
				/* $.getJSON("js/json/class_1.js",function(data){
					$(data).each(function(i,json){
						$("#attr_class_1_select").append("<option value="+json.id+">"+json.flmch1+"</option>");
					});
				}); */
				
				$('#attr_class_1_select').combobox({    
				    url:'js/json/class_1.js',    
				    valueField:'id',    
				    textField:'flmch1' ,
				    width:80,
				    onSelect:function get_attr_class_2(){
				    	//获取当前的下拉列表的value
				    	var attr_class_1_id=$(this).combobox("getValue");
						/* $.getJSON("js/json/class_2_"+attr_class_1_id+".js",function(data){
							$("#attr_class_2_select").empty();
							$(data).each(function(i,json){
								$("#attr_class_2_select").append("<option value="+json.id+">"+json.flmch2+"</option>");
							});
						}); */
				    	$('#attr_class_2_select').combobox({    
				    	    url:'js/json/class_2_'+attr_class_1_id+'.js',    
				    	    valueField:'id',    
				    	    textField:'flmch2',
				    	    onSelect:function (){
								//使用ajax异步查询
								/* $.post("goto_attrListInner.do",{flbh2:flbh2},function(data){
									$("#attrListInner").html(data);
									
								}); */
								var flbh2= $(this).combobox("getValue");
								get_attr_list(flbh2);
							}
				    	}); 
						
					}
				}); 
			});
			
			/* function get_attr_class_2(attr_class_1_id){
				$.getJSON("js/json/class_2_"+attr_class_1_id+".js",function(data){
					$("#attr_class_2_select").empty();
					$(data).each(function(i,json){
						$("#attr_class_2_select").append("<option value="+json.id+">"+json.flmch2+"</option>");
					});
				});
			} */
			
			function goto_attr_add(){
			
				var class_2_id=$("#attr_class_2_select").combobox("getValue");
				
				//window.location.href="goto_attr_add.do?flbh2="+class_2_id;
				
				add_tab("goto_attr_add.do?flbh2="+class_2_id,"属性添加页面");
			} 
			
			function get_attr_list(flbh2){
				//使用ajax异步查询
				/* $.post("goto_attrListInner.do",{flbh2:flbh2},function(data){
					$("#attrListInner").html(data);
					
				}); */
			
				//datagrid
				 $('#attrListInner').datagrid({    
				    url:'goto_attrListInner.do',  
				    queryParams:{
				    	flbh2:flbh2
				    },		
				    columns:[[    
				    	{field:'id',title:'id',width:80},  
				        {field:'shxm_mch',title:'属性名称',width:80},  
				        {field:'list_value',title:'属性值',width:250,
				        	formatter: function(value,row,index){
								//自己写的处理字段的方法
								var str="";
								$(value).each(function(i,json){
									str = str + json.shxzh+json.shxzh_mch+" ";
									
								});
								return str;
						    }
				        },    
				        {field:'chjshj',title:'创建时间',width:200,formatter: function(value,row,index){
							//自己写的处理字段的方法
							var d = new Date(value);
							var str=d.toLocaleString();
							return str;
					    }}    
				    ]]    
				}); 
			}
			
</script>
</body>
</html>