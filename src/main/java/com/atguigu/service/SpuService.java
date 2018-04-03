package com.atguigu.service;

import java.util.List;

import com.atguigu.bean.MODEL_T_MALL_PRODUCT_COLOR;
import com.atguigu.bean.MODEL_T_MALL_PRODUCT_VERSION;
import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_PRODUCT_COLOR;
import com.atguigu.bean.T_MALL_PRODUCT_VERSION;

public interface SpuService {
	public int insertSpu(T_MALL_PRODUCT tmp);

	// public void insert_spu(T_MALL_PRODUCT tmp, List<String> list_image);

	public List<T_MALL_PRODUCT> get_spu_list(int pp_id, int flbh2);

	public void insert_spu(T_MALL_PRODUCT tmp, List<String> list_image, MODEL_T_MALL_PRODUCT_COLOR color_list,
			MODEL_T_MALL_PRODUCT_VERSION version_list);

	public List<T_MALL_PRODUCT_COLOR> get_color_list(int shp_id);

	public List<T_MALL_PRODUCT_VERSION> get_verion_list(int shp_id);
}
