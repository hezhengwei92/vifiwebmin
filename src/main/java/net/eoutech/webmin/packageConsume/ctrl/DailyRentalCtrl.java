
package net.eoutech.webmin.packageConsume.ctrl;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbDailyRental;
import net.eoutech.webmin.rate.service.AreaService;
import net.eoutech.webmin.user.service.DailyRentalService;
import net.eoutech.webmin.uuwifi.service.ViFiDeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping( "/packageConsume/dailyRental" )
@CommonTabCtrlInit( resource = "packageConsume_dailyRental" )
public class DailyRentalCtrl extends FrameBaseCtrl< TbDailyRental > {
    DailyRentalService dailyRentalService;
    @Autowired
    public void setCfrmBaseService( DailyRentalService commonTabService ) {
        this.frameBaseService = dailyRentalService = commonTabService;
    }
    @Autowired
    ViFiDeviceService viFiDeviceService;
    @Autowired
    AreaService areaService;

    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
        view.put("idxViFiIDSelData", viFiDeviceService.getViFiDeviceSelData());
        view.put("areaCodesSelData", areaService.getAreaSelData());
        return super.view(model);
    }
}
       