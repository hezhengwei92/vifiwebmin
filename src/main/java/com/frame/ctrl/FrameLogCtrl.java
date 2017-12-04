package com.frame.ctrl;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.constant.MediaTypes;
import com.frame.commons.entity.base.RestObject;
import com.frame.commons.utils.ActionUtils;
import com.frame.commons.utils.CommonUtils;
import com.frame.commons.utils.LehmanCommonUtils;
import com.frame.commons.utils.LogUtils;
import com.frame.service.FrameLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

/**
 * Created by Administrator on 2015/8/6.
 */

/**
 * 日志文件查看
 *
 * @param
 */
@Controller
@RequestMapping("/syslog/fs")
public class FrameLogCtrl {
    protected final String PAGE_SIZE = "12";
    @Autowired
    protected FrameLogService frameLogService;

    @RequestMapping(method = RequestMethod.GET)
    public String logView(Model model) {
        LogUtils.dbg("access /log/webmin page");
        return "page/frame/frameLog";
    }


    /**
     * ajax查询日志列表
     */
    @RequestMapping(value = "{modelName}/list.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax(
            @PathVariable String modelName,
            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request) {

        Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");
        LogUtils.dbg("query  log");
        JSONObject pageView = new JSONObject();
        try {
        	Page<JSONObject> page = frameLogService.query(pageNumber, pageSize, modelName, queryParam);
            pageView = LehmanCommonUtils.createPageView(page);
            pageView.put("contentList", page.getContent());
		} catch (Exception e) {
			pageView.put("contentList", new ArrayList<JSONObject>());
		}
        return RestObject.newOk("", pageView);
    }


    /**
     * 回收站操作
     */
    @RequestMapping(value = "{modelName}/recycle.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject recycleAjax(@PathVariable String modelName, String fileName) {
        try {
            frameLogService.logRecycle(modelName, fileName);
            return RestObject.newOk(CommonUtils.lang("success"));
        } catch (IOException e) {
            e.printStackTrace();
            return RestObject.newError(CommonUtils.lang("error") + e.getMessage());
        }
    }

    /**
     * 下载
     */
    @RequestMapping(value = "{modelName}/download/{fileName:.+}", method = RequestMethod.GET)
    @ResponseBody
    public void downLog(@PathVariable("modelName") String modelName, @PathVariable("fileName") String fileName) {
        ActionUtils.downloadFile(frameLogService.logDown(modelName, fileName));
    }


    /**
     * 实时查看
     */
    @RequestMapping(value = "{modelName}/realTimeQuery.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject realTimeQuery(@PathVariable String modelName, String fileName) {
        String ctt = frameLogService.realTimeQuery(modelName, fileName);
        return RestObject.newOk("", ctt);
    }


    //////////////////////////////////////////////////////////////////////////////////
    // 详情操作
    //////////////////////////////////////////////////////////////////////////////////

    /**
     * ajax查询详情
     */
    @RequestMapping(value = "{modelName}/details/{fileName}.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject detailsAjax(@PathVariable String modelName, @PathVariable String fileName,
                                  @RequestParam(value = "page", defaultValue = "1") int pageNumber,
                                  @RequestParam(value = "pageSize", defaultValue = "50") int pageSize, ServletRequest request) {
        try {
            Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");
            Page<String> page = frameLogService.queryLogDetails(pageNumber, pageSize, modelName, fileName, queryParam);

            JSONObject pageView = LehmanCommonUtils.createPageView(page);
            pageView.put("content", page.getContent().get(0));

            return RestObject.newOk("", pageView);
        } catch (Exception e) {
            e.printStackTrace();
            return RestObject.newError(CommonUtils.lang("error") + e.getMessage());
        }
    }

}
