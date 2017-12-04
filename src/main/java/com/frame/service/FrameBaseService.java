package com.frame.service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.frame.commons.utils.*;
import com.frame.dao.FrameBaseDao;
import com.spring.jdbc.assistants.persistence.AutoField;
import com.spring.jdbc.assistants.persistence.Criteria;
import com.spring.jdbc.assistants.persistence.DefaultNameHandler;
import com.spring.jdbc.assistants.persistence.JdbcDao;
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbMsg;
import net.eoutech.webmin.commons.utils.CSVUtils;
import net.eoutech.webmin.msg.dao.MsgDao;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;

import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2015/8/17.
 */
public abstract class FrameBaseService<T_Entity> {

    @Autowired
    protected JdbcDao jdbcDao;

    @Autowired
    protected FrameBaseDao frameBaseDao;

    @Autowired
    protected MsgDao msgDao;


    protected FrameBaseDao baseDao;

    // Current entity class
    private Class<T_Entity> entityClass = null;
    private T_Entity entityInstance = null;
    private String pkName = null;

    public static DefaultNameHandler defaultNameHandler = new DefaultNameHandler();


    protected Class<T_Entity> getEntityClass() {
        if (entityClass == null) {//对应的实体类
            entityClass = (Class<T_Entity>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
            try {
                this.entityInstance = entityClass.newInstance();
            } catch (Exception e) {
                e.printStackTrace();
            }
            pkName = EntityTbUtils.getPKName(entityClass);
        }
        return entityClass;
    }

    //************************************  通用dao

    /**
     * 根据主键ID 获得.对象
     */
    public T_Entity get(Object pkId) {
        return jdbcDao.get(getEntityClass(), pkId);
    }

    public T_Entity save(T_Entity entity) {
        return save(entity, false, null);
    }

    public List<TbMsg> getNew() {
        return msgDao.selNewMsg();
    }


    public void delete(List<String> idList) {
        for (Object id : idList) {
            jdbcDao.delete(getEntityClass(), id);
        }
    }

    /**
     * 查询一个表所有对象
     */
    public List<T_Entity> queryAll() {

        if (this.entityInstance == null) {
            getEntityClass();
        };

        return jdbcDao.queryList(entityInstance);
    }

    /**
     * 查询最后插入数据的主键
     */
    public Object getLastInsertId() {
        return frameBaseDao.getLastInsertId();
    }

    //************************************  通用 操作逻辑
    protected Page<T_Entity> query(int pageNumber, int pageSize, Map<String, Object> queryParam, Criteria criteria) {
        // 解析查询参数到 Criteria
        FrameBaseService.parseQueryCriteria(queryParam, criteria);
        // 如果没有设置排序,  默认使用主键升序排序
        List<AutoField> orderByFields = criteria.getOrderByFields();
        if (orderByFields == null || orderByFields.isEmpty()) {
            criteria.asc(pkName);
        }
        return jdbcDao.queryPage(getEntityClass(), criteria, pageNumber, pageSize);
    }
    //实体类需要显示的字段可以少于表中实际的字段
    public Page<T_Entity> query(int pageNumber, int pageSize, Map<String, Object> queryParam) {
        Criteria criteria = Criteria.create(getEntityClass());
        return query(pageNumber, pageSize, queryParam, criteria);
    }

    /**
     * 查询表的详情
     */
    public JSONObject queryTbDetails() {
        return null;
    }

    /**
     * 查看单个数据的详情
     */
    public JSONObject querySingleDetails(String id) {
        return null;
    }

    /**
     * 查看多个数据的详情
     */
    public JSONObject queryMultiDetails(List<String> idList) {
        return null;
    }

    /**
     * 多行编辑,
     *
     * @param entity 参数实体
     * @param idList 主键集合
     */
    private void editMulti(T_Entity entity, List<String> idList) {
        String pkName = defaultNameHandler.getPKName(getEntityClass());
        for (String id : idList) {
            ReflectUtils.setUnkTypeProp(entity, pkName, id);
            jdbcDao.update(entity);
        }
    }

    public T_Entity save(T_Entity entity, boolean isEdit, List<String> idList) {

        if (isEdit) {
            if (idList != null && !idList.isEmpty()) {
                editMulti(entity, idList);
            } else {
                jdbcDao.update(entity);
            }
        } else {
            jdbcDao.insert(entity);

        }
        return entity;
    }

    public T_Entity save(T_Entity entity, boolean isEdit) {
        return save(entity, isEdit, null);
    }


    /**
     * 操作许可
     * 0|0|0|0 对应,details|add|edit|delete , 0=许可,1=禁止
     */
    public String getPermissions(String userName, String resources) {
        String permission;   //_EUROOT
        if (userName.equals(FrameUserService.FRM_ROOT)) {
            permission = "0|0|0|0";
        } else {
            permission = frameBaseDao.getPermissions(userName, resources);
        }
        return permission;
    }

    //****************************************


    /*************************************************************
     * 方法区域
     ***********/
    private static final String ORDER_PARAM_KEY = "ORDER_LIST";


    /**
     * 查询操作枚举
     */
    public enum Operator {
        EQ(" = "),//等于
        NEQ(" <> "),//不等于
        LIKE(" LIKE "),//模糊匹配
        GT(" > "),//大于
        LT(" < "),//小于
        GTE(" >= "),//大于等于
        LTE(" <= "),// 小于 等于
        ISNULL(" IS NULL "),//is null
        ISNOTNULL(" IS NOT NULL "),//not null
        IN(" IN ");//in
        public String symbol;

        Operator(String symbol) {
            this.symbol = symbol;
        }
    }

    // 是否有查询参数
    protected static boolean hasOrderParam(Map<String, Object> queryParam) {
        return queryParam.containsKey(ORDER_PARAM_KEY);//ORDER-LIST
    }

    /**
     * 解析 查询参数,到criteria 中
     */
    public static void parseQueryCriteria(Map<String, Object> queryParam, Criteria criteria) {
        // 排序逻辑...  ORDER-LIST
        String orderListJSON = (String) queryParam.get(ORDER_PARAM_KEY);
        if (hasOrderParam(queryParam)) {
            JSONArray orderList = JsonUtils.parseArray(orderListJSON);
            for (Object orderObj : orderList) {
                JSONArray orderArr = (JSONArray) orderObj;
                if ("1".equals(orderArr.get(1).toString())) {
                    criteria.asc(orderArr.get(0).toString());
                } else if ("2".equals(orderArr.get(1).toString())) {
                    criteria.desc(orderArr.get(0).toString());
                }
            }
        }

        String uerName= UserUtils.getUserName();

        if (null != uerName && !EUConst.ADMIN.equals(uerName)){
            queryParam.put("LIKE-|-idxAgentID",uerName);
        }

        boolean isFirstWhere = true;
        for (Map.Entry<String, Object> entry : queryParam.entrySet()) {

            String key = entry.getKey();
            String value = entry.getValue().toString();
            // 过滤掉空值和排序的值
            if (StringUtils.isBlank(value) || ORDER_PARAM_KEY.equals(key)) {
                continue;
            }
            // 拆分operator与filedAttribute   IN-|-status
            String[] names = StringUtils.split(key, "-|-");
            if (names.length != 2) {
                throw new IllegalArgumentException(key + " is not a valid search filter name");
            }
            String filedName = names[1];
            Operator operator = Operator.valueOf(names[0]);
            // LIKE * to %
            if (operator == Operator.LIKE) {
                if (value.contains("*")) {
                    value = value.replaceAll("\\*", "%");
                } else {
                    operator = Operator.EQ;
                }
            }
            if (isFirstWhere) {
            	if (operator == Operator.IN) {
            		try {
            			criteria.where(filedName, operator.symbol, (Object[]) entry.getValue());
					} catch (Exception e) {
						criteria.where(filedName, operator.symbol, new Object[]{value});
					}
                }else{
                	criteria.where(filedName, operator.symbol, new Object[]{value});
                }
                isFirstWhere = false;
            } else {
            	if (operator == Operator.IN) {
            		try {
            			criteria.and(filedName, operator.symbol, (Object[]) entry.getValue());
					} catch (Exception e) {
						criteria.and(filedName, operator.symbol, new Object[]{value});
					}
            	}else{
            		criteria.and(filedName, operator.symbol, new Object[]{value});
            	}
            }
        }

    }
    /**
     * 解析 查询参数,到criteria 中
     */
    public static void parseQueryCriteria(Map<String, Object> queryParam, Criteria criteria,boolean isFirstWhere) {
    	// 排序逻辑...
    	String orderListJSON = (String) queryParam.get(ORDER_PARAM_KEY);
    	if (hasOrderParam(queryParam)) {
    		JSONArray orderList = JsonUtils.parseArray(orderListJSON);
    		for (Object orderObj : orderList) {
    			JSONArray orderArr = (JSONArray) orderObj;
    			if ("1".equals(orderArr.get(1).toString())) {
    				criteria.asc(orderArr.get(0).toString());
    			} else if ("2".equals(orderArr.get(1).toString())) {
    				criteria.desc(orderArr.get(0).toString());
    			}
    		}
    	}
    	
    	
    	for (Map.Entry<String, Object> entry : queryParam.entrySet()) {
    		
    		String key = entry.getKey();
    		String value = entry.getValue().toString();
    		// 过滤掉空值和排序的值
    		if (StringUtils.isBlank(value) || ORDER_PARAM_KEY.equals(key)) {
    			continue;
    		}
    		// 拆分operator与filedAttribute
    		String[] names = StringUtils.split(key, "-|-");
    		if (names.length != 2) {
    			throw new IllegalArgumentException(key + " is not a valid search filter name");
    		}
    		String filedName = names[1];
    		Operator operator = Operator.valueOf(names[0]);
    		// LIKE * to %
    		if (operator == Operator.LIKE) {
    			if (value.contains("*")) {
    				value = value.replaceAll("\\*", "%");
    			} else {
    				operator = Operator.EQ;
    			}
    		}
    		if (isFirstWhere) {
    			criteria.where(filedName, operator.symbol, new Object[]{value});
    			isFirstWhere = false;
    		} else {
    			criteria.and(filedName, operator.symbol, new Object[]{value});
    		}
    	}
    	
    }

    //导出功能
    public String exportCsvByDb(String tbHead) {
        List<Map<String, Object>> payRecord = baseDao.queryAllRecord(tbHead);
        List<List<Object>> csvRateData = new ArrayList<List<Object>>();
        for (Map<String, Object> rate : payRecord) {
            List<Object> rateData = new ArrayList<Object>();
            for (Object o : rate.values()) {
                o = o instanceof Date ? DateUtils.formatDate((Date) o) : o;
                rateData.add(o);
            }
            csvRateData.add(rateData);
        }
        return CSVUtils.dataToCsv(csvRateData);
    }
}
