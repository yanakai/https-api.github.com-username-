package com.yk.business.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.yk.common.annotation.Excel;
import com.yk.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 业务--技师对象 b_artificer_info
 *
 * @author yanakai@126.com
 * @date 2022-09-02
 */
public class BArtificerInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long artificerId;

    /** 所属店铺id */
    @Excel(name = "所属店铺id")
    private Long deptId;

    /** 所属门店名称 */
    @Excel(name = "所属门店名称")
    private String deptName;

    /** 技师名称 */
    @Excel(name = "技师名称")
    private String artificerFullName;

    /** 技师简称 */
    @Excel(name = "技师简称")
    private String artificerName;

    /** 技师等级关联字典表类型b_artificer_level */
    @Excel(name = "技师等级关联字典表类型b_artificer_level")
    private String artificerLevel;

    /** 手机号 */
    @Excel(name = "手机号")
    private String phoneNumber;

    /** 关联字典表（0男 1女 2未知） */
    @Excel(name = "关联字典表", readConverterExp = "0=男,1=女,2=未知")
    private String sex;

    /** 薪资 */
    @Excel(name = "薪资")
    private BigDecimal salary;

    /** 入职时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "入职时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date entryTime;

    /** 特长 */
    @Excel(name = "特长")
    private String speciality;

    /** 是否排钟（0：否；1：是） */
    @Excel(name = "是否排钟", readConverterExp = "0=：否；1：是")
    private String isBell;

    /** 创建人 */
    @Excel(name = "创建人")
    private String createName;

    /** 修改人 */
    @Excel(name = "修改人")
    private String modifyName;

    /** 修改时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "修改时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date modifyTime;

    public void setArtificerId(Long artificerId)
    {
        this.artificerId = artificerId;
    }

    public Long getArtificerId()
    {
        return artificerId;
    }
    public void setDeptId(Long deptId)
    {
        this.deptId = deptId;
    }

    public Long getDeptId()
    {
        return deptId;
    }
    public void setDeptName(String deptName)
    {
        this.deptName = deptName;
    }

    public String getDeptName()
    {
        return deptName;
    }
    public void setArtificerFullName(String artificerFullName)
    {
        this.artificerFullName = artificerFullName;
    }

    public String getArtificerFullName()
    {
        return artificerFullName;
    }
    public void setArtificerName(String artificerName)
    {
        this.artificerName = artificerName;
    }

    public String getArtificerName()
    {
        return artificerName;
    }
    public void setArtificerLevel(String artificerLevel)
    {
        this.artificerLevel = artificerLevel;
    }

    public String getArtificerLevel()
    {
        return artificerLevel;
    }
    public void setPhoneNumber(String phoneNumber)
    {
        this.phoneNumber = phoneNumber;
    }

    public String getPhoneNumber()
    {
        return phoneNumber;
    }
    public void setSex(String sex)
    {
        this.sex = sex;
    }

    public String getSex()
    {
        return sex;
    }
    public void setSalary(BigDecimal salary)
    {
        this.salary = salary;
    }

    public BigDecimal getSalary()
    {
        return salary;
    }
    public void setEntryTime(Date entryTime)
    {
        this.entryTime = entryTime;
    }

    public Date getEntryTime()
    {
        return entryTime;
    }
    public void setSpeciality(String speciality)
    {
        this.speciality = speciality;
    }

    public String getSpeciality()
    {
        return speciality;
    }
    public void setIsBell(String isBell)
    {
        this.isBell = isBell;
    }

    public String getIsBell()
    {
        return isBell;
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
                .append("artificerId", getArtificerId())
                .append("deptId", getDeptId())
                .append("deptName", getDeptName())
                .append("artificerFullName", getArtificerFullName())
                .append("artificerName", getArtificerName())
                .append("artificerLevel", getArtificerLevel())
                .append("phoneNumber", getPhoneNumber())
                .append("sex", getSex())
                .append("salary", getSalary())
                .append("entryTime", getEntryTime())
                .append("speciality", getSpeciality())
                .append("isBell", getIsBell())
                .append("remark", getRemark())
                .append("createName", getCreateName())
                .append("createTime", getCreateTime())
                .append("modifyName", getModifyName())
                .append("modifyTime", getModifyTime())
                .toString();
    }
}
