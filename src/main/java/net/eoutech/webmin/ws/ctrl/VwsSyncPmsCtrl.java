package net.eoutech.webmin.ws.ctrl;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.constant.MediaTypes;
import com.frame.commons.utils.FileUtils;

import net.eoutech.webmin.ws.entity.PmsRequest;
import net.eoutech.webmin.ws.service.VwsPmsService;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2015/9/28.
 */
@Controller
@RequestMapping( "/ws" )
public class VwsSyncPmsCtrl {
    
	@Autowired
	private VwsPmsService service;
    /**
     * 统计接口
     */
    @RequestMapping( value = "pms", method = RequestMethod.GET, produces = MediaTypes.JSON_UTF_8 )
    @ResponseBody
    public JSONObject statisticsAs (@RequestParam ("type") int type,@RequestParam ("name") String name,@RequestParam("pass") String pass,HttpServletRequest request) {

    	JSONObject result = new JSONObject();
    	if (FileUtils.getDispositionValue("syncpms.username").equals(name) && FileUtils.getDispositionValue("syncpms.password").equals(pass)) {
    		PmsRequest req = new PmsRequest();
    			
    		if (type == 1) {
    			req.setAppType(request.getParameter("appType"));
    			result = service.doPmsGet(req);
    		} else {
    			try {
					req.setIds(URLDecoder.decode(request.getParameter("ids"), "UTF-8"));
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
    			result = service.doPmsUpdate(req);
    		}
    	}
    	
    	return result;
    }
    
}
