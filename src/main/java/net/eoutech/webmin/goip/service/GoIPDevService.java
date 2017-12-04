
package net.eoutech.webmin.goip.service;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.exceptions.FrameException;
import com.frame.commons.utils.ActionUtils;
import com.frame.commons.utils.CommonUtils;
import com.frame.commons.utils.JsonUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;

import net.eoutech.webmin.commons.entity.CommonOutlineInfoVO;
import net.eoutech.webmin.commons.entity.TbGoIPDev;
import net.eoutech.webmin.commons.entity.TbGoIPGrp;
import net.eoutech.webmin.commons.vo.StatusCountVO;
import net.eoutech.webmin.goip.dao.GoIPDevDao;
import net.eoutech.webmin.goip.vo.GoIPDevAndPortInfoVO;
import net.eoutech.webmin.goip.vo.GoIPDevOfPortInfoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class GoIPDevService extends FrameBaseService<TbGoIPDev> {

    @Autowired
    GoIPDevDao goIPDevDao;
    @Autowired
    GoIPPortService goIPPortService;


    @Override
    public TbGoIPDev save(TbGoIPDev goIPDev, boolean isEdit, List<String> idList) {

        goIPDev.setMdfTm(new Date());
        goIPDev.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
            //goIPDev.setIdxGoIPDevGrpID("0");
            goIPDev.setLastUpdate(goIPDev.getMdfTm());
            goIPDev.setIpaddr(ActionUtils.getRequest().getRemoteAddr());
            goIPDev.setPort(0);
            goIPDev.setStatus(0);
            goIPDev.setSipAccount("-");
            goIPDev.setSipPort(0);
            goIPDev.setSipRegExp(0);
            goIPDev.setSipRegDate(goIPDev.getMdfTm());
            goIPDev.setCrtBy(goIPDev.getMdfBy());
            goIPDev.setCrtTm(goIPDev.getMdfTm());
        }

        return super.save(goIPDev, isEdit, idList);
    }


    @Override
    public JSONObject queryTbDetails() {
        return queryMultiDetails(null);
    }


    @Override
    public JSONObject querySingleDetails(String id) {
        JSONObject result = new JSONObject();

        List<GoIPDevOfPortInfoVO> portInfoList = goIPPortService.queryGoIPPortInfoByDevID(id);

        Map<Integer, GoIPDevOfPortInfoVO> portInfoMap = new HashMap<Integer, GoIPDevOfPortInfoVO>();
        for (GoIPDevOfPortInfoVO portInfo : portInfoList) {
            portInfoMap.put(portInfo.getIdxportNum(), portInfo);
        }

        // 16 * 8 ,格式 端口展示
        int xSize = 16, ySize = 4;
        GoIPDevOfPortInfoVO[][] portList = new GoIPDevOfPortInfoVO[ySize][xSize];
        for (int y = 0; y < ySize; y++) {
            for (int x = 1; x <= xSize; x++) {
                int inx = y * xSize + x;
                GoIPDevOfPortInfoVO infoVO = portInfoMap.get(inx);
                if (infoVO == null) {
                    infoVO = new GoIPDevOfPortInfoVO();
                    infoVO.setIdxportNum(inx);
                    infoVO.setStatus(0);
                }
                portList[y][x - 1] = infoVO;
            }
        }


        // 状态数量统计
        Map<String, JSONObject> statusCount = new HashMap<String, JSONObject>();
        for (GoIPDevOfPortInfoVO[] portInfoVOs : portList) {
            for (GoIPDevOfPortInfoVO portInfoVO : portInfoVOs) {
                String staStr = portInfoVO.getStatus() + "";
                JSONObject staObj = statusCount.get(staStr);
                if (staObj == null) {
                    staObj = new JSONObject();
                    staObj.put("count", 0);
                    statusCount.put(staStr, staObj);
                }
                staObj.put("count", (Integer) staObj.get("count") + 1);
            }
        }

        result.put("portList", portList);
        result.put("statusCount", statusCount);
        return result;
    }

    @Override
    public JSONObject queryMultiDetails(List<String> idList) {
        JSONObject result = new JSONObject();
        result.put("devices", goIPDevDao.queryDevPortStatus(idList));
        result.put("devCount", jdbcDao.queryCount(new TbGoIPDev()));
        List<StatusCountVO> statusCountList = goIPPortService.queryStatusCountByDevID(idList);
        Long portSum = 0l;
        for (StatusCountVO sta : statusCountList) {
            portSum += sta.getCount();
        }
        result.put("portStatusCount", statusCountList);
        result.put("portSum", portSum);
        return result;
    }


    @Override
    public void delete(List<String> idList) {
        if (goIPPortService.queryCountByDevID(idList) > 0) {
            throw new FrameException(CommonUtils.lang("frame.tips.error.sql.unable_delete"));
        }
        super.delete(idList);
    }

    /**
     * 查询所有SimP设备,端口信息
     */
    public List<GoIPDevAndPortInfoVO> queryAllGoIPDevPortInfo() {
        List<GoIPDevAndPortInfoVO> devPortInfo = goIPDevDao.queryAllGoIPDevOfPortInfo();

        for (GoIPDevAndPortInfoVO devInfo : devPortInfo) {
            Object portInfo = devInfo.getPortInfo();
            JSONObject portInfoMap = portInfo != null ? JsonUtils.parseObject(portInfo.toString()) : new JSONObject();
            // 16 * 4 ,格式 端口展示 * 按端口总数量展示
            int ports = Integer.parseInt(devInfo.getPorts());
            int xSize = 16;
            int ySize = (int) Math.ceil((float)ports/xSize);
//            int xSize = 16, ySize = 4;
            GoIPDevAndPortInfoVO.PortInfo[][] valueList = new GoIPDevAndPortInfoVO.PortInfo[ySize][xSize];
            for (int i = 0; i < ySize; i++) {
                for (int j = 1; j <= xSize; j++) {
                    int inx = i * xSize + j;
                    if(inx>ports)
                    	break;
                    GoIPDevAndPortInfoVO.PortInfo item = new GoIPDevAndPortInfoVO.PortInfo();

                    item.setPortNum(inx);
                    JSONObject info = (JSONObject) portInfoMap.get(inx + "");
                    if (info != null) {
                        item.setKeyID((Integer) info.get("keyID"));
                        item.setState((Integer) info.get("status"));
                    }
                    valueList[i][j - 1] = item;
                }
            }
            devInfo.setPortInfoArray(valueList);
            devInfo.setPortInfo(null);
        }
        return devPortInfo;
    }

    // [0] 正常状态数量,[1]非正常其他状态数量
    public List<Integer> queryGoIPDevState() {
        int normal = 0, other = 0;
        for (StatusCountVO countVO : goIPDevDao.queryGoIPDevState()) {
            if (countVO.getStatus().equals("0")) {
                normal = countVO.getCount();
            } else {
                other += countVO.getCount();
            }
        }
        return Arrays.asList(normal, other);
    }


    /**
     * 获得组,select 控件数据
     */
    public List<String[]> getGoIPDevSelData() {
        List<String[]> selDatas = new ArrayList<String[]>();
        for (TbGoIPDev tbGoIPDev : queryAll()) {
            selDatas.add(new String[]{tbGoIPDev.getKeyGoIPDevID(), tbGoIPDev.getKeyGoIPDevID()});
        }
        return selDatas;
    }
    
    public List<String[]> getGoIPDevGrpData(){
    	List<String[]> selDatas = new ArrayList<String[]>();
    	List<TbGoIPGrp> tbGoIPDevList = goIPDevDao.queryGoipDevGroupList();
        for (TbGoIPGrp tbGoIPDev : tbGoIPDevList) {
            selDatas.add(new String[]{tbGoIPDev.getKeyGoIPDevGrpID(), tbGoIPDev.getGroupName()});//这里用字段类型一样的remarks存储了groupName
        }
        return selDatas;
    }
    
    public List<TbGoIPDev> getRecentOnlineDev(){
    	return goIPDevDao.getRecentOnlineDev();
    }
    
    public CommonOutlineInfoVO getOutlineInfo(){
    	return goIPDevDao.getOutlineInfo();
    }
    
    public int getActivityPortsNum(){
    	return goIPDevDao.getActivityPortsNum();
    }

}

       