
package net.eoutech.webmin.sysconfig.ctrl;

import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbConfigure;
import net.eoutech.webmin.sysconfig.service.ConfigureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping( "/sysconfig/configure" )
@CommonTabCtrlInit( resource = "sysconfig_configure" )
public class ConfigureCtrl extends FrameBaseCtrl< TbConfigure > {
    ConfigureService configureService;
    @Autowired
    public void setCfrmBaseService( ConfigureService commonTabService ) {
        this.frameBaseService = configureService = commonTabService;
    }

}
       