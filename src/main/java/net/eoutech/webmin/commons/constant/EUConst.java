package net.eoutech.webmin.commons.constant;


public interface EUConst {
    // 权限.只允许查询
    String PERMISSION_Q = "0|1|1|1";

    // 通用操作 uri 后缀.
    String URI_QUERY_AJAX = "list.ajax";
    String URI_QUERY_AJAX_1= "list.ajax1";
    String URI_TABLE_DETAIL_AJAX = "table-detail.ajax"; // table详情查看
    String URI_SINGLE_DETAIL_AJAX = "single-detail.ajax"; // 单个数据详情查看
    String URI_MULTI_DETAIL_AJAX = "multi-detail.ajax"; // 多个数据详情查看
    String URI_SAVE_AJAX = "save.ajax";
    String URI_SAVE_AJAX_1 = "save.ajax1";
    String URI_DELETE_AJAX = "delete.ajax";
    String URI_DELETE_AJAX_1 = "delete.ajax1";


    ///////// 权限 许可与否
    String PERMI_YES = "0";
    String PERMI_NO = "1";


    ////////////// 系统特定的角色
    // 供应商,代理商角色ID
    String SUPPLIER_ROLE = "supplier";
    String AGENT_ROLE = "agent";


    // 审计表操作的,角色类型
    String AUDIT_UT_VIFI_DEVICE = "ViFi";
    String AUDIT_UT_ANDROID = "ADR";
    String AUDIT_UT_IOS = "IOS";
    String AUDIT_UT_WEB_UI = "WUI";
    String AUDIT_UT_WEB_ADMIN = "WAD";
    String AUDIT_UT_WEB_SERVICES = "WS";
    String AUDIT_UT_MONITOR = "MNT";

    String ADMIN="admin";

    // *** goIP状态



    //

}
