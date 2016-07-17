package com.caoqi.seckill.dao;

import com.caoqi.seckill.entity.SuccessKilled;

/**
 * SuccessKilled实体的DAO
 * @author caoqi
 *
 */
public interface SuccessKilledDao {

	/**
	 * 插入购买明细，可过滤重复
	 * @param seckillId
	 * @param userPhone
	 * @return 插入的结果集数量
	 */
	int insertSuccessKilled(long seckillId, long userPhone);
	
	/**
	 * 根据id查询SuccessKilled并携带秒杀产品对象实体
	 * @param seckillId
	 * @return
	 */
	SuccessKilled queryByIdWithSeckill(long seckillId);
	
}
