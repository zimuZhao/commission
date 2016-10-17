package cn.hit.commission.dao;

import java.util.List;

import cn.hit.commission.po.Commission;

public interface IBossDAO {
	public int queryCount(int pageSize, String hql);
	public List<Commission> queryHistCommission(int pageSize, int pageNum, String startTime, String endTime);
}
