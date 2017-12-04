package net.eoutech.webmin.vpx.service;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.eoutech.webmin.commons.entity.TbAPPAuthRcd;
import net.eoutech.webmin.commons.entity.TbAPPServer;
import net.eoutech.webmin.vpx.dao.APPServerDao;
import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;

@Service
public class APPServerService  extends FrameBaseService<TbAPPServer> {
	@Autowired
	private APPServerDao appServerDao;

	@Override
	public TbAPPServer save(TbAPPServer entity, boolean isEdit,
			List<String> idList) {
		
		entity.setMdfTm(new Date());
		entity.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
        	entity.setCrtBy(entity.getMdfBy());
        	entity.setCrtTm(entity.getMdfTm());
        }
        //新增，拆分url，对应存如协议，ip，端口
    	String url = entity.getuRL();
    	if(url !=null && !"".equals(url)){
    		String[] urlStr = url.split("://");
    		entity.setAsProtocol(urlStr[0].toUpperCase());
    		if(urlStr.length>1 && urlStr[1] !=null && !"".equals(urlStr[1])){
    			String[] ipAndPort = urlStr[1].split(":");
    			entity.setAsAddrIP(ipAndPort[0]);
    			if(ipAndPort.length>1 && ipAndPort[1] !=null && !"".equals(ipAndPort[1])){
    				//不知道有哪些情况，多次截取，并捕捉异常
    				String port = ipAndPort[1];
    				String[] port1 = port.split("/");
    				String[] port2 = port1[0].split("\\?");
    				try {
						entity.setAsAddrPort(Integer.parseInt(port2[0]));
					} catch (NumberFormatException e) {
						entity.setAsAddrPort(80);
					}
    			}else{
    				entity.setAsAddrPort(80);
    			}
    		}
    	}

        return super.save(entity, isEdit, idList);
	}
	
	public int getServerCount(){
		return appServerDao.getServerCount();
	}
	
    public int getLicenseSum(){
    	return appServerDao.getLicenseSum();
    }
    
    public int getServerLicenseNum(String idxASCode){
    	return appServerDao.getServerLicenseNum(idxASCode);
    }

    public String getCompanyBycode(String idxASCode){
    	return appServerDao.getCompanyBycode(idxASCode);
    }
    
    //已用授权总数(并非剩余的，方法名起的有歧义) + 授权总量配置
    public int getAuthRemain(){
    	return appServerDao.getAuthRemain();
    }
    public int getAuthSum(){
    	return appServerDao.getAuthSum();
    }
    
    public List<TbAPPAuthRcd> getRecentAuthAccount(){
    	return appServerDao.getRecentAuthAccount();
    	
    }
}
