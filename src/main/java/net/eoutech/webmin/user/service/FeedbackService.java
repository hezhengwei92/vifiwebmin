
package net.eoutech.webmin.user.service;

import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbFeedback;
import net.eoutech.webmin.user.dao.FeedbackDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class FeedbackService extends FrameBaseService<TbFeedback> {

    @Autowired
    FeedbackDao feedbackDao;


    @Override
    public String getPermissions(String userName, String resources) {
        return EUConst.PERMISSION_Q;
    }

    /**
     * 查询最新3条反馈信息
     *
     * @return [{account: String,type: String,title: String,content: String,version: String,feedbackTime:String}]
     */
    public List<Map<String, Object>> queryTopThree() {
        return feedbackDao.queryTopThree();
    }

}

       