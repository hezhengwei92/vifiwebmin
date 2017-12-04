
package net.eoutech.webmin.sysconfig.ctrl;

import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbVersion;
import net.eoutech.webmin.sysconfig.service.VersionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping( "/sysconfig/version" )
@CommonTabCtrlInit( resource = "sysconfig_version" )
public class VersionCtrl extends FrameBaseCtrl< TbVersion > {
    VersionService versionService;
    @Autowired
    public void setCfrmBaseService( VersionService commonTabService ) {
        this.frameBaseService = versionService = commonTabService;
    }

}
       