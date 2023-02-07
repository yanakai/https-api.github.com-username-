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

}
