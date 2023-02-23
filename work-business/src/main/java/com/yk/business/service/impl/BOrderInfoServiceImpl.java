package com.yk.business.service.impl;

import java.util.*;

import com.yk.business.domain.*;
import com.yk.business.mapper.BArtificerInfoMapper;
import com.yk.business.mapper.BMemberInfoMapper;
import com.yk.business.mapper.BOrderAdditionalMapper;
import com.yk.common.utils.DateUtils;
import com.yk.common.utils.SecurityUtils;
import com.yk.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import com.yk.business.mapper.BOrderInfoMapper;
import com.yk.business.service.IBOrderInfoService;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * 订单信息Service业务层处理
 *
 * @author yankai
 * @date 2023-01-13
 */
@Service
public class BOrderInfoServiceImpl implements IBOrderInfoService
{
    @Resource
    private BOrderInfoMapper bOrderInfoMapper;

    @Resource
    private BOrderAdditionalMapper bOrderAdditionalMapper;

    @Resource
    private BMemberInfoMapper bMemberInfoMapper;

    @Resource
    private BArtificerInfoMapper bArtificerInfoMapper;

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
     * 新增订单信息；直接开单
     *
     * @param bOrderInfo 订单信息
     * @return 结果
     */
    @Override
    public int insertBOrderInfo(BOrderInfo bOrderInfo)
    {
        bOrderInfo.setCreateTime(DateUtils.getNowDate());
        bOrderInfo.setCreateBy(SecurityUtils.getLoginUser().getUser().getNickName());
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

    @Override
    @Transactional
    public int savePaymentData(BPaymentDataVo bPaymentDataVo) {
        int state =0;
        /** 赋值订单信息 */
        BOrderInfo orderInfo = new BOrderInfo();
        orderInfo.setOrderId(bPaymentDataVo.getOrderId());
        orderInfo.setOrderAmount(bPaymentDataVo.getOrderAmount());
        orderInfo.setEndTime(bPaymentDataVo.getEndTime());
        orderInfo.setMemberId(bPaymentDataVo.getMemberId());
        orderInfo.setPaymentTime(bPaymentDataVo.getEndTime());
        orderInfo.setPaymentType(bPaymentDataVo.getPaymentType());
        orderInfo.setUpdateTime(DateUtils.getNowDate());
        orderInfo.setUpdateBy(SecurityUtils.getLoginUser().getUser().getNickName());
        orderInfo.setOrderState("2");// 订单状态  0：预约中；1：已开单；2：已支付
        state = bOrderInfoMapper.updateBOrderInfo(orderInfo);
        /** 赋值订单信息 */

        /** 赋值辅助项目信息 */
        // 判断账单是否选中辅助项目
        if(StringUtils.isNotEmpty(bPaymentDataVo.getAdditionalIds())){
            List<BOrderAdditional> list = new ArrayList<>(bPaymentDataVo.getAdditionalIds().length);
            for(Long additionalId : bPaymentDataVo.getAdditionalIds()){
                BOrderAdditional bOrderAdditional = new BOrderAdditional();
                bOrderAdditional.setOrderId(bPaymentDataVo.getOrderId());
                bOrderAdditional.setAdditionalId(additionalId);
                list.add(bOrderAdditional);
            }
            state = bOrderAdditionalMapper.saveOrderAdditional(list);
        }
        /** 赋值辅助信息 */
        /** 修改会员的剩余金额/剩余次数 */
        // 判断账单付款是否会员付款
        if(bPaymentDataVo.getMemberId() !=null && "1".equals(bPaymentDataVo.getPaymentType())){
            // 获取付账会员信息
            BMemberInfo bMemberInfo = bMemberInfoMapper.selectBMemberInfoByMemberId(bPaymentDataVo.getMemberId());
            // 根据会员类型判断是减金额还是减次数  1:赠送金额卡；2:赠送次数卡
            if("1".equals(bMemberInfo.getMemberType())){
                bMemberInfo.setSurplusAmount(bMemberInfo.getSurplusAmount().subtract(bPaymentDataVo.getOrderAmount()));
            }else {
                bMemberInfo.setSurplusTimes(bMemberInfo.getSurplusTimes()-bPaymentDataVo.getOrderTimes());
            }
            state = bMemberInfoMapper.updateBMemberInfo(bMemberInfo);
        }
        /** 赋值辅助信息 */
        return state;
    }

    @Override
    public BOrderInfo getOrderInfoDetailsById(Long orderId) {
        BOrderInfo bOrderInfo = bOrderInfoMapper.selectBOrderInfoByOrderId(orderId);
        List<BOrderAdditional> list = bOrderAdditionalMapper.getListByOrderId(orderId);
        // 获取订单关联的辅助项目信息
        if(StringUtils.isNotEmpty(list)){
            Long[] additionalIds = new Long[list.size()];
            for (int i =0;i<list.size();i++){
                additionalIds[i]= list.get(i).getAdditionalId();
            }
            Map<String,Object> params = new HashMap<>();
            params.put("additionalIds",additionalIds);
            bOrderInfo.setParams(params);
        }
        // 获取订单关联的会员信息
        if(bOrderInfo.getMemberId()!=null){
            BMemberInfo bMemberInfo = bMemberInfoMapper.selectBMemberInfoByMemberId(bOrderInfo.getMemberId());
            Map<String,Object> params = new HashMap<>();
            params.put("bMemberInfo",bMemberInfo);
            bOrderInfo.setParams(params);
        }
        return bOrderInfo;
    }

    @Override
    public Map<String, Object> getOrderStatistics(BOrderInfo bOrderInfo) {
        Map<String,Object> statisticsMap = new HashMap<>();
        // 获取今日时间
        String nowDayTime = DateUtils.getDate();
        // 查询今日已结账的订单总额、及订单数量
        bOrderInfo.setOrderState("2");
        bOrderInfo.getParams().put("searchTime",nowDayTime);
        statisticsMap =  bOrderInfoMapper.getOrderStatistics(bOrderInfo);
        // 查询今日办理会员总金额
        BMemberInfo bMemberInfo = new BMemberInfo();
        bMemberInfo.getParams().put("searchTime",nowDayTime);
        int memberAmountCount = bMemberInfoMapper.getMemberAmountStatistics(bMemberInfo);
        // 今日会员重置金额
        statisticsMap.put("memberAmountCount",memberAmountCount);
        return statisticsMap;
    }

    @Override
    public List<Map<String, Object>> getArtificerStatistics(BOrderInfo bOrderInfo) {
        // 获取所有技师的信息
        List<BArtificerInfo> artificerInfoList = bArtificerInfoMapper.selectBArtificerInfoList(new BArtificerInfo());
        List<Map<String,Object>> mapList = new ArrayList<>();
        for (BArtificerInfo info: artificerInfoList){
            Map<String,Object>  map = new HashMap<>();
            // 赋值技师名称
            map.put("artificerName",info.getArtificerFullName());
            // 获取技师时间段内开单非会员的收入
            bOrderInfo.setArtificerId(info.getArtificerId());
            bOrderInfo.setOrderState("2");
            int orderAmountTotal = bOrderInfoMapper.getOrderAmountTotalByArtificerId(bOrderInfo);
            // 赋值技师结单的非会员收入
            map.put("orderAmountTotal",orderAmountTotal);
            // 获取技师时间段内的开单点钟和排钟的数量
            bOrderInfo.setBellType("1"); // 查询排钟数量
            int paiZhongTotal = bOrderInfoMapper.getPaiZhongTotalByArtificerId(bOrderInfo);
            // 赋值技师结单的排钟数量
            map.put("paiZhongTotal",paiZhongTotal);
            bOrderInfo.setBellType("2"); // 查询点钟数量
            int dianZhongTotal = bOrderInfoMapper.getPaiZhongTotalByArtificerId(bOrderInfo);
            // 赋值技师结单的点钟数量
            map.put("dianZhongTotal",dianZhongTotal);
            // 获取技师时间段内的开单主服务项目数量及名称
            List<Map<String,Object>> zhuAdditionalMapList = bOrderInfoMapper.getZhuAdditionalTotalByArtificerId(bOrderInfo);
            if(StringUtils.isNotEmpty(zhuAdditionalMapList)){
                StringBuilder sb = new StringBuilder();
                zhuAdditionalMapList.forEach(item ->{
                    sb.append(item.get("additionalName")+"*"+item.get("additionalTotal")+"；");
                });
                // 赋值技师结单的主服务项目信息
                map.put("zhuAdditionalDetail",sb);
            }
            // 获取技师时间段内的开单辅助项目数量及名称
            List<Map<String,Object>> fuZhuAdditionalMapList = bOrderAdditionalMapper.getFuZhuAdditionalTotalByArtificerId(bOrderInfo);
            if(StringUtils.isNotEmpty(fuZhuAdditionalMapList)){
                StringBuilder sb = new StringBuilder();
                fuZhuAdditionalMapList.forEach(item ->{
                    sb.append(item.get("fuZhuAdditionalName")+"*"+item.get("fuZhuAdditionalTotal")+"；");
                });
                // 赋值技师结单的辅助服务项目信息
                map.put("fuZhuAdditionalDetail",sb);
            }
            mapList.add(map);
        }
        return mapList;
    }


}
