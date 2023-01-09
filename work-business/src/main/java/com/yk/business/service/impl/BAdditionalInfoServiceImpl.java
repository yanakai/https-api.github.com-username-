package com.yk.business.service.impl;

import java.util.List;

import com.yk.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yk.business.mapper.BAdditionalInfoMapper;
import com.yk.business.domain.BAdditionalInfo;
import com.yk.business.service.IBAdditionalInfoService;
/**
 * @Description:
 * @Author: yanakai@126.com
 * @CreateDate: 2023/1/9 21:51
 * @UpdateUser: yanakai@126.com
 * @UpdateDate: 2023/1/9 21:51
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 */
@Service
public class BAdditionalInfoServiceImpl implements IBAdditionalInfoService {

    @Autowired
    private BAdditionalInfoMapper bAdditionalInfoMapper;

    /**
     * 查询附加项单次金额
     *
     * @param additionalId 附加项单次金额主键
     * @return 附加项单次金额
     */
    @Override
    public BAdditionalInfo selectBAdditionalInfoByAdditionalId(Long additionalId)
    {
        return bAdditionalInfoMapper.selectBAdditionalInfoByAdditionalId(additionalId);
    }

    /**
     * 查询附加项单次金额列表
     *
     * @param bAdditionalInfo 附加项单次金额
     * @return 附加项单次金额
     */
    @Override
    public List<BAdditionalInfo> selectBAdditionalInfoList(BAdditionalInfo bAdditionalInfo)
    {
        return bAdditionalInfoMapper.selectBAdditionalInfoList(bAdditionalInfo);
    }

    /**
     * 新增附加项单次金额
     *
     * @param bAdditionalInfo 附加项单次金额
     * @return 结果
     */
    @Override
    public int insertBAdditionalInfo(BAdditionalInfo bAdditionalInfo)
    {
        bAdditionalInfo.setCreateTime(DateUtils.getNowDate());
        return bAdditionalInfoMapper.insertBAdditionalInfo(bAdditionalInfo);
    }

    /**
     * 修改附加项单次金额
     *
     * @param bAdditionalInfo 附加项单次金额
     * @return 结果
     */
    @Override
    public int updateBAdditionalInfo(BAdditionalInfo bAdditionalInfo)
    {
        bAdditionalInfo.setUpdateTime(DateUtils.getNowDate());
        return bAdditionalInfoMapper.updateBAdditionalInfo(bAdditionalInfo);
    }

    /**
     * 批量删除附加项单次金额
     *
     * @param additionalIds 需要删除的附加项单次金额主键
     * @return 结果
     */
    @Override
    public int deleteBAdditionalInfoByAdditionalIds(Long[] additionalIds)
    {
        return bAdditionalInfoMapper.deleteBAdditionalInfoByAdditionalIds(additionalIds);
    }

    /**
     * 删除附加项单次金额信息
     *
     * @param additionalId 附加项单次金额主键
     * @return 结果
     */
    @Override
    public int deleteBAdditionalInfoByAdditionalId(Long additionalId)
    {
        return bAdditionalInfoMapper.deleteBAdditionalInfoByAdditionalId(additionalId);
    }

}
