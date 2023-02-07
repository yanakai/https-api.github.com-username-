package com.yk.business.domain;

import com.yk.common.annotation.Excel;
import com.yk.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @Description: 订单与辅助项目关联信息
 * @Author: yanakai@126.com
 * @CreateDate: 2023/2/7 23:16
 * @UpdateUser: yanakai@126.com
 * @UpdateDate: 2023/2/7 23:16
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 */
public class BOrderAdditional extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 订单id */
    @Excel(name = "订单id")
    private Long orderId;

    /** 辅助项目id */
    @Excel(name = "辅助项目id")
    private Long additionalId;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setOrderId(Long orderId)
    {
        this.orderId = orderId;
    }

    public Long getOrderId()
    {
        return orderId;
    }
    public void setAdditionalId(Long additionalId)
    {
        this.additionalId = additionalId;
    }

    public Long getAdditionalId()
    {
        return additionalId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("orderId", getOrderId())
                .append("additionalId", getAdditionalId())
                .toString();
    }
}
