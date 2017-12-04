
package net.eoutech.webmin.user.dao;

import com.frame.dao.FrameBaseDao;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class FeedbackDao extends FrameBaseDao {

    /**
     * 查询最新3条反馈信息
     *
     * @return [{account: String,type: String,title: String,content: String,version: String,feedbackTime:String}]
     */
    public List<Map<String, Object>> queryTopThree() {
        String sql = "select\n" +
                "idxAccountId_tbAccount account,\n" +
                "type,\n" +
                "title title,\n" +
                "content content,\n" +
                "verID version,\n" +
                "feedbackTime feedbackTime\n" +
                " from tbFeedback\n" +
                "order by feedbackTime desc limit 0 ,3";
        return jdbcTemplate.queryForList(sql);
    }
}

       