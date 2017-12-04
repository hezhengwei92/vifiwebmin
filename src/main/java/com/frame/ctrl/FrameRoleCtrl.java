package com.frame.ctrl;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.commons.constant.MediaTypes;
import com.frame.commons.entity.TbCfrmRole;
import com.frame.commons.entity.base.RestObject;
import com.frame.commons.exceptions.FrameException;
import com.frame.commons.utils.CommonUtils;
import com.frame.commons.utils.LogUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.commons.vo.FrameResourceViewVO;
import com.frame.service.FrameResourceService;
import com.frame.service.FrameRoleService;

import net.eoutech.webmin.commons.constant.EUConst;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Controller
@RequestMapping( "/frame/role" )
@CommonTabCtrlInit( resource = "frame_role", viewName = "/page/frame/frameRole" )
public class FrameRoleCtrl extends FrameBaseCtrl< TbCfrmRole > {

    @Autowired
    FrameResourceService frameResourceService;
    
    @Autowired
    FrameRoleService frameRoleService;

    @Autowired
    public void setCfrmBaseService( FrameRoleService commonTabService ) {
        this.frameBaseService = commonTabService;
    }

    @RequestMapping( method = RequestMethod.GET )
    public String view( Model model ) {
        String userName = UserUtils.getUserName();
        LogUtils.dbg( userName + " access " + viewName + " page" );
        List< FrameResourceViewVO > frameResources = frameResourceService.queryAllResource();

        JSONObject view = getModelAttrView( model );
        view.put( "resources", frameResources );
        view.put("homePageOptions", CommonUtils.getRsAppCfg("frame.homePages").split(","));
        view.put("roleHomePage", frameRoleService.queryRoles());
        System.out.println("-------"+view);
        return super.view( model );
    }

    /**
     * 删除
     */
    @RequestMapping(value = EUConst.URI_DELETE_AJAX, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject deleteAjax(@RequestParam(value = "idList[]") List<String> idList) {
        String lanDel = CommonUtils.lang("delete");
        String sucMsg = lanDel + CommonUtils.lang("success");
        String userRelationFailure = CommonUtils.lang("exceptionFrameRole");

        try {
        	int result = frameRoleService.queryUserWithRole(idList);
        	if(result!=0){
        		return RestObject.newError(userRelationFailure);
        	}
            frameBaseService.delete(idList);
            LogUtils.dbg("delete " + resource);
            return RestObject.newOk(sucMsg);
        } catch (Exception e) {
            e.printStackTrace();
            String failureMsg = lanDel + CommonUtils.lang("failure") + " : " + e.getMessage();
            throw new FrameException(failureMsg);
        }
    }
    
    /**
     * 保存
     */
    @RequestMapping(value = EUConst.URI_SAVE_AJAX, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject saveAjax(TbCfrmRole entity, String actionName
            , @RequestParam(value = "idList[]", required = false) List<String> idList) throws Exception {
        boolean isEdit = CommonUtils.lang("edit").equals(actionName);
        LogUtils.dbg(actionName + resource);

        String actionMsg = actionName + CommonUtils.lang("failure") + " : ";
        try {
            String sucMsg = actionName + CommonUtils.lang("success");
            entity = frameBaseService.save(entity, isEdit, idList);
            //另保存角色的主页设置
            //String = entity
            return RestObject.newOk(sucMsg, entity);
        } catch (DuplicateKeyException e) { // 唯一key重复
            String errorMsg = CommonUtils.lang("frame.tips.error.repeat_insert");
            // 取出重复的字段名
            String rapField = e.getCause().getMessage().replaceAll(".*entry '(.*?)'.*", "$1");
            actionMsg += String.format(errorMsg, rapField);
            throw new DuplicateKeyException(actionMsg);
        }
    }

}
