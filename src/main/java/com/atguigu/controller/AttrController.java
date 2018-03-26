package com.atguigu.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.atguigu.bean.MODEL_T_MALL_ATTR;
import com.atguigu.bean.OBJECT_T_MALL_ATTR;
import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.service.AttrService;

@Controller
public class AttrController {

	@Autowired
	AttrService attrService;

	/*
	 * 返回的是一个html页面
	 */
	@RequestMapping("goto_attrListInner")
	public String goto_attrListInner(Model model, int flbh2) {
		List<OBJECT_T_MALL_ATTR> list_attr = new ArrayList<OBJECT_T_MALL_ATTR>();
		
		//list_attr =attrService.get_attr_list(flbh2);
		model.addAttribute("flbh2", flbh2);
		model.addAttribute("list_attr", list_attr);
		return "attrListInner";
	}

	@RequestMapping("goto_attr_add")
	public String goto_attr_add(Model model, T_MALL_PRODUCT tmp) {
		model.addAttribute("flbh2", tmp.getFlbh2());
		return "attrAdd";
	}

	@RequestMapping("attr_add")
	public ModelAndView attr_add(int flbh2, MODEL_T_MALL_ATTR list_attr) {

		List<OBJECT_T_MALL_ATTR> attrList = list_attr.getList_attr();

		/*
		 * 我自己写的
		 */
		for (OBJECT_T_MALL_ATTR attr : attrList) {
			attr.setFlbh2(flbh2);
			attrService.insert_attr(attr);
		}

		/*
		 * 老师写的
		 */
		/* attrService.insert_attr(flbh2,attrList); */

		ModelAndView mv = new ModelAndView("redirect:/goto_attr_add.do");

		mv.addObject("flbh2", flbh2);

		return mv;
	}
}
