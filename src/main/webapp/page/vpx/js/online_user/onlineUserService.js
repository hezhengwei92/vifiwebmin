var myChart = null, option = null;
var mapData = require("./mapData");
var Utils = require("commonUtils");

// 根据请求的数据,初始化echarts数据
function initMapData(olUserInfo) {
    // value先全清零
    mapData.provinceData.setBatch("value", 0);
    mapData.cityData.setBatch("value", 0);
    var maxOlNum = 0, totalOnNum = 0;

    // echarts 配置,和整理的数据匹配前缀
    _.each(olUserInfo, function (stati) {
        totalOnNum += stati.count;
        console.log( stati.count )
        _.each(mapData.provinceData, function (province) {
            // 匹配前缀(表示省) 赋值 value
            if (stati.country.startWith(province.name)) {
                province.value += stati.count;
                // 收集人数最多的省.
                maxOlNum = province.value > maxOlNum ? province.value : maxOlNum;
                // echarts ,nameMap改名,主面板上也能看到数值.
                //  provinceNameMap[item.name] = item.name + ":" + stati.count;
            }
        });


        _.each(mapData.cityData, function (city) {
            // 匹配后缀(表示市) 赋值 value
            if (stati.country.contains(city.name)) {
                city.value += stati.count;
                // echarts ,nameMap改名,主面板上也能看到数值.
                //  provinceNameMap[item.name] = item.name + ":" + stati.count;
            }
        });
    });
    option.dataRange.max = maxOlNum;
    option.title.text = option.title.text.replace(/:.*/, totalOnNum + "");
}

function refreshMap() {
    Utils.ajax({
        url: PATH + "/vpx/online-user/list.ajax",
        success: function (res) {
            initMapData(res.data);
            myChart.setOption(option);
        }
    });
}


function drawMap() {

    // 基于准备好的dom，初始化echarts图表
    myChart = echarts.init(document.getElementById('main'));
    option = {
        title: {
            text: '总在线人数:0',
            x: 'center'
        },
        tooltip: {
            trigger: 'item'
        },
        dataRange: {
            min: 0,
            max: 5,
            x: 'left',
            y: 'bottom',
            color: ['orange', '#cccccc'],// 颜色范围
            text: ['高', '低'],           // 文本，默认为数值文本
            calculable: true
        },

        toolbox: {
            show: true,
            orient: 'vertical',
            x: 'right',
            y: 'center',
            feature: {
                refreshData: {
                    show: true,
                    title: '刷新',
                    icon: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6OTcxNDQ5Rjc4NzhBMTFFNUE5MDBBODFGNDM5OTUyNTUiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6OTcxNDQ5Rjg4NzhBMTFFNUE5MDBBODFGNDM5OTUyNTUiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo5NzE0NDlGNTg3OEExMUU1QTkwMEE4MUY0Mzk5NTI1NSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo5NzE0NDlGNjg3OEExMUU1QTkwMEE4MUY0Mzk5NTI1NSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PkoGto0AAAGlSURBVHjatJZNKERRFMfvoCyoKYyIxQtlozBZiaKJhSlRlsNGyYJkY2Frx95CkpqUjUg2VlgrCwuSSBYa8tErxvfH/9aZup3ufe8+nlO/pjf33P//frx73o0I7ygESdAO6kA1+ASX4ATsgm1Nv1LwBF5MwlEwC67Atw+nYBpEqK8DjkC5SbwLZCyEOcegCazRc1wnnvQRydK0bQwnuHjCkLgDhkEjra2cegsYBwceBuuqeDF41Yw2JfxjyrBXDyA/lzTHGr9Ag7CPJcMsmmVjEXhjDf0BxDs1/XNMyoQh9udeAPFan40+L6BDpMZ8AINKsALuQR6dhdyv1HZl0j5b+yoRcjwqBjc0glAjqxhkxD/EoWLwAWJhGyyzne8N22CUGWz9QSsqDLWbv7+tvxAfA3dgBlTwxkVm4NI7bhtx2j9VI6EmxDSzkAWsw0J8wFAqHJ6YMhz3NOgGZewE94FNQ58202hGPOrKMzgDF+DdI6/Hb8qDVDKCfjJd+txaRT1YtTSSt4cF3ZsjlJuAKRxaa1lxa0AJid7SbUJeWzbAtUngR4ABAIcp41vT5UxGAAAAAElFTkSuQmCC",
                    onclick: refreshMap
                },
                dataView: {show: true, readOnly: false},
                saveAsImage: {
                    show: true
                }
            }
        },
        series: [
            {
                name: '在线人数',
                type: 'map',
                mapType: 'china',
                mapLocation: {
                    width: '95%'
                },
                roam: true,
                selectedMode: 'single',
                itemStyle: {
                    normal: {label: {show: true}},
                    emphasis: {label: {show: true}}
                },
                nameMap: mapData.provinceNameMap,
                data: mapData.provinceData
            }
        ],
        animation: false
    };
    var ecConfig = echarts.config;
    myChart.on(ecConfig.EVENT.MAP_SELECTED, function (param) {
        var series = option.series[0];
        var mt = series.mapType;
        if (mt == 'china') {
            // 全国选择时指定到选中的省份
            var selected = param.selected;
            for (var i in selected) {
                if (selected[i]) {
                    mt = i;
                    break;
                }
            }
            series.data = mapData.cityData;
        } else {
            mt = 'china';
            series.data = mapData.provinceData;
        }
        series.mapType = mt;

        myChart.setOption(option, true);


    });
    myChart.setOption(option);
}


module.exports = {
    drawMap: drawMap,
    refreshMap: refreshMap
};