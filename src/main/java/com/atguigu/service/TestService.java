package com.atguigu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.T_MALL_CLASS_1;
import com.atguigu.dao.TestDao;

@Service
public class TestService {

	@Autowired
	TestDao testdao;
	 
	public List<T_MALL_CLASS_1> testDao() {
		List<T_MALL_CLASS_1> list = testdao.selectId();
		return list;
	}
}
