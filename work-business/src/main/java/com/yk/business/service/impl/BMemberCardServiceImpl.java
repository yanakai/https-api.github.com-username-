package com.yk.business.service.impl;

import com.yk.business.domain.BMemberCard;
import com.yk.common.utils.DateUtils;
import org.springframework.stereotype.Service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import com.yk.business.mapper.BMemberCardMapper;
import com.yk.business.service.IBMemberCardService;

/**
 * @Description:
 * @Author: yanakai@126.com
 * @CreateDate: 2022/9/2 16:28
 * @UpdateUser: yanakai@126.com
 * @UpdateDate: 2022/9/2 16:28
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 */
@Service
public class BMemberCardServiceImpl implements IBMemberCardService{

    @Autowired
    private BMemberCardMapper bMemberCardMapper;

    /**
     * 查询业务--会员卡信息
     *
     * @param cardId 业务--会员卡信息主键
     * @return 业务--会员卡信息
     */
    @Override
    public BMemberCard selectBMemberCardByCardId(Long cardId)
    {
        return bMemberCardMapper.selectBMemberCardByCardId(cardId);
    }

    /**
     * 查询业务--会员卡信息列表
     *
     * @param bMemberCard 业务--会员卡信息
     * @return 业务--会员卡信息
     */
    @Override
    public List<BMemberCard> selectBMemberCardList(BMemberCard bMemberCard)
    {
        return bMemberCardMapper.selectBMemberCardList(bMemberCard);
    }

    /**
     * 新增业务--会员卡信息
     *
     * @param bMemberCard 业务--会员卡信息
     * @return 结果
     */
    @Override
    public int insertBMemberCard(BMemberCard bMemberCard)
    {
        bMemberCard.setCreateTime(DateUtils.getNowDate());
        return bMemberCardMapper.insertBMemberCard(bMemberCard);
    }

    /**
     * 修改业务--会员卡信息
     *
     * @param bMemberCard 业务--会员卡信息
     * @return 结果
     */
    @Override
    public int updateBMemberCard(BMemberCard bMemberCard)
    {
        return bMemberCardMapper.updateBMemberCard(bMemberCard);
    }

    /**
     * 批量删除业务--会员卡信息
     *
     * @param cardIds 需要删除的业务--会员卡信息主键
     * @return 结果
     */
    @Override
    public int deleteBMemberCardByCardIds(Long[] cardIds)
    {
        return bMemberCardMapper.deleteBMemberCardByCardIds(cardIds);
    }

    /**
     * 删除业务--会员卡信息信息
     *
     * @param cardId 业务--会员卡信息主键
     * @return 结果
     */
    @Override
    public int deleteBMemberCardByCardId(Long cardId)
    {
        return bMemberCardMapper.deleteBMemberCardByCardId(cardId);
    }
}
