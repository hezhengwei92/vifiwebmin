package net.eoutech.webmin.cdr.ctrl;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.commons.constant.MediaTypes;
import com.frame.commons.entity.base.RestObject;
import com.frame.commons.utils.ActionUtils;
import com.frame.commons.utils.LehmanCommonUtils;
import com.frame.commons.utils.LogUtils;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.cdr.service.CdrService;
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbCDR;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = {"/cdr/cdr", "/cdr/data-cdr","/vpx/cdrNew"})
@CommonTabCtrlInit(viewName = "/page/cdr/cdr", resource = "vpx_cdrNew")
public class CDRCtrl extends FrameBaseCtrl<TbCDR> {

    private CdrService cdrService;

    @Autowired
    public void setCfrmBaseService(CdrService commonTabService) {
        this.frameBaseService = cdrService = commonTabService;
    }

    /**
     * ajax查询
     */
    @Override
    @RequestMapping(value = EUConst.URI_QUERY_AJAX, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax(
            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request) {
        Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");

        LogUtils.dbg("query  " + resource);
        Page<TbCDR> page = frameBaseService.query(pageNumber, pageSize, queryParam);

        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());
        pageView.put("statisInfo", ((CdrService) frameBaseService).queryCdrStatisInfo(queryParam));

        return RestObject.newOk("", pageView);
    }


    /**
     * 保存
     */
    @Override
    @RequestMapping(value = "/save.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject saveAjax(TbCDR entity, String actionName, @RequestParam(value = "idList[]", required = false) List<String> idList) {
        return RestObject.newError("not action");
    }

    /**
     * 删除
     */
    @Override
    @RequestMapping(value = "delete.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject deleteAjax(@RequestParam(value = "idList[]") List<String> idList) {
        return RestObject.newError("not action");
    }

    //************************* 统计查询

}
