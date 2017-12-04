var webpack = require('webpack');
var _ = require("underscore-node");
var process = require('process');
var projectPath = __dirname + "\\";
var projectName = __dirname.replace(/.*[\\\/]([^\\\/]+)[\\\/]{0,1}/, '$1');
// 打包后的文件
var bundlePath = projectPath + 'webapp/assets/bundle';
var bundleURI = "/vifiwebmin/assets/bundle/";

/**
 webpack 最基本的启动webpack命令
 webpack -w 提供watch方法，实时进行打包更新
 webpack -p 对打包后的文件进行压缩
 webpack -d 提供SourceMaps，方便调试
 webpack --colors 输出结果带彩色，比如：会用红色显示耗时较长的步骤
 webpack --profile 输出性能数据，可以看到每一步的耗时
 webpack --display-modules 默认情况下 node_modules 下的模块会被隐藏，加上这个参数可以显示这些被隐藏的模块
 */
var webpackConfig = {
    //页面入口文件配置
    entry: {
        beyond: './webapp/assets/js/beyond.js',
        index: './webapp/assets/js/index.js'
    },
    //入口文件输出配置
    output: {
        publicPath: bundleURI,
        path: bundlePath,
        filename: '[name].bundle.js',
        chunkFilename: "[name].chunk.bundle.js" // 异步按需加载的文件夹名
    },
    //插件项
    plugins: [
        // 浏览器里自动独立公共部分模块,变为单独文件
        new webpack.optimize.CommonsChunkPlugin('commons.js')
    ],
    module: {
        //加载器配置
        loaders: [
            {test: /\.css$/, loader: "style!css"},
            // babel6 es2015
            {test: /\.js$/, exclude: /(node_modules|bower_components)/, loader: 'babel?presets[]=es2015'},
            // 字体图标等...
            {test: /\.(woff|woff2)(\?v=\d+\.\d+\.\d+)?$/, loader: 'file?name=[name].[ext]'},
            {test: /\.ttf(\?v=\d+\.\d+\.\d+)?$/, loader: 'file?name=[name].[ext]'},
            {test: /\.eot(\?v=\d+\.\d+\.\d+)?$/, loader: 'file?name=[name].[ext]'},
            {test: /\.svg(\?v=\d+\.\d+\.\d+)?$/, loader: 'file?name=[name].[ext]'},
            {test: /\.html$/, loader: "file?name=[name].[ext]"},
            {test: /\.(png|jpg|gif)$/, loader: "url?name=[name].[ext]&limit=8192"}

            //// 不符合规范的模块（比如一些直接返回全局变量的插件）进行 shim 处理
            //{
            //    test: require.resolve("./WebContent/assets/beyond/js/skins.min.js"),
            //    loader: "exports?createCookie&readCookie"
            //}
        ]
    },
    //其它解决方案配置
    resolve: {
        //查找module的话从这里开始查找
        root: projectPath + '/webapp', //绝对路径

        //自动扩展文件后缀名，意味着我们require模块可以省略不写后缀名
        extensions: ['', '.js', '.json', '.css'],
        //模块别名定义，方便后续直接引用别名，无须多写长长的地址
        alias: {
            ///////////////////// angular 相关
            "angular": "assets/js/libs/angular/angular.min",
            "angularRoute": "assets/js/libs/angular/angular-route.min",
            "angularSanitize": "assets/js/libs/angular/angular-sanitize.min",
            "ngmodel.format": "assets/js/libs/angular/ngmodel.format", // angular 格式化
            "ngFileUpload": "assets/js/libs/angular/ng-file-upload-all.min", // angular 文件上传
            ///////////////////// jquery 相关插件
            "jquery": "assets/js/libs/jquery/jquery.min",
            "jquery.i18n.properties": "assets/js/libs/jquery/jquery.i18n.properties.min",
            "jquery.mousewheel": "assets/js/libs/jquery/jquery.mousewheel.min",// jquery 鼠标滚轮事件

            "validate": "assets/js/libs/jquery-validation/validateIndex",
            "laydate": "assets/js/libs/laydate/laydate", // 日期插件
            "layer": "assets/js/libs/layer/layer", // 弹出层
            ///////////////////// 其他javascript插件

            "md5": "assets/js/inc/md5",// md5 处理
            // echart 依赖
            echarts$: "assets/js/libs/echarts/src/echarts.js",
            echarts: "assets/js/libs/echarts/src",
            zrender$: "assets/js/libs/zrender/src/zrender.js",
            zrender: "assets/js/libs/zrender/src",

            /////////////////////////自己的一些....
            "jsConst": "assets/js/utils/jsConst", // js的全局常量
            "commonUtils": "assets/js/utils/commonUtils",
            "appModule": "page/frame/js/app_module/index",// angular主模块

            "frame": "page/frame/js"  // 框架模块目录

        }
    }
};


// 检查启动参数是否有 -w 来判断是否是开发阶段, 用于配置开发阶段和生产阶段不同的参数
var isDev = _.contains(process.argv, "-w");
if ( isDev ){
    //init compile fast, recompile also very fast , 开发阶段,错误定位具体文件
    webpackConfig.devtool= 'eval';
}

module.exports = webpackConfig;