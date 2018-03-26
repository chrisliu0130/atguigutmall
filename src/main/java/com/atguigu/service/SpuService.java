package com.atguigu.service;

import java.util.List;

import com.atguigu.bean.T_MALL_PRODUCT;

public interface SpuService {
	public int insertSpu(T_MALL_PRODUCT tmp);

	public void insert_spu(T_MALL_PRODUCT tmp, List<String> list_image);
}
