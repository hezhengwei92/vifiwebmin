/**
 * 随手记录一些小tips
 * @autor gya
 */

/************************	1.一些注意点 begin		**********************/
	1.VO中使用Integer,而不是int类型
		因为int有默认值0，编辑时若没有设置值，都会设回0
	2.@PathVariable出现点号"."时导致路径参数截断获取不全的解决办法
		下载日志时出现的问题：
		方法1：在完整字段后增加一个静态的字符段，这个段没有任何意义，可以为任意字符。这样需要的字段就被包裹起来，就不会被截断了。
		方法2：在@RequestMapping的value中使用SpEL来表示，value中的{version}换成{version:.+}。
		http://stackoverflow.com/questions/3526523/spring-mvc-pathvariable-getting-truncated
		
/***********************	2.常用服务	begin		*********************/
	1.代理商下拉框数据
		@Autowired
		AgentService agentService;
	    view.put("agentSelData", agentService.getAgentSelData());
	2.地区编号
		@Autowired
	    AreaService areaService;
		view.put("areaSelData", areaService.getAreaSelData());
	3.uuwifi设备
		@Autowired
		ViFiDeviceService viFiDeviceService;
		view.put("viFiDeviceSelData", viFiDeviceService.getViFiDeviceSelData());
	4.uuwifi设备组
		@Autowired
		ViFiDevGroupService viFiDevGroupService;
		view.put("viFiDevGrpSelData", viFiDevGroupService.getDevGroupSelData());
	5.simcardGroup流量卡组
		@Autowired
		SCGroupService sCGroupService;
		view.put("sCGroupSelData", sCGroupService.getSCGroupSelData());
		
		
/**************************		3.sevice中用到的一些特殊处理方式	*************************/	
	
	1.查询初始化参数（例如排序）
		1.为某个字段添加一个集合范围参数，例如：
			//初始查询参数：套餐类型["D","本地流量"],["R","漫游流量"]
	        Object[] rateMode = {"D","R"};//object数组
	        queryParam.put("IN-|-suiteType", rateMode);
	    2.添加权限限制
		    TbAgent agent = UserUtils.getUserProfile().getTbAgent();
	        if(agent !=null){
	        	queryParam.put("LIKE-|-idxAgentID", agent.getIdxAgentId()+"*");
	        }
	    3.表外字段：在表格中显示不存在于数据库的字段，不是很好的处理方式
	    	jsp：字段不可编辑和新增
	    	//表外字段：企业名称
   	     	{name: "company", width:140, hideEdit: "A", advQry: ["LIKE"]}},
   	     	service：
		    JSONObject pageView = LehmanCommonUtils.createPageView(page);
	        //特殊处理
	        List<TbAPPServer> appServerList = page.getContent();
	        List<TbAPPServer2> result = new ArrayList<TbAPPServer2>();
	        for(TbAPPServer vo : appServerList){
	        	result.add(new TbAPPServer2(vo, appServerService.getServerLicenseNum(vo.getIdxASCode())));
	        }
	        pageView.put("contentList", result);
	        return RestObject.newOk("", pageView);
	    4.修改默认的排序方式
		    List<AutoField> orderByFields = criteria.getOrderByFields();
	        if (orderByFields == null || orderByFields.isEmpty()) {
	            criteria.asc(pkName);
	        }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	