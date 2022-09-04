package com.yk.business.domain;

import com.yk.common.annotation.Excel;
import com.yk.common.core.domain.BaseEntity;
import java.math.BigDecimal;
import java.util.Date;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
/**
 * @Description:
 * @Author: yanakai@126.com
 * @CreateDate: 2022/9/2 16:15
 * @UpdateUser: yanakai@126.com
 * @UpdateDate: 2022/9/2 16:15
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 */
public class BMemberCard extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long cardId;

    /** 会员卡名称 */
    @Excel(name = "会员卡名称")
    private String cardName;

    /** 会员卡类型 */
    @Excel(name = "会员卡类型")
    private String cardType;

    /** 会员卡金额 */
    @Excel(name = "会员卡金额")
    private BigDecimal cardAmount;

    /** 会员卡赠送金额 */
    @Excel(name = "会员卡赠送金额")
    private BigDecimal cardGiveAmount;

    /** 单次金额 */
    @Excel(name = "单次金额")
    private BigDecimal singleAmount;

    /** 会员次数卡剩余次数 */
    @Excel(name = "会员次数卡剩余次数")
    private Long cardTimes;

    /** 会员卡标识（旧会员卡、新会员卡） */
    @Excel(name = "会员卡标识", readConverterExp = "旧=会员卡、新会员卡")
    private String dataType;

    /** 创建人 */
    private String createName;

    /** 修改人 */
    private String modifyName;

    /** 修改时间 */
    private Date modifyTime;

    public void setCardId(Long cardId)
    {
        this.cardId = cardId;
    }

    public Long getCardId()
    {
        return cardId;
    }
    public void setCardName(String cardName)
    {
        this.cardName = cardName;
    }

    public String getCardName()
    {
        return cardName;
    }
    public void setCardType(String cardType)
    {
        this.cardType = cardType;
    }

    public String getCardType()
    {
        return cardType;
    }
    public void setCardAmount(BigDecimal cardAmount)
    {
        this.cardAmount = cardAmount;
    }

    public BigDecimal getCardAmount()
    {
        return cardAmount;
    }
    public void setCardGiveAmount(BigDecimal cardGiveAmount)
    {
        this.cardGiveAmount = cardGiveAmount;
    }

    public BigDecimal getCardGiveAmount()
    {
        return cardGiveAmount;
    }
    public void setDataType(String dataType)
    {
        this.dataType = dataType;
    }

    public void setSingleAmount(BigDecimal singleAmount)
    {
        this.singleAmount = singleAmount;
    }
    public BigDecimal getSingleAmount()
    {
        return singleAmount;
    }
    public void setCardTimes(Long cardTimes)
    {
        this.cardTimes = cardTimes;
    }
    public Long getCardTimes()
    {
        return cardTimes;
    }

    public String getDataType()
    {
        return dataType;
    }
    public void setCreateName(String createName)
    {
        this.createName = createName;
    }

    public String getCreateName()
    {
        return createName;
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
                .append("cardId", getCardId())
                .append("cardName", getCardName())
                .append("cardType", getCardType())
                .append("cardAmount", getCardAmount())
                .append("cardGiveAmount", getCardGiveAmount())
                .append("singleAmount", getSingleAmount())
                .append("cardTimes", getCardTimes())
                .append("dataType", getDataType())
                .append("createName", getCreateName())
                .append("createTime", getCreateTime())
                .append("modifyName", getModifyName())
                .append("modifyTime", getModifyTime())
                .toString();
    }
}
