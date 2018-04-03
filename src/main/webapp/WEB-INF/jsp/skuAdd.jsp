<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>

</head>
<body>
	<form action="save_sku.do">
		<input type="hidden" name="flbh1" value="${flbh1 }"> <input
			type="hidden" name="flbh2" value="${flbh2 }"> 品牌：<select
			id="sku_tm_select" name="pp_id" onchange="get_spu_list(this.value)"><option>请选择</option></select>
		商品<select id="spu_list" name="id" onchange="get_sale_attr(this.value)"><option>请选择</option></select>
		<hr>
		分类属性：<br>
		<c:forEach items="${attr_list }" var="attr" varStatus="status">
			<input value="${attr.id }" name="list_attr[${status.index }].shxm_id"
				type="checkbox" onclick="show_val(${attr.id},this.checked)">${attr.shxm_mch}
		</c:forEach>
		<hr>

		<c:forEach items="${attr_list }" var="attr" varStatus="status">
			<div id="val_${attr.id }" style="display: none">
				<c:forEach items="${attr.list_value }" var="val">
					<input value="${val.id }"
						name="list_attr[${status.index }].shxzh_id" type="radio">${val.shxzh}
				</c:forEach>
			</div>
		</c:forEach>
		<hr>
		销售属性<br>颜色：
		<div id="sale_color"></div>
		<br>版本：
		<div id="sale_version"></div>
		<hr>
		商品库存名称：<input type="text" name="sku_mch"><br> 商品库存数量：<input
			type="text" name="kc"><br> 商品库存价格：<input type="text"
			name="jg"><br> 商品库存地址：<input type="text" name="kcdz"><br>
		<input type="submit" value="提交">
	</form>

	<script type="text/javascript">

		$(function (){
			//页面加载完函数
			$.getJSON("js/json/tm_class_1_${flbh1}.js",function(data){
				$("#sku_tm_select").empty();
				$(data).each(function(i,json){
					$("#sku_tm_select").append("<option value="+json.id+">"+json.ppmch+"</option>");
				});
			});
			
		});
		
		function get_sale_attr(spu_id){
			//选择完商品之后，加载销售属性
			//此时已有spu_id，可查询t_mall_product_color和t_mall_product_version
			
			//分别添加颜色
			$.post("get_color_list.do",{"shp_id":spu_id},function(data){
				$("#sale_color").empty();
				$(data).each(function(i,json){
					/* $("#sale_color").append("<span style='border:1px solid red;margin:5px'>"+json.shp_ys+"</span>"); */
					$("#sale_color").append("<input type='radio' name='ys_id' value="+json.id+">"+json.shp_ys+"</input>");
				})
			}); 
			//分别添加版本
			$.post("get_version_list.do",{"shp_id":spu_id},function(data){
				$("#sale_version").empty();
				$(data).each(function(i,json){
					/* $("#sale_version").append("<span style='border:1px solid red;margin:5px'>"+json.shp_bb+"</span>"); */
					$("#sale_version").append("<input type='radio' name='bb_id' value="+json.id+">"+json.shp_bb+"</input>");
				})
				
			}); 

		}
		
		function get_tm(class_1_id){
			
			$.getJSON("js/json/tm_class_1_"+class_1_id+".js",function(data){
				$("#tm_select").empty();
				$(data).each(function(i,json){
					$("#tm_select").append("<option value="+json.id+">"+json.ppmch+"</option>");
				});
			});
		}
		
		function get_spu_list(pp_id){
			//选择完品牌之后，加载商品列表
			var flbh2="${flbh2}";
			//alert("pp_id:"+pp_id);
			$.post("get_spu_list.do",{pp_id:pp_id,flbh2:flbh2},function(data){
				$("#spu_list").empty();
				$(data).each(function(i,json){
					$("#spu_list").append("<option value="+json.id+">"+json.shp_mch+"</option>");
				});
			});
			
			
		}
		
		function show_val(attr_id,checked){
			if(!checked){
				$("#val_"+attr_id).hide();
			}else{
				$("#val_"+attr_id).show();
			}
			/* $("#val_"+attr_id).attr("style","display:block"); */
		}
</script>
</body>
</html>