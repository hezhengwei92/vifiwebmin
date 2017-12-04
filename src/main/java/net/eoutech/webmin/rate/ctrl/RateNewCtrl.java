package net.eoutech.webmin.rate.ctrl;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbRate;
import net.eoutech.webmin.rate.service.AreaService;
import net.eoutech.webmin.rate.service.RateService;
import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.commons.constant.MediaTypes;
import com.frame.commons.entity.base.RestObject;
import com.frame.commons.utils.CommonUtils;
import com.frame.ctrl.FrameBaseCtrl;


@Controller
@RequestMapping(value={"/rate/rateNew"})
@CommonTabCtrlInit(viewName="/page/rate/rateNew",resource="rate_rateNew")
public class RateNewCtrl extends FrameBaseCtrl<TbRate>{

	RateService rateService = null;

    @Autowired
    public void setCfrmBaseService(RateService commonTabService) {
        this.frameBaseService = rateService = commonTabService;
    }
    
    
	
    /**
     * ajax查询
     */
    @RequestMapping(value = "/list.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax(
            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request) {
        RestObject restObject = super.queryAjax(pageNumber, pageSize, request);
        JSONObject pageView = (JSONObject) restObject.getData();
        pageView.put("maxKeyRateId", rateService.queryMaxKeyRateId());

        return restObject;
    }


    /**
     * 导入费率
     */
    @RequestMapping(value = "/importRateCsv.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject importRateCsvToDbAjax(String csvStr) {
        int resCount = 0;
        try {
            resCount = rateService.importRateCsvToDb(csvStr);
        } catch (DuplicateKeyException e) {
            String msg = "import failure key id index repeat!" + e.getMessage();

            if (e.getMessage().contains("idxCallPrefix_index_unique")) {
                msg = CommonUtils.lang("page.rate.imp_prefix_repeat");
            }
            return RestObject.newError(msg);
        }
        return RestObject.newOk("import rate success,insert count : " + resCount);
    }

    /**
     * 导出费率
     */
    @RequestMapping(value = "/exportRateCsv.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject exportRateCsvByDbAjax(String tbHead) {
        String data = rateService.exportRateCsvByDb(tbHead);
        return RestObject.newOk("", data);
    }

    @Autowired
    AreaService areaService;

    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
        view.put("areaSelData", areaService.getAreaSelData());
        view.put("rateGroupByArea", rateService.queryRateGroupByCountry());
        ArrayList<Object> list = new ArrayList<Object>();
        view.put("testTop10", list);
        return super.view(model);
    }


    @RequestMapping(value = EUConst.URI_SAVE_AJAX, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
	@Override
	public RestObject saveAjax(TbRate entity, String actionName,
			@RequestParam(value = "idList[]", required = false)List<String> idList) throws Exception {
//		entity.setKeyRateID(234587654);
		return super.saveAjax(entity, actionName, idList);
	}
}
