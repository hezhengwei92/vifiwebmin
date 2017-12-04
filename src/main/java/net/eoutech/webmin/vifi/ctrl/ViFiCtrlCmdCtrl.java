package net.eoutech.webmin.vifi.ctrl;

import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbViFiCtrlCmd;
import net.eoutech.webmin.vifi.service.ViFiCtrlCmdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping( "/vifi/ctrlcmd" )
@CommonTabCtrlInit(resource = "vifi_ctrlcmd" )
public class ViFiCtrlCmdCtrl extends FrameBaseCtrl< TbViFiCtrlCmd > {



    // 初始化的 范例
    @Autowired
    public void setCfrmBaseService( ViFiCtrlCmdService cmdService ){
        frameBaseService = cmdService;
    }

}
