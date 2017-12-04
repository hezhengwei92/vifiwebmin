
package net.eoutech.webmin.user.ctrl;

import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbRewardRcd;
import net.eoutech.webmin.user.service.RewardRcdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping( "/user/rewardRcd" )
@CommonTabCtrlInit( resource = "user_rewardRcd" )
public class RewardRcdCtrl extends FrameBaseCtrl< TbRewardRcd > {
    RewardRcdService rewardRcdService;
    @Autowired
    public void setCfrmBaseService( RewardRcdService commonTabService ) {
        this.frameBaseService = rewardRcdService = commonTabService;
    }

}
       