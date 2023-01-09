package com.yk.business.domain;

import com.yk.common.annotation.Excel;
import com.yk.common.core.domain.BaseEntity;
import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @Description:
 * @Author: yanakai@126.com
 * @CreateDate: 2023/1/9 21:40
 * @UpdateUser: yanakai@126.com
 * @UpdateDate: 2023/1/9 21:40
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 */
public class BAdditionalInfo  extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long additionalId;

    /** 附加项名称 */
    @Excel(name = "附加项名称")
    private String additionalName;

    /** 附加项金额 */
    @Excel(name = "附加项金额")
    private BigDecimal additionalAmount;

    /** 排序 */
    @Excel(name = "排序")
    private Long additionalSort;

    /** 备注 */
    @Excel(name = "备注")
    private String remarks;

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
    public void setAdditionalAmount(BigDecimal additionalAmount)
    {
        this.additionalAmount = additionalAmount;
    }

    public BigDecimal getAdditionalAmount()
    {
        return additionalAmount;
    }
    public void setAdditionalSort(Long additionalSort)
    {
        this.additionalSort = additionalSort;
    }

    public Long getAdditionalSort()
    {
        return additionalSort;
    }
    public void setRemarks(String remarks)
    {
        this.remarks = remarks;
    }

    public String getRemarks()
    {
        return remarks;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("additionalId", getAdditionalId())
                .append("additionalName", getAdditionalName())
                .append("additionalAmount", getAdditionalAmount())
                .append("additionalSort", getAdditionalSort())
                .append("createTime", getCreateTime())
                .append("createBy", getCreateBy())
                .append("updateTime", getUpdateTime())
                .append("updateBy", getUpdateBy())
                .append("remarks", getRemarks())
                .toString();
    }
}
