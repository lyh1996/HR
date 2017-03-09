package com.hr.dao;

import java.util.List;
import java.util.Map;

public interface BaseDao<T> {
//  sqlSession.add/update/delete/selectOne/selectList("mapp中的sqlid",   对象)
	//  T -> Person    ->   PersonMapper.xml
	public List<T> findAll(T t, String sqlId);
	
	//     select * from xx limit 5,10
	//    Map   start=5
	//          end=10
	public List<T> findAll( T t, Map map, String sqlId);
	
	// add, delete,  update
	public void add(  T t, String sqlId);
	
	public void add( T t, Map map, String sqlId);
	
	public void addMany( T t, List list, String sqlId);
	
	public void delete(  T t, String sqlId);
	
	public void delete(  T t, Map map, String sqlId);   // delete from xxx where id in(1,2,3,)
	
	public void deleteMany( T t, List list, String sqlId);
	
	public void update(  T t, String sqlId);
	
	public void update( T t, Map map, String sqlId);  // update xxx set sex=x where id in(1,2,3)
	
	public void updateMany( T t, List list, String sqlId);
	
	// 聚合函数
	public int findFunc(  T t, String sqlId); // select count(*) from xxx
	
	public int findFunc( T t, Map map, String sqlId);
	
	
	
	

	
}
