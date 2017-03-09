package com.hr.dao.redis.cache;

import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

import org.apache.ibatis.cache.Cache;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import redis.clients.jedis.Jedis;

 

public  class RedisCache implements Cache{
	//日志对象
	private static Logger logger=LogManager.getLogger(RedisCache.class);
	//对象编号
	private String id;
	private Jedis redisClient=createRedis();
	
	//用于同步锁
	private ReadWriteLock readWriteLock=new ReentrantReadWriteLock();
	
	  public RedisCache(String id) {
		  if(id==null){
			  throw new IllegalArgumentException("Cache instance requires an id");
		  }
		  logger.debug("create an cache instance with id:"+id);
		  this.id=id;
	}
	

	public static  Jedis createRedis() {//从连接池中获取
		 Jedis jedis=RedisPool.getPool().getResource();
		return jedis;
	}
	
	@Override
	public String getId() {//获取当前这个缓存中的id号
		 logger.info("redis is begin");
		return this.id;
	}
	
	@Override
	public void putObject(Object key, Object value) {
		 byte[] keybyte=SerializableUtil.serialize(key);
		 byte[] valuebyte=SerializableUtil.serialize(value);
		 this.redisClient.set(keybyte, valuebyte);
	}

	@Override
	public Object getObject(Object key) {//通过key到缓存redis中取值
		//缓存穿透
		byte[] values=this.redisClient.get(SerializableUtil.serialize(key));
		if(values==null){
			return null;
		}
		Object obj=SerializableUtil.unSerialize(values);
		return obj;
	}

	@Override
	public Object removeObject(Object key) {
		byte[] keybytes=SerializableUtil.serialize(key);
		return this.redisClient.expire(keybytes, 0);
	}

	@Override
	public void clear() {//将缓存中的数据删除，实际就是要清除redis中的数据
		this.redisClient.flushDB();
	}

	@Override
	public int getSize() {
		Long size=this.redisClient.dbSize();
		int s=Integer.valueOf(size+"");
		return s;
	}

	@Override
	public ReadWriteLock getReadWriteLock() {
		return readWriteLock;
	}
	 
 }