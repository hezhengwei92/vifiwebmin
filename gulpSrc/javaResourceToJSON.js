/**
 * Created by Administrator on 2016/1/16.
 */

// unicode 转字符串
function unicodeTo(ovalue) {
    var uReg = /\\u(\w{4})/img;
    if (ovalue && uReg.test(ovalue)) {
        return ovalue.replace(uReg, (str, subs)=>unescape('%u' + subs));
    }
    return ovalue;
}
// java 资源文件转 JSON字符串
function javaResourceToJSON(resourceStr) {
    var resourceObj = {};
    var resArray = resourceStr.split("\n");
    for (var line of resArray) {
        var eqNum = line.indexOf("=");
        if (eqNum == -1 || /&.*?#/.test(line))continue;
        // 取出, 国际化文件的,名称和值
        var resKey = line.substring(0, eqNum).replace(/\s/g, ""), resValue = line.substring(eqNum + 1).replace(/\r/g, "");
        resValue = unicodeTo(resValue);
        // 名称切割为类似 包名.的层次
        var packList = resKey.split(".");

        var currentObj = resourceObj;
        for (var i = 0; i < packList.length; i++) {
            var pack = packList[i];
            // 获得当前要赋值的值
            var currentValue = packList.length - 1 === i ? resValue : null;// 如果是最后一层,取具体数值

            try {
                currentValue = JSON.parse(currentValue);
            } catch (e) {
            }
            //根据是否有值, 建立对象 ,因为可能有下级,所以要弄个对象,只放在""中
            currentValue = currentValue ? {"": currentValue} : {};
            currentObj[pack] = currentObj[pack] || currentValue;
            // 像链表一样,向下走
            currentObj = currentObj[pack];
        }

    }
    return JSON.stringify(resourceObj)
}

module.exports = javaResourceToJSON;