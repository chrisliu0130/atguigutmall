package com.atguigu.controller;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.atguigu.bean.MODEL_T_MALL_PRODUCT_COLOR;
import com.atguigu.bean.MODEL_T_MALL_PRODUCT_VERSION;
import com.atguigu.bean.T_MALL_CLASS_1;
import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_PRODUCT_COLOR;
import com.atguigu.bean.T_MALL_PRODUCT_VERSION;
import com.atguigu.dao.SpuDao;
import com.atguigu.service.SpuService;
import com.atguigu.service.TestService;
import com.atguigu.util.MyFileUpLoad;
import com.google.gson.Gson;

@Controller
public class SpuController {
	@Autowired
	TestService testService;

	@Autowired
	SpuService spuService;

	@Autowired
	SpuDao spuDao;

	@ResponseBody
	@RequestMapping("get_version_list")
	public List<T_MALL_PRODUCT_VERSION> get_version_list(int shp_id) {

		List<T_MALL_PRODUCT_VERSION> version_list = spuService.get_verion_list(shp_id);

		return version_list;
	}

	@ResponseBody
	@RequestMapping("get_color_list")
	public List<T_MALL_PRODUCT_COLOR> get_color_list(int shp_id) {

		List<T_MALL_PRODUCT_COLOR> color_list = spuService.get_color_list(shp_id);

		return color_list;
	}

	@ResponseBody
	@RequestMapping("get_spu_list")
	public List<T_MALL_PRODUCT> get_spu_list(int pp_id, int flbh2) {

		List<T_MALL_PRODUCT> spu_list = spuService.get_spu_list(pp_id, flbh2);

		return spu_list;
	}

	@RequestMapping("testjson")
	public String testjson() throws Exception {
		List<T_MALL_CLASS_1> list = testService.testDao();

		// 用gson
		Gson gson = new Gson();
		// .toJson
		String json = gson.toJson(list);
		System.out.println(json);
		// 生成静态文件，用IO流
		FileOutputStream stream = new FileOutputStream("d:/testjson2.js");
		stream.write(json.getBytes());
		stream.close();

		for (T_MALL_CLASS_1 t1 : list) {
			System.out.println(t1.getId() + t1.getFlmch1());
		}

		return "testjson";
	}

	@RequestMapping("spu_add")
	public ModelAndView spu_add(@RequestParam("files") MultipartFile[] files, T_MALL_PRODUCT tmp,
			MODEL_T_MALL_PRODUCT_COLOR color_list, MODEL_T_MALL_PRODUCT_VERSION version_list) {

		// 上传图片
		// 需要上换图片的工具类
		List<String> list_image = MyFileUpLoad.upload_image(files);

		// 保存商品信息 // 保存颜色和版本信息
		spuService.insert_spu(tmp, list_image, color_list, version_list);

		ModelAndView mv = new ModelAndView("redirect:/index.do");

		/*
		 * mv.addObject("flbh1", tmp.getFlbh1()); mv.addObject("flbh2", tmp.getFlbh2());
		 * mv.addObject("pp_id", tmp.getPp_id());
		 */
		mv.addObject("url",
				"goto_spu_add.do?flbh1=" + tmp.getFlbh1() + "&flbh2=" + tmp.getFlbh2() + "&pp_id=" + tmp.getPp_id());
		mv.addObject("title", "添加商品信息");

		/*
		 * System.out.println("Shp_mch:" + tmp.getShp_mch() + "--Flbh1:" +
		 * tmp.getFlbh1()); // spuDao.insertSpu(tmp); int key =
		 * spuService.insertSpu(tmp); ModelAndView mv = new ModelAndView();
		 */

		return mv;
	}

	@RequestMapping("goto_spu_add")
	public String goto_spu_add(ModelMap model, T_MALL_PRODUCT spu) {
		// System.out.println("spucontroller:goto_spu_add");
		model.put("spu", spu);
		return "spuAdd";
	}
}
