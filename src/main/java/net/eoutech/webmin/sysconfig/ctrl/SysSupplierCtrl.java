package net.eoutech.webmin.sysconfig.ctrl;


import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbSupplier;
import net.eoutech.webmin.sysconfig.service.SysSupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping( "/sysconfig/sysSupplier" )
@CommonTabCtrlInit( resource = "sysconfig_sysSupplier" )
public class SysSupplierCtrl extends FrameBaseCtrl< TbSupplier > {

    @Autowired
    public void setCfrmBaseService( SysSupplierService commonTabService ) {
        this.frameBaseService = commonTabService;
    }


}