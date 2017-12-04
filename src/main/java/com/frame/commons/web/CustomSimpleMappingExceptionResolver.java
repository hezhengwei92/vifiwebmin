package com.frame.commons.web;

import com.frame.commons.entity.base.RestObject;
import com.frame.commons.utils.ActionUtils;
import com.frame.commons.utils.JsonUtils;
import com.frame.commons.utils.LogUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.io.StringWriter;

/**
 * @Description: 重写spring mvc 异常处理器,处理普通请求异常,ajax请求异常.并将异常信息记录到log4j
 */
public class CustomSimpleMappingExceptionResolver extends SimpleMappingExceptionResolver {

    @Override
    protected ModelAndView doResolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        // Expose ModelAndView for chosen error view.
        String viewName = determineViewName(ex, request);
        if (viewName == null) {
            return null;
        }
        // 普通请求异常处理
        if (!isAjaxRequest(request)) {
            // 如果不是异步请求
            // Apply HTTP status code for error views, if specified.
            // Only apply it if we're processing a top-level request.
            Integer statusCode = determineStatusCode(request, viewName);
            if (statusCode != null) {
                applyStatusCodeIfPossible(request, response, statusCode);
            }
            // TODO 调试: 异常打印到控制台方便调试
            ex.printStackTrace();
            // 异常保存到日志
            LogUtils.error(getTrace(ex));
            return getModelAndView(viewName, ex, request);
        } else {// Ajax异常处理
            // 异常保存到日志
            LogUtils.error("Ajax异常:{0} , {1}", ex.getMessage(), getTrace(ex));
            String result = JsonUtils.toJSONString(RestObject.newError(ex.getMessage()));
            // 返回异常 信息给ajax
            ActionUtils.ajaxReturn(result);
            return null;
        }
    }

    private boolean isAjaxRequest(HttpServletRequest request) {
        String header = request.getHeader("X-Requested-With");
        return (request.getHeader("accept").contains("application/json") || (header != null && header.contains("XMLHttpRequest")));
    }


    /**
     * 获得异常 StackTrace 字符串 Throwable t:异常类
     */
    public static String getTrace(Throwable t) {
        StringWriter stringWriter = new StringWriter();
        PrintWriter writer = new PrintWriter(stringWriter);
        t.printStackTrace(writer);
        StringBuffer buffer = stringWriter.getBuffer();
        return buffer.toString();
    }
}