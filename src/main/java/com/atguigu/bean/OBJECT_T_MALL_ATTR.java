package com.atguigu.bean;

import java.util.List;

/*
 * 感觉上这就是一个包装类,包装一个属性
 * 一个属性（T_MALL_ATTR）中可以包含多个属性值（T_MALL_VALUE）
 * 但是为什么要继承呢？因为还要被包装？
 */
public class OBJECT_T_MALL_ATTR extends T_MALL_ATTR {

	private List<T_MALL_VALUE> list_value;

	public List<T_MALL_VALUE> getList_value() {
		return list_value;
	}

	public void setList_value(List<T_MALL_VALUE> list_value) {
		this.list_value = list_value;
	}

}
