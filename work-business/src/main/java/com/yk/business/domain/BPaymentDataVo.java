package com.yk.business.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.yk.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @Description: 结账对象
 * @Author: yanakai@126.com
 * @CreateDate: 2023/2/7 22:34
 * @UpdateUser: yanakai@126.com
 * @UpdateDate: 2023/2/7 22:34
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 */
public class BPaymentDataVo extends BaseEntity {
    private static final long serialVersionUID = 1L;
    /**
     * 结账订单
     */
    private Long orderId;
    /**
     * 结账会员
     */
    private Long memberId;
    /**
     * 结账时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm")
    private Date endTime;
    /**
     * 付款方式
     */
    private String paymentType;
    /**
     * 订单金额
     */
    private BigDecimal orderAmount;
    /**
     * 赠送金额会员剩余金额
     */
    private BigDecimal cardSurplusAmount;
    /**
     * 赠送次数会员剩余次数
     */
    private Integer cardSurplusNum;

    /**
     * 辅助项目id
     */
    private Long[] additionalIds;

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getMemberId() {
        return memberId;
    }

    public void setMemberId(Long memberId) {
        this.memberId = memberId;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public BigDecimal getOrderAmount() {
        return orderAmount;
    }

    public void setOrderAmount(BigDecimal orderAmount) {
        this.orderAmount = orderAmount;
    }

    public BigDecimal getCardSurplusAmount() {
        return cardSurplusAmount;
    }

    public void setCardSurplusAmount(BigDecimal cardSurplusAmount) {
        this.cardSurplusAmount = cardSurplusAmount;
    }

    public Integer getCardSurplusNum() {
        return cardSurplusNum;
    }

    public void setCardSurplusNum(Integer cardSurplusNum) {
        this.cardSurplusNum = cardSurplusNum;
    }

    public Long[] getAdditionalIds() {
        return additionalIds;
    }

    public void setAdditionalIds(Long[] additionalIds) {
        this.additionalIds = additionalIds;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("orderId", getOrderId())
                .append("memberId", getMemberId())
                .append("endTime", getEndTime())
                .append("paymentType", getPaymentType())
                .append("orderAmount", getOrderAmount())
                .append("cardSurplusAmount", getCardSurplusAmount())
                .append("cardSurplusNum", getCardSurplusNum())
                .toString();
    }
}
