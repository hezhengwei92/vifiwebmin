package net.eoutech.task;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.frame.commons.utils.LogUtils;

public class TimerUpdateStatus 
{
    @Autowired
    protected JdbcTemplate jdbcTemplate;
	
    /**
     * 定时器： 更新用户/设备离线状态  每两分钟触发一次？
     */
	public void run() 
	{
//        LogUtils.info("TimerTask begin, update user,vifi,vsw,goip,simpool status ...");

//        int upUserRst = updateUserStatus();
//        int upViFiRst = updateViFiStatus();
//        int upVSWRst = updateVSWStatus();
//        int upGoipDevRst = updateGoipDevStatus();
//        int upGoipSipRst = updateGoipSipStatus();
//        int upSimpoolRst = updateSimpoolStatus(); 这里为什么总是要更新设备的状态 为1  ？
        
//        LogUtils.info("TimerTask end. "
//        		+ "updateUserStatus="+upUserRst
//        		+ ",updateViFiStatus="+upViFiRst
//        		+ ",updateVSWStatus="+upVSWRst
//        		+ ",updateGoipDevStatus="+upGoipDevRst
//        		+ ",updateGoipSipStatus="+upGoipSipRst);
//        		+ ",updateSimpoolStatus="+upSimpoolRst);
	}
        
	
	private int updateUserStatus()
	{
		//MySQL的时间差函数TIMESTAMPDIFF、DATEDIFF
		String sql = "UPDATE tbUser SET appState = 10 WHERE TIMESTAMPDIFF(SECOND, lastAppOnlineDate, NOW())>(sipExpire+60)";
		return execSQL(sql);
	}
	
	private int updateViFiStatus()
	{
		String sql = "UPDATE tbViFiDevice SET online = 0 WHERE online = 1 AND TIMESTAMPDIFF(SECOND, lastConnectTime, NOW())>180";
		return execSQL(sql);
	}
	
	private int updateVSWStatus()
	{
		String sql = "UPDATE tbVSW SET state = \"S\" WHERE state = \"R\" AND TIMESTAMPDIFF(SECOND, lastHBTime, NOW())>expire ";
		return execSQL(sql);
	}
	
	private int updateGoipDevStatus()
	{
		//**[["0","正常"],["1","已断开连接"],["2","服务器允许异常"]]
		String sql = "UPDATE tbGoIPDev SET status = 1 WHERE status =0 AND TIMESTAMPDIFF(SECOND, lastUpdate, NOW())>expire";
		return execSQL(sql);
	}
	
	private int updateGoipSipStatus()
	{
		String sql = "UPDATE tbGoIPDev SET sipOnline = 0 WHERE sipOnline =1 AND TIMESTAMPDIFF(SECOND, lastUpdate, NOW())>expire";
		return execSQL(sql);
	}
	
	
	private int updateSimpoolStatus()
	{
		//**[["0","正常"],["1","已断开"]
		String sql = "UPDATE tbSimPDev SET status = 1 WHERE status =0 AND TIMESTAMPDIFF(SECOND, lastUpdate, now())>expire";//DATEDIFF(second,lastUpdate, getDate())>expire";
		return execSQL(sql);
	}
	
	
	
		
	private int execSQL(String sql)
	{
		int result = 0;
		try {
			result = jdbcTemplate.update(sql);
	        LogUtils.dbg("exec result="+ result +",sql="+sql);
		} catch (Exception e) {
			LogUtils.error("exec sql error:"+e.toString()+",sql="+sql);
		}
		return result;
	}
	

	
}
