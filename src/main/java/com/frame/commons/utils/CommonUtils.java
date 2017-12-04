package com.frame.commons.utils;

import com.frame.commons.constant.FrameConst;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;

/**
 * Created by Administrator on 2015/8/19.
 */
public class CommonUtils {

    private static ResourceBundle appCfg = null;


    public static void sleep(long time) {
        try {
            Thread.sleep(time);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    // app config
    public static ResourceBundle getAppCfg() {
        return appCfg == null ? ResourceBundle.getBundle("application") : appCfg;
    }

    public static String getRsAppCfg(String key) {
        String cfgStr = null;
        try {
            cfgStr = getAppCfg().getString(key);
        } catch (Exception ignored) {
        }
        return cfgStr;
    }

    public static boolean rsAppContainsKey(String key) {
        return getAppCfg().containsKey(key);
    }


    //   语言国际化文件
    public static ResourceBundle getLangRes() {
        HttpServletRequest request = ActionUtils.getRequest();
        HttpSession session = request.getSession();
        ResourceBundle lang = (ResourceBundle) session.getAttribute(FrameConst.LANGUAGE_RESOURCE_SESSION_KEY);
        if (lang == null) {
            Locale locale = RequestContextUtils.getLocaleResolver(request).resolveLocale(request);
            lang = ResourceBundle.getBundle("messages", locale);
            session.setAttribute(FrameConst.LANGUAGE_RESOURCE_SESSION_KEY, lang);
        }
        return lang;
    }

    /**
     * 国际化文件查询
     *
     * @param key
     * @return
     */
    public static String lang(String key) {
        String lanStr = null;
        // 取不到异常,或其他异常,就返回null
        try {
            lanStr = getLangRes().getString(key);
        } catch (Exception ignored) {
        }
        return lanStr;
    }

    public static boolean langContainsKey(String key) {
        return getLangRes().containsKey(key);
    }


    /**
     * list元素类型转换,支持普通类型 ,Integer,String,Float,Double 之间转换
     */
    public static <T> List<T> listElTypeConvert(List list, Class<T> cls) {
        List<Object> listTmp = null;
        try {
            listTmp = (List) list.getClass().newInstance();
            for (Object o : list) {
                if (cls == Integer.class) {
                    listTmp.add(Integer.valueOf(o.toString()));
                }
            }
        } catch (InstantiationException  e) {
            e.printStackTrace();
        } catch (IllegalAccessException e1) {
            e1.printStackTrace();
        }
        return (List<T>) listTmp;
    }


}
