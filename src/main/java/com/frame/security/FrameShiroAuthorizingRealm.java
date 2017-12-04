package com.frame.security;

import com.frame.commons.entity.TbCfrmUser;
import com.frame.commons.utils.CommonUtils;
import com.frame.commons.vo.FrameUserAuthVO;
import com.frame.commons.web.UserProfile;
import com.frame.service.FrameUserService;
import com.mysql.jdbc.StringUtils;
import net.eoutech.webmin.agent.service.AgentService;
import net.eoutech.webmin.commons.entity.TbAgent;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;


public class FrameShiroAuthorizingRealm extends AuthorizingRealm {

    @Autowired
    protected FrameUserService frameUserService;
    @Autowired
    protected AgentService agentService;


    private void initUserLoginInfo(UserProfile userProfile, String username) {
        Date curDate = new Date();
        userProfile.setLoginDate(curDate);
        userProfile.setIsLogin(true);
        if (username.equals(FrameUserService.FRM_ROOT)) {
            userProfile.setLastLoginIP("0.0.0.0");
            userProfile.setLastLoginTime(curDate);
            // root 用户默认
            userProfile.setPassword(CommonUtils.getRsAppCfg("root.password"));
            frameUserService.updateLoginTime(username, userProfile.getHost(), false);
        } else {
            TbCfrmUser frmUser = frameUserService.getUserByName(username);

            userProfile.setLastLoginIP(frmUser.getLastLoginIP());
            userProfile.setLastLoginTime(frmUser.getLastLoginTime());
            userProfile.setPassword(frmUser.getPassword());
            //  add agent to user info
            TbAgent tbAgent = agentService.getAgentByName(username);
            userProfile.setTbAgent(tbAgent);

            frameUserService.updateLoginTime(username, userProfile.getHost(), true);
        }
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        if (principals == null) {
            throw new AuthenticationException("Principals is null");
        }

        UserProfile userProfile = (UserProfile) principals.fromRealm(getName()).iterator().next();
        String username = userProfile.getUserName();


        if (StringUtils.isNullOrEmpty(username)) {
            throw new AuthenticationException("username is null");
        }

        FrameUserAuthVO user = frameUserService.getUserAuthVO(username);
        if (user == null) {
            //log
            throw new AuthenticationException("user is null");
        }

        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        if (!StringUtils.isNullOrEmpty(user.getRole())) {
            info.addRole(user.getRole());
            userProfile.setRole(user.getRole());
        }

        if (!StringUtils.isNullOrEmpty(user.getPermission())) {
            info.addStringPermission(user.getPermission());
        }
        if (!userProfile.isLogin()) {
            initUserLoginInfo(userProfile, username);
        }
        return info;
    }


    /**
     * 验证登陆
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;

        String username = token.getUsername();

        if (username == null || username.trim().equals("")) {
            throw new AccountException("username can't be empty");
        }

        FrameUserAuthVO user = frameUserService.getUserAuthVO(username);
        if (user == null) {
            throw new AccountException("username is error");
        }

        UserProfile userProfile = new UserProfile();
        userProfile.setUserName(user.getName());
        userProfile.setIndex(user.getIndexPage());

        // 用户的菜单,字符串
        userProfile.setMenu(frameUserService.getUserMenu(username));

        userProfile.setHost(token.getHost());

        return new SimpleAuthenticationInfo(userProfile, user.getPassword(), getName());
    }


    public void clearCachedAuthorizationInfo(String principal) {
        SimplePrincipalCollection principals = new SimplePrincipalCollection(principal, getName());
        clearCachedAuthorizationInfo(principals);
    }


    public void clearAllCachedAuthorizationInfo() {
        Cache<Object, AuthorizationInfo> cache = getAuthorizationCache();
        if (cache != null) {
            for (Object key : cache.keys()) {
                cache.remove(key);
            }
        }
    }

}
