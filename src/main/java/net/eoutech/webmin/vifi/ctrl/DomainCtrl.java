
package net.eoutech.webmin.vifi.ctrl;

import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbDomain;
import net.eoutech.webmin.vifi.service.DomainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping( "/vifi/domain" )
@CommonTabCtrlInit( resource = "vifi_domain" )
public class DomainCtrl extends FrameBaseCtrl< TbDomain > {
    DomainService domainService;
    @Autowired
    public void setCfrmBaseService( DomainService commonTabService ) {
        this.frameBaseService = domainService = commonTabService;
    }

}
       