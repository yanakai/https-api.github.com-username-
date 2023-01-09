package com.yk.business.mapper;

import java.util.List;
import com.yk.business.domain.BAdditionalInfo;

/**
 * 附加项单次金额Mapper接口
 *
 * @author yankai
 * @date 2023-01-09
 */
public interface BAdditionalInfoMapper
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
     * 删除附加项单次金额
     *
     * @param additionalId 附加项单次金额主键
     * @return 结果
     */
    public int deleteBAdditionalInfoByAdditionalId(Long additionalId);

    /**
     * 批量删除附加项单次金额
     *
     * @param additionalIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBAdditionalInfoByAdditionalIds(Long[] additionalIds);
}
