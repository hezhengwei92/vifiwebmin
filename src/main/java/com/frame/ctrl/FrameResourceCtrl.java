package com.frame.ctrl;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.constant.MediaTypes;
import com.frame.commons.entity.TbCfrmResource;
import com.frame.commons.entity.base.RestObject;
import com.frame.commons.utils.LehmanCommonUtils;
import com.frame.commons.vo.FrameResourceViewVO;
import com.frame.service.FrameResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping( "/frame/resource" )
public class FrameResourceCtrl {
    @Autowired
    private FrameResourceService frameResourceService;

    /////////////////////////////////////////////////////////////////////////////
    // 新方法
    ////////////////////////////////////////////////////////////////////////////
    //view jsp page
    @RequestMapping( method = RequestMethod.GET )
    public String viewResource() {



        return "page/frame/frameResource";
    }

    /**
     * ajax查询
     */
    @RequestMapping( value = "/list.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8 )
    @ResponseBody
    public RestObject queryAjax() {
        Page< FrameResourceViewVO > page = frameResourceService.queryResourcePage();
        JSONObject pageView = LehmanCommonUtils.createPageView( page );
        pageView.put( "contentList", page.getContent() );
        return RestObject.newOk( "", pageView );
    }


    /**
     * 交换2个资源的排序位置
     */
    @RequestMapping( value = "/swapSortPosi.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8 )
    @ResponseBody
    public RestObject swapSortPosiResource( @RequestBody TbCfrmResource[] datas ) {
        frameResourceService.swapSortPosiResource( datas );
        return RestObject.newOk( "", datas );
    }


}
