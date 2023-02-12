package com.yk.business.service;

import java.util.List;
import com.yk.business.domain.BOrderInfo;
import com.yk.business.domain.BPaymentDataVo;

/**
 * 订单信息Service接口
 *
 * @author yankai
 * @date 2023-01-13
 */
public interface IBOrderInfoService
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
     * 批量删除订单信息
     *
     * @param orderIds 需要删除的订单信息主键集合
     * @return 结果
     */
    public int deleteBOrderInfoByOrderIds(Long[] orderIds);

    /**
     * 删除订单信息信息
     *
     * @param orderId 订单信息主键
     * @return 结果
     */
    public int deleteBOrderInfoByOrderId(Long orderId);
    /**
     * @title savePaymentData
     * @description  订单结账保存
     * @param bPaymentDataVo
     * @return int
     * @author yanakai@126.com
     * @date   2023/2/7
     */
    int savePaymentData(BPaymentDataVo bPaymentDataVo);
    /**
     * @title getOrderInfoDetailsById
     * @description  查询订单所有的详情信息
     * @param orderId  订单id
     * @return com.yk.business.domain.BOrderInfo
     * @author yanakai@126.com
     * @date   2023/2/11
     */
    BOrderInfo getOrderInfoDetailsById(Long orderId);
}
