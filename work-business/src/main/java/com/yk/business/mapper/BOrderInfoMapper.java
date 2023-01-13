package com.yk.business.mapper;

import java.util.List;
import com.yk.business.domain.BOrderInfo;

/**
 * 订单信息Mapper接口
 *
 * @author yankai
 * @date 2023-01-13
 */
public interface BOrderInfoMapper
{
    /**
     * 查询订单信息
     *
     * @param orderId 订单信息主键
     * @return 订单信息
     */
    public BOrderInfo selectBOrderInfoByOrderId(Long orderId);

    /**
     * 查询订单信息列表
     *
     * @param bOrderInfo 订单信息
     * @return 订单信息集合
     */
    public List<BOrderInfo> selectBOrderInfoList(BOrderInfo bOrderInfo);

    /**
     * 新增订单信息
     *
     * @param bOrderInfo 订单信息
     * @return 结果
     */
    public int insertBOrderInfo(BOrderInfo bOrderInfo);

    /**
     * 修改订单信息
     *
     * @param bOrderInfo 订单信息
     * @return 结果
     */
    public int updateBOrderInfo(BOrderInfo bOrderInfo);

    /**
     * 删除订单信息
     *
     * @param orderId 订单信息主键
     * @return 结果
     */
    public int deleteBOrderInfoByOrderId(Long orderId);

    /**
     * 批量删除订单信息
     *
     * @param orderIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBOrderInfoByOrderIds(Long[] orderIds);
}
