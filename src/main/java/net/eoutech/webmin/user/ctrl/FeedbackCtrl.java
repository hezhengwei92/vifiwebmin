
package net.eoutech.webmin.user.ctrl;

import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbFeedback;
import net.eoutech.webmin.user.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping( "/user/feedback" )
@CommonTabCtrlInit( resource = "user_feedback" )
public class FeedbackCtrl extends FrameBaseCtrl< TbFeedback > {
    FeedbackService feedbackService;
    @Autowired
    public void setCfrmBaseService( FeedbackService commonTabService ) {
        this.frameBaseService = feedbackService = commonTabService;
    }

}
       