package com.yk.business.service;

import java.util.List;
import com.yk.business.domain.BMemberCard;

/**
 * 业务--会员卡信息Service接口
 *
 * @author yanakai@126.com
 * @date 2022-09-02
 */
public interface IBMemberCardService
{
    /**
     * 查询业务--会员卡信息
     *
     * @param cardId 业务--会员卡信息主键
     * @return 业务--会员卡信息
     */
    public BMemberCard selectBMemberCardByCardId(Long cardId);

    /**
     * 查询业务--会员卡信息列表
     *
     * @param bMemberCard 业务--会员卡信息
     * @return 业务--会员卡信息集合
     */
    public List<BMemberCard> selectBMemberCardList(BMemberCard bMemberCard);

    /**
     * 新增业务--会员卡信息
     *
     * @param bMemberCard 业务--会员卡信息
     * @return 结果
     */
    public int insertBMemberCard(BMemberCard bMemberCard);

    /**
     * 修改业务--会员卡信息
     *
     * @param bMemberCard 业务--会员卡信息
     * @return 结果
     */
    public int updateBMemberCard(BMemberCard bMemberCard);

    /**
     * 批量删除业务--会员卡信息
     *
     * @param cardIds 需要删除的业务--会员卡信息主键集合
     * @return 结果
     */
    public int deleteBMemberCardByCardIds(Long[] cardIds);

    /**
     * 删除业务--会员卡信息信息
     *
     * @param cardId 业务--会员卡信息主键
     * @return 结果
     */
    public int deleteBMemberCardByCardId(Long cardId);
}
