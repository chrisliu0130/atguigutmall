package com.atguigu.serviceimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_PRODUCT_COLOR;
import com.atguigu.bean.T_MALL_PRODUCT_VERSION;
import com.atguigu.bean.T_MALL_SKU;
import com.atguigu.bean.T_MALL_SKU_ATTR_VALUE;
import com.atguigu.dao.SkuDao;
import com.atguigu.service.SkuService;

@Service
public class SkuServiceImpl implements SkuService {

	@Autowired
	SkuDao skuDao;

	@Override
	public void save_sku(T_MALL_SKU sku, List<T_MALL_SKU_ATTR_VALUE> list_attr, T_MALL_PRODUCT tmp,
			int ys_id, int bb_id) {
		// 返回主键
		sku.setId(tmp.getId());
		skuDao.insert_sku(sku);

		// 将颜色和版本插入到t_mall_product_sku_info
		Map<Object, Object> paramMap2 = new HashMap<Object, Object>();
		paramMap2.put("sku_id", sku.getId());
		paramMap2.put("ys_id", ys_id);
		paramMap2.put("bb_id", bb_id);
		skuDao.insert_sku_ys_bb(paramMap2);

		// 插入属性关联表
		Map<Object, Object> paramMap = new HashMap<Object, Object>();
		paramMap.put("shp_id", tmp.getId());
		paramMap.put("sku_id", sku.getId());
		paramMap.put("list_av", list_attr);
		skuDao.insert_sku_av(paramMap);
	}

}
