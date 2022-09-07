package com.yk.business.service;

import java.util.List;
import com.yk.business.domain.BMemberInfo;

/**
 * 会员信息Service接口
 *
 * @author yanakai@126.com
 * @date 2022-09-02
 */
public interface IBMemberInfoService
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
     * 批量删除会员信息
     *
     * @param memberIds 需要删除的会员信息主键集合
     * @return 结果
     */
    public int deleteBMemberInfoByMemberIds(Long[] memberIds);

    /**
     * 删除会员信息信息
     *
     * @param memberId 会员信息主键
     * @return 结果
     */
    public int deleteBMemberInfoByMemberId(Long memberId);
    /**
     * @title getMergeMemberList
     * @description 通过会员id和会员手机号查询该该手机号下的所有会员信息，不查询当前该会员信息
     * @param memberId  预合并的会员id
     * @param memberPhonenumper  会员手机号
     * @return java.util.List<com.yk.business.domain.BMemberInfo>
     * @author yanakai@126.com
     * @date   2022/9/6
     */
    List<BMemberInfo> getMergeMemberList(Long memberId, String memberPhonenumper);
    /**
     * @title handleMergeMemberList
     * @description  合并会员信息
     * @param memberId  会员id
     * @param memberIds  要合并的会员ids
     * @return int
     * @author yanakai@126.com
     * @date   2022/9/6
     */
    int handleMergeMemberList(Long memberId, String memberIds);
}
