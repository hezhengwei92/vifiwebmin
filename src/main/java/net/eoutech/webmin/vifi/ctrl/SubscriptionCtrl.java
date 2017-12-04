
package net.eoutech.webmin.vifi.ctrl;

import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbSubscription;
import net.eoutech.webmin.vifi.service.SubscriptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping( "/vifi/subscription" )
@CommonTabCtrlInit( resource = "vifi_subscription" )
public class SubscriptionCtrl extends FrameBaseCtrl< TbSubscription > {
    SubscriptionService subscriptionService;
    @Autowired
    public void setCfrmBaseService( SubscriptionService commonTabService ) {
        this.frameBaseService = subscriptionService = commonTabService;
    }

}
       