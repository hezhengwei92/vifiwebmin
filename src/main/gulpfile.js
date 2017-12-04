var gulp = require('gulp');
var fs = require('fs');
var shell = require('gulp-shell');
var gulpUtils = require('./gulpSrc/gulpUtils');
var javaResourceToJSON = require('./gulpSrc/javaResourceToJSON');


gulp.task('default', ['webpack-dev', 'javaI18N2jsJSON-watch']);


// webpack 开发阶段 监听,打包,debug处理等
gulp.task('webpack-dev', shell.task([
    'npm run webpack-dev'
]));

// webpack 生产阶段压缩打包 + 国际化文件处理
gulp.task('webpack-production', ["webpack-production-cmd","javaI18N2jsJSON-watch"]);


// webpack 生产阶段压缩打包
gulp.task('webpack-production-cmd', shell.task([
    'npm run webpack-p'
]));

// 监听java 国际化文件,变动,自动保存到js,json 国际化文件
gulp.task('javaI18N2jsJSON-watch', function () {
    var newDirPath = "webapp\\assets\\bundle\\i18n\\";
    gulpUtils.mkdirSync(newDirPath); // 确保存放文件的文件夹存在
    // 初始化一下所有语言文件
    for (var lang of ["en_US", "jp_JP", "ko_KR", "zh_CN", "zh_TW"]) {
        javaI18N2jsJSON(`resources\\messages_${lang}.properties`)
    }

    // 监听文件变更,转换文件
    gulp.watch('src/main/resources/*.properties', function (e) {
        // 不是国际化文件 返回
        if (e.path.indexOf("message") == -1) return;

        javaI18N2jsJSON(e.path);
    });

    //// 监听文件变更,转换文件
    //gulp.watch('src/*.properties', function (e) {
    //    // 不是国际化文件 返回
    //    if (e.path.indexOf("message") == -1) return;
    //
    //    javaI18N2jsJSON(e.path);
    //});
    function javaI18N2jsJSON(oldPath) {
        var taskBeginTime = new Date().getTime();
        // 获得保存的文件名
        var nameReg = oldPath.match(/messages_(.*?)\.properties/);
        var lang = nameReg && nameReg.length > 1 ? nameReg[1] : "unName";
        var newPath = newDirPath + `${lang}.json`;

        // ***
        var resourceStr = fs.readFileSync(oldPath, "utf-8");
        var resourceJSON = javaResourceToJSON(resourceStr);
        fs.writeFile(newPath, resourceJSON, function (err) {
            if (err) throw err;
            console.log(`${new Date().format()}转换:${lang}到${newPath},JSON成功,耗时:${new Date().getTime() - taskBeginTime}` );
        });
    }

});
