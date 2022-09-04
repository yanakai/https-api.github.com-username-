package com.yk.business.service.impl;

import java.util.List;

import com.yk.common.utils.DateUtils;
import com.yk.common.utils.SecurityUtils;
import com.yk.system.mapper.SysDeptMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yk.business.mapper.BArtificerInfoMapper;
import com.yk.business.domain.BArtificerInfo;
import com.yk.business.service.IBArtificerInfoService;

import javax.annotation.Resource;

/**
 * @Description:
 * @Author: yanakai@126.com
 * @CreateDate: 2022/9/1 23:56
 * @UpdateUser: yanakai@126.com
 * @UpdateDate: 2022/9/1 23:56
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 */
@Service
public class BArtificerInfoServiceImpl implements IBArtificerInfoService{
    @Autowired
    private BArtificerInfoMapper bArtificerInfoMapper;

    @Resource
    private SysDeptMapper sysDeptMapper;

    /**
     * 查询业务--技师
     *
     * @param artificerId 业务--技师主键
     * @return 业务--技师
     */
    @Override
    public BArtificerInfo selectBArtificerInfoByArtificerId(Long artificerId)
    {
        return bArtificerInfoMapper.selectBArtificerInfoByArtificerId(artificerId);
    }

    /**
     * 查询业务--技师列表
     *
     * @param bArtificerInfo 业务--技师
     * @return 业务--技师
     */
    @Override
    public List<BArtificerInfo> selectBArtificerInfoList(BArtificerInfo bArtificerInfo)
    {
        return bArtificerInfoMapper.selectBArtificerInfoList(bArtificerInfo);
    }

    /**
     * 新增业务--技师
     *
     * @param bArtificerInfo 业务--技师
     * @return 结果
     */
    @Override
    public int insertBArtificerInfo(BArtificerInfo bArtificerInfo)
    {
        bArtificerInfo.setCreateTime(DateUtils.getNowDate());
        bArtificerInfo.setCreateName(SecurityUtils.getUsername());
        bArtificerInfo.setDeptName(sysDeptMapper.selectDeptById(SecurityUtils.getDeptId()).getDeptName());
        return bArtificerInfoMapper.insertBArtificerInfo(bArtificerInfo);
    }

    /**
     * 修改业务--技师
     *
     * @param bArtificerInfo 业务--技师
     * @return 结果
     */
    @Override
    public int updateBArtificerInfo(BArtificerInfo bArtificerInfo)
    {
        return bArtificerInfoMapper.updateBArtificerInfo(bArtificerInfo);
    }

    /**
     * 批量删除业务--技师
     *
     * @param artificerIds 需要删除的业务--技师主键
     * @return 结果
     */
    @Override
    public int deleteBArtificerInfoByArtificerIds(Long[] artificerIds)
    {
        return bArtificerInfoMapper.deleteBArtificerInfoByArtificerIds(artificerIds);
    }

    /**
     * 删除业务--技师信息
     *
     * @param artificerId 业务--技师主键
     * @return 结果
     */
    @Override
    public int deleteBArtificerInfoByArtificerId(Long artificerId)
    {
        return bArtificerInfoMapper.deleteBArtificerInfoByArtificerId(artificerId);
    }
}
