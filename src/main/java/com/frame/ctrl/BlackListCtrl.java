package com.frame.ctrl;

import com.frame.ctrl.FrameBaseCtrl;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.service.BlackListService;

import net.eoutech.webmin.commons.entity.TbBlackList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping( "/frame/blackList" )
@CommonTabCtrlInit( resource = "frame_blackList" )
public class BlackListCtrl extends FrameBaseCtrl< TbBlackList > {

    @Autowired
    public void setCfrmBaseService( BlackListService commonTabService ) {
        this.frameBaseService = commonTabService;
    }


}
