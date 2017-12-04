var Utils = require("commonUtils");

var appModule = require("./crtModule");

require("./frmDirectives");
require("./frmFilters");

// factory
// 管理 基类
require("./factory/frame_admin_base/index");


appModule.factory('Utils', ()=>Utils);


module.exports = appModule;







