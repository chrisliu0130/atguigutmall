package com.atguigu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.atguigu.bean.MODET_T_MALL_SKU_ATTR_VALUE;
import com.atguigu.bean.OBJECT_T_MALL_ATTR;
import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_PRODUCT_COLOR;
import com.atguigu.bean.T_MALL_PRODUCT_VERSION;
import com.atguigu.bean.T_MALL_SKU;
import com.atguigu.service.AttrService;
import com.atguigu.service.SkuService;

@Controller
public class SkuController {

	@Autowired
	SkuService skuService;

	@Autowired
	AttrService attrService;

	@RequestMapping("save_sku")
	public ModelAndView save_sku(T_MALL_SKU sku, MODET_T_MALL_SKU_ATTR_VALUE list_attr, T_MALL_PRODUCT tmp,
			int ys_id, int bb_id) {

		// 将颜色信息和版本信息保存到t_mall_product_sku_info,考虑到需要sku_id....
		skuService.save_sku(sku, list_attr.getList_attr(), tmp, ys_id, bb_id);

		ModelAndView mv = new ModelAndView("redirect:/index.do");
		mv.addObject("flbh1", tmp.getFlbh1());
		mv.addObject("flbh2", tmp.getFlbh2());
		// 下面两个easyui用
		mv.addObject("url", "goto_sku_add.do?flbh2=" + tmp.getFlbh2() + "&flbh1=" + tmp.getFlbh1());
		mv.addObject("title", "库存单元信息");
		return mv;
	}

	@RequestMapping("goto_sku_add")
	public String goto_sku_add(Model model, int flbh1, int flbh2) {

		// 在跳转页面之前，已经存在了flbh2,根据flbh2可以插入其需要的属性，传到页面后
		// 可做成checkbox
		List<OBJECT_T_MALL_ATTR> attr_list = attrService.get_attr_list(flbh2);

		model.addAttribute("attr_list", attr_list);
		model.addAttribute("flbh1", flbh1);
		model.addAttribute("flbh2", flbh2);
		return "skuAdd";
	}

}
