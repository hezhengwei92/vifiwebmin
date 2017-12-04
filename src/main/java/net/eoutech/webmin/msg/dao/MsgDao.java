package net.eoutech.webmin.msg.dao;

import com.frame.dao.FrameBaseDao;
import net.eoutech.webmin.commons.entity.TbMsg;
import org.springframework.stereotype.Component;

import java.util.List;


@Component
public class MsgDao extends FrameBaseDao {
    public List<TbMsg> selNewMsg(){
        String sql = "SELECT keyID AS keyID,msgType AS msgType,msgTitle AS msgTitle,msgContent AS msg Content,crtTm AS crtTm" +
                " FROM tbmsg where crtTm=(SELECT MAX(crtTm) FROM tbmsg)";
        return queryList(sql,TbMsg.class);
    }

    public List<TbMsg> getCount(){
        String sql="SELECT * from tbmsg";
        return queryList(sql,TbMsg.class);
    }


}
