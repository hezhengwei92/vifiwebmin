
package net.eoutech.webmin.sysconfig.service;

import java.util.Date;
import java.util.List;
import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbUUWiFiArea;
import org.springframework.stereotype.Service;

@Service
public class WifiAreaService extends FrameBaseService<TbUUWiFiArea> {

	@Override
	public TbUUWiFiArea save(TbUUWiFiArea tbUUWiFiArea, boolean isEdit,
			List<String> idList) {
		tbUUWiFiArea.setMdfTm(new Date());
		tbUUWiFiArea.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
        	tbUUWiFiArea.setCrtBy(tbUUWiFiArea.getMdfBy());
        	tbUUWiFiArea.setCrtTm(tbUUWiFiArea.getMdfTm());
        	tbUUWiFiArea.setTotalNumber(0);
        }
		return super.save(tbUUWiFiArea, isEdit, idList);
	}
	
	
}
