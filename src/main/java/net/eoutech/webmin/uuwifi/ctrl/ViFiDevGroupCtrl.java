
package net.eoutech.webmin.uuwifi.ctrl;

import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbViFiDevGroup;
import net.eoutech.webmin.uuwifi.service.ViFiDevGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping( "/uuwifi/viFiDevGroup" )
@CommonTabCtrlInit( resource = "uuwifi_viFiDevGroup",viewName = "page/uuwifi/viFiDevGroup" )
public class ViFiDevGroupCtrl extends FrameBaseCtrl< TbViFiDevGroup > {
    ViFiDevGroupService viFiDevGroupService;
    @Autowired
    public void setCfrmBaseService( ViFiDevGroupService commonTabService ) {
        this.frameBaseService = viFiDevGroupService = commonTabService;
    }

}
       