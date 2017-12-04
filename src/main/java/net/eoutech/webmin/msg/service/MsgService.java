package net.eoutech.webmin.msg.service;

import net.eoutech.webmin.msg.push.Demo;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbMsg;
import net.eoutech.webmin.msg.dao.MsgDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2016/10/15 0015.
 */
@Service
public class MsgService extends FrameBaseService<TbMsg> {

    @Autowired
    MsgDao msgDao;

    @Override
    public TbMsg save(TbMsg tbMsg, boolean isEdit, List<String> idList) {

        tbMsg.setCrtTm(new Date());
        if (!isEdit) {
            tbMsg.setCrtTm(tbMsg.getCrtTm());
        }

        tbMsg = super.save(tbMsg, isEdit, idList);
        List<TbMsg> lists = new ArrayList<>();
        lists.add(tbMsg);
        Demo demo = new Demo("580498fae0f55a28f400166a" ,"igyxrtpvfkfbnewa0ro1fvorzj6ef3xe");
        try {
            demo.sendAndroidBroadcast(lists);
            demo.sendIOSBroadcast(lists);
        }catch (Exception e){
            e.printStackTrace();
        }
        return tbMsg;
    }

    @Override
    public List<TbMsg> getNew() {
        return msgDao.selNewMsg();
    }

    public List<TbMsg> getCount(){
        List<TbMsg> tbMsgs=msgDao.getCount();

        return tbMsgs;
    }

}
