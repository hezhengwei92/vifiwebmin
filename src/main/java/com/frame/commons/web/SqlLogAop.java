package com.frame.commons.web;

/**
 * aop方式 sql操作 日志保存
 */

import com.frame.commons.utils.JsonUtils;
import com.frame.commons.utils.LogUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


@Aspect
@Component
public class SqlLogAop extends HandlerInterceptorAdapter {


    @Around("execution(* org.springframework.jdbc.core.JdbcTemplate.query*(..)) || execution(* org.springframework.jdbc.core.JdbcTemplate.update(..))")
    public Object sqlLogAspect(ProceedingJoinPoint pjp) throws Throwable {
        Object[] args = pjp.getArgs();

        Object result = pjp.proceed();

        try {
            if (args != null) {
                String querySql = (String) args[0];
                Object queryParams = null;
                if (args.length > 1) {
                    queryParams = args[1];
                }
                LogUtils.dbg("Preparing Sql:{0}\n    Parameters:{1},Result: {2}", querySql, JsonUtils.toJSONString(queryParams), JsonUtils.toJSONString(result));
            }
        } catch (Exception e) {
            e.printStackTrace();
            LogUtils.dbg("Preparing SqlError!!! param:{0}\n Result: {1}", JsonUtils.toJSONString(args), JsonUtils.toJSONString(result));
        }

        return result;
    }
}