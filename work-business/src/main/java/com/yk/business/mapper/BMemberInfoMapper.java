package com.yk.business.mapper;

import java.util.List;
import com.yk.business.domain.BMemberInfo;
import org.apache.ibatis.annotations.Param;

/**
 * 会员信息Mapper接口
 *
 * @author yanakai@126.com
 * @date 2022-09-02
 */
public interface BMemberInfoMapper
{
    /**
     * 查询会员信息
     *
     * @param memberId 会员信息主键
     * @return 会员信息
     */
    public BMemberInfo selectBMemberInfoByMemberId(Long memberId);

    /**
     * 查询会员信息列表
     *
     * @param bMemberInfo 会员信息
     * @return 会员信息集合
     */
    public List<BMemberInfo> selectBMemberInfoList(BMemberInfo bMemberInfo);

    /**
     * 新增会员信息
     *
     * @param bMemberInfo 会员信息
     * @return 结果
     */
    public int insertBMemberInfo(BMemberInfo bMemberInfo);

    /**
     * 修改会员信息
     *
     * @param bMemberInfo 会员信息
     * @return 结果
     */
    public int updateBMemberInfo(BMemberInfo bMemberInfo);

    /**
     * 删除会员信息
     *
     * @param memberId 会员信息主键
     * @return 结果
     */
    public int deleteBMemberInfoByMemberId(Long memberId);

    /**
     * 批量删除会员信息
     *
     * @param memberIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBMemberInfoByMemberIds(Long[] memberIds);

    /**
     * @title getMergeMemberList
     * @description  通过会员id和会员手机号查询该该手机号下的所有会员信息，不查询当前该会员信息
     * @param memberId  预合并的会员id
     * @param memberPhonenumper   会员手机号
     * @return java.util.List<com.yk.business.domain.BMemberInfo>
     * @author yanakai@126.com
     * @date   2022/9/6
     */
    List<BMemberInfo> getMergeMemberList(@Param("memberId") Long memberId, @Param("memberPhonenumper")String memberPhonenumper);
    /**
     * @title getBMemberInfoListByMemberIds
     * @description  通过会员ids查询会员信息
     * @param memberIds  会员ids
     * @return java.util.List<com.yk.business.domain.BMemberInfo>
     * @author yanakai@126.com
     * @date   2022/9/6
     */
    List<BMemberInfo> getBMemberInfoListByMemberIds(Long[] memberIds);
    /**
     * @title getMemberAmountStatistics
     * @description  查询今日办理会员总金额
     * @param bMemberInfo
     * @return int
     * @author yanakai@126.com
     * @date   2023/2/22
     */
    int getMemberAmountStatistics(BMemberInfo bMemberInfo);
}
