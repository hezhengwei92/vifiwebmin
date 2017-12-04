
package net.eoutech.webmin.sysconfig.service;

import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbAgent;
import org.springframework.stereotype.Service;
import com.frame.commons.constant.FrameConst;
import com.frame.commons.entity.TbCfrmUser;
import com.frame.commons.exceptions.FrameException;
import com.frame.commons.utils.ActionUtils;
import com.frame.commons.utils.CommonUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameUserService;
import com.spring.jdbc.assistants.persistence.Criteria;
import net.eoutech.webmin.agent.dao.AgentDao;
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbUser;
import net.eoutech.webmin.commons.entity.TbViFiDevice;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class AgentManagerService extends FrameBaseService<TbAgent> {

    @Autowired
    FrameUserService frameUserService;
    @Autowired
    AgentDao agentDao;

    @Override
    public Page<TbAgent> query(int pageNumber, int pageSize, Map<String, Object> queryParam) {
        // 当前代理商用户ID前缀,查询条件
        TbAgent agent = UserUtils.getUserProfile().getTbAgent();
        if (agent != null) {
            queryParam.put("LIKE-|-idxAgentId", agent.getIdxAgentId() + ".*");
        }

        return super.query(pageNumber, pageSize, queryParam);
    }

    @Override
    public TbAgent save(TbAgent agent, boolean isEdit, List<String> idList) {
        Date nowDate = new Date();
        agent.setMdfBy(UserUtils.getUserName());
        agent.setMdfTm(nowDate);
        if (!isEdit) {
            int agentLevel = 0;
            // auto generate agentId and agentLevel
            if (StringUtils.isNotBlank(agent.getIdxParentsId())) {
                agent.setIdxAgentId(String.format("%s.%s", agent.getIdxParentsId(), agent.getIdxAgentName()));
                agentLevel = agent.getIdxAgentId().split("\\.").length - 1;
            } else {
                agent.setIdxAgentId(agent.getIdxAgentName());
            }
            agent.setAgentLevel(agentLevel);

            agent.setCrtBy(UserUtils.getUserName());
            agent.setCrtTm(nowDate);
            // 添加后台登陆用户
            addFrameUser(agent);
        }

        return super.save(agent, isEdit, idList);
    }

    private void addFrameUser(TbAgent agent) {
        Date nowDate = new Date();
        String userName = UserUtils.getUserName();
        TbCfrmUser frmUser = new TbCfrmUser();
        frmUser.setPassword(CommonUtils.getRsAppCfg("frame.user.agent.default.psw"));
        frmUser.setKeyUserId(agent.getIdxAgentName());
        frmUser.setIdxRoleId_tbRole(EUConst.AGENT_ROLE);
        frmUser.setPhoneNumber(agent.getPhoneNumber());
        frmUser.setState(FrameConst.USER_STATE_NOT_DEL);
        // default
        frmUser.setIdxGroupId_tbGroup("-");
        frmUser.setLocked(0);
        frmUser.setLoginFailTimes(0);
        frmUser.setLoginTimes(0);
        frmUser.setLastLoginTime(nowDate);
        frmUser.setLastLoginIP(ActionUtils.getRequest().getRemoteAddr());
        frmUser.setAccessIPs("-");
        frmUser.setLanguage("zh");
        frmUser.setRemarks("-");
        frmUser.setCreatedBy(userName);
        frmUser.setCreatedTime(nowDate);
        frmUser.setModifiedBy(userName);
        frmUser.setModifiedTime(nowDate);
        frameUserService.addFrameUser(frmUser);
    }


    @Override
    public void delete(List<String> idList) {
        for (String agentId : idList) {

            // 检查是否有子代理
            Criteria criteria = Criteria.create(TbAgent.class);
            criteria.and("idxAgentId", Operator.LIKE.name(), new Object[]{agentId + ".%"});
            if (jdbcDao.queryCount(criteria) > 0) {
                throw new FrameException(CommonUtils.lang("page.agent.has_child_undel"));
            }
            // 检查其他表的引用
            if (jdbcDao.queryCount(Criteria.create(TbViFiDevice.class).where("idxAgentID", new Object[]{agentId})) > 0) {
                String msg = CommonUtils.lang("frame.tips.error.sql.unable_delete") + CommonUtils.lang("menu.uuwifi_viFiDevice");
                throw new FrameException(msg);
            } else if (jdbcDao.queryCount(Criteria.create(TbUser.class).where("idxAgentID", new Object[]{agentId})) > 0) {
                String msg = CommonUtils.lang("frame.tips.error.sql.unable_delete") + CommonUtils.lang("menu.user_user");
                throw new FrameException(msg);
            }

            String idxAgentName = agentId.substring(agentId.lastIndexOf(".") + 1);
            jdbcDao.delete(TbAgent.class, agentId);
            jdbcDao.delete(TbCfrmUser.class, idxAgentName);
        }
    }


    //////////////////////////////////

    /**
     * 获得所偶上级代理,select 控件 data
     */
    public List<String[]> getParentsSelData() {
        List<String[]> restult = new ArrayList<String[]>();
        // 当前用户是代理的话只有自己...
        TbAgent userAgent = UserUtils.getUserProfile().getTbAgent();
        if (userAgent != null) {
            restult.add(new String[]{userAgent.getIdxAgentId(), userAgent.getIdxAgentId()});
            return restult;
        }

        Criteria criteria = Criteria.create(TbAgent.class);
        criteria.include("idxAgentId");

        List<TbAgent> agents = jdbcDao.queryList(criteria);
        restult.add(new String[]{"eu", "eu"});
        for (TbAgent agent : agents) {
            restult.add(new String[]{agent.getIdxAgentId(), agent.getIdxAgentId()});
        }
        return restult;
    }

    public List<Map<String, Object>> queryUserFiveChildAgent() {
        return agentDao.queryUserFiveChildAgent();
    }

    public TbAgent getAgentByName(String agentName) {
        Criteria criteria = Criteria.create(TbAgent.class);
        criteria.where("idxAgentName", new Object[]{agentName});
        return jdbcDao.querySingleResult(criteria);
    }

    public List<String[]> getAgentSelData() {
        List<String[]> selDatas = new ArrayList<String[]>();
        TbAgent agent = UserUtils.getUserProfile().getTbAgent();
        for (TbAgent tbAgent : queryAll()) {
        	if(agent !=null){
        		if(tbAgent.getIdxAgentId().startsWith(agent.getIdxAgentId())){
        			selDatas.add(new String[]{tbAgent.getIdxAgentId(), tbAgent.getIdxAgentName()});
        		}
        	}else{
        		selDatas.add(new String[]{tbAgent.getIdxAgentId(), tbAgent.getIdxAgentName()});
        	}
        }
        return selDatas;
    }
    


}

