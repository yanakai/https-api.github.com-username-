package com.yk.business.service.impl;

import java.math.BigDecimal;
import java.util.List;

import com.yk.common.core.text.Convert;
import com.yk.common.utils.DateUtils;
import com.yk.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yk.business.mapper.BMemberInfoMapper;
import com.yk.business.domain.BMemberInfo;
import com.yk.business.service.IBMemberInfoService;

import javax.annotation.Resource;

/**
 * @Description:
 * @Author: yanakai@126.com
 * @CreateDate: 2022/9/2 14:46
 * @UpdateUser: yanakai@126.com
 * @UpdateDate: 2022/9/2 14:46
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 */
@Service
public class BMemberInfoServiceImpl implements IBMemberInfoService {

    @Resource
    private BMemberInfoMapper bMemberInfoMapper;

    /**
     * 查询会员信息
     *
     * @param memberId 会员信息主键
     * @return 会员信息
     */
    @Override
    public BMemberInfo selectBMemberInfoByMemberId(Long memberId)
    {
        return bMemberInfoMapper.selectBMemberInfoByMemberId(memberId);
    }

    /**
     * 查询会员信息列表
     *
     * @param bMemberInfo 会员信息
     * @return 会员信息
     */
    @Override
    public List<BMemberInfo> selectBMemberInfoList(BMemberInfo bMemberInfo)
    {
        return bMemberInfoMapper.selectBMemberInfoList(bMemberInfo);
    }

    /**
     * 新增会员信息
     *
     * @param bMemberInfo 会员信息
     * @return 结果
     */
    @Override
    public int insertBMemberInfo(BMemberInfo bMemberInfo)
    {
        bMemberInfo.setCreateTime(DateUtils.getNowDate());
        return bMemberInfoMapper.insertBMemberInfo(bMemberInfo);
    }

    /**
     * 修改会员信息
     *
     * @param bMemberInfo 会员信息
     * @return 结果
     */
    @Override
    public int updateBMemberInfo(BMemberInfo bMemberInfo)
    {
        return bMemberInfoMapper.updateBMemberInfo(bMemberInfo);
    }

    /**
     * 批量删除会员信息
     *
     * @param memberIds 需要删除的会员信息主键
     * @return 结果
     */
    @Override
    public int deleteBMemberInfoByMemberIds(Long[] memberIds)
    {
        return bMemberInfoMapper.deleteBMemberInfoByMemberIds(memberIds);
    }

    /**
     * 删除会员信息信息
     *
     * @param memberId 会员信息主键
     * @return 结果
     */
    @Override
    public int deleteBMemberInfoByMemberId(Long memberId)
    {
        return bMemberInfoMapper.deleteBMemberInfoByMemberId(memberId);
    }

    @Override
    public List<BMemberInfo> getMergeMemberList(Long memberId, String memberPhonenumper) {
        return bMemberInfoMapper.getMergeMemberList(memberId,memberPhonenumper);
    }

    @Override
    public int handleMergeMemberList(Long memberId,String memberIds) {
        // 获取选中的会员信息
        List<BMemberInfo> list = bMemberInfoMapper.getBMemberInfoListByMemberIds(Convert.toLongArray(memberIds));
        // 获取主会员信息
        BMemberInfo info = bMemberInfoMapper.selectBMemberInfoByMemberId(memberId);
        BigDecimal totalAmount = new BigDecimal(0);
        if(StringUtils.isNotEmpty(list)){
            // 循环选中的数据，计算会员卡的剩余金额
            for (BMemberInfo item:list){
                totalAmount = totalAmount.add(new BigDecimal(String.valueOf(item.getSurplusAmount())));
                item.setSurplusAmount(new BigDecimal(0));
                bMemberInfoMapper.updateBMemberInfo(item);
            }
        }
        // 把剩余金额和主会员余额相加得到该会员最终的余额
        info.setSurplusAmount(totalAmount.add(info.getSurplusAmount()));
        return bMemberInfoMapper.updateBMemberInfo(info);
    }
}
