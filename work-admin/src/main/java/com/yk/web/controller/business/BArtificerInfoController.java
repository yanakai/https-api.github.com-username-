package com.yk.web.controller.business;

import com.yk.business.domain.BArtificerInfo;
import com.yk.business.service.IBArtificerInfoService;
import com.yk.common.annotation.Log;
import com.yk.common.core.controller.BaseController;
import com.yk.common.core.domain.AjaxResult;
import com.yk.common.core.page.TableDataInfo;
import com.yk.common.enums.BusinessType;
import com.yk.common.utils.poi.ExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @Description:
 * @Author: yanakai@126.com
 * @CreateDate: 2022/9/1 23:58
 * @UpdateUser: yanakai@126.com
 * @UpdateDate: 2022/9/1 23:58
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 */
@RestController
@RequestMapping("/business/artificer")
public class BArtificerInfoController extends BaseController {
    @Autowired
    private IBArtificerInfoService bArtificerInfoService;

    /**
     * 查询业务--技师列表
     */
    @PreAuthorize("@ss.hasPermi('business:artificer:list')")
    @GetMapping("/list")
    public TableDataInfo list(BArtificerInfo bArtificerInfo)
    {
        startPage();
        List<BArtificerInfo> list = bArtificerInfoService.selectBArtificerInfoList(bArtificerInfo);
        return getDataTable(list);
    }
    /**
     * @title getList
     * @description  获取技师列表数据
     * @param bArtificerInfo
     * @return com.yk.common.core.domain.AjaxResult
     * @author yanakai@126.com
     * @date   2022/9/2
     */
    @GetMapping("/getList")
    public AjaxResult getList(BArtificerInfo bArtificerInfo){
        List<BArtificerInfo> list = bArtificerInfoService.selectBArtificerInfoList(bArtificerInfo);
        return AjaxResult.success("数据获取成功",list);
    }

    /**
     * 导出业务--技师列表
     */
    @PreAuthorize("@ss.hasPermi('business:artificer:export')")
    @Log(title = "业务--技师", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BArtificerInfo bArtificerInfo)
    {
        List<BArtificerInfo> list = bArtificerInfoService.selectBArtificerInfoList(bArtificerInfo);
        ExcelUtil<BArtificerInfo> util = new ExcelUtil<BArtificerInfo>(BArtificerInfo.class);
        util.exportExcel(response, list, "业务--技师数据");
    }

    /**
     * 获取业务--技师详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:artificer:query')")
    @GetMapping(value = "/{artificerId}")
    public AjaxResult getInfo(@PathVariable("artificerId") Long artificerId)
    {
        return AjaxResult.success(bArtificerInfoService.selectBArtificerInfoByArtificerId(artificerId));
    }

    /**
     * 新增业务--技师
     */
    @PreAuthorize("@ss.hasPermi('business:artificer:add')")
    @Log(title = "业务--技师", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BArtificerInfo bArtificerInfo)
    {
        return toAjax(bArtificerInfoService.insertBArtificerInfo(bArtificerInfo));
    }

    /**
     * 修改业务--技师
     */
    @PreAuthorize("@ss.hasPermi('business:artificer:edit')")
    @Log(title = "业务--技师", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BArtificerInfo bArtificerInfo)
    {
        return toAjax(bArtificerInfoService.updateBArtificerInfo(bArtificerInfo));
    }

    /**
     * 删除业务--技师
     */
    @PreAuthorize("@ss.hasPermi('business:artificer:remove')")
    @Log(title = "业务--技师", businessType = BusinessType.DELETE)
    @DeleteMapping("/{artificerIds}")
    public AjaxResult remove(@PathVariable Long[] artificerIds)
    {
        return toAjax(bArtificerInfoService.deleteBArtificerInfoByArtificerIds(artificerIds));
    }
}
