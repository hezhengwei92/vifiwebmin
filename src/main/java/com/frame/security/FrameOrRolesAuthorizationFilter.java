package com.frame.security;

import com.frame.commons.utils.CommonUtils;
import net.eoutech.webmin.commons.constant.EUConst;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authz.AuthorizationFilter;
import org.apache.shiro.web.servlet.ShiroHttpServletRequest;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;


public class FrameOrRolesAuthorizationFilter extends AuthorizationFilter {

    @Override
    protected boolean isAccessAllowed( ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
        if ( mappedValue == null ) {
            return false;
        }

        Subject subject = getSubject( request, response );
        String[] rolesArray = ( String[] ) mappedValue;
        if ( rolesArray.length == 0 ) {
            return false;
        }

        for ( int i = 0; i < rolesArray.length; ++i ) {
            if ( subject.hasRole( rolesArray[i] ) && checkActionPermi( ( ShiroHttpServletRequest ) request ) ) {
                return true;
            }
        }

        return false;
    }


    // 检查是否拥有 查,增,改,删, 操作权限!
    private boolean checkActionPermi( ShiroHttpServletRequest request ) {
        if ( RequestMethod.POST.name().equalsIgnoreCase( request.getMethod() ) ) {
            String curUri = request.getRequestURI();
            // 绕过一些不需要权限的操作
            if ( curUri.contains( "/syslog/" ) || curUri.contains( "/frame/resource/" ) ) {
                return true;
            }

            // 查询动作
            if ( curUri.endsWith( EUConst.URI_QUERY_AJAX ) && !getActionPermi( curUri, request, 0 ) ) {
                return false;
            } else if ( curUri.endsWith( EUConst.URI_SAVE_AJAX ) ) { // 保存动作
                String actionName = request.getParameter( "actionName" );
                boolean isEdit = CommonUtils.lang( "edit" ).equals( actionName );
                if ( !isEdit && !getActionPermi( curUri, request, 1 ) ) {
                    return false;
                } else if ( isEdit && !getActionPermi( curUri, request, 2 ) ) {
                    return false;
                }
                //删除动作
            } else if ( curUri.endsWith( EUConst.URI_DELETE_AJAX ) && !getActionPermi( curUri, request, 3 ) ) {
                return false;
            }
        }
        return true;
    }

    /**
     * 获得特定操作是否有权限
     * @param curUri 当前uri 用于取权限,判断
     * @param request ShiroHttpServletRequest
     * @param permiInx 权限约定的未知
     * @return 是否拥有权限
     */
    private boolean getActionPermi( String curUri, ShiroHttpServletRequest request, int permiInx ) {
        String permiKey = curUri.replaceAll( "/{1,}[^/]*$", "" );
        String[] curPermi = ( String[] ) request.getSession().getAttribute( permiKey );
        if ( curPermi == null ) {
            curPermi = new String[]{EUConst.PERMI_NO, EUConst.PERMI_NO, EUConst.PERMI_NO, EUConst.PERMI_NO, EUConst.PERMI_NO};
        }
        return EUConst.PERMI_YES.equals( curPermi[permiInx] );
    }

}