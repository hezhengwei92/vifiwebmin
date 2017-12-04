package net.eoutech.webmin.vifi.service;

import com.frame.commons.constant.FrameConst;
import com.frame.commons.entity.TbCfrmUser;
import com.frame.commons.utils.ActionUtils;
import com.frame.commons.utils.CommonUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import com.frame.service.FrameUserService;
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbSupplier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class SupplierService extends FrameBaseService< TbSupplier > {

    @Autowired
    FrameUserService frameUserService;

    @Override
    public TbSupplier save( TbSupplier supplier, boolean isEdit, List< String > idList ) {
        Date nowDate = new Date();
        String userName = UserUtils.getUserName();
        if ( !isEdit ) {
            supplier.setCrtBy( userName );
            supplier.setCrtTm( nowDate );
            supplier.setMdfBy( userName );
            supplier.setMdfTm( nowDate );

            // 添加后台登陆用户
            addFrameUser( supplier );
        }

        return super.save( supplier, isEdit, idList );
    }


    /**
     * 获得供应商,select 控件数据
     */
    public List<String[]> getSupplierSelData() {

        List<String[]> selDatas = new ArrayList<String[]>();
        for (TbSupplier supplier : queryAll()) {
            selDatas.add(new String[]{supplier.getIdxSupplierId(), supplier.getName()});
        }
        return selDatas;
    }


    private void addFrameUser(TbSupplier supplier ) {
        Date nowDate = new Date();
        String userName = UserUtils.getUserName();
        TbCfrmUser frmUser = new TbCfrmUser();
        frmUser.setPassword( CommonUtils.getRsAppCfg( "frame.user.supplier.default.psw" ) );
        frmUser.setKeyUserId( supplier.getIdxSupplierId() );
        frmUser.setIdxRoleId_tbRole( EUConst.SUPPLIER_ROLE );
        frmUser.setPhoneNumber( supplier.getPhoneNumber() );
        frmUser.setState( FrameConst.USER_STATE_NOT_DEL );
        // default
        frmUser.setIdxGroupId_tbGroup( "-" );
        frmUser.setLocked( 0 );
        frmUser.setLoginFailTimes( 0 );
        frmUser.setLoginTimes( 0 );
        frmUser.setLastLoginTime( nowDate );
        frmUser.setLastLoginIP( ActionUtils.getRequest().getRemoteAddr() );
        frmUser.setAccessIPs( "-" );
        frmUser.setLanguage( "zh" );
        frmUser.setRemarks( "-" );
        frmUser.setCreatedBy( userName );
        frmUser.setCreatedTime( nowDate );
        frmUser.setModifiedBy( userName );
        frmUser.setModifiedTime( nowDate );
        frameUserService.addFrameUser( frmUser );
    }


    @Override
    public void delete( List< String > idList ) {
        for ( Object supplierId : idList ) {
            jdbcDao.delete( TbCfrmUser.class, supplierId );
            jdbcDao.delete( TbSupplier.class, supplierId );
        }
    }
}
