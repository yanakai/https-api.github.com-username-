package com.yk.business.domain;

import java.math.BigDecimal;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.yk.common.annotation.Excel;
import com.yk.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
/**
 * @Description:
 * @Author: yanakai@126.com
 * @CreateDate: 2022/9/2 14:20
 * @UpdateUser: yanakai@126.com
 * @UpdateDate: 2022/9/2 14:20
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 */
public class BMemberInfo extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long memberId;

    /** 会员姓名 */
    @Excel(name = "会员姓名")
    private String memberName;

    /** 手机号 */
    @Excel(name = "手机号")
    private String memberPhonenumper;

    /** 性别关联字典表（0男 1女 2未知） */
    @Excel(name = "性别关联字典表", readConverterExp = "0=男,1=女,2=未知")
    private String sex;

    /** 会员密码 */
    @Excel(name = "会员密码")
    private String memberPassword;

    /** 会员卡id（关联表b_member_card） */
    @Excel(name = "会员卡id", readConverterExp = "关=联表b_member_card")
    private Long memberCardId;

    /** 会员卡名称（关联表b_member_card） */
    @Excel(name = "会员卡名称", readConverterExp = "关=联表b_member_card")
    private String memberCardName;

    /** 会员卡类型（关联表b_member_card） */
    @Excel(name = "会员卡类型", readConverterExp = "关=联表b_member_card")
    private String memberType;

    /** 会员卡类型名称（关联表b_member_card） */
    @Excel(name = "会员卡类型名称", readConverterExp = "关=联表b_member_card")
    private String memberTypeName;

    /** 充值金额（关联表b_member_card） */
    @Excel(name = "充值金额", readConverterExp = "关=联表b_member_card")
    private BigDecimal rechargeAmount;

    /** 赠送金额（关联表b_member_card） */
    @Excel(name = "赠送金额", readConverterExp = "关=联表b_member_card")
    private BigDecimal giveAmount;

    /** 单次金额（关联表b_member_card） */
    @Excel(name = "单次金额", readConverterExp = "关=联表b_member_card")
    private BigDecimal singleAmount;

    /** 剩余金额 （充值金额+赠送金额-使用金额） */
    @Excel(name = "剩余金额 ", readConverterExp = "充=值金额+赠送金额-使用金额")
    private BigDecimal surplusAmount;

    /** 剩余次数--用户会员次数卡记录（关联表b_member_card） */
    @Excel(name = "剩余次数", readConverterExp = "关=联表b_member_card")
    private Long surplusTimes;

    /** 支付方式（关联字典表b_member_paymentType） */
    @Excel(name = "支付方式", readConverterExp = "关=联字典表b_member_paymentType")
    private String paymentType;

    /** 办卡技师所属id */
    @Excel(name = "办卡技师所属id")
    private Long artificerId;

    /** 办卡技师所属名称 */
    @Excel(name = "办卡技师所属名称")
    private String artificerName;

    /** 会员积分 */
    @Excel(name = "会员积分")
    private Long memberPoints;

    /** 赠品 */
    @Excel(name = "赠品")
    private String additive;

    /** 赠送数量 */
    @Excel(name = "赠送数量")
    private String additiveNumber;

    /** 办卡人员 */
    @Excel(name = "办卡人员")
    private String cardPersonnel;

    /** 创建人 */
    @Excel(name = "创建人")
    private String createNema;

    /** 修改人 */
    @Excel(name = "修改人")
    private String modifyName;

    /**************************************只做查询********************************************/
    /** 会员ids */
    private String memberIds;
    /** 会员办卡次数 */
    private int handleCardNum;

    public int getHandleCardNum() {
        return handleCardNum;
    }

    public void setHandleCardNum(int handleCardNum) {
        this.handleCardNum = handleCardNum;
    }

    public String getMemberIds() {
        return memberIds;
    }

    public void setMemberIds(String memberIds) {
        this.memberIds = memberIds;
    }
    /**********************************************************************************/

    /** 修改时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "修改时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date modifyTime;

    public void setMemberId(Long memberId)
    {
        this.memberId = memberId;
    }

    public Long getMemberId()
    {
        return memberId;
    }
    public void setMemberName(String memberName)
    {
        this.memberName = memberName;
    }

    public String getMemberName()
    {
        return memberName;
    }
    public void setMemberPhonenumper(String memberPhonenumper)
    {
        this.memberPhonenumper = memberPhonenumper;
    }

    public String getMemberPhonenumper()
    {
        return memberPhonenumper;
    }
    public void setSex(String sex)
    {
        this.sex = sex;
    }

    public String getSex()
    {
        return sex;
    }

    public void setMemberPassword(String memberPassword)
    {
        this.memberPassword = memberPassword;
    }

    public String getMemberPassword()
    {
        return memberPassword;
    }

    public void setMemberCardId(Long memberCardId)
    {
        this.memberCardId = memberCardId;
    }

    public Long getMemberCardId()
    {
        return memberCardId;
    }
    public void setMemberCardName(String memberCardName)
    {
        this.memberCardName = memberCardName;
    }

    public String getMemberCardName()
    {
        return memberCardName;
    }
    public void setMemberType(String memberType)
    {
        this.memberType = memberType;
    }

    public String getMemberType()
    {
        return memberType;
    }
    public void setMemberTypeName(String memberTypeName)
    {
        this.memberTypeName = memberTypeName;
    }

    public String getMemberTypeName()
    {
        return memberTypeName;
    }
    public void setRechargeAmount(BigDecimal rechargeAmount)
    {
        this.rechargeAmount = rechargeAmount;
    }

    public BigDecimal getRechargeAmount()
    {
        return rechargeAmount;
    }
    public void setGiveAmount(BigDecimal giveAmount)
    {
        this.giveAmount = giveAmount;
    }

    public BigDecimal getGiveAmount()
    {
        return giveAmount;
    }
    public void setSurplusAmount(BigDecimal surplusAmount)
    {
        this.surplusAmount = surplusAmount;
    }

    public void setSingleAmount(BigDecimal singleAmount)
    {
        this.singleAmount = singleAmount;
    }
    public BigDecimal getSingleAmount()
    {
        return singleAmount;
    }

    public void setSurplusTimes(Long surplusTimes)
    {
        this.surplusTimes = surplusTimes;
    }
    public Long getSurplusTimes()
    {
        return surplusTimes;
    }

    public BigDecimal getSurplusAmount()
    {
        return surplusAmount;
    }
    public void setPaymentType(String paymentType)
    {
        this.paymentType = paymentType;
    }

    public String getPaymentType()
    {
        return paymentType;
    }
    public void setArtificerId(Long artificerId)
    {
        this.artificerId = artificerId;
    }

    public Long getArtificerId()
    {
        return artificerId;
    }
    public void setArtificerName(String artificerName)
    {
        this.artificerName = artificerName;
    }

    public String getArtificerName()
    {
        return artificerName;
    }
    public void setMemberPoints(Long memberPoints)
    {
        this.memberPoints = memberPoints;
    }

    public Long getMemberPoints()
    {
        return memberPoints;
    }
    public void setAdditive(String additive)
    {
        this.additive = additive;
    }

    public String getAdditive()
    {
        return additive;
    }
    public void setAdditiveNumber(String additiveNumber)
    {
        this.additiveNumber = additiveNumber;
    }

    public String getAdditiveNumber()
    {
        return additiveNumber;
    }
    public void setCardPersonnel(String cardPersonnel)
    {
        this.cardPersonnel = cardPersonnel;
    }

    public String getCardPersonnel()
    {
        return cardPersonnel;
    }
    public void setCreateNema(String createNema)
    {
        this.createNema = createNema;
    }

    public String getCreateNema()
    {
        return createNema;
    }
    public void setModifyName(String modifyName)
    {
        this.modifyName = modifyName;
    }

    public String getModifyName()
    {
        return modifyName;
    }
    public void setModifyTime(Date modifyTime)
    {
        this.modifyTime = modifyTime;
    }

    public Date getModifyTime()
    {
        return modifyTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("memberId", getMemberId())
                .append("memberName", getMemberName())
                .append("memberPhonenumper", getMemberPhonenumper())
                .append("sex", getSex())
                .append("memberPassword", getMemberPassword())
                .append("memberCardId", getMemberCardId())
                .append("memberCardName", getMemberCardName())
                .append("memberType", getMemberType())
                .append("memberTypeName", getMemberTypeName())
                .append("rechargeAmount", getRechargeAmount())
                .append("giveAmount", getGiveAmount())
                .append("singleAmount", getSingleAmount())
                .append("surplusAmount", getSurplusAmount())
                .append("surplusTimes", getSurplusTimes())
                .append("paymentType", getPaymentType())
                .append("artificerId", getArtificerId())
                .append("artificerName", getArtificerName())
                .append("memberPoints", getMemberPoints())
                .append("additive", getAdditive())
                .append("additiveNumber", getAdditiveNumber())
                .append("cardPersonnel", getCardPersonnel())
                .append("remark", getRemark())
                .append("createTime", getCreateTime())
                .append("createNema", getCreateNema())
                .append("modifyName", getModifyName())
                .append("modifyTime", getModifyTime())
                .toString();
    }
}
