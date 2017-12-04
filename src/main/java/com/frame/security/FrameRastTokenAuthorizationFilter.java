package com.frame.security;

import com.frame.commons.utils.CommonUtils;
import org.apache.shiro.web.filter.authz.AuthorizationFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 * 接口访问需要带有token的请求过滤的访问
 */
public class FrameRastTokenAuthorizationFilter extends AuthorizationFilter {
    static String rateToken = CommonUtils.getRsAppCfg( "rate.token" );

    @Override
    protected boolean isAccessAllowed( ServletRequest request, ServletResponse response, Object obj ) throws Exception {
        HttpServletRequest req = (HttpServletRequest)request;
        String token = req.getParameter( "token" );

        return rateToken.equals( token );
    }
}