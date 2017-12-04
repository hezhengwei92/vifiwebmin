package net.eoutech.webmin.vifi.ctrl;

import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbSupplier;
import net.eoutech.webmin.vifi.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping( "/vifi/supplier" )
@CommonTabCtrlInit( resource = "vifi_supplier" )
public class SupplierCtrl extends FrameBaseCtrl< TbSupplier > {

    @Autowired
    public void setCfrmBaseService( SupplierService commonTabService ) {
        this.frameBaseService = commonTabService;
    }


}
