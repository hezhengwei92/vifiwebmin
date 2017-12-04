# ViFiWebmin
## *** 软件环境
1. JDK 1.7
2. spring4.17
3. mysql数据库  5.1.73

# mysql 数据库 配置.
1. 修改group_concat_max_len长度.否则某些使用group_concat查询的报错,
    配置文件(重启生效):linux:/etc/my.cnf 文件加入配置:group_concat_max_len=4294967295
    执行语句(重启失效):
        SET GLOBAL group_concat_max_len=4294967295;
        SET SESSION group_concat_max_len=4294967295;



## *** 添加表页面步骤步骤

1. 实体(表名,字段要对应),controller(通用service接口初始化) , service(sava的一些默认初始化)
2. 资源配置 : 国际化配置文件,数据库
3. js ( $scope.viewCfg 视图字段配置 )
4. route.config.js 路由配置


## *** 修改表菜单步骤

1. 数据库
2. ctrl:@RequestMapping的url 和 CommonTabCtrlInit.resource 资源属性
3. route.config.js 导入路径, 和 url配置
4. 对应的sj文件,currentUri属性配置
5. 数据库链接配置：apllication







### *********************************开发---发布说明
### 前端文件自动化任务,国际化打包,webpack 打包
1. 安装 nodejs
2. 安装 gulp 运行命令:npm install gulp -g

## *** 开发阶段
1. cd 到项目目录 运行命令(webpack打包资源和国际化转换): gulp

## *** 生产阶段-发布
##1 发布时,压缩打包, 修改版本号,改数据库链接

1. gulp webpack-production
2. 更改版本号 VersionTool.java文件下  VERSION_STR
3. 改数据库连接


/*
 * 视图 字段配置 说明
 * {配置类型}: {S} string字符串,{N} number数字,{B} boolean真假,{O} object对象,{A} array数组,{X} x任意类型
 *
 * @i18nPrefix  {S} 页面字段国家化 key 的前缀,用于组合字段名取国际化显示
 * @isSplit     {B} <自动配置>是否分割布局
 * @currentUri  {S} 当前页面uri
 * @dtlLayout   {A} 详情层,单个详情布局,[左边比例,右边比例,层宽度 默认90] 比例以12为单位 默认:[6,6]
 *
 * @fields 字段属性配置说明:
 *
 * 1.type      : {S} 字段属性类型, 参数:I:数字,S:字符串,F:浮点小数类型; D:时间2005-11-11 11:11:11,默认 S 字符串类型. (如有unitMul属性默认:F)
 * 2.name      : {S} 字段名
 * 3.title     : {S} <自动配置>字段标题
 * 4.width     : {N} 字段宽度 例:width=150
 * 5.show      : {X} 列表上显示字段,3钟配置 true:列表显示,false:列表隐藏,0:列表隐藏,且不能配置再次显示. 默认:true
 * 6.left      : {B} 分割布局时在左边还是右边,默认:false
 * 7.def       : {X} 默认值
 * 8.hideEdit  : {S} 编辑层控件隐藏 参数:N:新增时隐藏,E:编辑时隐藏,A:全部隐藏
 * 9.disabled  : {S} 编辑层控件禁用 参数:N:新增时禁用,E:编辑时禁用,A:全部禁用
 * 10.help     : {S} <自动配置>输入的提示,input的placeholder显示的内容,
 * 11.pk       : {B} 主键字段标识,用于删除动作时
 * 12.comType  : {S} 组件类型      参数:text,select,redio.checkbox 默认:text
 * 13.comData  : {A} 组件所需的数据,select,redio 二位数组,[0]:选中的值,[1]:展示 ,checkbox 二位数组,[0]:勾选的[1]非勾选的[2]展示的说明
 * 14.advQry   : {A} 高级搜索      参数:EQ:等于查询,LIKE:模糊查询,GTE:范围查询 例:advQry:['LIKE']
 * 15.vali     : {O} 属性验证配置   参数:默认:{required:true}, 根据字段类型,会默认一些验证:digits,date,ngSelRequire
 *                   1    required:true        必须输入的字段。
 *                   2    remote:"check.php"   使用 ajax 方法调用 check.php 验证输入值。
 *                   3    email:true           必须输入正确格式的电子邮件。
 *                   4    url:true             必须输入正确格式的网址。
 *                   5    date:true            必须输入正确格式的日期。日期校验 ie6 出错，慎用。
 *                   6    dateISO:true         必须输入正确格式的日期（ISO），例如：2009-06-23，1998/01/22。只验证格式，不验证有效性。
 *                   7    number:true          必须输入合法的数字（负数，小数）。
 *                   8    digits:true          必须输入整数。
 *                   9    creditcard:          必须输入合法的信用卡号。
 *                   10   equalTo:"#field"     输入值必须和 #field 相同。
 *                   11   accept:              输入拥有合法后缀名的字符串（上传文件的后缀）。
 *                   12   maxlength:5          输入长度最多是 5 的字符串（汉字算一个字符）。
 *                   13   minlength:10         输入长度最小是 10 的字符串（汉字算一个字符）。
 *                   14   rangelength:[5,10]   输入长度必须介于 5 和 10 之间的字符串（汉字算一个字符）。
 *                   15   range:[5,10]         输入值必须介于 5 和 10 之间。
 *                   16   max:5                输入值不能大于 5。
 *                   17   min:10               输入值不能小于 10。
 *                   // ***扩展***
 *                   18   decimals:2           小数位,不能超过2位数
 * 16.mulEdit  : {B} 多行编辑标识
 * 17.valAs    : {O} 值别名映射. 例:{"1":"是","0":"否"}
 * 18.unitMul  : {N} 数值单位换算倍数.数据库到前端的倍数.  例:厘->元: 倍数:0.001
 * 19.valFormat: {S} 值显示的格式化字符串. 参数:{a}=原始值,{b}=别名值
 *                   例: <div class='fa fa-circle simp-dev-sta-{a}'></div>{b}
 */


### MsgCtrl.java 文件中的推送：在新增系统消息并保存时，会推送一条系统消息给所有APP用户。
新增页面 ：活动管理/banner/banner  任务界面管理redeem/redeem
任务：
1：Iebox设备 需要导入功能 到时一键导入设备信息 只需要三个字段 ：设备编号 IeBox编号 设备别名 代理商 -------- ok
2：app中有  是否需要增加这些字段？--------------
我的流量：初始剩余流量，购买会员剩余流量，转增剩余流量，任务赠送流量
3：设备表的导入导出功能  可以了  但未写活！如何写活？-----------
4：用户反馈  ok
5：短信信息 no need
6:webmin：sim卡处理 可以添加运营商的卡 一键就把某个卡池中的sim卡的营运商全改   AA：默认的运营商是哪个？？---------------- ok
7:消息推送 -- OK  新增一条消息 则会向全部用户推送消息
8: 卡池中使用的sim卡 数量不匹配。----- ?
9：webmin中搜索按钮的功能有问题 要一个一个去调试
10: 增加广告 ok -- banner 活动管理
11：流量套餐 ok --- packageConsume 资费说明
12：任务的图片链接 ok -- redeem 任务界面管理 管理APP任务界面中中图片 简介
13：问答帮助（常见问题）  ok -- help 设置 -- 常见问题
14: 流量卡管理 流量计算 概要信息 中的使用流量表有问题  -- simCardNew
15：simpool卡池的概要信息
16：卡交换服务的概要信息  -- vswExchangeSer
17: 添加赠送流量功能  -------- 上传图片功能  ????? 还未添加


18:tbvsw 这张表有问题  没用就把他删了，不然就要增加字段了。- ok
19:概要信息，表展示代理商 增删改查 时默认进行代理商的入库
// 通过webmin管理代理商 从tbvns中查出代理商 然后进行套餐管理 通过代理商可以显示不同的套餐  默认全部
卡池 卡槽 卡 通过修改卡池的代理商 则可以把卡槽 和对应的卡槽上的卡的代理商全部改变  所以只能改卡池 的代理商
Iebox设备 就是增加代理商字段，当启动卡入库后 admin可以修改代理商  代理商入库只能是系统根据登录的用户自己把字段默认填写  代理商不可修改代理商字段？？？
用户信息  流量账单  充值记录 上卡记录应是WS入库代理商字段
组模块（tbsimpdevgrp）现今是不需要的
20:增加子模块;tbdictionary
21:本来是代理商表Agent 改成tbvns代理商管理

22:  1：套餐类型明文显示
     2：价格为FUNK币，不能除100
     3：活动字段改为 活动状态
     	上线   禁用
     4：货币单位不可写，固定funk币
     5：套餐类型没有押金和系统赠送

23:增加一个用户，并且可以给某个用户增加流量
24: 147 用23库 -----------

25:tbdictionary 这张表 存储的是卡批次 和卡池相关的代理商  当卡池，卡入库时，
会去数据库中把相关的卡批次（exActions） 代理商(idxAgentID)找出
AA入库卡池数据时，根据传进的卡池名（在tbdictionary中已经配置好,KEY:simpool_003 VALUE:IeBox），找到对应的代理商，TbsimPDev,TbSimPPort入库代理商。
AA入库SimCard时，根据传进的Iccid，然后截取前15位，得到KEY（898603164520285）的值，然后得到VALUE（IeBox&00-29-08-17），&前面位代理商，后面为卡批次。
请务必按KEY,VALUE的格式要求增加，修改数据。

26:消息推送（tbmsg）：当新增一条系统消息，填写标题，以及内容，则会向所有APP用户推送一条消息；当是个人消息时，则只是向管理员推送消息,详情可见MsgCtrl中saveAjax方法。
27：SimPool卡池：只能修改SimPool卡池设备列表中的代理商，当修改SimPool卡池的代理商时，卡槽上的代理商也会改变，并且卡槽上对应的SIM卡的代理商也将改变。
28：数据业务--IeBox设备导入功能，用Excel表格导入数据，对应的表头是：keyDevID,idxViFiID,alaisName,idxAgentID;三个字段（设备编号，IeBox设备，设备别名），
可以按导出键，查看具体导出的数据格式和字段。
还需要在Excel增加代理商（idxAgentID）这个字段，--- ok
29:代理商下拉菜单选择 而不是自己填写 --- ok



30: 问题一：计流量那块有问题，周一拿个盒子测试流量的使用。
31: 问题二：当登录账号和数据库中大小写不匹配时  数据会查出来 但是代理商字段却不会展示出来。（这个不算问题 应该是规范 按规范来操作 严格遵守大小写 登录名 密码 ）
32: 增加图片上传功能  上传到项目 assets/images下 这是可访问到的目录 管理APP中广告的图片 和 banner
33: 日志的获取  framlog.java
34：文件上传 FrameFileUploadCtrl.java   PJCommonsMultpartResolver.java  frmDirectives.js
35: 增加表tbdevicever 硬软件版本更新管理
36：tbvifidevice IeBox管理 里面的字段需要增加 少了硬件 软件字段
37: 增加用户剩余流量  和流量使用情况
38：当月可用  并且有效期要大于当天
