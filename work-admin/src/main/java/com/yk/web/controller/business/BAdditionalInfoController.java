package com.yk.web.controller.business;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import com.yk.common.annotation.Log;
import com.yk.common.core.controller.BaseController;
import com.yk.common.core.domain.AjaxResult;
import com.yk.common.enums.BusinessType;
import com.yk.business.domain.BAdditionalInfo;
import com.yk.business.service.IBAdditionalInfoService;
import  com.yk.common.utils.poi.ExcelUtil;
import com.yk.common.core.page.TableDataInfo;

/**
 * @Description:
 * @Author: yanakai@126.com
 * @CreateDate: 2023/1/9 21:55
 * @UpdateUser: yanakai@126.com
 * @UpdateDate: 2023/1/9 21:55
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 */
@RestController
@RequestMapping("/business/additional")
public class BAdditionalInfoController extends BaseController {


    @Autowired
    private IBAdditionalInfoService bAdditionalInfoService;

    /**
     * 查询附加项单次金额列表
     */
    @PreAuthorize("@ss.hasPermi('business:additional:list')")
    @GetMapping("/list")
    public TableDataInfo list(BAdditionalInfo bAdditionalInfo)
    {
        startPage();
        List<BAdditionalInfo> list = bAdditionalInfoService.selectBAdditionalInfoList(bAdditionalInfo);
        return getDataTable(list);
    }

    /**
     * 导出附加项单次金额列表
     */
    @PreAuthorize("@ss.hasPermi('business:additional:export')")
    @Log(title = "附加项单次金额", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BAdditionalInfo bAdditionalInfo)
    {
        List<BAdditionalInfo> list = bAdditionalInfoService.selectBAdditionalInfoList(bAdditionalInfo);
        ExcelUtil<BAdditionalInfo> util = new ExcelUtil<BAdditionalInfo>(BAdditionalInfo.class);
        util.exportExcel(response, list, "附加项单次金额数据");
    }

    /**
     * 获取附加项单次金额详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:additional:query')")
    @GetMapping(value = "/{additionalId}")
    public AjaxResult getInfo(@PathVariable("additionalId") Long additionalId)
    {
        return AjaxResult.success(bAdditionalInfoService.selectBAdditionalInfoByAdditionalId(additionalId));
    }

    /**
     * 新增附加项单次金额
     */
    @PreAuthorize("@ss.hasPermi('business:additional:add')")
    @Log(title = "附加项单次金额", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BAdditionalInfo bAdditionalInfo)
    {
        return toAjax(bAdditionalInfoService.insertBAdditionalInfo(bAdditionalInfo));
    }

    /**
     * 修改附加项单次金额
     */
    @PreAuthorize("@ss.hasPermi('business:additional:edit')")
    @Log(title = "附加项单次金额", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BAdditionalInfo bAdditionalInfo)
    {
        return toAjax(bAdditionalInfoService.updateBAdditionalInfo(bAdditionalInfo));
    }

    /**
     * 删除附加项单次金额
     */
    @PreAuthorize("@ss.hasPermi('business:additional:remove')")
    @Log(title = "附加项单次金额", businessType = BusinessType.DELETE)
    @DeleteMapping("/{additionalIds}")
    public AjaxResult remove(@PathVariable Long[] additionalIds)
    {
        return toAjax(bAdditionalInfoService.deleteBAdditionalInfoByAdditionalIds(additionalIds));
    }

    /**
     * 查询服务项目列表不分页
     */
    @GetMapping("/getAdditionalList")
    public AjaxResult getAdditionalList(BAdditionalInfo bAdditionalInfo){
        List<BAdditionalInfo> list = bAdditionalInfoService.selectBAdditionalInfoList(bAdditionalInfo);
        return AjaxResult.success(list);
    }
}
