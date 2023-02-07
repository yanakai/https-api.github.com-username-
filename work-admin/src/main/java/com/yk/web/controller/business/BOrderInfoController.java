package com.yk.web.controller.business;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import com.yk.business.domain.BPaymentDataVo;
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
import com.yk.business.domain.BOrderInfo;
import com.yk.business.service.IBOrderInfoService;
import  com.yk.common.utils.poi.ExcelUtil;
import com.yk.common.core.page.TableDataInfo;

/**
 * 订单信息Controller
 *
 * @author yankai
 * @date 2023-01-13
 */
@RestController
@RequestMapping("/business/order")
public class BOrderInfoController extends BaseController {
    @Autowired
    private IBOrderInfoService bOrderInfoService;


    /**
     * 查询订单信息列表
     */
    @PreAuthorize("@ss.hasPermi('business:order:list')")
    @GetMapping("/list")
    public TableDataInfo list(BOrderInfo bOrderInfo)
    {
        startPage();
        List<BOrderInfo> list = bOrderInfoService.selectBOrderInfoList(bOrderInfo);
        return getDataTable(list);
    }

    /**
     * 导出订单信息列表
     */
    @PreAuthorize("@ss.hasPermi('business:order:export')")
    @Log(title = "订单信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BOrderInfo bOrderInfo)
    {
        List<BOrderInfo> list = bOrderInfoService.selectBOrderInfoList(bOrderInfo);
        ExcelUtil<BOrderInfo> util = new ExcelUtil<BOrderInfo>(BOrderInfo.class);
        util.exportExcel(response, list, "订单信息数据");
    }

    /**
     * 获取订单信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:order:query')")
    @GetMapping(value = "/{orderId}")
    public AjaxResult getInfo(@PathVariable("orderId") Long orderId)
    {
        return AjaxResult.success(bOrderInfoService.selectBOrderInfoByOrderId(orderId));
    }

    /**
     * 新增订单信息
     */
    @PreAuthorize("@ss.hasPermi('business:order:add')")
    @Log(title = "订单信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BOrderInfo bOrderInfo)
    {
        return toAjax(bOrderInfoService.insertBOrderInfo(bOrderInfo));
    }

    /**
     * 修改订单信息
     */
    @PreAuthorize("@ss.hasPermi('business:order:edit')")
    @Log(title = "订单信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BOrderInfo bOrderInfo)
    {
        return toAjax(bOrderInfoService.updateBOrderInfo(bOrderInfo));
    }

    /**
     * 删除订单信息
     */
    @PreAuthorize("@ss.hasPermi('business:order:remove')")
    @Log(title = "订单信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{orderIds}")
    public AjaxResult remove(@PathVariable Long[] orderIds)
    {
        return toAjax(bOrderInfoService.deleteBOrderInfoByOrderIds(orderIds));
    }

    /**
     * @title savePaymentData
     * @description  订单结账保存
     * @param bPaymentDataVo  订单对象
     * @return com.yk.common.core.domain.AjaxResult
     * @author yanakai@126.com
     * @date   2023/2/7
     */
    @PostMapping("/savePaymentData")
    @Log(title = "订单结账", businessType = BusinessType.INSERT)
    public AjaxResult savePaymentData(@RequestBody BPaymentDataVo bPaymentDataVo){
        return toAjax(bOrderInfoService.savePaymentData(bPaymentDataVo));
    }



}
