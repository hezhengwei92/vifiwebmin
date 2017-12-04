package net.eoutech.webmin.cron.enums;

/**
 * Created by Administrator on 2015/10/14.
 */
public enum CronTypeEnum {
    // 用户注册超时,离线管理
    USER_TIMEOUT_OFFLINE_MANAGE( "30m" );
    private String runCycle;

    public String getRunCycle() {
        return runCycle;
    }

    CronTypeEnum( String runCycle ){
        this.runCycle = runCycle;
    }

}
