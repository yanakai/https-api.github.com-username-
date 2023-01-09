package com.yk.business.service;

import java.util.List;
import com.yk.business.domain.BAdditionalInfo;

/**
 * 附加项单次金额Service接口
 *
 * @author yankai
 * @date 2023-01-09
 */
public interface IBAdditionalInfoService
{
    /**
     * 查询附加项单次金额
     *
     * @param additionalId 附加项单次金额主键
     * @return 附加项单次金额
     */
    public BAdditionalInfo selectBAdditionalInfoByAdditionalId(Long additionalId);

    /**
     * 查询附加项单次金额列表
     *
     * @param bAdditionalInfo 附加项单次金额
     * @return 附加项单次金额集合
     */
    public List<BAdditionalInfo> selectBAdditionalInfoList(BAdditionalInfo bAdditionalInfo);

    /**
     * 新增附加项单次金额
     *
     * @param bAdditionalInfo 附加项单次金额
     * @return 结果
     */
    public int insertBAdditionalInfo(BAdditionalInfo bAdditionalInfo);

    /**
     * 修改附加项单次金额
     *
     * @param bAdditionalInfo 附加项单次金额
     * @return 结果
     */
    public int updateBAdditionalInfo(BAdditionalInfo bAdditionalInfo);

    /**
     * 批量删除附加项单次金额
     *
     * @param additionalIds 需要删除的附加项单次金额主键集合
     * @return 结果
     */
    public int deleteBAdditionalInfoByAdditionalIds(Long[] additionalIds);

    /**
     * 删除附加项单次金额信息
     *
     * @param additionalId 附加项单次金额主键
     * @return 结果
     */
    public int deleteBAdditionalInfoByAdditionalId(Long additionalId);
}
