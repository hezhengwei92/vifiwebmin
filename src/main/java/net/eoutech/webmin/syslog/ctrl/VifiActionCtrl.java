package net.eoutech.webmin.syslog.ctrl;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.DateVO;
import net.eoutech.webmin.commons.entity.TbViFiAction;
import net.eoutech.webmin.syslog.service.VifiActionService;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.commons.constant.MediaTypes;
import com.frame.commons.entity.base.RestObject;
import com.frame.commons.utils.ActionUtils;
import com.frame.commons.utils.LehmanCommonUtils;
import com.frame.commons.utils.LogUtils;
import com.frame.ctrl.FrameBaseCtrl;


@Controller
@RequestMapping( "/syslog/vifiAction" )
@CommonTabCtrlInit( resource = "syslog_vifiAction", viewName="/page/syslog/vifiAction" )
public class VifiActionCtrl extends FrameBaseCtrl<TbViFiAction>
{
	@Autowired
	private VifiActionService actionService;
	
	@Autowired
    public void setCfrmBaseService( VifiActionService commonTabService ) {
        this.frameBaseService = commonTabService;
    }

    
//    /**
//     * 
//     */
//    @RequestMapping(method = RequestMethod.GET, produces = MediaTypes.JSON_UTF_8)
//    @ResponseBody
//    public String doView(ServletRequest request, HttpServletResponse response) {
//    	response.setStatus(200);
//    	
//    	return "doView";
//    }
    
	/**
	 * 		GET：   根据条件返回资源对象或对象列表（数组）
	        POST ：返回新生成的资源对象
	        PUT：   返回完整的资源对象
	        DELETE：返回一个空文档
	 */

	
	
  	@RequestMapping(value="actions.json",   method = RequestMethod.GET, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public String doList(
    		//@RequestParam(value = "page", defaultValue = "1") int pageNumber,
            //@RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request, HttpServletResponse response) {
    	response.setStatus(200);

    	return "doList";
    }
	

    @RequestMapping(value="actions.json", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public String doAdd(
    		@RequestParam(value="action",defaultValue="doAdd")String action,
    		@RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request, HttpServletResponse response) {
//    	response.setStatus(201);
    	
    	

    	return "doAdd";
    }
    
    
    @RequestMapping(value="actions.json", method = RequestMethod.PUT, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public String doUpdate(
    		//@RequestParam(value = "page", defaultValue = "1") int pageNumber,
            //@RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request, HttpServletResponse response) {

    	response.setStatus(201);

    	return "doUpdate";
    }
    
    
    @RequestMapping(value="actions.json", method = RequestMethod.DELETE, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public String doDelete(
    		//@RequestParam(value = "page", defaultValue = "1") int pageNumber,
            //@RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request, HttpServletResponse response) {

    	response.setStatus(204);
    	return "doDelete";
    }
    
    /**
     * ajax查询
     */
    @RequestMapping(value = EUConst.URI_QUERY_AJAX, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax(
            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request) {
        LogUtils.dbg("query  " + resource);
        Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");
        Page<TbViFiAction> page = frameBaseService.query(pageNumber, pageSize, queryParam);

        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());

        return RestObject.newOk("", pageView);
    }
    
    @RequestMapping(value = "queryAnalysisDate.json", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAnalysisJson(ServletRequest request) throws ParseException{
    	LogUtils.dbg("VIFIACTIONCTRL | queryAnalysisJson begin ; ");
    	Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");
    	List<DateVO> result = actionService.queryAnalysisData(queryParam);
    	
    	JSONObject view = new JSONObject();
    	view.put("content", result);
    	return RestObject.newOk("", view);
    }
    
    
    
    
    
    
    

   
    
    
    





}
