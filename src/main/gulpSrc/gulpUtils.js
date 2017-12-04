var fs = require("fs");

function Utils() {
}

// 拷贝文件
Utils.copyfile = function (oldPath, newPath) {
    console.log('复制' + oldPath + ' -> ' + newPath);
    var stat = fs.lstatSync(oldPath);
    if (stat.isDirectory()) {
        console.log(oldPath + '是目录');
        return false;
    }
    var readStream = fs.createReadStream(oldPath);
    var writeStream = fs.createWriteStream(newPath);
    readStream.pipe(writeStream);
    readStream.on('end', function () {
        console.log('copy end');
    });
    readStream.on('error', function () {
        console.log('copy error');
    });
};

/**
 * 创建文件夹,   不存在会自动一级一级的建立
 * @param path
 */
Utils.mkdirSync = function (path) {
    var pathArr = path.split(/\/|\\/), mode = 755;

    if (pathArr[0] === ".") {//处理 ./aaa
        pathArr.shift();
    } else if (pathArr[0] == "..") {//处理 ../ddd/d
        pathArr.splice(0, 2, pathArr[0] + "/" + pathArr[1])
    }
    function inner(cur) {
        if (!fs.existsSync(cur)) {//不存在就创建一个
            fs.mkdirSync(cur, mode)
        }
        if (pathArr.length) {
            inner(cur + "/" + pathArr.shift());
        } else {
            console.log(`${cur} ,create success!`)
        }
    }
    pathArr.length && inner(pathArr.shift());
};


//***********************************扩展一些原生的方法**********************************
//---------------------------------------------------
// 日期格式化
// 格式 YYYY/yyyy/YY/yy 表示年份
// MM/M 月份
// W/w 星期
// dd/DD/d/D 日期
// hh/HH/h/H 时间
// mm/m 分钟
// ss/SS/s/S 秒
//---------------------------------------------------
Date.prototype.format = function (formatStr) {
    formatStr = formatStr || "yyyy-MM-dd HH:mm:ss";
    var str = formatStr;
    var Week = ['日', '一', '二', '三', '四', '五', '六'];
    var month = this.getMonth() + 1;
    str = str.replace(/yyyy|YYYY/, this.getFullYear());
    str = str.replace(/MM/, month > 9 ? month + '' : '0' + month);
    str = str.replace(/w|W/g, Week[this.getDay()]);
    str = str.replace(/dd|DD/, this.getDate() > 9 ? this.getDate().toString() : '0' + this.getDate());
    str = str.replace(/hh|HH/, this.getHours() > 9 ? this.getHours().toString() : '0' + this.getHours());
    str = str.replace(/mm/, this.getMinutes() > 9 ? this.getMinutes().toString() : '0' + this.getMinutes());
    str = str.replace(/ss|SS/, this.getSeconds() > 9 ? this.getSeconds().toString() : '0' + this.getSeconds());
    return str;
};


module.exports = Utils;