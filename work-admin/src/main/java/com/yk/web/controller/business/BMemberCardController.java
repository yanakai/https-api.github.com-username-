package com.yk.web.controller.business;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.yk.business.domain.BMemberCard;
import com.yk.business.service.IBMemberCardService;
import com.yk.common.annotation.Log;
import com.yk.common.core.controller.BaseController;
import com.yk.common.core.domain.AjaxResult;
import com.yk.common.core.page.TableDataInfo;
import com.yk.common.enums.BusinessType;
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

/**
 * @Description:
 * @Author: yanakai@126.com
 * @CreateDate: 2022/9/2 16:39
 * @UpdateUser: yanakai@126.com
 * @UpdateDate: 2022/9/2 16:39
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 */
@RestController
@RequestMapping("/business/card")
public class BMemberCardController extends BaseController {

    @Autowired
    private IBMemberCardService bMemberCardService;

    /**
     * 查询业务--会员卡信息列表
     */
    @PreAuthorize("@ss.hasPermi('business:card:list')")
    @GetMapping("/list")
    public TableDataInfo list(BMemberCard bMemberCard)
    {
        startPage();
        List<BMemberCard> list = bMemberCardService.selectBMemberCardList(bMemberCard);
        return getDataTable(list);
    }

    /**
     * @title getList
     * @description  获取会员卡列表信息
     * @param bMemberCard  会员卡对象
     * @return com.yk.common.core.domain.AjaxResult
     * @author yanakai@126.com
     * @date   2022/9/2
     */
    @GetMapping("/getList")
    public AjaxResult getList(BMemberCard bMemberCard){
        List<BMemberCard> list = bMemberCardService.selectBMemberCardList(bMemberCard);
        return AjaxResult.success("数据获取成功",list);
    }

    /**
     * 导出业务--会员卡信息列表
     */
    @PreAuthorize("@ss.hasPermi('business:card:export')")
    @Log(title = "业务--会员卡信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BMemberCard bMemberCard)
    {
        List<BMemberCard> list = bMemberCardService.selectBMemberCardList(bMemberCard);
        ExcelUtil<BMemberCard> util = new ExcelUtil<BMemberCard>(BMemberCard.class);
        util.exportExcel(response, list, "会员卡信息数据");
    }

    /**
     * 获取业务--会员卡信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:card:query')")
    @GetMapping(value = "/{cardId}")
    public AjaxResult getInfo(@PathVariable("cardId") Long cardId)
    {
        return AjaxResult.success(bMemberCardService.selectBMemberCardByCardId(cardId));
    }

    /**
     * 新增业务--会员卡信息
     */
    @PreAuthorize("@ss.hasPermi('business:card:add')")
    @Log(title = "业务--会员卡信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BMemberCard bMemberCard)
    {
        return toAjax(bMemberCardService.insertBMemberCard(bMemberCard));
    }

    /**
     * 修改业务--会员卡信息
     */
    @PreAuthorize("@ss.hasPermi('business:card:edit')")
    @Log(title = "业务--会员卡信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BMemberCard bMemberCard)
    {
        return toAjax(bMemberCardService.updateBMemberCard(bMemberCard));
    }

    /**
     * 删除业务--会员卡信息
     */
    @PreAuthorize("@ss.hasPermi('business:card:remove')")
    @Log(title = "业务--会员卡信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{cardIds}")
    public AjaxResult remove(@PathVariable Long[] cardIds)
    {
        return toAjax(bMemberCardService.deleteBMemberCardByCardIds(cardIds));
    }
}
