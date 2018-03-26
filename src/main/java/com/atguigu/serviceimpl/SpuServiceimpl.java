package com.atguigu.serviceimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.dao.SpuDao;
import com.atguigu.service.SpuService;

@Service
public class SpuServiceimpl implements SpuService {

	@Autowired
	SpuDao spuDao;

	@Override
	public int insertSpu(T_MALL_PRODUCT tmp) {
		return spuDao.insertSpu(tmp);
	}

	@Override
	public void insert_spu(T_MALL_PRODUCT tmp, List<String> list_image) {
		// 插入商品信息 t_mall_product
		tmp.setShp_tp(list_image.get(0));// 此张图片作为商品的首页
		spuDao.insert_spu(tmp);
		//System.out.println("SpuServiceimpl:" + tmp.getId());// 还很的能返回啊

		// 根据spu的主键，插入商品图片信息 t_mall_product_image
		Map<Object, Object> paramMap = new HashMap<Object, Object>();
		paramMap.put("shp_id", tmp.getId());
		paramMap.put("list_image", list_image);
		spuDao.insert_images(paramMap);
	}

}
