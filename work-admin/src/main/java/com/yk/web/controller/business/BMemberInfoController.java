package com.yk.web.controller.business;

import com.yk.common.annotation.Log;
import com.yk.common.core.controller.BaseController;
import com.yk.common.core.domain.AjaxResult;
import com.yk.common.core.domain.model.LoginUser;
import com.yk.common.core.page.TableDataInfo;
import com.yk.common.enums.BusinessType;
import com.yk.common.utils.DateUtils;
import com.yk.common.utils.SecurityUtils;
import com.yk.common.utils.poi.ExcelUtil;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.yk.business.domain.BMemberInfo;
import com.yk.business.service.IBMemberInfoService;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @Description:
 * @Author: yanakai@126.com
 * @CreateDate: 2022/9/2 14:48
 * @UpdateUser: yanakai@126.com
 * @UpdateDate: 2022/9/2 14:48
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 */
@RestController
@RequestMapping("/business/member")
public class BMemberInfoController extends BaseController {
    @Autowired
    private IBMemberInfoService bMemberInfoService;

    /**
     * 查询会员信息列表
     */
    @PreAuthorize("@ss.hasPermi('business:member:list')")
    @GetMapping("/list")
    public TableDataInfo list(BMemberInfo bMemberInfo)
    {
        startPage();
        List<BMemberInfo> list = bMemberInfoService.selectBMemberInfoList(bMemberInfo);
        return getDataTable(list);
    }

    /**
     * 导出会员信息列表
     */
    @PreAuthorize("@ss.hasPermi('business:member:export')")
    @Log(title = "会员信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BMemberInfo bMemberInfo)
    {
        List<BMemberInfo> list = bMemberInfoService.selectBMemberInfoList(bMemberInfo);
        ExcelUtil<BMemberInfo> util = new ExcelUtil<BMemberInfo>(BMemberInfo.class);
        util.exportExcel(response, list, "会员信息数据");
    }

    /**
     * 获取会员信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:member:query')")
    @GetMapping(value = "/{memberId}")
    public AjaxResult getInfo(@PathVariable("memberId") Long memberId)
    {
        return AjaxResult.success(bMemberInfoService.selectBMemberInfoByMemberId(memberId));
    }

    /**
     * 新增会员信息
     */
    @PreAuthorize("@ss.hasPermi('business:member:add')")
    @Log(title = "会员信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BMemberInfo bMemberInfo)
    {
        return toAjax(bMemberInfoService.insertBMemberInfo(bMemberInfo));
    }

    /**
     * 修改会员信息
     */
    @PreAuthorize("@ss.hasPermi('business:member:edit')")
    @Log(title = "会员信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BMemberInfo bMemberInfo)
    {
        return toAjax(bMemberInfoService.updateBMemberInfo(bMemberInfo));
    }

    /**
     * 删除会员信息
     */
    @PreAuthorize("@ss.hasPermi('business:member:remove')")
    @Log(title = "会员信息", businessType = BusinessType.UPDATE)
    @DeleteMapping("/{memberIds}")
    public AjaxResult remove(@PathVariable Long[] memberIds)
    {
        return toAjax(bMemberInfoService.deleteBMemberInfoByMemberIds(memberIds));
    }
    /**
     * @title updatePwd
     * @description  会员密码修改
     * @param memberId  会员id
     * @param oldPassword  老密码
     * @param newPassword  新密码
     * @return com.yk.common.core.domain.AjaxResult
     * @author yanakai@126.com
     * @date   2022/9/3
     */
    @PreAuthorize("@ss.hasPermi('business:member:updatePwd')")
    @Log(title = "会员信息--会员密码修改", businessType = BusinessType.UPDATE)
    @PutMapping("/updatePwd")
    public AjaxResult updatePwd(Long memberId,String oldPassword, String newPassword){
        BMemberInfo memberInfo = bMemberInfoService.selectBMemberInfoByMemberId(memberId);
        if (!oldPassword.equals(memberInfo.getMemberPassword()) ){
            return AjaxResult.error("修改密码失败，旧密码错误");
        }
        memberInfo.setMemberPassword(newPassword);
        memberInfo.setUpdateBy(SecurityUtils.getUsername());
        memberInfo.setUpdateTime(DateUtils.getNowDate());
        return toAjax(bMemberInfoService.updateBMemberInfo(memberInfo));
    }

}
