package com.atguigu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.atguigu.bean.T_MALL_CLASS_1;

public interface TestDao {

	@Select("select * from t_mall_class_1")
	public List<T_MALL_CLASS_1> selectId();
	
}
