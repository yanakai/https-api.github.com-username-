package com.yk.business.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.yk.common.annotation.Excel;
import com.yk.common.core.domain.BaseEntity;

/**
 * 订单信息对象 b_order_info
 *
 * @author yankai
 * @date 2023-01-13
 */
public class BOrderInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 订单id */
    private Long orderId;

    /** 订单开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "订单开始时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    /** 订单结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "订单结束时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;

    /** 订单金额 */
    @Excel(name = "订单金额")
    private BigDecimal orderAmount;

    /** 订单状态关联字典表b_order_state */
    @Excel(name = "订单状态关联字典表b_order_state")
    private String orderState;

    /** 排钟类型关联字典表 b_order_bellType */
    @Excel(name = "排钟类型关联字典表 b_order_bellType")
    private String bellType;

    /** 服务项目id */
    private Long additionalId;

    /** 服务项目名称 */
    @Excel(name = "服务项目名称")
    private String additionalName;

    /** 技师id */
    private Long artificerId;

    /** 技师名称 */
    private String artificerName;

    public void setOrderId(Long orderId)
    {
        this.orderId = orderId;
    }

    public Long getOrderId()
    {
        return orderId;
    }
    public void setStartTime(Date startTime)
    {
        this.startTime = startTime;
    }

    public Date getStartTime()
    {
        return startTime;
    }
    public void setEndTime(Date endTime)
    {
        this.endTime = endTime;
    }

    public Date getEndTime()
    {
        return endTime;
    }
    public void setOrderAmount(BigDecimal orderAmount)
    {
        this.orderAmount = orderAmount;
    }

    public BigDecimal getOrderAmount()
    {
        return orderAmount;
    }
    public void setOrderState(String orderState)
    {
        this.orderState = orderState;
    }

    public String getOrderState()
    {
        return orderState;
    }
    public void setBellType(String bellType)
    {
        this.bellType = bellType;
    }

    public String getBellType()
    {
        return bellType;
    }
    public void setAdditionalId(Long additionalId)
    {
        this.additionalId = additionalId;
    }

    public Long getAdditionalId()
    {
        return additionalId;
    }
    public void setAdditionalName(String additionalName)
    {
        this.additionalName = additionalName;
    }

    public String getAdditionalName()
    {
        return additionalName;
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

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("orderId", getOrderId())
                .append("startTime", getStartTime())
                .append("endTime", getEndTime())
                .append("orderAmount", getOrderAmount())
                .append("orderState", getOrderState())
                .append("bellType", getBellType())
                .append("additionalId", getAdditionalId())
                .append("additionalName", getAdditionalName())
                .append("artificerId", getArtificerId())
                .append("artificerName", getArtificerName())
                .append("createTime", getCreateTime())
                .append("createBy", getCreateBy())
                .toString();
    }
}
