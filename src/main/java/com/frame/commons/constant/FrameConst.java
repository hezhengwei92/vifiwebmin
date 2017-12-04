package com.frame.commons.constant;

/**
 * Created by Administrator on 2015/10/15.
 */
public interface FrameConst {

    // system user unable delete
    int USER_STATE_NOT_DEL = 8;


    String LANGUAGE_RESOURCE_SESSION_KEY = "language_resource";

    class EmaySMSGateway {

        public final static String SN = "8SDK-EMY-6699-RERSO";// 软件序列号,请通过亿美销售人员获取
        public final static String KEY = "557155";// 序列号首次激活时自己设定
        public final static String PASSWORD = "557155";// 密码,请通过亿美销售人员获取
        public final static String BASEURL = "http://hprpt2.eucp.b2m.cn:8080/sdkproxy/querybalance.action";

    }

    class Status {

        public final static Integer TBSMSGATEWAY_STATE_NORMARL = 0;
        public final static Integer TBSMSGATEWAY_STATE_UNNORMARL = 1;

    }


}
