package com.yk.business.service.impl;

import java.util.List;

import com.yk.common.utils.DateUtils;
import com.yk.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yk.business.mapper.BOrderInfoMapper;
import com.yk.business.domain.BOrderInfo;
import com.yk.business.service.IBOrderInfoService;

/**
 * 订单信息Service业务层处理
 *
 * @author yankai
 * @date 2023-01-13
 */
@Service
public class BOrderInfoServiceImpl implements IBOrderInfoService
{
    @Autowired
    private BOrderInfoMapper bOrderInfoMapper;

    /**
     * 查询订单信息
     *
     * @param orderId 订单信息主键
     * @return 订单信息
     */
    @Override
    public BOrderInfo selectBOrderInfoByOrderId(Long orderId)
    {
        return bOrderInfoMapper.selectBOrderInfoByOrderId(orderId);
    }

    /**
     * 查询订单信息列表
     *
     * @param bOrderInfo 订单信息
     * @return 订单信息
     */
    @Override
    public List<BOrderInfo> selectBOrderInfoList(BOrderInfo bOrderInfo)
    {
        return bOrderInfoMapper.selectBOrderInfoList(bOrderInfo);
    }

    /**
     * 新增订单信息
     *
     * @param bOrderInfo 订单信息
     * @return 结果
     */
    @Override
    public int insertBOrderInfo(BOrderInfo bOrderInfo)
    {
        bOrderInfo.setCreateTime(DateUtils.getNowDate());
        bOrderInfo.setCreateBy(SecurityUtils.getLoginUser().getUser().getNickName());
        bOrderInfo.setOrderState("0");
        return bOrderInfoMapper.insertBOrderInfo(bOrderInfo);
    }

    /**
     * 修改订单信息
     *
     * @param bOrderInfo 订单信息
     * @return 结果
     */
    @Override
    public int updateBOrderInfo(BOrderInfo bOrderInfo)
    {
        return bOrderInfoMapper.updateBOrderInfo(bOrderInfo);
    }

    /**
     * 批量删除订单信息
     *
     * @param orderIds 需要删除的订单信息主键
     * @return 结果
     */
    @Override
    public int deleteBOrderInfoByOrderIds(Long[] orderIds)
    {
        return bOrderInfoMapper.deleteBOrderInfoByOrderIds(orderIds);
    }

    /**
     * 删除订单信息信息
     *
     * @param orderId 订单信息主键
     * @return 结果
     */
    @Override
    public int deleteBOrderInfoByOrderId(Long orderId)
    {
        return bOrderInfoMapper.deleteBOrderInfoByOrderId(orderId);
    }
}
