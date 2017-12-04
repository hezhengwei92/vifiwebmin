package com.frame.ctrl;


import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.commons.entity.TbCfrmUser;
import com.frame.service.FrameUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping( "/frame/user" )
@CommonTabCtrlInit( resource = "frame_user", viewName="page/frame/frameUser")
public class FrameUserCtrl extends FrameBaseCtrl< TbCfrmUser > {
    FrameUserService frameUserService;
    @Autowired
    public void setCfrmBaseService( FrameUserService commonTabService ) {
        this.frameBaseService = commonTabService;
        frameUserService = ( FrameUserService ) frameBaseService;
    }

    @RequestMapping( method = RequestMethod.GET )
    public String view( Model model ) {
        JSONObject view = getModelAttrView( model );
        view.put( "roleSelectVals", frameUserService.getRoleNgSelect() );
        return super.view( model );
    }

}
