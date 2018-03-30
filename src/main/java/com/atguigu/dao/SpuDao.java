package com.atguigu.dao;

import java.util.List;
import java.util.Map;

import com.atguigu.bean.T_MALL_PRODUCT;

public interface SpuDao {

	public int insertSpu(T_MALL_PRODUCT tmp);

	public void insert_spu(T_MALL_PRODUCT tmp);

	public void insert_images(Map map);

	public List<T_MALL_PRODUCT> select_spu_list(Map map);
}
