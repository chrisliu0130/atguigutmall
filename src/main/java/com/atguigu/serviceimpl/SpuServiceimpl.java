package com.atguigu.serviceimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.MODEL_T_MALL_PRODUCT_COLOR;
import com.atguigu.bean.MODEL_T_MALL_PRODUCT_VERSION;
import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_PRODUCT_COLOR;
import com.atguigu.bean.T_MALL_PRODUCT_VERSION;
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

	/*
	 * @Override public void insert_spu(T_MALL_PRODUCT tmp, List<String> list_image)
	 * { // 插入商品信息 t_mall_product tmp.setShp_tp(list_image.get(0));// 此张图片作为商品的首页
	 * spuDao.insert_spu(tmp); // System.out.println("SpuServiceimpl:" +
	 * tmp.getId());// 还很的能返回啊
	 * 
	 * // 根据spu的主键，插入商品图片信息 t_mall_product_image Map<Object, Object> paramMap = new
	 * HashMap<Object, Object>(); paramMap.put("shp_id", tmp.getId());
	 * paramMap.put("list_image", list_image); spuDao.insert_images(paramMap); }
	 */

	@Override
	public List<T_MALL_PRODUCT> get_spu_list(int pp_id, int flbh2) {
		Map<Object, Object> paramMap = new HashMap<Object, Object>();
		paramMap.put("pp_id", pp_id);
		paramMap.put("flbh2", flbh2);

		List<T_MALL_PRODUCT> spu_list = spuDao.select_spu_list(paramMap);
		return spu_list;
	}

	@Override
	public void insert_spu(T_MALL_PRODUCT tmp, List<String> list_image, MODEL_T_MALL_PRODUCT_COLOR color_list,
			MODEL_T_MALL_PRODUCT_VERSION version_list) {
		// 插入商品信息 t_mall_product
		tmp.setShp_tp(list_image.get(0));// 此张图片作为商品的首页
		spuDao.insert_spu(tmp);
		// System.out.println("SpuServiceimpl:" + tmp.getId());// 还很的能返回啊

		// 根据spu的主键，插入商品图片信息 t_mall_product_image
		Map<Object, Object> paramMap = new HashMap<Object, Object>();
		paramMap.put("shp_id", tmp.getId());
		paramMap.put("list_image", list_image);
		spuDao.insert_images(paramMap);

		// 根据spu的主键，插入商品颜色信息 t_mall_product_color
		Map<Object, Object> colorMap = new HashedMap();
		colorMap.put("shp_id", tmp.getId());
		// colorMap.put("color_list", color_list.getColor_list());
		List<T_MALL_PRODUCT_COLOR> color_list2 = color_list.getColor_list();
		color_list2.remove(color_list2.size() - 1);
		colorMap.put("color_list", color_list2);
		spuDao.insert_color(colorMap);

		// 根据spu的主键，插入商品版本色信息 t_mall_product_version
		Map<Object, Object> versionMap = new HashedMap();
		versionMap.put("shp_id", tmp.getId());
		// versionMap.put("version_list", version_list.getVersion_list());
		List<T_MALL_PRODUCT_VERSION> version_list2 = version_list.getVersion_list();
		version_list2.remove(version_list2.size() - 1);
		versionMap.put("version_list", version_list2);
		spuDao.insert_version(versionMap);

	}

	@Override
	public List<T_MALL_PRODUCT_COLOR> get_color_list(int shp_id) {
		List<T_MALL_PRODUCT_COLOR> color_list = spuDao.select_color_list(shp_id);
		return color_list;
	}

	@Override
	public List<T_MALL_PRODUCT_VERSION> get_verion_list(int shp_id) {
		List<T_MALL_PRODUCT_VERSION> version_list = spuDao.select_verion_list(shp_id);
		return version_list;
	}

}
