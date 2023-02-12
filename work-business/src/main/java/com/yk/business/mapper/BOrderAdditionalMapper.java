package com.yk.business.mapper;

import com.yk.business.domain.BOrderAdditional;

import java.util.List;

/**
 * 订单和辅助项目关联表
 */
public interface BOrderAdditionalMapper {
    /**
     * 批量保存订单与辅助项目信息
     */
    public int saveOrderAdditional(List<BOrderAdditional> orderAdditionalList);
    /**
     * @title getListByOrderId
     * @description  通过订单id查询 订单所关联的辅助项目
     * @param orderId 订单id
     * @return java.util.List<com.yk.business.domain.BOrderAdditional>
     * @author yanakai@126.com
     * @date   2023/2/11
     */
    List<BOrderAdditional> getListByOrderId(Long orderId);
}
