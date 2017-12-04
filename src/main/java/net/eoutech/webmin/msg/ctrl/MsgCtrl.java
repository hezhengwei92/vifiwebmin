package net.eoutech.webmin.msg.ctrl;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.commons.constant.MediaTypes;
import com.frame.commons.entity.base.RestObject;
import com.frame.commons.utils.ActionUtils;
import com.frame.commons.utils.CommonUtils;
import com.frame.commons.utils.LehmanCommonUtils;
import com.frame.commons.utils.LogUtils;
import com.frame.ctrl.FrameBaseCtrl;
import com.frame.push.JGpush.JiguangPush;
import net.eoutech.webmin.agent.service.AgentService;
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbMsg;
import net.eoutech.webmin.msg.service.MsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/10/15 0015.
 */

@Controller
@RequestMapping( "/msg/msg" )
@CommonTabCtrlInit( viewName="/page/msg/msg", resource = "new_msg" )
public class MsgCtrl extends FrameBaseCtrl<TbMsg> {
    @Autowired
    MsgService msgService;
    @Autowired
    AgentService agentService;


    @Autowired
    public void setCfrmBaseService(MsgService commonTabService){
       this.frameBaseService = msgService = commonTabService;
    }

    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model){
//        JSONObject view = getModelAttrView(model);
        return super.view(model);
    }

    @RequestMapping(value = EUConst.URI_QUERY_AJAX, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax(
            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request) {

        Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");

        LogUtils.dbg("query  " + resource);
        Page<TbMsg> page = frameBaseService.query(pageNumber, pageSize, queryParam);

        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());

        return RestObject.newOk("", pageView);
    }


    /**
     * 保存
     */

    @RequestMapping(value = EUConst.URI_SAVE_AJAX, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject saveAjax(TbMsg entity, String actionName
            , @RequestParam(value = "idList[]", required = false) List<String> idList) throws Exception {

        boolean isEdit = CommonUtils.lang("edit").equals(actionName);
        LogUtils.dbg(actionName + resource);

        String actionMsg = actionName + CommonUtils.lang("failure") + " : ";
        try {
            String sucMsg = actionName + CommonUtils.lang("success");
            entity = frameBaseService.save(entity, isEdit, idList);
            /** 当是系统消息,并是新增，则发送推送  isEdit：false 新增
             * [["P","个人消息"],["S","系统消息"],["F","使用介绍"]]  status：0:未读 1 ：已读
             */
            if(entity.getMsgType().equals("S") && isEdit == false){//
                JiguangPush jiguangPush=new JiguangPush();
                jiguangPush.jiguangPush("Notification",null,null,entity.getMsgTitle(),entity.getMsgContent(),"message","2",null);
            }else if (entity.getMsgType().equals("P")){
                JiguangPush jiguangPush=new JiguangPush();
                jiguangPush.jiguangPush("Notification","ypfj7d4ucpa70bg1ekgb",null,entity.getMsgTitle(),entity.getMsgContent(),"message","2",null);
            }else if (entity.getMsgType().equals("F")){
                //WS：当用户第一次登录时推送一条使用介绍 webmin：不推送，只做修改内容
            }

            return RestObject.newOk(sucMsg, entity);

        } catch (DuplicateKeyException e) { // 唯一key
            // 重复
            String errorMsg = CommonUtils.lang("frame.tips.error.repeat_insert");
            // 取出重复的字段名
            String rapField = e.getCause().getMessage().replaceAll(".*entry '(.*?)'.*", "$1");
            actionMsg += String.format(errorMsg, rapField);
            throw new DuplicateKeyException(actionMsg);
        }
    }
}
