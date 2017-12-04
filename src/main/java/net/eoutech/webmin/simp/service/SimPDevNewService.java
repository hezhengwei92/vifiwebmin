
package net.eoutech.webmin.simp.service;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.exceptions.FrameException;
import com.frame.commons.utils.CommonUtils;
import com.frame.commons.utils.JsonUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;

import net.eoutech.webmin.commons.entity.CommonOutlineInfoVO;
import net.eoutech.webmin.commons.entity.TbSimPDev;
import net.eoutech.webmin.commons.vo.StatusCountVO;
import net.eoutech.webmin.simp.dao.SimPDevDao;
import net.eoutech.webmin.simp.vo.SimPDevOfPortInfoVO;
import net.eoutech.webmin.simp.vo.SimPPortInfoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class SimPDevNewService extends FrameBaseService<TbSimPDev> {

    @Autowired
    SimPDevDao simPDevDao;
    @Autowired
    SimPPortService simPPortService;

    @Override
    public TbSimPDev save(TbSimPDev simPDev, boolean isEdit, List<String> idList) {

        simPDev.setMdfTm(new Date());
        simPDev.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
            simPDev.setStatus(0);
//            simPDev.setIdxSimPDevGrpID(0);
            simPDev.setCrtBy(simPDev.getMdfBy());
            simPDev.setCrtTm(simPDev.getMdfTm());
            simPDev.setIpaddr("192.168.1.1");
            simPDev.setPort(0);
            simPDev.setLastUpdate(new Date());
        }

        return super.save(simPDev, isEdit, idList);
    }

    @Override
    public void delete(List<String> idList) {
        if (simPPortService.queryCountByDevID(idList) > 0) {
            throw new FrameException(CommonUtils.lang("frame.tips.error.sql.unable_delete"));
        }
        super.delete(idList);
    }

    public CommonOutlineInfoVO getOutlineInfo(){
    	return simPDevDao.getOutlineInfo();
    }
    
    public CommonOutlineInfoVO getSimCardData(){
    	CommonOutlineInfoVO vo = simPPortService.getSimCardData();
    	return vo;
    }

    /**************
     * 统计详情
     ********/
    @Override
    public JSONObject queryTbDetails() {
        return queryMultiDetails(null);
    }

    @Override
    public JSONObject queryMultiDetails(List<String> idList) {
        JSONObject result = new JSONObject();
        result.put("devices", simPDevDao.queryDevPortStatus(idList));
        result.put("devCount", jdbcDao.queryCount(new TbSimPDev()));
        Long portSum = 0l;
        List<StatusCountVO> statusCountList = simPPortService.queryStatusCountByDevID(idList);
        for (StatusCountVO sta : statusCountList) {
            portSum += sta.getCount();
        }
        result.put("portStatusCount", statusCountList);
        result.put("portSum", portSum);
        return result;
    }

    @Override
    public JSONObject querySingleDetails(String id) {
        JSONObject result = new JSONObject();

        List<SimPPortInfoVO> portInfoList = simPPortService.queryStatusDtlByDevID(id);
        Map<Integer, SimPPortInfoVO> portInfoMap = new HashMap<Integer, SimPPortInfoVO>();
        for (SimPPortInfoVO portInfo : portInfoList) {
            portInfoMap.put(portInfo.getIdxSlotNum(), portInfo);
        }

        // x16 * y14 ,格式 端口展示
        int xSize = 16, ySize = 14;
        SimPPortInfoVO[][] portList = new SimPPortInfoVO[ySize][xSize];
        for (int y = 0; y < ySize; y++) {
            for (int x = 1; x <= xSize; x++) {
                int inx = y * xSize + x;
                SimPPortInfoVO infoVO = portInfoMap.get(inx);
                if (infoVO == null) {
                    infoVO = new SimPPortInfoVO();
                    infoVO.setIdxSlotNum(inx);
                    infoVO.setStatus(2);
                }
                portList[y][x - 1] = infoVO;
            }
        }


        // 状态数量统计
        Map<String, JSONObject> statusCount = new HashMap<String, JSONObject>();
        for (SimPPortInfoVO[] portInfoVOs : portList) {
            for (SimPPortInfoVO portInfoVO : portInfoVOs) {
                String staStr = portInfoVO.getStatus() + "";
                JSONObject staObj = statusCount.get(staStr);
                if (staObj == null) {
                    staObj = new JSONObject();
                    staObj.put("count", 2);
                    statusCount.put(staStr, staObj);
                }
                staObj.put("count", (Integer) staObj.get("count") + 1);
            }
        }

        result.put("portList", portList);
        result.put("statusCount", statusCount);
        return result;
    }


    /**
     * 查询所有SimP设备,端口信息
     *
     * @return [ {
     * tbSimPDev.*:,//tbSimPDev 所有属性,太多 不一一列出来了
     * portInfo:JSONObject[][]{keyID:String,portNum:Integer,state:Integer} // 端口状态信息
     * } ]
     * 设备{List}.端口[][]
     */
    // 端口信息
    public List<SimPDevOfPortInfoVO> queryAllSimPDevPortInfo() {
        List<SimPDevOfPortInfoVO> devPortInfo = simPDevDao.queryAllSimPDevOfPortInfo();

        for (SimPDevOfPortInfoVO devInfo : devPortInfo) {
            Object portInfo = devInfo.getPortInfo();
            JSONObject portInfoMap = portInfo != null ? JsonUtils.parseObject(portInfo.toString()) : new JSONObject();
            // 32 * 4 ,格式 端口展示     改变现实方式，8个一组，响应布局
            int xSize = 8, ySize = portInfoMap.size()/8;
            SimPDevOfPortInfoVO.PortInfo[][] valueList = new SimPDevOfPortInfoVO.PortInfo[ySize][xSize];
            for (int y = 0; y < ySize; y++) {
                for (int x = 1; x <= xSize; x++) {
                    int inx = y * xSize + x;
                    SimPDevOfPortInfoVO.PortInfo item = new SimPDevOfPortInfoVO.PortInfo();

                    item.setPortNum(inx);
                    JSONObject info = (JSONObject) portInfoMap.get(inx + "");
                    if (info != null) {
                        item.setKeyID((Integer) info.get("keyID"));
                        item.setState((Integer) info.get("status"));
                    }
                    valueList[y][x - 1] = item;
                }
            }
            devInfo.setPortInfoArray(valueList);
            devInfo.setPortInfo(null);
        }
        return devPortInfo;
    }

    // [0] 正常状态数量,[1]非正常其他状态数量
    public List<Integer> querySimPDevState() {
        int normal = 0, other = 0;
        for (StatusCountVO countVO : simPDevDao.querySimPDevStatusCount()) {
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
    public List<String[]> getSimPDevSelData() {
        List<String[]> selDatas = new ArrayList<String[]>();
        for (TbSimPDev tbSimPDev : queryAll()) {
            selDatas.add(new String[]{tbSimPDev.getKeySimPDevID(), tbSimPDev.getKeySimPDevID()});
        }
        return selDatas;
    }
}

       