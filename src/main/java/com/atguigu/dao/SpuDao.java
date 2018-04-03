package com.atguigu.dao;

import java.util.List;
import java.util.Map;

import com.atguigu.bean.MODEL_T_MALL_PRODUCT_COLOR;
import com.atguigu.bean.MODEL_T_MALL_PRODUCT_VERSION;
import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_PRODUCT_COLOR;
import com.atguigu.bean.T_MALL_PRODUCT_VERSION;

public interface SpuDao {

	public int insertSpu(T_MALL_PRODUCT tmp);

	public void insert_spu(T_MALL_PRODUCT tmp);

	public void insert_images(Map map);

	public List<T_MALL_PRODUCT> select_spu_list(Map map);

	public void insert_color(Map<Object, Object> colorMap);

	public void insert_version(Map<Object, Object> versionMap);

	public List<T_MALL_PRODUCT_COLOR> select_color_list(int shp_id);

	public List<T_MALL_PRODUCT_VERSION> select_verion_list(int shp_id);



	

	
}
