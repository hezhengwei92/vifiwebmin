/******/ (function(modules) { // webpackBootstrap
/******/ 	// install a JSONP callback for chunk loading
/******/ 	var parentJsonpFunction = window["webpackJsonp"];
/******/ 	window["webpackJsonp"] = function webpackJsonpCallback(chunkIds, moreModules) {
/******/ 		// add "moreModules" to the modules object,
/******/ 		// then flag all "chunkIds" as loaded and fire callback
/******/ 		var moduleId, chunkId, i = 0, callbacks = [];
/******/ 		for(;i < chunkIds.length; i++) {
/******/ 			chunkId = chunkIds[i];
/******/ 			if(installedChunks[chunkId])
/******/ 				callbacks.push.apply(callbacks, installedChunks[chunkId]);
/******/ 			installedChunks[chunkId] = 0;
/******/ 		}
/******/ 		for(moduleId in moreModules) {
/******/ 			if(Object.prototype.hasOwnProperty.call(moreModules, moduleId)) {
/******/ 				modules[moduleId] = moreModules[moduleId];
/******/ 			}
/******/ 		}
/******/ 		if(parentJsonpFunction) parentJsonpFunction(chunkIds, moreModules);
/******/ 		while(callbacks.length)
/******/ 			callbacks.shift().call(null, __webpack_require__);
/******/ 		if(moreModules[0]) {
/******/ 			installedModules[0] = 0;
/******/ 			return __webpack_require__(0);
/******/ 		}
/******/ 	};

/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// object to store loaded and loading chunks
/******/ 	// "0" means "already loaded"
/******/ 	// Array means "loading", array contains callbacks
/******/ 	var installedChunks = {
/******/ 		3:0
/******/ 	};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}

/******/ 	// This file contains only the entry chunk.
/******/ 	// The chunk loading function for additional chunks
/******/ 	__webpack_require__.e = function requireEnsure(chunkId, callback) {
/******/ 		// "0" is the signal for "already loaded"
/******/ 		if(installedChunks[chunkId] === 0)
/******/ 			return callback.call(null, __webpack_require__);

/******/ 		// an array means "currently loading".
/******/ 		if(installedChunks[chunkId] !== undefined) {
/******/ 			installedChunks[chunkId].push(callback);
/******/ 		} else {
/******/ 			// start chunk loading
/******/ 			installedChunks[chunkId] = [callback];
/******/ 			var head = document.getElementsByTagName('head')[0];
/******/ 			var script = document.createElement('script');
/******/ 			script.type = 'text/javascript';
/******/ 			script.charset = 'utf-8';
/******/ 			script.async = true;

/******/ 			script.src = __webpack_require__.p + "" + ({"0":"beyond","1":"index"}[chunkId]||chunkId) + ".chunk.bundle.js";
/******/ 			head.appendChild(script);
/******/ 		}
/******/ 	};

/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/vifiwebmin/assets/bundle/";
/******/ })
/************************************************************************/
/******/ ({

/***/ 3:
/***/ (function(module, exports) {

	/*
		MIT License http://www.opensource.org/licenses/mit-license.php
		Author Tobias Koppers @sokra
	*/
	// css base code, injected by the css-loader
	module.exports = function() {
		var list = [];

		// return the list of modules as css string
		list.toString = function toString() {
			var result = [];
			for(var i = 0; i < this.length; i++) {
				var item = this[i];
				if(item[2]) {
					result.push("@media " + item[2] + "{" + item[1] + "}");
				} else {
					result.push(item[1]);
				}
			}
			return result.join("");
		};

		// import a list of modules into the list
		list.i = function(modules, mediaQuery) {
			if(typeof modules === "string")
				modules = [[null, modules, ""]];
			var alreadyImportedModules = {};
			for(var i = 0; i < this.length; i++) {
				var id = this[i][0];
				if(typeof id === "number")
					alreadyImportedModules[id] = true;
			}
			for(i = 0; i < modules.length; i++) {
				var item = modules[i];
				// skip already imported module
				// this implementation is not 100% perfect for weird media query combinations
				//  when a module is imported multiple times with different media queries.
				//  I hope this will never occur (Hey this way we have smaller bundles)
				if(typeof item[0] !== "number" || !alreadyImportedModules[item[0]]) {
					if(mediaQuery && !item[2]) {
						item[2] = mediaQuery;
					} else if(mediaQuery) {
						item[2] = "(" + item[2] + ") and (" + mediaQuery + ")";
					}
					list.push(item);
				}
			}
		};
		return list;
	};


/***/ }),

/***/ 10:
/***/ (function(module, exports, __webpack_require__) {

	/*
		MIT License http://www.opensource.org/licenses/mit-license.php
		Author Tobias Koppers @sokra
	*/
	var stylesInDom = {},
		memoize = function(fn) {
			var memo;
			return function () {
				if (typeof memo === "undefined") memo = fn.apply(this, arguments);
				return memo;
			};
		},
		isOldIE = memoize(function() {
			return /msie [6-9]\b/.test(window.navigator.userAgent.toLowerCase());
		}),
		getHeadElement = memoize(function () {
			return document.head || document.getElementsByTagName("head")[0];
		}),
		singletonElement = null,
		singletonCounter = 0,
		styleElementsInsertedAtTop = [];

	module.exports = function(list, options) {
		if(false) {
			if(typeof document !== "object") throw new Error("The style-loader cannot be used in a non-browser environment");
		}

		options = options || {};
		// Force single-tag solution on IE6-9, which has a hard limit on the # of <style>
		// tags it will allow on a page
		if (typeof options.singleton === "undefined") options.singleton = isOldIE();

		// By default, add <style> tags to the bottom of <head>.
		if (typeof options.insertAt === "undefined") options.insertAt = "bottom";

		var styles = listToStyles(list);
		addStylesToDom(styles, options);

		return function update(newList) {
			var mayRemove = [];
			for(var i = 0; i < styles.length; i++) {
				var item = styles[i];
				var domStyle = stylesInDom[item.id];
				domStyle.refs--;
				mayRemove.push(domStyle);
			}
			if(newList) {
				var newStyles = listToStyles(newList);
				addStylesToDom(newStyles, options);
			}
			for(var i = 0; i < mayRemove.length; i++) {
				var domStyle = mayRemove[i];
				if(domStyle.refs === 0) {
					for(var j = 0; j < domStyle.parts.length; j++)
						domStyle.parts[j]();
					delete stylesInDom[domStyle.id];
				}
			}
		};
	}

	function addStylesToDom(styles, options) {
		for(var i = 0; i < styles.length; i++) {
			var item = styles[i];
			var domStyle = stylesInDom[item.id];
			if(domStyle) {
				domStyle.refs++;
				for(var j = 0; j < domStyle.parts.length; j++) {
					domStyle.parts[j](item.parts[j]);
				}
				for(; j < item.parts.length; j++) {
					domStyle.parts.push(addStyle(item.parts[j], options));
				}
			} else {
				var parts = [];
				for(var j = 0; j < item.parts.length; j++) {
					parts.push(addStyle(item.parts[j], options));
				}
				stylesInDom[item.id] = {id: item.id, refs: 1, parts: parts};
			}
		}
	}

	function listToStyles(list) {
		var styles = [];
		var newStyles = {};
		for(var i = 0; i < list.length; i++) {
			var item = list[i];
			var id = item[0];
			var css = item[1];
			var media = item[2];
			var sourceMap = item[3];
			var part = {css: css, media: media, sourceMap: sourceMap};
			if(!newStyles[id])
				styles.push(newStyles[id] = {id: id, parts: [part]});
			else
				newStyles[id].parts.push(part);
		}
		return styles;
	}

	function insertStyleElement(options, styleElement) {
		var head = getHeadElement();
		var lastStyleElementInsertedAtTop = styleElementsInsertedAtTop[styleElementsInsertedAtTop.length - 1];
		if (options.insertAt === "top") {
			if(!lastStyleElementInsertedAtTop) {
				head.insertBefore(styleElement, head.firstChild);
			} else if(lastStyleElementInsertedAtTop.nextSibling) {
				head.insertBefore(styleElement, lastStyleElementInsertedAtTop.nextSibling);
			} else {
				head.appendChild(styleElement);
			}
			styleElementsInsertedAtTop.push(styleElement);
		} else if (options.insertAt === "bottom") {
			head.appendChild(styleElement);
		} else {
			throw new Error("Invalid value for parameter 'insertAt'. Must be 'top' or 'bottom'.");
		}
	}

	function removeStyleElement(styleElement) {
		styleElement.parentNode.removeChild(styleElement);
		var idx = styleElementsInsertedAtTop.indexOf(styleElement);
		if(idx >= 0) {
			styleElementsInsertedAtTop.splice(idx, 1);
		}
	}

	function createStyleElement(options) {
		var styleElement = document.createElement("style");
		styleElement.type = "text/css";
		insertStyleElement(options, styleElement);
		return styleElement;
	}

	function createLinkElement(options) {
		var linkElement = document.createElement("link");
		linkElement.rel = "stylesheet";
		insertStyleElement(options, linkElement);
		return linkElement;
	}

	function addStyle(obj, options) {
		var styleElement, update, remove;

		if (options.singleton) {
			var styleIndex = singletonCounter++;
			styleElement = singletonElement || (singletonElement = createStyleElement(options));
			update = applyToSingletonTag.bind(null, styleElement, styleIndex, false);
			remove = applyToSingletonTag.bind(null, styleElement, styleIndex, true);
		} else if(obj.sourceMap &&
			typeof URL === "function" &&
			typeof URL.createObjectURL === "function" &&
			typeof URL.revokeObjectURL === "function" &&
			typeof Blob === "function" &&
			typeof btoa === "function") {
			styleElement = createLinkElement(options);
			update = updateLink.bind(null, styleElement);
			remove = function() {
				removeStyleElement(styleElement);
				if(styleElement.href)
					URL.revokeObjectURL(styleElement.href);
			};
		} else {
			styleElement = createStyleElement(options);
			update = applyToTag.bind(null, styleElement);
			remove = function() {
				removeStyleElement(styleElement);
			};
		}

		update(obj);

		return function updateStyle(newObj) {
			if(newObj) {
				if(newObj.css === obj.css && newObj.media === obj.media && newObj.sourceMap === obj.sourceMap)
					return;
				update(obj = newObj);
			} else {
				remove();
			}
		};
	}

	var replaceText = (function () {
		var textStore = [];

		return function (index, replacement) {
			textStore[index] = replacement;
			return textStore.filter(Boolean).join('\n');
		};
	})();

	function applyToSingletonTag(styleElement, index, remove, obj) {
		var css = remove ? "" : obj.css;

		if (styleElement.styleSheet) {
			styleElement.styleSheet.cssText = replaceText(index, css);
		} else {
			var cssNode = document.createTextNode(css);
			var childNodes = styleElement.childNodes;
			if (childNodes[index]) styleElement.removeChild(childNodes[index]);
			if (childNodes.length) {
				styleElement.insertBefore(cssNode, childNodes[index]);
			} else {
				styleElement.appendChild(cssNode);
			}
		}
	}

	function applyToTag(styleElement, obj) {
		var css = obj.css;
		var media = obj.media;
		var sourceMap = obj.sourceMap;

		if(media) {
			styleElement.setAttribute("media", media)
		}

		if(styleElement.styleSheet) {
			styleElement.styleSheet.cssText = css;
		} else {
			while(styleElement.firstChild) {
				styleElement.removeChild(styleElement.firstChild);
			}
			styleElement.appendChild(document.createTextNode(css));
		}
	}

	function updateLink(linkElement, obj) {
		var css = obj.css;
		var media = obj.media;
		var sourceMap = obj.sourceMap;

		if(sourceMap) {
			// http://stackoverflow.com/a/26603875
			css += "\n/*# sourceMappingURL=data:application/json;base64," + btoa(unescape(encodeURIComponent(JSON.stringify(sourceMap)))) + " */";
		}

		var blob = new Blob([css], { type: "text/css" });

		var oldSrc = linkElement.href;

		linkElement.href = URL.createObjectURL(blob);

		if(oldSrc)
			URL.revokeObjectURL(oldSrc);
	}


/***/ }),

/***/ 46:
/***/ (function(module, exports, __webpack_require__) {

	var __WEBPACK_AMD_DEFINE_ARRAY__, __WEBPACK_AMD_DEFINE_RESULT__;/* WEBPACK VAR INJECTION */(function(module) {"use strict";

	function _typeof(obj) { return obj && typeof Symbol !== "undefined" && obj.constructor === Symbol ? "symbol" : typeof obj; }

	/*! jQuery v2.1.3 | (c) 2005, 2014 jQuery Foundation, Inc. | jquery.org/license */
	!(function (a, b) {
	  "object" == ( false ? "undefined" : _typeof(module)) && "object" == _typeof(module.exports) ? module.exports = a.document ? b(a, !0) : function (a) {
	    if (!a.document) throw new Error("jQuery requires a window with a document");return b(a);
	  } : b(a);
	})("undefined" != typeof window ? window : undefined, function (a, b) {
	  var c = [],
	      d = c.slice,
	      e = c.concat,
	      f = c.push,
	      g = c.indexOf,
	      h = {},
	      i = h.toString,
	      j = h.hasOwnProperty,
	      k = {},
	      l = a.document,
	      m = "2.1.3",
	      n = function n(a, b) {
	    return new n.fn.init(a, b);
	  },
	      o = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g,
	      p = /^-ms-/,
	      q = /-([\da-z])/gi,
	      r = function r(a, b) {
	    return b.toUpperCase();
	  };n.fn = n.prototype = { jquery: m, constructor: n, selector: "", length: 0, toArray: function toArray() {
	      return d.call(this);
	    }, get: function get(a) {
	      return null != a ? 0 > a ? this[a + this.length] : this[a] : d.call(this);
	    }, pushStack: function pushStack(a) {
	      var b = n.merge(this.constructor(), a);return b.prevObject = this, b.context = this.context, b;
	    }, each: function each(a, b) {
	      return n.each(this, a, b);
	    }, map: function map(a) {
	      return this.pushStack(n.map(this, function (b, c) {
	        return a.call(b, c, b);
	      }));
	    }, slice: function slice() {
	      return this.pushStack(d.apply(this, arguments));
	    }, first: function first() {
	      return this.eq(0);
	    }, last: function last() {
	      return this.eq(-1);
	    }, eq: function eq(a) {
	      var b = this.length,
	          c = +a + (0 > a ? b : 0);return this.pushStack(c >= 0 && b > c ? [this[c]] : []);
	    }, end: function end() {
	      return this.prevObject || this.constructor(null);
	    }, push: f, sort: c.sort, splice: c.splice }, n.extend = n.fn.extend = function () {
	    var a,
	        b,
	        c,
	        d,
	        e,
	        f,
	        g = arguments[0] || {},
	        h = 1,
	        i = arguments.length,
	        j = !1;for ("boolean" == typeof g && (j = g, g = arguments[h] || {}, h++), "object" == (typeof g === "undefined" ? "undefined" : _typeof(g)) || n.isFunction(g) || (g = {}), h === i && (g = this, h--); i > h; h++) {
	      if (null != (a = arguments[h])) for (b in a) {
	        c = g[b], d = a[b], g !== d && (j && d && (n.isPlainObject(d) || (e = n.isArray(d))) ? (e ? (e = !1, f = c && n.isArray(c) ? c : []) : f = c && n.isPlainObject(c) ? c : {}, g[b] = n.extend(j, f, d)) : void 0 !== d && (g[b] = d));
	      }
	    }return g;
	  }, n.extend({ expando: "jQuery" + (m + Math.random()).replace(/\D/g, ""), isReady: !0, error: function error(a) {
	      throw new Error(a);
	    }, noop: function noop() {}, isFunction: function isFunction(a) {
	      return "function" === n.type(a);
	    }, isArray: Array.isArray, isWindow: function isWindow(a) {
	      return null != a && a === a.window;
	    }, isNumeric: function isNumeric(a) {
	      return !n.isArray(a) && a - parseFloat(a) + 1 >= 0;
	    }, isPlainObject: function isPlainObject(a) {
	      return "object" !== n.type(a) || a.nodeType || n.isWindow(a) ? !1 : a.constructor && !j.call(a.constructor.prototype, "isPrototypeOf") ? !1 : !0;
	    }, isEmptyObject: function isEmptyObject(a) {
	      var b;for (b in a) {
	        return !1;
	      }return !0;
	    }, type: function type(a) {
	      return null == a ? a + "" : "object" == (typeof a === "undefined" ? "undefined" : _typeof(a)) || "function" == typeof a ? h[i.call(a)] || "object" : typeof a === "undefined" ? "undefined" : _typeof(a);
	    }, globalEval: function globalEval(a) {
	      var b,
	          c = eval;a = n.trim(a), a && (1 === a.indexOf("use strict") ? (b = l.createElement("script"), b.text = a, l.head.appendChild(b).parentNode.removeChild(b)) : c(a));
	    }, camelCase: function camelCase(a) {
	      return a.replace(p, "ms-").replace(q, r);
	    }, nodeName: function nodeName(a, b) {
	      return a.nodeName && a.nodeName.toLowerCase() === b.toLowerCase();
	    }, each: function each(a, b, c) {
	      var d,
	          e = 0,
	          f = a.length,
	          g = s(a);if (c) {
	        if (g) {
	          for (; f > e; e++) {
	            if ((d = b.apply(a[e], c), d === !1)) break;
	          }
	        } else for (e in a) {
	          if ((d = b.apply(a[e], c), d === !1)) break;
	        }
	      } else if (g) {
	        for (; f > e; e++) {
	          if ((d = b.call(a[e], e, a[e]), d === !1)) break;
	        }
	      } else for (e in a) {
	        if ((d = b.call(a[e], e, a[e]), d === !1)) break;
	      }return a;
	    }, trim: function trim(a) {
	      return null == a ? "" : (a + "").replace(o, "");
	    }, makeArray: function makeArray(a, b) {
	      var c = b || [];return null != a && (s(Object(a)) ? n.merge(c, "string" == typeof a ? [a] : a) : f.call(c, a)), c;
	    }, inArray: function inArray(a, b, c) {
	      return null == b ? -1 : g.call(b, a, c);
	    }, merge: function merge(a, b) {
	      for (var c = +b.length, d = 0, e = a.length; c > d; d++) {
	        a[e++] = b[d];
	      }return a.length = e, a;
	    }, grep: function grep(a, b, c) {
	      for (var d, e = [], f = 0, g = a.length, h = !c; g > f; f++) {
	        d = !b(a[f], f), d !== h && e.push(a[f]);
	      }return e;
	    }, map: function map(a, b, c) {
	      var d,
	          f = 0,
	          g = a.length,
	          h = s(a),
	          i = [];if (h) for (; g > f; f++) {
	        d = b(a[f], f, c), null != d && i.push(d);
	      } else for (f in a) {
	        d = b(a[f], f, c), null != d && i.push(d);
	      }return e.apply([], i);
	    }, guid: 1, proxy: function proxy(a, b) {
	      var c, e, f;return "string" == typeof b && (c = a[b], b = a, a = c), n.isFunction(a) ? (e = d.call(arguments, 2), f = function () {
	        return a.apply(b || this, e.concat(d.call(arguments)));
	      }, f.guid = a.guid = a.guid || n.guid++, f) : void 0;
	    }, now: Date.now, support: k }), n.each("Boolean Number String Function Array Date RegExp Object Error".split(" "), function (a, b) {
	    h["[object " + b + "]"] = b.toLowerCase();
	  });function s(a) {
	    var b = a.length,
	        c = n.type(a);return "function" === c || n.isWindow(a) ? !1 : 1 === a.nodeType && b ? !0 : "array" === c || 0 === b || "number" == typeof b && b > 0 && b - 1 in a;
	  }var t = (function (a) {
	    var b,
	        c,
	        d,
	        e,
	        f,
	        g,
	        h,
	        i,
	        j,
	        k,
	        l,
	        m,
	        n,
	        o,
	        p,
	        q,
	        r,
	        s,
	        t,
	        u = "sizzle" + 1 * new Date(),
	        v = a.document,
	        w = 0,
	        x = 0,
	        y = hb(),
	        z = hb(),
	        A = hb(),
	        B = function B(a, b) {
	      return a === b && (l = !0), 0;
	    },
	        C = 1 << 31,
	        D = ({}).hasOwnProperty,
	        E = [],
	        F = E.pop,
	        G = E.push,
	        H = E.push,
	        I = E.slice,
	        J = function J(a, b) {
	      for (var c = 0, d = a.length; d > c; c++) {
	        if (a[c] === b) return c;
	      }return -1;
	    },
	        K = "checked|selected|async|autofocus|autoplay|controls|defer|disabled|hidden|ismap|loop|multiple|open|readonly|required|scoped",
	        L = "[\\x20\\t\\r\\n\\f]",
	        M = "(?:\\\\.|[\\w-]|[^\\x00-\\xa0])+",
	        N = M.replace("w", "w#"),
	        O = "\\[" + L + "*(" + M + ")(?:" + L + "*([*^$|!~]?=)" + L + "*(?:'((?:\\\\.|[^\\\\'])*)'|\"((?:\\\\.|[^\\\\\"])*)\"|(" + N + "))|)" + L + "*\\]",
	        P = ":(" + M + ")(?:\\((('((?:\\\\.|[^\\\\'])*)'|\"((?:\\\\.|[^\\\\\"])*)\")|((?:\\\\.|[^\\\\()[\\]]|" + O + ")*)|.*)\\)|)",
	        Q = new RegExp(L + "+", "g"),
	        R = new RegExp("^" + L + "+|((?:^|[^\\\\])(?:\\\\.)*)" + L + "+$", "g"),
	        S = new RegExp("^" + L + "*," + L + "*"),
	        T = new RegExp("^" + L + "*([>+~]|" + L + ")" + L + "*"),
	        U = new RegExp("=" + L + "*([^\\]'\"]*?)" + L + "*\\]", "g"),
	        V = new RegExp(P),
	        W = new RegExp("^" + N + "$"),
	        X = { ID: new RegExp("^#(" + M + ")"), CLASS: new RegExp("^\\.(" + M + ")"), TAG: new RegExp("^(" + M.replace("w", "w*") + ")"), ATTR: new RegExp("^" + O), PSEUDO: new RegExp("^" + P), CHILD: new RegExp("^:(only|first|last|nth|nth-last)-(child|of-type)(?:\\(" + L + "*(even|odd|(([+-]|)(\\d*)n|)" + L + "*(?:([+-]|)" + L + "*(\\d+)|))" + L + "*\\)|)", "i"), bool: new RegExp("^(?:" + K + ")$", "i"), needsContext: new RegExp("^" + L + "*[>+~]|:(even|odd|eq|gt|lt|nth|first|last)(?:\\(" + L + "*((?:-\\d)?\\d*)" + L + "*\\)|)(?=[^-]|$)", "i") },
	        Y = /^(?:input|select|textarea|button)$/i,
	        Z = /^h\d$/i,
	        $ = /^[^{]+\{\s*\[native \w/,
	        _ = /^(?:#([\w-]+)|(\w+)|\.([\w-]+))$/,
	        ab = /[+~]/,
	        bb = /'|\\/g,
	        cb = new RegExp("\\\\([\\da-f]{1,6}" + L + "?|(" + L + ")|.)", "ig"),
	        db = function db(a, b, c) {
	      var d = "0x" + b - 65536;return d !== d || c ? b : 0 > d ? String.fromCharCode(d + 65536) : String.fromCharCode(d >> 10 | 55296, 1023 & d | 56320);
	    },
	        eb = function eb() {
	      m();
	    };try {
	      H.apply(E = I.call(v.childNodes), v.childNodes), E[v.childNodes.length].nodeType;
	    } catch (fb) {
	      H = { apply: E.length ? function (a, b) {
	          G.apply(a, I.call(b));
	        } : function (a, b) {
	          var c = a.length,
	              d = 0;while (a[c++] = b[d++]) {}a.length = c - 1;
	        } };
	    }function gb(a, b, d, e) {
	      var f, h, j, k, l, o, r, s, w, x;if (((b ? b.ownerDocument || b : v) !== n && m(b), b = b || n, d = d || [], k = b.nodeType, "string" != typeof a || !a || 1 !== k && 9 !== k && 11 !== k)) return d;if (!e && p) {
	        if (11 !== k && (f = _.exec(a))) if (j = f[1]) {
	          if (9 === k) {
	            if ((h = b.getElementById(j), !h || !h.parentNode)) return d;if (h.id === j) return d.push(h), d;
	          } else if (b.ownerDocument && (h = b.ownerDocument.getElementById(j)) && t(b, h) && h.id === j) return d.push(h), d;
	        } else {
	          if (f[2]) return H.apply(d, b.getElementsByTagName(a)), d;if ((j = f[3]) && c.getElementsByClassName) return H.apply(d, b.getElementsByClassName(j)), d;
	        }if (c.qsa && (!q || !q.test(a))) {
	          if ((s = r = u, w = b, x = 1 !== k && a, 1 === k && "object" !== b.nodeName.toLowerCase())) {
	            o = g(a), (r = b.getAttribute("id")) ? s = r.replace(bb, "\\$&") : b.setAttribute("id", s), s = "[id='" + s + "'] ", l = o.length;while (l--) {
	              o[l] = s + rb(o[l]);
	            }w = ab.test(a) && pb(b.parentNode) || b, x = o.join(",");
	          }if (x) try {
	            return H.apply(d, w.querySelectorAll(x)), d;
	          } catch (y) {} finally {
	            r || b.removeAttribute("id");
	          }
	        }
	      }return i(a.replace(R, "$1"), b, d, e);
	    }function hb() {
	      var a = [];function b(c, e) {
	        return a.push(c + " ") > d.cacheLength && delete b[a.shift()], b[c + " "] = e;
	      }return b;
	    }function ib(a) {
	      return a[u] = !0, a;
	    }function jb(a) {
	      var b = n.createElement("div");try {
	        return !!a(b);
	      } catch (c) {
	        return !1;
	      } finally {
	        b.parentNode && b.parentNode.removeChild(b), b = null;
	      }
	    }function kb(a, b) {
	      var c = a.split("|"),
	          e = a.length;while (e--) {
	        d.attrHandle[c[e]] = b;
	      }
	    }function lb(a, b) {
	      var c = b && a,
	          d = c && 1 === a.nodeType && 1 === b.nodeType && (~b.sourceIndex || C) - (~a.sourceIndex || C);if (d) return d;if (c) while (c = c.nextSibling) {
	        if (c === b) return -1;
	      }return a ? 1 : -1;
	    }function mb(a) {
	      return function (b) {
	        var c = b.nodeName.toLowerCase();return "input" === c && b.type === a;
	      };
	    }function nb(a) {
	      return function (b) {
	        var c = b.nodeName.toLowerCase();return ("input" === c || "button" === c) && b.type === a;
	      };
	    }function ob(a) {
	      return ib(function (b) {
	        return b = +b, ib(function (c, d) {
	          var e,
	              f = a([], c.length, b),
	              g = f.length;while (g--) {
	            c[e = f[g]] && (c[e] = !(d[e] = c[e]));
	          }
	        });
	      });
	    }function pb(a) {
	      return a && "undefined" != typeof a.getElementsByTagName && a;
	    }c = gb.support = {}, f = gb.isXML = function (a) {
	      var b = a && (a.ownerDocument || a).documentElement;return b ? "HTML" !== b.nodeName : !1;
	    }, m = gb.setDocument = function (a) {
	      var b,
	          e,
	          g = a ? a.ownerDocument || a : v;return g !== n && 9 === g.nodeType && g.documentElement ? (n = g, o = g.documentElement, e = g.defaultView, e && e !== e.top && (e.addEventListener ? e.addEventListener("unload", eb, !1) : e.attachEvent && e.attachEvent("onunload", eb)), p = !f(g), c.attributes = jb(function (a) {
	        return a.className = "i", !a.getAttribute("className");
	      }), c.getElementsByTagName = jb(function (a) {
	        return a.appendChild(g.createComment("")), !a.getElementsByTagName("*").length;
	      }), c.getElementsByClassName = $.test(g.getElementsByClassName), c.getById = jb(function (a) {
	        return o.appendChild(a).id = u, !g.getElementsByName || !g.getElementsByName(u).length;
	      }), c.getById ? (d.find.ID = function (a, b) {
	        if ("undefined" != typeof b.getElementById && p) {
	          var c = b.getElementById(a);return c && c.parentNode ? [c] : [];
	        }
	      }, d.filter.ID = function (a) {
	        var b = a.replace(cb, db);return function (a) {
	          return a.getAttribute("id") === b;
	        };
	      }) : (delete d.find.ID, d.filter.ID = function (a) {
	        var b = a.replace(cb, db);return function (a) {
	          var c = "undefined" != typeof a.getAttributeNode && a.getAttributeNode("id");return c && c.value === b;
	        };
	      }), d.find.TAG = c.getElementsByTagName ? function (a, b) {
	        return "undefined" != typeof b.getElementsByTagName ? b.getElementsByTagName(a) : c.qsa ? b.querySelectorAll(a) : void 0;
	      } : function (a, b) {
	        var c,
	            d = [],
	            e = 0,
	            f = b.getElementsByTagName(a);if ("*" === a) {
	          while (c = f[e++]) {
	            1 === c.nodeType && d.push(c);
	          }return d;
	        }return f;
	      }, d.find.CLASS = c.getElementsByClassName && function (a, b) {
	        return p ? b.getElementsByClassName(a) : void 0;
	      }, r = [], q = [], (c.qsa = $.test(g.querySelectorAll)) && (jb(function (a) {
	        o.appendChild(a).innerHTML = "<a id='" + u + "'></a><select id='" + u + "-\f]' msallowcapture=''><option selected=''></option></select>", a.querySelectorAll("[msallowcapture^='']").length && q.push("[*^$]=" + L + "*(?:''|\"\")"), a.querySelectorAll("[selected]").length || q.push("\\[" + L + "*(?:value|" + K + ")"), a.querySelectorAll("[id~=" + u + "-]").length || q.push("~="), a.querySelectorAll(":checked").length || q.push(":checked"), a.querySelectorAll("a#" + u + "+*").length || q.push(".#.+[+~]");
	      }), jb(function (a) {
	        var b = g.createElement("input");b.setAttribute("type", "hidden"), a.appendChild(b).setAttribute("name", "D"), a.querySelectorAll("[name=d]").length && q.push("name" + L + "*[*^$|!~]?="), a.querySelectorAll(":enabled").length || q.push(":enabled", ":disabled"), a.querySelectorAll("*,:x"), q.push(",.*:");
	      })), (c.matchesSelector = $.test(s = o.matches || o.webkitMatchesSelector || o.mozMatchesSelector || o.oMatchesSelector || o.msMatchesSelector)) && jb(function (a) {
	        c.disconnectedMatch = s.call(a, "div"), s.call(a, "[s!='']:x"), r.push("!=", P);
	      }), q = q.length && new RegExp(q.join("|")), r = r.length && new RegExp(r.join("|")), b = $.test(o.compareDocumentPosition), t = b || $.test(o.contains) ? function (a, b) {
	        var c = 9 === a.nodeType ? a.documentElement : a,
	            d = b && b.parentNode;return a === d || !(!d || 1 !== d.nodeType || !(c.contains ? c.contains(d) : a.compareDocumentPosition && 16 & a.compareDocumentPosition(d)));
	      } : function (a, b) {
	        if (b) while (b = b.parentNode) {
	          if (b === a) return !0;
	        }return !1;
	      }, B = b ? function (a, b) {
	        if (a === b) return l = !0, 0;var d = !a.compareDocumentPosition - !b.compareDocumentPosition;return d ? d : (d = (a.ownerDocument || a) === (b.ownerDocument || b) ? a.compareDocumentPosition(b) : 1, 1 & d || !c.sortDetached && b.compareDocumentPosition(a) === d ? a === g || a.ownerDocument === v && t(v, a) ? -1 : b === g || b.ownerDocument === v && t(v, b) ? 1 : k ? J(k, a) - J(k, b) : 0 : 4 & d ? -1 : 1);
	      } : function (a, b) {
	        if (a === b) return l = !0, 0;var c,
	            d = 0,
	            e = a.parentNode,
	            f = b.parentNode,
	            h = [a],
	            i = [b];if (!e || !f) return a === g ? -1 : b === g ? 1 : e ? -1 : f ? 1 : k ? J(k, a) - J(k, b) : 0;if (e === f) return lb(a, b);c = a;while (c = c.parentNode) {
	          h.unshift(c);
	        }c = b;while (c = c.parentNode) {
	          i.unshift(c);
	        }while (h[d] === i[d]) {
	          d++;
	        }return d ? lb(h[d], i[d]) : h[d] === v ? -1 : i[d] === v ? 1 : 0;
	      }, g) : n;
	    }, gb.matches = function (a, b) {
	      return gb(a, null, null, b);
	    }, gb.matchesSelector = function (a, b) {
	      if (((a.ownerDocument || a) !== n && m(a), b = b.replace(U, "='$1']"), !(!c.matchesSelector || !p || r && r.test(b) || q && q.test(b)))) try {
	        var d = s.call(a, b);if (d || c.disconnectedMatch || a.document && 11 !== a.document.nodeType) return d;
	      } catch (e) {}return gb(b, n, null, [a]).length > 0;
	    }, gb.contains = function (a, b) {
	      return (a.ownerDocument || a) !== n && m(a), t(a, b);
	    }, gb.attr = function (a, b) {
	      (a.ownerDocument || a) !== n && m(a);var e = d.attrHandle[b.toLowerCase()],
	          f = e && D.call(d.attrHandle, b.toLowerCase()) ? e(a, b, !p) : void 0;return void 0 !== f ? f : c.attributes || !p ? a.getAttribute(b) : (f = a.getAttributeNode(b)) && f.specified ? f.value : null;
	    }, gb.error = function (a) {
	      throw new Error("Syntax error, unrecognized expression: " + a);
	    }, gb.uniqueSort = function (a) {
	      var b,
	          d = [],
	          e = 0,
	          f = 0;if ((l = !c.detectDuplicates, k = !c.sortStable && a.slice(0), a.sort(B), l)) {
	        while (b = a[f++]) {
	          b === a[f] && (e = d.push(f));
	        }while (e--) {
	          a.splice(d[e], 1);
	        }
	      }return k = null, a;
	    }, e = gb.getText = function (a) {
	      var b,
	          c = "",
	          d = 0,
	          f = a.nodeType;if (f) {
	        if (1 === f || 9 === f || 11 === f) {
	          if ("string" == typeof a.textContent) return a.textContent;for (a = a.firstChild; a; a = a.nextSibling) {
	            c += e(a);
	          }
	        } else if (3 === f || 4 === f) return a.nodeValue;
	      } else while (b = a[d++]) {
	        c += e(b);
	      }return c;
	    }, d = gb.selectors = { cacheLength: 50, createPseudo: ib, match: X, attrHandle: {}, find: {}, relative: { ">": { dir: "parentNode", first: !0 }, " ": { dir: "parentNode" }, "+": { dir: "previousSibling", first: !0 }, "~": { dir: "previousSibling" } }, preFilter: { ATTR: function ATTR(a) {
	          return a[1] = a[1].replace(cb, db), a[3] = (a[3] || a[4] || a[5] || "").replace(cb, db), "~=" === a[2] && (a[3] = " " + a[3] + " "), a.slice(0, 4);
	        }, CHILD: function CHILD(a) {
	          return a[1] = a[1].toLowerCase(), "nth" === a[1].slice(0, 3) ? (a[3] || gb.error(a[0]), a[4] = +(a[4] ? a[5] + (a[6] || 1) : 2 * ("even" === a[3] || "odd" === a[3])), a[5] = +(a[7] + a[8] || "odd" === a[3])) : a[3] && gb.error(a[0]), a;
	        }, PSEUDO: function PSEUDO(a) {
	          var b,
	              c = !a[6] && a[2];return X.CHILD.test(a[0]) ? null : (a[3] ? a[2] = a[4] || a[5] || "" : c && V.test(c) && (b = g(c, !0)) && (b = c.indexOf(")", c.length - b) - c.length) && (a[0] = a[0].slice(0, b), a[2] = c.slice(0, b)), a.slice(0, 3));
	        } }, filter: { TAG: function TAG(a) {
	          var b = a.replace(cb, db).toLowerCase();return "*" === a ? function () {
	            return !0;
	          } : function (a) {
	            return a.nodeName && a.nodeName.toLowerCase() === b;
	          };
	        }, CLASS: function CLASS(a) {
	          var b = y[a + " "];return b || (b = new RegExp("(^|" + L + ")" + a + "(" + L + "|$)")) && y(a, function (a) {
	            return b.test("string" == typeof a.className && a.className || "undefined" != typeof a.getAttribute && a.getAttribute("class") || "");
	          });
	        }, ATTR: function ATTR(a, b, c) {
	          return function (d) {
	            var e = gb.attr(d, a);return null == e ? "!=" === b : b ? (e += "", "=" === b ? e === c : "!=" === b ? e !== c : "^=" === b ? c && 0 === e.indexOf(c) : "*=" === b ? c && e.indexOf(c) > -1 : "$=" === b ? c && e.slice(-c.length) === c : "~=" === b ? (" " + e.replace(Q, " ") + " ").indexOf(c) > -1 : "|=" === b ? e === c || e.slice(0, c.length + 1) === c + "-" : !1) : !0;
	          };
	        }, CHILD: function CHILD(a, b, c, d, e) {
	          var f = "nth" !== a.slice(0, 3),
	              g = "last" !== a.slice(-4),
	              h = "of-type" === b;return 1 === d && 0 === e ? function (a) {
	            return !!a.parentNode;
	          } : function (b, c, i) {
	            var j,
	                k,
	                l,
	                m,
	                n,
	                o,
	                p = f !== g ? "nextSibling" : "previousSibling",
	                q = b.parentNode,
	                r = h && b.nodeName.toLowerCase(),
	                s = !i && !h;if (q) {
	              if (f) {
	                while (p) {
	                  l = b;while (l = l[p]) {
	                    if (h ? l.nodeName.toLowerCase() === r : 1 === l.nodeType) return !1;
	                  }o = p = "only" === a && !o && "nextSibling";
	                }return !0;
	              }if ((o = [g ? q.firstChild : q.lastChild], g && s)) {
	                k = q[u] || (q[u] = {}), j = k[a] || [], n = j[0] === w && j[1], m = j[0] === w && j[2], l = n && q.childNodes[n];while (l = ++n && l && l[p] || (m = n = 0) || o.pop()) {
	                  if (1 === l.nodeType && ++m && l === b) {
	                    k[a] = [w, n, m];break;
	                  }
	                }
	              } else if (s && (j = (b[u] || (b[u] = {}))[a]) && j[0] === w) m = j[1];else while (l = ++n && l && l[p] || (m = n = 0) || o.pop()) {
	                if ((h ? l.nodeName.toLowerCase() === r : 1 === l.nodeType) && ++m && (s && ((l[u] || (l[u] = {}))[a] = [w, m]), l === b)) break;
	              }return m -= e, m === d || m % d === 0 && m / d >= 0;
	            }
	          };
	        }, PSEUDO: function PSEUDO(a, b) {
	          var c,
	              e = d.pseudos[a] || d.setFilters[a.toLowerCase()] || gb.error("unsupported pseudo: " + a);return e[u] ? e(b) : e.length > 1 ? (c = [a, a, "", b], d.setFilters.hasOwnProperty(a.toLowerCase()) ? ib(function (a, c) {
	            var d,
	                f = e(a, b),
	                g = f.length;while (g--) {
	              d = J(a, f[g]), a[d] = !(c[d] = f[g]);
	            }
	          }) : function (a) {
	            return e(a, 0, c);
	          }) : e;
	        } }, pseudos: { not: ib(function (a) {
	          var b = [],
	              c = [],
	              d = h(a.replace(R, "$1"));return d[u] ? ib(function (a, b, c, e) {
	            var f,
	                g = d(a, null, e, []),
	                h = a.length;while (h--) {
	              (f = g[h]) && (a[h] = !(b[h] = f));
	            }
	          }) : function (a, e, f) {
	            return b[0] = a, d(b, null, f, c), b[0] = null, !c.pop();
	          };
	        }), has: ib(function (a) {
	          return function (b) {
	            return gb(a, b).length > 0;
	          };
	        }), contains: ib(function (a) {
	          return a = a.replace(cb, db), function (b) {
	            return (b.textContent || b.innerText || e(b)).indexOf(a) > -1;
	          };
	        }), lang: ib(function (a) {
	          return W.test(a || "") || gb.error("unsupported lang: " + a), a = a.replace(cb, db).toLowerCase(), function (b) {
	            var c;do {
	              if (c = p ? b.lang : b.getAttribute("xml:lang") || b.getAttribute("lang")) return c = c.toLowerCase(), c === a || 0 === c.indexOf(a + "-");
	            } while ((b = b.parentNode) && 1 === b.nodeType);return !1;
	          };
	        }), target: function target(b) {
	          var c = a.location && a.location.hash;return c && c.slice(1) === b.id;
	        }, root: function root(a) {
	          return a === o;
	        }, focus: function focus(a) {
	          return a === n.activeElement && (!n.hasFocus || n.hasFocus()) && !!(a.type || a.href || ~a.tabIndex);
	        }, enabled: function enabled(a) {
	          return a.disabled === !1;
	        }, disabled: function disabled(a) {
	          return a.disabled === !0;
	        }, checked: function checked(a) {
	          var b = a.nodeName.toLowerCase();return "input" === b && !!a.checked || "option" === b && !!a.selected;
	        }, selected: function selected(a) {
	          return a.parentNode && a.parentNode.selectedIndex, a.selected === !0;
	        }, empty: function empty(a) {
	          for (a = a.firstChild; a; a = a.nextSibling) {
	            if (a.nodeType < 6) return !1;
	          }return !0;
	        }, parent: function parent(a) {
	          return !d.pseudos.empty(a);
	        }, header: function header(a) {
	          return Z.test(a.nodeName);
	        }, input: function input(a) {
	          return Y.test(a.nodeName);
	        }, button: function button(a) {
	          var b = a.nodeName.toLowerCase();return "input" === b && "button" === a.type || "button" === b;
	        }, text: function text(a) {
	          var b;return "input" === a.nodeName.toLowerCase() && "text" === a.type && (null == (b = a.getAttribute("type")) || "text" === b.toLowerCase());
	        }, first: ob(function () {
	          return [0];
	        }), last: ob(function (a, b) {
	          return [b - 1];
	        }), eq: ob(function (a, b, c) {
	          return [0 > c ? c + b : c];
	        }), even: ob(function (a, b) {
	          for (var c = 0; b > c; c += 2) {
	            a.push(c);
	          }return a;
	        }), odd: ob(function (a, b) {
	          for (var c = 1; b > c; c += 2) {
	            a.push(c);
	          }return a;
	        }), lt: ob(function (a, b, c) {
	          for (var d = 0 > c ? c + b : c; --d >= 0;) {
	            a.push(d);
	          }return a;
	        }), gt: ob(function (a, b, c) {
	          for (var d = 0 > c ? c + b : c; ++d < b;) {
	            a.push(d);
	          }return a;
	        }) } }, d.pseudos.nth = d.pseudos.eq;for (b in { radio: !0, checkbox: !0, file: !0, password: !0, image: !0 }) {
	      d.pseudos[b] = mb(b);
	    }for (b in { submit: !0, reset: !0 }) {
	      d.pseudos[b] = nb(b);
	    }function qb() {}qb.prototype = d.filters = d.pseudos, d.setFilters = new qb(), g = gb.tokenize = function (a, b) {
	      var c,
	          e,
	          f,
	          g,
	          h,
	          i,
	          j,
	          k = z[a + " "];if (k) return b ? 0 : k.slice(0);h = a, i = [], j = d.preFilter;while (h) {
	        (!c || (e = S.exec(h))) && (e && (h = h.slice(e[0].length) || h), i.push(f = [])), c = !1, (e = T.exec(h)) && (c = e.shift(), f.push({ value: c, type: e[0].replace(R, " ") }), h = h.slice(c.length));for (g in d.filter) {
	          !(e = X[g].exec(h)) || j[g] && !(e = j[g](e)) || (c = e.shift(), f.push({ value: c, type: g, matches: e }), h = h.slice(c.length));
	        }if (!c) break;
	      }return b ? h.length : h ? gb.error(a) : z(a, i).slice(0);
	    };function rb(a) {
	      for (var b = 0, c = a.length, d = ""; c > b; b++) {
	        d += a[b].value;
	      }return d;
	    }function sb(a, b, c) {
	      var d = b.dir,
	          e = c && "parentNode" === d,
	          f = x++;return b.first ? function (b, c, f) {
	        while (b = b[d]) {
	          if (1 === b.nodeType || e) return a(b, c, f);
	        }
	      } : function (b, c, g) {
	        var h,
	            i,
	            j = [w, f];if (g) {
	          while (b = b[d]) {
	            if ((1 === b.nodeType || e) && a(b, c, g)) return !0;
	          }
	        } else while (b = b[d]) {
	          if (1 === b.nodeType || e) {
	            if ((i = b[u] || (b[u] = {}), (h = i[d]) && h[0] === w && h[1] === f)) return j[2] = h[2];if ((i[d] = j, j[2] = a(b, c, g))) return !0;
	          }
	        }
	      };
	    }function tb(a) {
	      return a.length > 1 ? function (b, c, d) {
	        var e = a.length;while (e--) {
	          if (!a[e](b, c, d)) return !1;
	        }return !0;
	      } : a[0];
	    }function ub(a, b, c) {
	      for (var d = 0, e = b.length; e > d; d++) {
	        gb(a, b[d], c);
	      }return c;
	    }function vb(a, b, c, d, e) {
	      for (var f, g = [], h = 0, i = a.length, j = null != b; i > h; h++) {
	        (f = a[h]) && (!c || c(f, d, e)) && (g.push(f), j && b.push(h));
	      }return g;
	    }function wb(a, b, c, d, e, f) {
	      return d && !d[u] && (d = wb(d)), e && !e[u] && (e = wb(e, f)), ib(function (f, g, h, i) {
	        var j,
	            k,
	            l,
	            m = [],
	            n = [],
	            o = g.length,
	            p = f || ub(b || "*", h.nodeType ? [h] : h, []),
	            q = !a || !f && b ? p : vb(p, m, a, h, i),
	            r = c ? e || (f ? a : o || d) ? [] : g : q;if ((c && c(q, r, h, i), d)) {
	          j = vb(r, n), d(j, [], h, i), k = j.length;while (k--) {
	            (l = j[k]) && (r[n[k]] = !(q[n[k]] = l));
	          }
	        }if (f) {
	          if (e || a) {
	            if (e) {
	              j = [], k = r.length;while (k--) {
	                (l = r[k]) && j.push(q[k] = l);
	              }e(null, r = [], j, i);
	            }k = r.length;while (k--) {
	              (l = r[k]) && (j = e ? J(f, l) : m[k]) > -1 && (f[j] = !(g[j] = l));
	            }
	          }
	        } else r = vb(r === g ? r.splice(o, r.length) : r), e ? e(null, g, r, i) : H.apply(g, r);
	      });
	    }function xb(a) {
	      for (var b, c, e, f = a.length, g = d.relative[a[0].type], h = g || d.relative[" "], i = g ? 1 : 0, k = sb(function (a) {
	        return a === b;
	      }, h, !0), l = sb(function (a) {
	        return J(b, a) > -1;
	      }, h, !0), m = [function (a, c, d) {
	        var e = !g && (d || c !== j) || ((b = c).nodeType ? k(a, c, d) : l(a, c, d));return b = null, e;
	      }]; f > i; i++) {
	        if (c = d.relative[a[i].type]) m = [sb(tb(m), c)];else {
	          if ((c = d.filter[a[i].type].apply(null, a[i].matches), c[u])) {
	            for (e = ++i; f > e; e++) {
	              if (d.relative[a[e].type]) break;
	            }return wb(i > 1 && tb(m), i > 1 && rb(a.slice(0, i - 1).concat({ value: " " === a[i - 2].type ? "*" : "" })).replace(R, "$1"), c, e > i && xb(a.slice(i, e)), f > e && xb(a = a.slice(e)), f > e && rb(a));
	          }m.push(c);
	        }
	      }return tb(m);
	    }function yb(a, b) {
	      var c = b.length > 0,
	          e = a.length > 0,
	          f = function f(_f, g, h, i, k) {
	        var l,
	            m,
	            o,
	            p = 0,
	            q = "0",
	            r = _f && [],
	            s = [],
	            t = j,
	            u = _f || e && d.find.TAG("*", k),
	            v = w += null == t ? 1 : Math.random() || .1,
	            x = u.length;for (k && (j = g !== n && g); q !== x && null != (l = u[q]); q++) {
	          if (e && l) {
	            m = 0;while (o = a[m++]) {
	              if (o(l, g, h)) {
	                i.push(l);break;
	              }
	            }k && (w = v);
	          }c && ((l = !o && l) && p--, _f && r.push(l));
	        }if ((p += q, c && q !== p)) {
	          m = 0;while (o = b[m++]) {
	            o(r, s, g, h);
	          }if (_f) {
	            if (p > 0) while (q--) {
	              r[q] || s[q] || (s[q] = F.call(i));
	            }s = vb(s);
	          }H.apply(i, s), k && !_f && s.length > 0 && p + b.length > 1 && gb.uniqueSort(i);
	        }return k && (w = v, j = t), r;
	      };return c ? ib(f) : f;
	    }return h = gb.compile = function (a, b) {
	      var c,
	          d = [],
	          e = [],
	          f = A[a + " "];if (!f) {
	        b || (b = g(a)), c = b.length;while (c--) {
	          f = xb(b[c]), f[u] ? d.push(f) : e.push(f);
	        }f = A(a, yb(e, d)), f.selector = a;
	      }return f;
	    }, i = gb.select = function (a, b, e, f) {
	      var i,
	          j,
	          k,
	          l,
	          m,
	          n = "function" == typeof a && a,
	          o = !f && g(a = n.selector || a);if ((e = e || [], 1 === o.length)) {
	        if ((j = o[0] = o[0].slice(0), j.length > 2 && "ID" === (k = j[0]).type && c.getById && 9 === b.nodeType && p && d.relative[j[1].type])) {
	          if ((b = (d.find.ID(k.matches[0].replace(cb, db), b) || [])[0], !b)) return e;n && (b = b.parentNode), a = a.slice(j.shift().value.length);
	        }i = X.needsContext.test(a) ? 0 : j.length;while (i--) {
	          if ((k = j[i], d.relative[l = k.type])) break;if ((m = d.find[l]) && (f = m(k.matches[0].replace(cb, db), ab.test(j[0].type) && pb(b.parentNode) || b))) {
	            if ((j.splice(i, 1), a = f.length && rb(j), !a)) return H.apply(e, f), e;break;
	          }
	        }
	      }return (n || h(a, o))(f, b, !p, e, ab.test(a) && pb(b.parentNode) || b), e;
	    }, c.sortStable = u.split("").sort(B).join("") === u, c.detectDuplicates = !!l, m(), c.sortDetached = jb(function (a) {
	      return 1 & a.compareDocumentPosition(n.createElement("div"));
	    }), jb(function (a) {
	      return a.innerHTML = "<a href='#'></a>", "#" === a.firstChild.getAttribute("href");
	    }) || kb("type|href|height|width", function (a, b, c) {
	      return c ? void 0 : a.getAttribute(b, "type" === b.toLowerCase() ? 1 : 2);
	    }), c.attributes && jb(function (a) {
	      return a.innerHTML = "<input/>", a.firstChild.setAttribute("value", ""), "" === a.firstChild.getAttribute("value");
	    }) || kb("value", function (a, b, c) {
	      return c || "input" !== a.nodeName.toLowerCase() ? void 0 : a.defaultValue;
	    }), jb(function (a) {
	      return null == a.getAttribute("disabled");
	    }) || kb(K, function (a, b, c) {
	      var d;return c ? void 0 : a[b] === !0 ? b.toLowerCase() : (d = a.getAttributeNode(b)) && d.specified ? d.value : null;
	    }), gb;
	  })(a);n.find = t, n.expr = t.selectors, n.expr[":"] = n.expr.pseudos, n.unique = t.uniqueSort, n.text = t.getText, n.isXMLDoc = t.isXML, n.contains = t.contains;var u = n.expr.match.needsContext,
	      v = /^<(\w+)\s*\/?>(?:<\/\1>|)$/,
	      w = /^.[^:#\[\.,]*$/;function x(a, b, c) {
	    if (n.isFunction(b)) return n.grep(a, function (a, d) {
	      return !!b.call(a, d, a) !== c;
	    });if (b.nodeType) return n.grep(a, function (a) {
	      return a === b !== c;
	    });if ("string" == typeof b) {
	      if (w.test(b)) return n.filter(b, a, c);b = n.filter(b, a);
	    }return n.grep(a, function (a) {
	      return g.call(b, a) >= 0 !== c;
	    });
	  }n.filter = function (a, b, c) {
	    var d = b[0];return c && (a = ":not(" + a + ")"), 1 === b.length && 1 === d.nodeType ? n.find.matchesSelector(d, a) ? [d] : [] : n.find.matches(a, n.grep(b, function (a) {
	      return 1 === a.nodeType;
	    }));
	  }, n.fn.extend({ find: function find(a) {
	      var b,
	          c = this.length,
	          d = [],
	          e = this;if ("string" != typeof a) return this.pushStack(n(a).filter(function () {
	        for (b = 0; c > b; b++) {
	          if (n.contains(e[b], this)) return !0;
	        }
	      }));for (b = 0; c > b; b++) {
	        n.find(a, e[b], d);
	      }return d = this.pushStack(c > 1 ? n.unique(d) : d), d.selector = this.selector ? this.selector + " " + a : a, d;
	    }, filter: function filter(a) {
	      return this.pushStack(x(this, a || [], !1));
	    }, not: function not(a) {
	      return this.pushStack(x(this, a || [], !0));
	    }, is: function is(a) {
	      return !!x(this, "string" == typeof a && u.test(a) ? n(a) : a || [], !1).length;
	    } });var y,
	      z = /^(?:\s*(<[\w\W]+>)[^>]*|#([\w-]*))$/,
	      A = n.fn.init = function (a, b) {
	    var c, d;if (!a) return this;if ("string" == typeof a) {
	      if ((c = "<" === a[0] && ">" === a[a.length - 1] && a.length >= 3 ? [null, a, null] : z.exec(a), !c || !c[1] && b)) return !b || b.jquery ? (b || y).find(a) : this.constructor(b).find(a);if (c[1]) {
	        if ((b = b instanceof n ? b[0] : b, n.merge(this, n.parseHTML(c[1], b && b.nodeType ? b.ownerDocument || b : l, !0)), v.test(c[1]) && n.isPlainObject(b))) for (c in b) {
	          n.isFunction(this[c]) ? this[c](b[c]) : this.attr(c, b[c]);
	        }return this;
	      }return d = l.getElementById(c[2]), d && d.parentNode && (this.length = 1, this[0] = d), this.context = l, this.selector = a, this;
	    }return a.nodeType ? (this.context = this[0] = a, this.length = 1, this) : n.isFunction(a) ? "undefined" != typeof y.ready ? y.ready(a) : a(n) : (void 0 !== a.selector && (this.selector = a.selector, this.context = a.context), n.makeArray(a, this));
	  };A.prototype = n.fn, y = n(l);var B = /^(?:parents|prev(?:Until|All))/,
	      C = { children: !0, contents: !0, next: !0, prev: !0 };n.extend({ dir: function dir(a, b, c) {
	      var d = [],
	          e = void 0 !== c;while ((a = a[b]) && 9 !== a.nodeType) {
	        if (1 === a.nodeType) {
	          if (e && n(a).is(c)) break;d.push(a);
	        }
	      }return d;
	    }, sibling: function sibling(a, b) {
	      for (var c = []; a; a = a.nextSibling) {
	        1 === a.nodeType && a !== b && c.push(a);
	      }return c;
	    } }), n.fn.extend({ has: function has(a) {
	      var b = n(a, this),
	          c = b.length;return this.filter(function () {
	        for (var a = 0; c > a; a++) {
	          if (n.contains(this, b[a])) return !0;
	        }
	      });
	    }, closest: function closest(a, b) {
	      for (var c, d = 0, e = this.length, f = [], g = u.test(a) || "string" != typeof a ? n(a, b || this.context) : 0; e > d; d++) {
	        for (c = this[d]; c && c !== b; c = c.parentNode) {
	          if (c.nodeType < 11 && (g ? g.index(c) > -1 : 1 === c.nodeType && n.find.matchesSelector(c, a))) {
	            f.push(c);break;
	          }
	        }
	      }return this.pushStack(f.length > 1 ? n.unique(f) : f);
	    }, index: function index(a) {
	      return a ? "string" == typeof a ? g.call(n(a), this[0]) : g.call(this, a.jquery ? a[0] : a) : this[0] && this[0].parentNode ? this.first().prevAll().length : -1;
	    }, add: function add(a, b) {
	      return this.pushStack(n.unique(n.merge(this.get(), n(a, b))));
	    }, addBack: function addBack(a) {
	      return this.add(null == a ? this.prevObject : this.prevObject.filter(a));
	    } });function D(a, b) {
	    while ((a = a[b]) && 1 !== a.nodeType) {}return a;
	  }n.each({ parent: function parent(a) {
	      var b = a.parentNode;return b && 11 !== b.nodeType ? b : null;
	    }, parents: function parents(a) {
	      return n.dir(a, "parentNode");
	    }, parentsUntil: function parentsUntil(a, b, c) {
	      return n.dir(a, "parentNode", c);
	    }, next: function next(a) {
	      return D(a, "nextSibling");
	    }, prev: function prev(a) {
	      return D(a, "previousSibling");
	    }, nextAll: function nextAll(a) {
	      return n.dir(a, "nextSibling");
	    }, prevAll: function prevAll(a) {
	      return n.dir(a, "previousSibling");
	    }, nextUntil: function nextUntil(a, b, c) {
	      return n.dir(a, "nextSibling", c);
	    }, prevUntil: function prevUntil(a, b, c) {
	      return n.dir(a, "previousSibling", c);
	    }, siblings: function siblings(a) {
	      return n.sibling((a.parentNode || {}).firstChild, a);
	    }, children: function children(a) {
	      return n.sibling(a.firstChild);
	    }, contents: function contents(a) {
	      return a.contentDocument || n.merge([], a.childNodes);
	    } }, function (a, b) {
	    n.fn[a] = function (c, d) {
	      var e = n.map(this, b, c);return "Until" !== a.slice(-5) && (d = c), d && "string" == typeof d && (e = n.filter(d, e)), this.length > 1 && (C[a] || n.unique(e), B.test(a) && e.reverse()), this.pushStack(e);
	    };
	  });var E = /\S+/g,
	      F = {};function G(a) {
	    var b = F[a] = {};return n.each(a.match(E) || [], function (a, c) {
	      b[c] = !0;
	    }), b;
	  }n.Callbacks = function (a) {
	    a = "string" == typeof a ? F[a] || G(a) : n.extend({}, a);var b,
	        c,
	        d,
	        e,
	        f,
	        g,
	        h = [],
	        i = !a.once && [],
	        j = function j(l) {
	      for (b = a.memory && l, c = !0, g = e || 0, e = 0, f = h.length, d = !0; h && f > g; g++) {
	        if (h[g].apply(l[0], l[1]) === !1 && a.stopOnFalse) {
	          b = !1;break;
	        }
	      }d = !1, h && (i ? i.length && j(i.shift()) : b ? h = [] : k.disable());
	    },
	        k = { add: function add() {
	        if (h) {
	          var c = h.length;!(function g(b) {
	            n.each(b, function (b, c) {
	              var d = n.type(c);"function" === d ? a.unique && k.has(c) || h.push(c) : c && c.length && "string" !== d && g(c);
	            });
	          })(arguments), d ? f = h.length : b && (e = c, j(b));
	        }return this;
	      }, remove: function remove() {
	        return h && n.each(arguments, function (a, b) {
	          var c;while ((c = n.inArray(b, h, c)) > -1) {
	            h.splice(c, 1), d && (f >= c && f--, g >= c && g--);
	          }
	        }), this;
	      }, has: function has(a) {
	        return a ? n.inArray(a, h) > -1 : !(!h || !h.length);
	      }, empty: function empty() {
	        return h = [], f = 0, this;
	      }, disable: function disable() {
	        return h = i = b = void 0, this;
	      }, disabled: function disabled() {
	        return !h;
	      }, lock: function lock() {
	        return i = void 0, b || k.disable(), this;
	      }, locked: function locked() {
	        return !i;
	      }, fireWith: function fireWith(a, b) {
	        return !h || c && !i || (b = b || [], b = [a, b.slice ? b.slice() : b], d ? i.push(b) : j(b)), this;
	      }, fire: function fire() {
	        return k.fireWith(this, arguments), this;
	      }, fired: function fired() {
	        return !!c;
	      } };return k;
	  }, n.extend({ Deferred: function Deferred(a) {
	      var b = [["resolve", "done", n.Callbacks("once memory"), "resolved"], ["reject", "fail", n.Callbacks("once memory"), "rejected"], ["notify", "progress", n.Callbacks("memory")]],
	          c = "pending",
	          d = { state: function state() {
	          return c;
	        }, always: function always() {
	          return e.done(arguments).fail(arguments), this;
	        }, then: function then() {
	          var a = arguments;return n.Deferred(function (c) {
	            n.each(b, function (b, f) {
	              var g = n.isFunction(a[b]) && a[b];e[f[1]](function () {
	                var a = g && g.apply(this, arguments);a && n.isFunction(a.promise) ? a.promise().done(c.resolve).fail(c.reject).progress(c.notify) : c[f[0] + "With"](this === d ? c.promise() : this, g ? [a] : arguments);
	              });
	            }), a = null;
	          }).promise();
	        }, promise: function promise(a) {
	          return null != a ? n.extend(a, d) : d;
	        } },
	          e = {};return d.pipe = d.then, n.each(b, function (a, f) {
	        var g = f[2],
	            h = f[3];d[f[1]] = g.add, h && g.add(function () {
	          c = h;
	        }, b[1 ^ a][2].disable, b[2][2].lock), e[f[0]] = function () {
	          return e[f[0] + "With"](this === e ? d : this, arguments), this;
	        }, e[f[0] + "With"] = g.fireWith;
	      }), d.promise(e), a && a.call(e, e), e;
	    }, when: function when(a) {
	      var b = 0,
	          c = d.call(arguments),
	          e = c.length,
	          f = 1 !== e || a && n.isFunction(a.promise) ? e : 0,
	          g = 1 === f ? a : n.Deferred(),
	          h = function h(a, b, c) {
	        return function (e) {
	          b[a] = this, c[a] = arguments.length > 1 ? d.call(arguments) : e, c === i ? g.notifyWith(b, c) : --f || g.resolveWith(b, c);
	        };
	      },
	          i,
	          j,
	          k;if (e > 1) for (i = new Array(e), j = new Array(e), k = new Array(e); e > b; b++) {
	        c[b] && n.isFunction(c[b].promise) ? c[b].promise().done(h(b, k, c)).fail(g.reject).progress(h(b, j, i)) : --f;
	      }return f || g.resolveWith(k, c), g.promise();
	    } });var H;n.fn.ready = function (a) {
	    return n.ready.promise().done(a), this;
	  }, n.extend({ isReady: !1, readyWait: 1, holdReady: function holdReady(a) {
	      a ? n.readyWait++ : n.ready(!0);
	    }, ready: function ready(a) {
	      (a === !0 ? --n.readyWait : n.isReady) || (n.isReady = !0, a !== !0 && --n.readyWait > 0 || (H.resolveWith(l, [n]), n.fn.triggerHandler && (n(l).triggerHandler("ready"), n(l).off("ready"))));
	    } });function I() {
	    l.removeEventListener("DOMContentLoaded", I, !1), a.removeEventListener("load", I, !1), n.ready();
	  }n.ready.promise = function (b) {
	    return H || (H = n.Deferred(), "complete" === l.readyState ? setTimeout(n.ready) : (l.addEventListener("DOMContentLoaded", I, !1), a.addEventListener("load", I, !1))), H.promise(b);
	  }, n.ready.promise();var J = n.access = function (a, b, c, d, e, f, g) {
	    var h = 0,
	        i = a.length,
	        j = null == c;if ("object" === n.type(c)) {
	      e = !0;for (h in c) {
	        n.access(a, b, h, c[h], !0, f, g);
	      }
	    } else if (void 0 !== d && (e = !0, n.isFunction(d) || (g = !0), j && (g ? (b.call(a, d), b = null) : (j = b, b = function (a, b, c) {
	      return j.call(n(a), c);
	    })), b)) for (; i > h; h++) {
	      b(a[h], c, g ? d : d.call(a[h], h, b(a[h], c)));
	    }return e ? a : j ? b.call(a) : i ? b(a[0], c) : f;
	  };n.acceptData = function (a) {
	    return 1 === a.nodeType || 9 === a.nodeType || ! +a.nodeType;
	  };function K() {
	    Object.defineProperty(this.cache = {}, 0, { get: function get() {
	        return {};
	      } }), this.expando = n.expando + K.uid++;
	  }K.uid = 1, K.accepts = n.acceptData, K.prototype = { key: function key(a) {
	      if (!K.accepts(a)) return 0;var b = {},
	          c = a[this.expando];if (!c) {
	        c = K.uid++;try {
	          b[this.expando] = { value: c }, Object.defineProperties(a, b);
	        } catch (d) {
	          b[this.expando] = c, n.extend(a, b);
	        }
	      }return this.cache[c] || (this.cache[c] = {}), c;
	    }, set: function set(a, b, c) {
	      var d,
	          e = this.key(a),
	          f = this.cache[e];if ("string" == typeof b) f[b] = c;else if (n.isEmptyObject(f)) n.extend(this.cache[e], b);else for (d in b) {
	        f[d] = b[d];
	      }return f;
	    }, get: function get(a, b) {
	      var c = this.cache[this.key(a)];return void 0 === b ? c : c[b];
	    }, access: function access(a, b, c) {
	      var d;return void 0 === b || b && "string" == typeof b && void 0 === c ? (d = this.get(a, b), void 0 !== d ? d : this.get(a, n.camelCase(b))) : (this.set(a, b, c), void 0 !== c ? c : b);
	    }, remove: function remove(a, b) {
	      var c,
	          d,
	          e,
	          f = this.key(a),
	          g = this.cache[f];if (void 0 === b) this.cache[f] = {};else {
	        n.isArray(b) ? d = b.concat(b.map(n.camelCase)) : (e = n.camelCase(b), b in g ? d = [b, e] : (d = e, d = d in g ? [d] : d.match(E) || [])), c = d.length;while (c--) {
	          delete g[d[c]];
	        }
	      }
	    }, hasData: function hasData(a) {
	      return !n.isEmptyObject(this.cache[a[this.expando]] || {});
	    }, discard: function discard(a) {
	      a[this.expando] && delete this.cache[a[this.expando]];
	    } };var L = new K(),
	      M = new K(),
	      N = /^(?:\{[\w\W]*\}|\[[\w\W]*\])$/,
	      O = /([A-Z])/g;function P(a, b, c) {
	    var d;if (void 0 === c && 1 === a.nodeType) if ((d = "data-" + b.replace(O, "-$1").toLowerCase(), c = a.getAttribute(d), "string" == typeof c)) {
	      try {
	        c = "true" === c ? !0 : "false" === c ? !1 : "null" === c ? null : +c + "" === c ? +c : N.test(c) ? n.parseJSON(c) : c;
	      } catch (e) {}M.set(a, b, c);
	    } else c = void 0;return c;
	  }n.extend({ hasData: function hasData(a) {
	      return M.hasData(a) || L.hasData(a);
	    }, data: function data(a, b, c) {
	      return M.access(a, b, c);
	    }, removeData: function removeData(a, b) {
	      M.remove(a, b);
	    }, _data: function _data(a, b, c) {
	      return L.access(a, b, c);
	    }, _removeData: function _removeData(a, b) {
	      L.remove(a, b);
	    } }), n.fn.extend({ data: function data(a, b) {
	      var c,
	          d,
	          e,
	          f = this[0],
	          g = f && f.attributes;if (void 0 === a) {
	        if (this.length && (e = M.get(f), 1 === f.nodeType && !L.get(f, "hasDataAttrs"))) {
	          c = g.length;while (c--) {
	            g[c] && (d = g[c].name, 0 === d.indexOf("data-") && (d = n.camelCase(d.slice(5)), P(f, d, e[d])));
	          }L.set(f, "hasDataAttrs", !0);
	        }return e;
	      }return "object" == (typeof a === "undefined" ? "undefined" : _typeof(a)) ? this.each(function () {
	        M.set(this, a);
	      }) : J(this, function (b) {
	        var c,
	            d = n.camelCase(a);if (f && void 0 === b) {
	          if ((c = M.get(f, a), void 0 !== c)) return c;if ((c = M.get(f, d), void 0 !== c)) return c;if ((c = P(f, d, void 0), void 0 !== c)) return c;
	        } else this.each(function () {
	          var c = M.get(this, d);M.set(this, d, b), -1 !== a.indexOf("-") && void 0 !== c && M.set(this, a, b);
	        });
	      }, null, b, arguments.length > 1, null, !0);
	    }, removeData: function removeData(a) {
	      return this.each(function () {
	        M.remove(this, a);
	      });
	    } }), n.extend({ queue: function queue(a, b, c) {
	      var d;return a ? (b = (b || "fx") + "queue", d = L.get(a, b), c && (!d || n.isArray(c) ? d = L.access(a, b, n.makeArray(c)) : d.push(c)), d || []) : void 0;
	    }, dequeue: function dequeue(a, b) {
	      b = b || "fx";var c = n.queue(a, b),
	          d = c.length,
	          e = c.shift(),
	          f = n._queueHooks(a, b),
	          g = function g() {
	        n.dequeue(a, b);
	      };"inprogress" === e && (e = c.shift(), d--), e && ("fx" === b && c.unshift("inprogress"), delete f.stop, e.call(a, g, f)), !d && f && f.empty.fire();
	    }, _queueHooks: function _queueHooks(a, b) {
	      var c = b + "queueHooks";return L.get(a, c) || L.access(a, c, { empty: n.Callbacks("once memory").add(function () {
	          L.remove(a, [b + "queue", c]);
	        }) });
	    } }), n.fn.extend({ queue: function queue(a, b) {
	      var c = 2;return "string" != typeof a && (b = a, a = "fx", c--), arguments.length < c ? n.queue(this[0], a) : void 0 === b ? this : this.each(function () {
	        var c = n.queue(this, a, b);n._queueHooks(this, a), "fx" === a && "inprogress" !== c[0] && n.dequeue(this, a);
	      });
	    }, dequeue: function dequeue(a) {
	      return this.each(function () {
	        n.dequeue(this, a);
	      });
	    }, clearQueue: function clearQueue(a) {
	      return this.queue(a || "fx", []);
	    }, promise: function promise(a, b) {
	      var c,
	          d = 1,
	          e = n.Deferred(),
	          f = this,
	          g = this.length,
	          h = function h() {
	        --d || e.resolveWith(f, [f]);
	      };"string" != typeof a && (b = a, a = void 0), a = a || "fx";while (g--) {
	        c = L.get(f[g], a + "queueHooks"), c && c.empty && (d++, c.empty.add(h));
	      }return h(), e.promise(b);
	    } });var Q = /[+-]?(?:\d*\.|)\d+(?:[eE][+-]?\d+|)/.source,
	      R = ["Top", "Right", "Bottom", "Left"],
	      S = function S(a, b) {
	    return a = b || a, "none" === n.css(a, "display") || !n.contains(a.ownerDocument, a);
	  },
	      T = /^(?:checkbox|radio)$/i;!(function () {
	    var a = l.createDocumentFragment(),
	        b = a.appendChild(l.createElement("div")),
	        c = l.createElement("input");c.setAttribute("type", "radio"), c.setAttribute("checked", "checked"), c.setAttribute("name", "t"), b.appendChild(c), k.checkClone = b.cloneNode(!0).cloneNode(!0).lastChild.checked, b.innerHTML = "<textarea>x</textarea>", k.noCloneChecked = !!b.cloneNode(!0).lastChild.defaultValue;
	  })();var U = "undefined";k.focusinBubbles = "onfocusin" in a;var V = /^key/,
	      W = /^(?:mouse|pointer|contextmenu)|click/,
	      X = /^(?:focusinfocus|focusoutblur)$/,
	      Y = /^([^.]*)(?:\.(.+)|)$/;function Z() {
	    return !0;
	  }function $() {
	    return !1;
	  }function _() {
	    try {
	      return l.activeElement;
	    } catch (a) {}
	  }n.event = { global: {}, add: function add(a, b, c, d, e) {
	      var f,
	          g,
	          h,
	          i,
	          j,
	          k,
	          l,
	          m,
	          o,
	          p,
	          q,
	          r = L.get(a);if (r) {
	        c.handler && (f = c, c = f.handler, e = f.selector), c.guid || (c.guid = n.guid++), (i = r.events) || (i = r.events = {}), (g = r.handle) || (g = r.handle = function (b) {
	          return (typeof n === "undefined" ? "undefined" : _typeof(n)) !== U && n.event.triggered !== b.type ? n.event.dispatch.apply(a, arguments) : void 0;
	        }), b = (b || "").match(E) || [""], j = b.length;while (j--) {
	          h = Y.exec(b[j]) || [], o = q = h[1], p = (h[2] || "").split(".").sort(), o && (l = n.event.special[o] || {}, o = (e ? l.delegateType : l.bindType) || o, l = n.event.special[o] || {}, k = n.extend({ type: o, origType: q, data: d, handler: c, guid: c.guid, selector: e, needsContext: e && n.expr.match.needsContext.test(e), namespace: p.join(".") }, f), (m = i[o]) || (m = i[o] = [], m.delegateCount = 0, l.setup && l.setup.call(a, d, p, g) !== !1 || a.addEventListener && a.addEventListener(o, g, !1)), l.add && (l.add.call(a, k), k.handler.guid || (k.handler.guid = c.guid)), e ? m.splice(m.delegateCount++, 0, k) : m.push(k), n.event.global[o] = !0);
	        }
	      }
	    }, remove: function remove(a, b, c, d, e) {
	      var f,
	          g,
	          h,
	          i,
	          j,
	          k,
	          l,
	          m,
	          o,
	          p,
	          q,
	          r = L.hasData(a) && L.get(a);if (r && (i = r.events)) {
	        b = (b || "").match(E) || [""], j = b.length;while (j--) {
	          if ((h = Y.exec(b[j]) || [], o = q = h[1], p = (h[2] || "").split(".").sort(), o)) {
	            l = n.event.special[o] || {}, o = (d ? l.delegateType : l.bindType) || o, m = i[o] || [], h = h[2] && new RegExp("(^|\\.)" + p.join("\\.(?:.*\\.|)") + "(\\.|$)"), g = f = m.length;while (f--) {
	              k = m[f], !e && q !== k.origType || c && c.guid !== k.guid || h && !h.test(k.namespace) || d && d !== k.selector && ("**" !== d || !k.selector) || (m.splice(f, 1), k.selector && m.delegateCount--, l.remove && l.remove.call(a, k));
	            }g && !m.length && (l.teardown && l.teardown.call(a, p, r.handle) !== !1 || n.removeEvent(a, o, r.handle), delete i[o]);
	          } else for (o in i) {
	            n.event.remove(a, o + b[j], c, d, !0);
	          }
	        }n.isEmptyObject(i) && (delete r.handle, L.remove(a, "events"));
	      }
	    }, trigger: function trigger(b, c, d, e) {
	      var f,
	          g,
	          h,
	          i,
	          k,
	          m,
	          o,
	          p = [d || l],
	          q = j.call(b, "type") ? b.type : b,
	          r = j.call(b, "namespace") ? b.namespace.split(".") : [];if ((g = h = d = d || l, 3 !== d.nodeType && 8 !== d.nodeType && !X.test(q + n.event.triggered) && (q.indexOf(".") >= 0 && (r = q.split("."), q = r.shift(), r.sort()), k = q.indexOf(":") < 0 && "on" + q, b = b[n.expando] ? b : new n.Event(q, "object" == (typeof b === "undefined" ? "undefined" : _typeof(b)) && b), b.isTrigger = e ? 2 : 3, b.namespace = r.join("."), b.namespace_re = b.namespace ? new RegExp("(^|\\.)" + r.join("\\.(?:.*\\.|)") + "(\\.|$)") : null, b.result = void 0, b.target || (b.target = d), c = null == c ? [b] : n.makeArray(c, [b]), o = n.event.special[q] || {}, e || !o.trigger || o.trigger.apply(d, c) !== !1))) {
	        if (!e && !o.noBubble && !n.isWindow(d)) {
	          for (i = o.delegateType || q, X.test(i + q) || (g = g.parentNode); g; g = g.parentNode) {
	            p.push(g), h = g;
	          }h === (d.ownerDocument || l) && p.push(h.defaultView || h.parentWindow || a);
	        }f = 0;while ((g = p[f++]) && !b.isPropagationStopped()) {
	          b.type = f > 1 ? i : o.bindType || q, m = (L.get(g, "events") || {})[b.type] && L.get(g, "handle"), m && m.apply(g, c), m = k && g[k], m && m.apply && n.acceptData(g) && (b.result = m.apply(g, c), b.result === !1 && b.preventDefault());
	        }return b.type = q, e || b.isDefaultPrevented() || o._default && o._default.apply(p.pop(), c) !== !1 || !n.acceptData(d) || k && n.isFunction(d[q]) && !n.isWindow(d) && (h = d[k], h && (d[k] = null), n.event.triggered = q, d[q](), n.event.triggered = void 0, h && (d[k] = h)), b.result;
	      }
	    }, dispatch: function dispatch(a) {
	      a = n.event.fix(a);var b,
	          c,
	          e,
	          f,
	          g,
	          h = [],
	          i = d.call(arguments),
	          j = (L.get(this, "events") || {})[a.type] || [],
	          k = n.event.special[a.type] || {};if ((i[0] = a, a.delegateTarget = this, !k.preDispatch || k.preDispatch.call(this, a) !== !1)) {
	        h = n.event.handlers.call(this, a, j), b = 0;while ((f = h[b++]) && !a.isPropagationStopped()) {
	          a.currentTarget = f.elem, c = 0;while ((g = f.handlers[c++]) && !a.isImmediatePropagationStopped()) {
	            (!a.namespace_re || a.namespace_re.test(g.namespace)) && (a.handleObj = g, a.data = g.data, e = ((n.event.special[g.origType] || {}).handle || g.handler).apply(f.elem, i), void 0 !== e && (a.result = e) === !1 && (a.preventDefault(), a.stopPropagation()));
	          }
	        }return k.postDispatch && k.postDispatch.call(this, a), a.result;
	      }
	    }, handlers: function handlers(a, b) {
	      var c,
	          d,
	          e,
	          f,
	          g = [],
	          h = b.delegateCount,
	          i = a.target;if (h && i.nodeType && (!a.button || "click" !== a.type)) for (; i !== this; i = i.parentNode || this) {
	        if (i.disabled !== !0 || "click" !== a.type) {
	          for (d = [], c = 0; h > c; c++) {
	            f = b[c], e = f.selector + " ", void 0 === d[e] && (d[e] = f.needsContext ? n(e, this).index(i) >= 0 : n.find(e, this, null, [i]).length), d[e] && d.push(f);
	          }d.length && g.push({ elem: i, handlers: d });
	        }
	      }return h < b.length && g.push({ elem: this, handlers: b.slice(h) }), g;
	    }, props: "altKey bubbles cancelable ctrlKey currentTarget eventPhase metaKey relatedTarget shiftKey target timeStamp view which".split(" "), fixHooks: {}, keyHooks: { props: "char charCode key keyCode".split(" "), filter: function filter(a, b) {
	        return null == a.which && (a.which = null != b.charCode ? b.charCode : b.keyCode), a;
	      } }, mouseHooks: { props: "button buttons clientX clientY offsetX offsetY pageX pageY screenX screenY toElement".split(" "), filter: function filter(a, b) {
	        var c,
	            d,
	            e,
	            f = b.button;return null == a.pageX && null != b.clientX && (c = a.target.ownerDocument || l, d = c.documentElement, e = c.body, a.pageX = b.clientX + (d && d.scrollLeft || e && e.scrollLeft || 0) - (d && d.clientLeft || e && e.clientLeft || 0), a.pageY = b.clientY + (d && d.scrollTop || e && e.scrollTop || 0) - (d && d.clientTop || e && e.clientTop || 0)), a.which || void 0 === f || (a.which = 1 & f ? 1 : 2 & f ? 3 : 4 & f ? 2 : 0), a;
	      } }, fix: function fix(a) {
	      if (a[n.expando]) return a;var b,
	          c,
	          d,
	          e = a.type,
	          f = a,
	          g = this.fixHooks[e];g || (this.fixHooks[e] = g = W.test(e) ? this.mouseHooks : V.test(e) ? this.keyHooks : {}), d = g.props ? this.props.concat(g.props) : this.props, a = new n.Event(f), b = d.length;while (b--) {
	        c = d[b], a[c] = f[c];
	      }return a.target || (a.target = l), 3 === a.target.nodeType && (a.target = a.target.parentNode), g.filter ? g.filter(a, f) : a;
	    }, special: { load: { noBubble: !0 }, focus: { trigger: function trigger() {
	          return this !== _() && this.focus ? (this.focus(), !1) : void 0;
	        }, delegateType: "focusin" }, blur: { trigger: function trigger() {
	          return this === _() && this.blur ? (this.blur(), !1) : void 0;
	        }, delegateType: "focusout" }, click: { trigger: function trigger() {
	          return "checkbox" === this.type && this.click && n.nodeName(this, "input") ? (this.click(), !1) : void 0;
	        }, _default: function _default(a) {
	          return n.nodeName(a.target, "a");
	        } }, beforeunload: { postDispatch: function postDispatch(a) {
	          void 0 !== a.result && a.originalEvent && (a.originalEvent.returnValue = a.result);
	        } } }, simulate: function simulate(a, b, c, d) {
	      var e = n.extend(new n.Event(), c, { type: a, isSimulated: !0, originalEvent: {} });d ? n.event.trigger(e, null, b) : n.event.dispatch.call(b, e), e.isDefaultPrevented() && c.preventDefault();
	    } }, n.removeEvent = function (a, b, c) {
	    a.removeEventListener && a.removeEventListener(b, c, !1);
	  }, n.Event = function (a, b) {
	    return this instanceof n.Event ? (a && a.type ? (this.originalEvent = a, this.type = a.type, this.isDefaultPrevented = a.defaultPrevented || void 0 === a.defaultPrevented && a.returnValue === !1 ? Z : $) : this.type = a, b && n.extend(this, b), this.timeStamp = a && a.timeStamp || n.now(), void (this[n.expando] = !0)) : new n.Event(a, b);
	  }, n.Event.prototype = { isDefaultPrevented: $, isPropagationStopped: $, isImmediatePropagationStopped: $, preventDefault: function preventDefault() {
	      var a = this.originalEvent;this.isDefaultPrevented = Z, a && a.preventDefault && a.preventDefault();
	    }, stopPropagation: function stopPropagation() {
	      var a = this.originalEvent;this.isPropagationStopped = Z, a && a.stopPropagation && a.stopPropagation();
	    }, stopImmediatePropagation: function stopImmediatePropagation() {
	      var a = this.originalEvent;this.isImmediatePropagationStopped = Z, a && a.stopImmediatePropagation && a.stopImmediatePropagation(), this.stopPropagation();
	    } }, n.each({ mouseenter: "mouseover", mouseleave: "mouseout", pointerenter: "pointerover", pointerleave: "pointerout" }, function (a, b) {
	    n.event.special[a] = { delegateType: b, bindType: b, handle: function handle(a) {
	        var c,
	            d = this,
	            e = a.relatedTarget,
	            f = a.handleObj;return (!e || e !== d && !n.contains(d, e)) && (a.type = f.origType, c = f.handler.apply(this, arguments), a.type = b), c;
	      } };
	  }), k.focusinBubbles || n.each({ focus: "focusin", blur: "focusout" }, function (a, b) {
	    var c = function c(a) {
	      n.event.simulate(b, a.target, n.event.fix(a), !0);
	    };n.event.special[b] = { setup: function setup() {
	        var d = this.ownerDocument || this,
	            e = L.access(d, b);e || d.addEventListener(a, c, !0), L.access(d, b, (e || 0) + 1);
	      }, teardown: function teardown() {
	        var d = this.ownerDocument || this,
	            e = L.access(d, b) - 1;e ? L.access(d, b, e) : (d.removeEventListener(a, c, !0), L.remove(d, b));
	      } };
	  }), n.fn.extend({ on: function on(a, b, c, d, e) {
	      var f, g;if ("object" == (typeof a === "undefined" ? "undefined" : _typeof(a))) {
	        "string" != typeof b && (c = c || b, b = void 0);for (g in a) {
	          this.on(g, b, c, a[g], e);
	        }return this;
	      }if ((null == c && null == d ? (d = b, c = b = void 0) : null == d && ("string" == typeof b ? (d = c, c = void 0) : (d = c, c = b, b = void 0)), d === !1)) d = $;else if (!d) return this;return 1 === e && (f = d, d = function (a) {
	        return n().off(a), f.apply(this, arguments);
	      }, d.guid = f.guid || (f.guid = n.guid++)), this.each(function () {
	        n.event.add(this, a, d, c, b);
	      });
	    }, one: function one(a, b, c, d) {
	      return this.on(a, b, c, d, 1);
	    }, off: function off(a, b, c) {
	      var d, e;if (a && a.preventDefault && a.handleObj) return d = a.handleObj, n(a.delegateTarget).off(d.namespace ? d.origType + "." + d.namespace : d.origType, d.selector, d.handler), this;if ("object" == (typeof a === "undefined" ? "undefined" : _typeof(a))) {
	        for (e in a) {
	          this.off(e, b, a[e]);
	        }return this;
	      }return (b === !1 || "function" == typeof b) && (c = b, b = void 0), c === !1 && (c = $), this.each(function () {
	        n.event.remove(this, a, c, b);
	      });
	    }, trigger: function trigger(a, b) {
	      return this.each(function () {
	        n.event.trigger(a, b, this);
	      });
	    }, triggerHandler: function triggerHandler(a, b) {
	      var c = this[0];return c ? n.event.trigger(a, b, c, !0) : void 0;
	    } });var ab = /<(?!area|br|col|embed|hr|img|input|link|meta|param)(([\w:]+)[^>]*)\/>/gi,
	      bb = /<([\w:]+)/,
	      cb = /<|&#?\w+;/,
	      db = /<(?:script|style|link)/i,
	      eb = /checked\s*(?:[^=]|=\s*.checked.)/i,
	      fb = /^$|\/(?:java|ecma)script/i,
	      gb = /^true\/(.*)/,
	      hb = /^\s*<!(?:\[CDATA\[|--)|(?:\]\]|--)>\s*$/g,
	      ib = { option: [1, "<select multiple='multiple'>", "</select>"], thead: [1, "<table>", "</table>"], col: [2, "<table><colgroup>", "</colgroup></table>"], tr: [2, "<table><tbody>", "</tbody></table>"], td: [3, "<table><tbody><tr>", "</tr></tbody></table>"], _default: [0, "", ""] };ib.optgroup = ib.option, ib.tbody = ib.tfoot = ib.colgroup = ib.caption = ib.thead, ib.th = ib.td;function jb(a, b) {
	    return n.nodeName(a, "table") && n.nodeName(11 !== b.nodeType ? b : b.firstChild, "tr") ? a.getElementsByTagName("tbody")[0] || a.appendChild(a.ownerDocument.createElement("tbody")) : a;
	  }function kb(a) {
	    return a.type = (null !== a.getAttribute("type")) + "/" + a.type, a;
	  }function lb(a) {
	    var b = gb.exec(a.type);return b ? a.type = b[1] : a.removeAttribute("type"), a;
	  }function mb(a, b) {
	    for (var c = 0, d = a.length; d > c; c++) {
	      L.set(a[c], "globalEval", !b || L.get(b[c], "globalEval"));
	    }
	  }function nb(a, b) {
	    var c, d, e, f, g, h, i, j;if (1 === b.nodeType) {
	      if (L.hasData(a) && (f = L.access(a), g = L.set(b, f), j = f.events)) {
	        delete g.handle, g.events = {};for (e in j) {
	          for (c = 0, d = j[e].length; d > c; c++) {
	            n.event.add(b, e, j[e][c]);
	          }
	        }
	      }M.hasData(a) && (h = M.access(a), i = n.extend({}, h), M.set(b, i));
	    }
	  }function ob(a, b) {
	    var c = a.getElementsByTagName ? a.getElementsByTagName(b || "*") : a.querySelectorAll ? a.querySelectorAll(b || "*") : [];return void 0 === b || b && n.nodeName(a, b) ? n.merge([a], c) : c;
	  }function pb(a, b) {
	    var c = b.nodeName.toLowerCase();"input" === c && T.test(a.type) ? b.checked = a.checked : ("input" === c || "textarea" === c) && (b.defaultValue = a.defaultValue);
	  }n.extend({ clone: function clone(a, b, c) {
	      var d,
	          e,
	          f,
	          g,
	          h = a.cloneNode(!0),
	          i = n.contains(a.ownerDocument, a);if (!(k.noCloneChecked || 1 !== a.nodeType && 11 !== a.nodeType || n.isXMLDoc(a))) for (g = ob(h), f = ob(a), d = 0, e = f.length; e > d; d++) {
	        pb(f[d], g[d]);
	      }if (b) if (c) for (f = f || ob(a), g = g || ob(h), d = 0, e = f.length; e > d; d++) {
	        nb(f[d], g[d]);
	      } else nb(a, h);return g = ob(h, "script"), g.length > 0 && mb(g, !i && ob(a, "script")), h;
	    }, buildFragment: function buildFragment(a, b, c, d) {
	      for (var e, f, g, h, i, j, k = b.createDocumentFragment(), l = [], m = 0, o = a.length; o > m; m++) {
	        if ((e = a[m], e || 0 === e)) if ("object" === n.type(e)) n.merge(l, e.nodeType ? [e] : e);else if (cb.test(e)) {
	          f = f || k.appendChild(b.createElement("div")), g = (bb.exec(e) || ["", ""])[1].toLowerCase(), h = ib[g] || ib._default, f.innerHTML = h[1] + e.replace(ab, "<$1></$2>") + h[2], j = h[0];while (j--) {
	            f = f.lastChild;
	          }n.merge(l, f.childNodes), f = k.firstChild, f.textContent = "";
	        } else l.push(b.createTextNode(e));
	      }k.textContent = "", m = 0;while (e = l[m++]) {
	        if ((!d || -1 === n.inArray(e, d)) && (i = n.contains(e.ownerDocument, e), f = ob(k.appendChild(e), "script"), i && mb(f), c)) {
	          j = 0;while (e = f[j++]) {
	            fb.test(e.type || "") && c.push(e);
	          }
	        }
	      }return k;
	    }, cleanData: function cleanData(a) {
	      for (var b, c, d, e, f = n.event.special, g = 0; void 0 !== (c = a[g]); g++) {
	        if (n.acceptData(c) && (e = c[L.expando], e && (b = L.cache[e]))) {
	          if (b.events) for (d in b.events) {
	            f[d] ? n.event.remove(c, d) : n.removeEvent(c, d, b.handle);
	          }L.cache[e] && delete L.cache[e];
	        }delete M.cache[c[M.expando]];
	      }
	    } }), n.fn.extend({ text: function text(a) {
	      return J(this, function (a) {
	        return void 0 === a ? n.text(this) : this.empty().each(function () {
	          (1 === this.nodeType || 11 === this.nodeType || 9 === this.nodeType) && (this.textContent = a);
	        });
	      }, null, a, arguments.length);
	    }, append: function append() {
	      return this.domManip(arguments, function (a) {
	        if (1 === this.nodeType || 11 === this.nodeType || 9 === this.nodeType) {
	          var b = jb(this, a);b.appendChild(a);
	        }
	      });
	    }, prepend: function prepend() {
	      return this.domManip(arguments, function (a) {
	        if (1 === this.nodeType || 11 === this.nodeType || 9 === this.nodeType) {
	          var b = jb(this, a);b.insertBefore(a, b.firstChild);
	        }
	      });
	    }, before: function before() {
	      return this.domManip(arguments, function (a) {
	        this.parentNode && this.parentNode.insertBefore(a, this);
	      });
	    }, after: function after() {
	      return this.domManip(arguments, function (a) {
	        this.parentNode && this.parentNode.insertBefore(a, this.nextSibling);
	      });
	    }, remove: function remove(a, b) {
	      for (var c, d = a ? n.filter(a, this) : this, e = 0; null != (c = d[e]); e++) {
	        b || 1 !== c.nodeType || n.cleanData(ob(c)), c.parentNode && (b && n.contains(c.ownerDocument, c) && mb(ob(c, "script")), c.parentNode.removeChild(c));
	      }return this;
	    }, empty: function empty() {
	      for (var a, b = 0; null != (a = this[b]); b++) {
	        1 === a.nodeType && (n.cleanData(ob(a, !1)), a.textContent = "");
	      }return this;
	    }, clone: function clone(a, b) {
	      return a = null == a ? !1 : a, b = null == b ? a : b, this.map(function () {
	        return n.clone(this, a, b);
	      });
	    }, html: function html(a) {
	      return J(this, function (a) {
	        var b = this[0] || {},
	            c = 0,
	            d = this.length;if (void 0 === a && 1 === b.nodeType) return b.innerHTML;if ("string" == typeof a && !db.test(a) && !ib[(bb.exec(a) || ["", ""])[1].toLowerCase()]) {
	          a = a.replace(ab, "<$1></$2>");try {
	            for (; d > c; c++) {
	              b = this[c] || {}, 1 === b.nodeType && (n.cleanData(ob(b, !1)), b.innerHTML = a);
	            }b = 0;
	          } catch (e) {}
	        }b && this.empty().append(a);
	      }, null, a, arguments.length);
	    }, replaceWith: function replaceWith() {
	      var a = arguments[0];return this.domManip(arguments, function (b) {
	        a = this.parentNode, n.cleanData(ob(this)), a && a.replaceChild(b, this);
	      }), a && (a.length || a.nodeType) ? this : this.remove();
	    }, detach: function detach(a) {
	      return this.remove(a, !0);
	    }, domManip: function domManip(a, b) {
	      a = e.apply([], a);var c,
	          d,
	          f,
	          g,
	          h,
	          i,
	          j = 0,
	          l = this.length,
	          m = this,
	          o = l - 1,
	          p = a[0],
	          q = n.isFunction(p);if (q || l > 1 && "string" == typeof p && !k.checkClone && eb.test(p)) return this.each(function (c) {
	        var d = m.eq(c);q && (a[0] = p.call(this, c, d.html())), d.domManip(a, b);
	      });if (l && (c = n.buildFragment(a, this[0].ownerDocument, !1, this), d = c.firstChild, 1 === c.childNodes.length && (c = d), d)) {
	        for (f = n.map(ob(c, "script"), kb), g = f.length; l > j; j++) {
	          h = c, j !== o && (h = n.clone(h, !0, !0), g && n.merge(f, ob(h, "script"))), b.call(this[j], h, j);
	        }if (g) for (i = f[f.length - 1].ownerDocument, n.map(f, lb), j = 0; g > j; j++) {
	          h = f[j], fb.test(h.type || "") && !L.access(h, "globalEval") && n.contains(i, h) && (h.src ? n._evalUrl && n._evalUrl(h.src) : n.globalEval(h.textContent.replace(hb, "")));
	        }
	      }return this;
	    } }), n.each({ appendTo: "append", prependTo: "prepend", insertBefore: "before", insertAfter: "after", replaceAll: "replaceWith" }, function (a, b) {
	    n.fn[a] = function (a) {
	      for (var c, d = [], e = n(a), g = e.length - 1, h = 0; g >= h; h++) {
	        c = h === g ? this : this.clone(!0), n(e[h])[b](c), f.apply(d, c.get());
	      }return this.pushStack(d);
	    };
	  });var qb,
	      rb = {};function sb(b, c) {
	    var d,
	        e = n(c.createElement(b)).appendTo(c.body),
	        f = a.getDefaultComputedStyle && (d = a.getDefaultComputedStyle(e[0])) ? d.display : n.css(e[0], "display");return e.detach(), f;
	  }function tb(a) {
	    var b = l,
	        c = rb[a];return c || (c = sb(a, b), "none" !== c && c || (qb = (qb || n("<iframe frameborder='0' width='0' height='0'/>")).appendTo(b.documentElement), b = qb[0].contentDocument, b.write(), b.close(), c = sb(a, b), qb.detach()), rb[a] = c), c;
	  }var ub = /^margin/,
	      vb = new RegExp("^(" + Q + ")(?!px)[a-z%]+$", "i"),
	      wb = function wb(b) {
	    return b.ownerDocument.defaultView.opener ? b.ownerDocument.defaultView.getComputedStyle(b, null) : a.getComputedStyle(b, null);
	  };function xb(a, b, c) {
	    var d,
	        e,
	        f,
	        g,
	        h = a.style;return c = c || wb(a), c && (g = c.getPropertyValue(b) || c[b]), c && ("" !== g || n.contains(a.ownerDocument, a) || (g = n.style(a, b)), vb.test(g) && ub.test(b) && (d = h.width, e = h.minWidth, f = h.maxWidth, h.minWidth = h.maxWidth = h.width = g, g = c.width, h.width = d, h.minWidth = e, h.maxWidth = f)), void 0 !== g ? g + "" : g;
	  }function yb(a, b) {
	    return { get: function get() {
	        return a() ? void delete this.get : (this.get = b).apply(this, arguments);
	      } };
	  }!(function () {
	    var b,
	        c,
	        d = l.documentElement,
	        e = l.createElement("div"),
	        f = l.createElement("div");if (f.style) {
	      (function () {
	        var g = function g() {
	          f.style.cssText = "-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;display:block;margin-top:1%;top:1%;border:1px;padding:1px;width:4px;position:absolute", f.innerHTML = "", d.appendChild(e);var g = a.getComputedStyle(f, null);b = "1%" !== g.top, c = "4px" === g.width, d.removeChild(e);
	        };

	        f.style.backgroundClip = "content-box", f.cloneNode(!0).style.backgroundClip = "", k.clearCloneStyle = "content-box" === f.style.backgroundClip, e.style.cssText = "border:0;width:0;height:0;top:0;left:-9999px;margin-top:1px;position:absolute", e.appendChild(f);a.getComputedStyle && n.extend(k, { pixelPosition: function pixelPosition() {
	            return g(), b;
	          }, boxSizingReliable: function boxSizingReliable() {
	            return null == c && g(), c;
	          }, reliableMarginRight: function reliableMarginRight() {
	            var b,
	                c = f.appendChild(l.createElement("div"));return c.style.cssText = f.style.cssText = "-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box;display:block;margin:0;border:0;padding:0", c.style.marginRight = c.style.width = "0", f.style.width = "1px", d.appendChild(e), b = !parseFloat(a.getComputedStyle(c, null).marginRight), d.removeChild(e), f.removeChild(c), b;
	          } });
	      })();
	    }
	  })(), n.swap = function (a, b, c, d) {
	    var e,
	        f,
	        g = {};for (f in b) {
	      g[f] = a.style[f], a.style[f] = b[f];
	    }e = c.apply(a, d || []);for (f in b) {
	      a.style[f] = g[f];
	    }return e;
	  };var zb = /^(none|table(?!-c[ea]).+)/,
	      Ab = new RegExp("^(" + Q + ")(.*)$", "i"),
	      Bb = new RegExp("^([+-])=(" + Q + ")", "i"),
	      Cb = { position: "absolute", visibility: "hidden", display: "block" },
	      Db = { letterSpacing: "0", fontWeight: "400" },
	      Eb = ["Webkit", "O", "Moz", "ms"];function Fb(a, b) {
	    if (b in a) return b;var c = b[0].toUpperCase() + b.slice(1),
	        d = b,
	        e = Eb.length;while (e--) {
	      if ((b = Eb[e] + c, b in a)) return b;
	    }return d;
	  }function Gb(a, b, c) {
	    var d = Ab.exec(b);return d ? Math.max(0, d[1] - (c || 0)) + (d[2] || "px") : b;
	  }function Hb(a, b, c, d, e) {
	    for (var f = c === (d ? "border" : "content") ? 4 : "width" === b ? 1 : 0, g = 0; 4 > f; f += 2) {
	      "margin" === c && (g += n.css(a, c + R[f], !0, e)), d ? ("content" === c && (g -= n.css(a, "padding" + R[f], !0, e)), "margin" !== c && (g -= n.css(a, "border" + R[f] + "Width", !0, e))) : (g += n.css(a, "padding" + R[f], !0, e), "padding" !== c && (g += n.css(a, "border" + R[f] + "Width", !0, e)));
	    }return g;
	  }function Ib(a, b, c) {
	    var d = !0,
	        e = "width" === b ? a.offsetWidth : a.offsetHeight,
	        f = wb(a),
	        g = "border-box" === n.css(a, "boxSizing", !1, f);if (0 >= e || null == e) {
	      if ((e = xb(a, b, f), (0 > e || null == e) && (e = a.style[b]), vb.test(e))) return e;d = g && (k.boxSizingReliable() || e === a.style[b]), e = parseFloat(e) || 0;
	    }return e + Hb(a, b, c || (g ? "border" : "content"), d, f) + "px";
	  }function Jb(a, b) {
	    for (var c, d, e, f = [], g = 0, h = a.length; h > g; g++) {
	      d = a[g], d.style && (f[g] = L.get(d, "olddisplay"), c = d.style.display, b ? (f[g] || "none" !== c || (d.style.display = ""), "" === d.style.display && S(d) && (f[g] = L.access(d, "olddisplay", tb(d.nodeName)))) : (e = S(d), "none" === c && e || L.set(d, "olddisplay", e ? c : n.css(d, "display"))));
	    }for (g = 0; h > g; g++) {
	      d = a[g], d.style && (b && "none" !== d.style.display && "" !== d.style.display || (d.style.display = b ? f[g] || "" : "none"));
	    }return a;
	  }n.extend({ cssHooks: { opacity: { get: function get(a, b) {
	          if (b) {
	            var c = xb(a, "opacity");return "" === c ? "1" : c;
	          }
	        } } }, cssNumber: { columnCount: !0, fillOpacity: !0, flexGrow: !0, flexShrink: !0, fontWeight: !0, lineHeight: !0, opacity: !0, order: !0, orphans: !0, widows: !0, zIndex: !0, zoom: !0 }, cssProps: { "float": "cssFloat" }, style: function style(a, b, c, d) {
	      if (a && 3 !== a.nodeType && 8 !== a.nodeType && a.style) {
	        var e,
	            f,
	            g,
	            h = n.camelCase(b),
	            i = a.style;return b = n.cssProps[h] || (n.cssProps[h] = Fb(i, h)), g = n.cssHooks[b] || n.cssHooks[h], void 0 === c ? g && "get" in g && void 0 !== (e = g.get(a, !1, d)) ? e : i[b] : (f = typeof c === "undefined" ? "undefined" : _typeof(c), "string" === f && (e = Bb.exec(c)) && (c = (e[1] + 1) * e[2] + parseFloat(n.css(a, b)), f = "number"), null != c && c === c && ("number" !== f || n.cssNumber[h] || (c += "px"), k.clearCloneStyle || "" !== c || 0 !== b.indexOf("background") || (i[b] = "inherit"), g && "set" in g && void 0 === (c = g.set(a, c, d)) || (i[b] = c)), void 0);
	      }
	    }, css: function css(a, b, c, d) {
	      var e,
	          f,
	          g,
	          h = n.camelCase(b);return b = n.cssProps[h] || (n.cssProps[h] = Fb(a.style, h)), g = n.cssHooks[b] || n.cssHooks[h], g && "get" in g && (e = g.get(a, !0, c)), void 0 === e && (e = xb(a, b, d)), "normal" === e && b in Db && (e = Db[b]), "" === c || c ? (f = parseFloat(e), c === !0 || n.isNumeric(f) ? f || 0 : e) : e;
	    } }), n.each(["height", "width"], function (a, b) {
	    n.cssHooks[b] = { get: function get(a, c, d) {
	        return c ? zb.test(n.css(a, "display")) && 0 === a.offsetWidth ? n.swap(a, Cb, function () {
	          return Ib(a, b, d);
	        }) : Ib(a, b, d) : void 0;
	      }, set: function set(a, c, d) {
	        var e = d && wb(a);return Gb(a, c, d ? Hb(a, b, d, "border-box" === n.css(a, "boxSizing", !1, e), e) : 0);
	      } };
	  }), n.cssHooks.marginRight = yb(k.reliableMarginRight, function (a, b) {
	    return b ? n.swap(a, { display: "inline-block" }, xb, [a, "marginRight"]) : void 0;
	  }), n.each({ margin: "", padding: "", border: "Width" }, function (a, b) {
	    n.cssHooks[a + b] = { expand: function expand(c) {
	        for (var d = 0, e = {}, f = "string" == typeof c ? c.split(" ") : [c]; 4 > d; d++) {
	          e[a + R[d] + b] = f[d] || f[d - 2] || f[0];
	        }return e;
	      } }, ub.test(a) || (n.cssHooks[a + b].set = Gb);
	  }), n.fn.extend({ css: function css(a, b) {
	      return J(this, function (a, b, c) {
	        var d,
	            e,
	            f = {},
	            g = 0;if (n.isArray(b)) {
	          for (d = wb(a), e = b.length; e > g; g++) {
	            f[b[g]] = n.css(a, b[g], !1, d);
	          }return f;
	        }return void 0 !== c ? n.style(a, b, c) : n.css(a, b);
	      }, a, b, arguments.length > 1);
	    }, show: function show() {
	      return Jb(this, !0);
	    }, hide: function hide() {
	      return Jb(this);
	    }, toggle: function toggle(a) {
	      return "boolean" == typeof a ? a ? this.show() : this.hide() : this.each(function () {
	        S(this) ? n(this).show() : n(this).hide();
	      });
	    } });function Kb(a, b, c, d, e) {
	    return new Kb.prototype.init(a, b, c, d, e);
	  }n.Tween = Kb, Kb.prototype = { constructor: Kb, init: function init(a, b, c, d, e, f) {
	      this.elem = a, this.prop = c, this.easing = e || "swing", this.options = b, this.start = this.now = this.cur(), this.end = d, this.unit = f || (n.cssNumber[c] ? "" : "px");
	    }, cur: function cur() {
	      var a = Kb.propHooks[this.prop];return a && a.get ? a.get(this) : Kb.propHooks._default.get(this);
	    }, run: function run(a) {
	      var b,
	          c = Kb.propHooks[this.prop];return this.pos = b = this.options.duration ? n.easing[this.easing](a, this.options.duration * a, 0, 1, this.options.duration) : a, this.now = (this.end - this.start) * b + this.start, this.options.step && this.options.step.call(this.elem, this.now, this), c && c.set ? c.set(this) : Kb.propHooks._default.set(this), this;
	    } }, Kb.prototype.init.prototype = Kb.prototype, Kb.propHooks = { _default: { get: function get(a) {
	        var b;return null == a.elem[a.prop] || a.elem.style && null != a.elem.style[a.prop] ? (b = n.css(a.elem, a.prop, ""), b && "auto" !== b ? b : 0) : a.elem[a.prop];
	      }, set: function set(a) {
	        n.fx.step[a.prop] ? n.fx.step[a.prop](a) : a.elem.style && (null != a.elem.style[n.cssProps[a.prop]] || n.cssHooks[a.prop]) ? n.style(a.elem, a.prop, a.now + a.unit) : a.elem[a.prop] = a.now;
	      } } }, Kb.propHooks.scrollTop = Kb.propHooks.scrollLeft = { set: function set(a) {
	      a.elem.nodeType && a.elem.parentNode && (a.elem[a.prop] = a.now);
	    } }, n.easing = { linear: function linear(a) {
	      return a;
	    }, swing: function swing(a) {
	      return .5 - Math.cos(a * Math.PI) / 2;
	    } }, n.fx = Kb.prototype.init, n.fx.step = {};var Lb,
	      Mb,
	      Nb = /^(?:toggle|show|hide)$/,
	      Ob = new RegExp("^(?:([+-])=|)(" + Q + ")([a-z%]*)$", "i"),
	      Pb = /queueHooks$/,
	      Qb = [Vb],
	      Rb = { "*": [function (a, b) {
	      var c = this.createTween(a, b),
	          d = c.cur(),
	          e = Ob.exec(b),
	          f = e && e[3] || (n.cssNumber[a] ? "" : "px"),
	          g = (n.cssNumber[a] || "px" !== f && +d) && Ob.exec(n.css(c.elem, a)),
	          h = 1,
	          i = 20;if (g && g[3] !== f) {
	        f = f || g[3], e = e || [], g = +d || 1;do {
	          h = h || ".5", g /= h, n.style(c.elem, a, g + f);
	        } while (h !== (h = c.cur() / d) && 1 !== h && --i);
	      }return e && (g = c.start = +g || +d || 0, c.unit = f, c.end = e[1] ? g + (e[1] + 1) * e[2] : +e[2]), c;
	    }] };function Sb() {
	    return setTimeout(function () {
	      Lb = void 0;
	    }), Lb = n.now();
	  }function Tb(a, b) {
	    var c,
	        d = 0,
	        e = { height: a };for (b = b ? 1 : 0; 4 > d; d += 2 - b) {
	      c = R[d], e["margin" + c] = e["padding" + c] = a;
	    }return b && (e.opacity = e.width = a), e;
	  }function Ub(a, b, c) {
	    for (var d, e = (Rb[b] || []).concat(Rb["*"]), f = 0, g = e.length; g > f; f++) {
	      if (d = e[f].call(c, b, a)) return d;
	    }
	  }function Vb(a, b, c) {
	    var d,
	        e,
	        f,
	        g,
	        h,
	        i,
	        j,
	        k,
	        l = this,
	        m = {},
	        o = a.style,
	        p = a.nodeType && S(a),
	        q = L.get(a, "fxshow");c.queue || (h = n._queueHooks(a, "fx"), null == h.unqueued && (h.unqueued = 0, i = h.empty.fire, h.empty.fire = function () {
	      h.unqueued || i();
	    }), h.unqueued++, l.always(function () {
	      l.always(function () {
	        h.unqueued--, n.queue(a, "fx").length || h.empty.fire();
	      });
	    })), 1 === a.nodeType && ("height" in b || "width" in b) && (c.overflow = [o.overflow, o.overflowX, o.overflowY], j = n.css(a, "display"), k = "none" === j ? L.get(a, "olddisplay") || tb(a.nodeName) : j, "inline" === k && "none" === n.css(a, "float") && (o.display = "inline-block")), c.overflow && (o.overflow = "hidden", l.always(function () {
	      o.overflow = c.overflow[0], o.overflowX = c.overflow[1], o.overflowY = c.overflow[2];
	    }));for (d in b) {
	      if ((e = b[d], Nb.exec(e))) {
	        if ((delete b[d], f = f || "toggle" === e, e === (p ? "hide" : "show"))) {
	          if ("show" !== e || !q || void 0 === q[d]) continue;p = !0;
	        }m[d] = q && q[d] || n.style(a, d);
	      } else j = void 0;
	    }if (n.isEmptyObject(m)) "inline" === ("none" === j ? tb(a.nodeName) : j) && (o.display = j);else {
	      q ? "hidden" in q && (p = q.hidden) : q = L.access(a, "fxshow", {}), f && (q.hidden = !p), p ? n(a).show() : l.done(function () {
	        n(a).hide();
	      }), l.done(function () {
	        var b;L.remove(a, "fxshow");for (b in m) {
	          n.style(a, b, m[b]);
	        }
	      });for (d in m) {
	        g = Ub(p ? q[d] : 0, d, l), d in q || (q[d] = g.start, p && (g.end = g.start, g.start = "width" === d || "height" === d ? 1 : 0));
	      }
	    }
	  }function Wb(a, b) {
	    var c, d, e, f, g;for (c in a) {
	      if ((d = n.camelCase(c), e = b[d], f = a[c], n.isArray(f) && (e = f[1], f = a[c] = f[0]), c !== d && (a[d] = f, delete a[c]), g = n.cssHooks[d], g && "expand" in g)) {
	        f = g.expand(f), delete a[d];for (c in f) {
	          c in a || (a[c] = f[c], b[c] = e);
	        }
	      } else b[d] = e;
	    }
	  }function Xb(a, b, c) {
	    var d,
	        e,
	        f = 0,
	        g = Qb.length,
	        h = n.Deferred().always(function () {
	      delete i.elem;
	    }),
	        i = function i() {
	      if (e) return !1;for (var b = Lb || Sb(), c = Math.max(0, j.startTime + j.duration - b), d = c / j.duration || 0, f = 1 - d, g = 0, i = j.tweens.length; i > g; g++) {
	        j.tweens[g].run(f);
	      }return h.notifyWith(a, [j, f, c]), 1 > f && i ? c : (h.resolveWith(a, [j]), !1);
	    },
	        j = h.promise({ elem: a, props: n.extend({}, b), opts: n.extend(!0, { specialEasing: {} }, c), originalProperties: b, originalOptions: c, startTime: Lb || Sb(), duration: c.duration, tweens: [], createTween: function createTween(b, c) {
	        var d = n.Tween(a, j.opts, b, c, j.opts.specialEasing[b] || j.opts.easing);return j.tweens.push(d), d;
	      }, stop: function stop(b) {
	        var c = 0,
	            d = b ? j.tweens.length : 0;if (e) return this;for (e = !0; d > c; c++) {
	          j.tweens[c].run(1);
	        }return b ? h.resolveWith(a, [j, b]) : h.rejectWith(a, [j, b]), this;
	      } }),
	        k = j.props;for (Wb(k, j.opts.specialEasing); g > f; f++) {
	      if (d = Qb[f].call(j, a, k, j.opts)) return d;
	    }return n.map(k, Ub, j), n.isFunction(j.opts.start) && j.opts.start.call(a, j), n.fx.timer(n.extend(i, { elem: a, anim: j, queue: j.opts.queue })), j.progress(j.opts.progress).done(j.opts.done, j.opts.complete).fail(j.opts.fail).always(j.opts.always);
	  }n.Animation = n.extend(Xb, { tweener: function tweener(a, b) {
	      n.isFunction(a) ? (b = a, a = ["*"]) : a = a.split(" ");for (var c, d = 0, e = a.length; e > d; d++) {
	        c = a[d], Rb[c] = Rb[c] || [], Rb[c].unshift(b);
	      }
	    }, prefilter: function prefilter(a, b) {
	      b ? Qb.unshift(a) : Qb.push(a);
	    } }), n.speed = function (a, b, c) {
	    var d = a && "object" == (typeof a === "undefined" ? "undefined" : _typeof(a)) ? n.extend({}, a) : { complete: c || !c && b || n.isFunction(a) && a, duration: a, easing: c && b || b && !n.isFunction(b) && b };return d.duration = n.fx.off ? 0 : "number" == typeof d.duration ? d.duration : d.duration in n.fx.speeds ? n.fx.speeds[d.duration] : n.fx.speeds._default, (null == d.queue || d.queue === !0) && (d.queue = "fx"), d.old = d.complete, d.complete = function () {
	      n.isFunction(d.old) && d.old.call(this), d.queue && n.dequeue(this, d.queue);
	    }, d;
	  }, n.fn.extend({ fadeTo: function fadeTo(a, b, c, d) {
	      return this.filter(S).css("opacity", 0).show().end().animate({ opacity: b }, a, c, d);
	    }, animate: function animate(a, b, c, d) {
	      var e = n.isEmptyObject(a),
	          f = n.speed(b, c, d),
	          g = function g() {
	        var b = Xb(this, n.extend({}, a), f);(e || L.get(this, "finish")) && b.stop(!0);
	      };return g.finish = g, e || f.queue === !1 ? this.each(g) : this.queue(f.queue, g);
	    }, stop: function stop(a, b, c) {
	      var d = function d(a) {
	        var b = a.stop;delete a.stop, b(c);
	      };return "string" != typeof a && (c = b, b = a, a = void 0), b && a !== !1 && this.queue(a || "fx", []), this.each(function () {
	        var b = !0,
	            e = null != a && a + "queueHooks",
	            f = n.timers,
	            g = L.get(this);if (e) g[e] && g[e].stop && d(g[e]);else for (e in g) {
	          g[e] && g[e].stop && Pb.test(e) && d(g[e]);
	        }for (e = f.length; e--;) {
	          f[e].elem !== this || null != a && f[e].queue !== a || (f[e].anim.stop(c), b = !1, f.splice(e, 1));
	        }(b || !c) && n.dequeue(this, a);
	      });
	    }, finish: function finish(a) {
	      return a !== !1 && (a = a || "fx"), this.each(function () {
	        var b,
	            c = L.get(this),
	            d = c[a + "queue"],
	            e = c[a + "queueHooks"],
	            f = n.timers,
	            g = d ? d.length : 0;for (c.finish = !0, n.queue(this, a, []), e && e.stop && e.stop.call(this, !0), b = f.length; b--;) {
	          f[b].elem === this && f[b].queue === a && (f[b].anim.stop(!0), f.splice(b, 1));
	        }for (b = 0; g > b; b++) {
	          d[b] && d[b].finish && d[b].finish.call(this);
	        }delete c.finish;
	      });
	    } }), n.each(["toggle", "show", "hide"], function (a, b) {
	    var c = n.fn[b];n.fn[b] = function (a, d, e) {
	      return null == a || "boolean" == typeof a ? c.apply(this, arguments) : this.animate(Tb(b, !0), a, d, e);
	    };
	  }), n.each({ slideDown: Tb("show"), slideUp: Tb("hide"), slideToggle: Tb("toggle"), fadeIn: { opacity: "show" }, fadeOut: { opacity: "hide" }, fadeToggle: { opacity: "toggle" } }, function (a, b) {
	    n.fn[a] = function (a, c, d) {
	      return this.animate(b, a, c, d);
	    };
	  }), n.timers = [], n.fx.tick = function () {
	    var a,
	        b = 0,
	        c = n.timers;for (Lb = n.now(); b < c.length; b++) {
	      a = c[b], a() || c[b] !== a || c.splice(b--, 1);
	    }c.length || n.fx.stop(), Lb = void 0;
	  }, n.fx.timer = function (a) {
	    n.timers.push(a), a() ? n.fx.start() : n.timers.pop();
	  }, n.fx.interval = 13, n.fx.start = function () {
	    Mb || (Mb = setInterval(n.fx.tick, n.fx.interval));
	  }, n.fx.stop = function () {
	    clearInterval(Mb), Mb = null;
	  }, n.fx.speeds = { slow: 600, fast: 200, _default: 400 }, n.fn.delay = function (a, b) {
	    return a = n.fx ? n.fx.speeds[a] || a : a, b = b || "fx", this.queue(b, function (b, c) {
	      var d = setTimeout(b, a);c.stop = function () {
	        clearTimeout(d);
	      };
	    });
	  }, (function () {
	    var a = l.createElement("input"),
	        b = l.createElement("select"),
	        c = b.appendChild(l.createElement("option"));a.type = "checkbox", k.checkOn = "" !== a.value, k.optSelected = c.selected, b.disabled = !0, k.optDisabled = !c.disabled, a = l.createElement("input"), a.value = "t", a.type = "radio", k.radioValue = "t" === a.value;
	  })();var Yb,
	      Zb,
	      $b = n.expr.attrHandle;n.fn.extend({ attr: function attr(a, b) {
	      return J(this, n.attr, a, b, arguments.length > 1);
	    }, removeAttr: function removeAttr(a) {
	      return this.each(function () {
	        n.removeAttr(this, a);
	      });
	    } }), n.extend({ attr: function attr(a, b, c) {
	      var d,
	          e,
	          f = a.nodeType;if (a && 3 !== f && 8 !== f && 2 !== f) return _typeof(a.getAttribute) === U ? n.prop(a, b, c) : (1 === f && n.isXMLDoc(a) || (b = b.toLowerCase(), d = n.attrHooks[b] || (n.expr.match.bool.test(b) ? Zb : Yb)), void 0 === c ? d && "get" in d && null !== (e = d.get(a, b)) ? e : (e = n.find.attr(a, b), null == e ? void 0 : e) : null !== c ? d && "set" in d && void 0 !== (e = d.set(a, c, b)) ? e : (a.setAttribute(b, c + ""), c) : void n.removeAttr(a, b));
	    }, removeAttr: function removeAttr(a, b) {
	      var c,
	          d,
	          e = 0,
	          f = b && b.match(E);if (f && 1 === a.nodeType) while (c = f[e++]) {
	        d = n.propFix[c] || c, n.expr.match.bool.test(c) && (a[d] = !1), a.removeAttribute(c);
	      }
	    }, attrHooks: { type: { set: function set(a, b) {
	          if (!k.radioValue && "radio" === b && n.nodeName(a, "input")) {
	            var c = a.value;return a.setAttribute("type", b), c && (a.value = c), b;
	          }
	        } } } }), Zb = { set: function set(a, b, c) {
	      return b === !1 ? n.removeAttr(a, c) : a.setAttribute(c, c), c;
	    } }, n.each(n.expr.match.bool.source.match(/\w+/g), function (a, b) {
	    var c = $b[b] || n.find.attr;$b[b] = function (a, b, d) {
	      var e, f;return d || (f = $b[b], $b[b] = e, e = null != c(a, b, d) ? b.toLowerCase() : null, $b[b] = f), e;
	    };
	  });var _b = /^(?:input|select|textarea|button)$/i;n.fn.extend({ prop: function prop(a, b) {
	      return J(this, n.prop, a, b, arguments.length > 1);
	    }, removeProp: function removeProp(a) {
	      return this.each(function () {
	        delete this[n.propFix[a] || a];
	      });
	    } }), n.extend({ propFix: { "for": "htmlFor", "class": "className" }, prop: function prop(a, b, c) {
	      var d,
	          e,
	          f,
	          g = a.nodeType;if (a && 3 !== g && 8 !== g && 2 !== g) return f = 1 !== g || !n.isXMLDoc(a), f && (b = n.propFix[b] || b, e = n.propHooks[b]), void 0 !== c ? e && "set" in e && void 0 !== (d = e.set(a, c, b)) ? d : a[b] = c : e && "get" in e && null !== (d = e.get(a, b)) ? d : a[b];
	    }, propHooks: { tabIndex: { get: function get(a) {
	          return a.hasAttribute("tabindex") || _b.test(a.nodeName) || a.href ? a.tabIndex : -1;
	        } } } }), k.optSelected || (n.propHooks.selected = { get: function get(a) {
	      var b = a.parentNode;return b && b.parentNode && b.parentNode.selectedIndex, null;
	    } }), n.each(["tabIndex", "readOnly", "maxLength", "cellSpacing", "cellPadding", "rowSpan", "colSpan", "useMap", "frameBorder", "contentEditable"], function () {
	    n.propFix[this.toLowerCase()] = this;
	  });var ac = /[\t\r\n\f]/g;n.fn.extend({ addClass: function addClass(a) {
	      var b,
	          c,
	          d,
	          e,
	          f,
	          g,
	          h = "string" == typeof a && a,
	          i = 0,
	          j = this.length;if (n.isFunction(a)) return this.each(function (b) {
	        n(this).addClass(a.call(this, b, this.className));
	      });if (h) for (b = (a || "").match(E) || []; j > i; i++) {
	        if ((c = this[i], d = 1 === c.nodeType && (c.className ? (" " + c.className + " ").replace(ac, " ") : " "))) {
	          f = 0;while (e = b[f++]) {
	            d.indexOf(" " + e + " ") < 0 && (d += e + " ");
	          }g = n.trim(d), c.className !== g && (c.className = g);
	        }
	      }return this;
	    }, removeClass: function removeClass(a) {
	      var b,
	          c,
	          d,
	          e,
	          f,
	          g,
	          h = 0 === arguments.length || "string" == typeof a && a,
	          i = 0,
	          j = this.length;if (n.isFunction(a)) return this.each(function (b) {
	        n(this).removeClass(a.call(this, b, this.className));
	      });if (h) for (b = (a || "").match(E) || []; j > i; i++) {
	        if ((c = this[i], d = 1 === c.nodeType && (c.className ? (" " + c.className + " ").replace(ac, " ") : ""))) {
	          f = 0;while (e = b[f++]) {
	            while (d.indexOf(" " + e + " ") >= 0) {
	              d = d.replace(" " + e + " ", " ");
	            }
	          }g = a ? n.trim(d) : "", c.className !== g && (c.className = g);
	        }
	      }return this;
	    }, toggleClass: function toggleClass(a, b) {
	      var c = typeof a === "undefined" ? "undefined" : _typeof(a);return "boolean" == typeof b && "string" === c ? b ? this.addClass(a) : this.removeClass(a) : this.each(n.isFunction(a) ? function (c) {
	        n(this).toggleClass(a.call(this, c, this.className, b), b);
	      } : function () {
	        if ("string" === c) {
	          var b,
	              d = 0,
	              e = n(this),
	              f = a.match(E) || [];while (b = f[d++]) {
	            e.hasClass(b) ? e.removeClass(b) : e.addClass(b);
	          }
	        } else (c === U || "boolean" === c) && (this.className && L.set(this, "__className__", this.className), this.className = this.className || a === !1 ? "" : L.get(this, "__className__") || "");
	      });
	    }, hasClass: function hasClass(a) {
	      for (var b = " " + a + " ", c = 0, d = this.length; d > c; c++) {
	        if (1 === this[c].nodeType && (" " + this[c].className + " ").replace(ac, " ").indexOf(b) >= 0) return !0;
	      }return !1;
	    } });var bc = /\r/g;n.fn.extend({ val: function val(a) {
	      var b,
	          c,
	          d,
	          e = this[0];{
	        if (arguments.length) return d = n.isFunction(a), this.each(function (c) {
	          var e;1 === this.nodeType && (e = d ? a.call(this, c, n(this).val()) : a, null == e ? e = "" : "number" == typeof e ? e += "" : n.isArray(e) && (e = n.map(e, function (a) {
	            return null == a ? "" : a + "";
	          })), b = n.valHooks[this.type] || n.valHooks[this.nodeName.toLowerCase()], b && "set" in b && void 0 !== b.set(this, e, "value") || (this.value = e));
	        });if (e) return b = n.valHooks[e.type] || n.valHooks[e.nodeName.toLowerCase()], b && "get" in b && void 0 !== (c = b.get(e, "value")) ? c : (c = e.value, "string" == typeof c ? c.replace(bc, "") : null == c ? "" : c);
	      }
	    } }), n.extend({ valHooks: { option: { get: function get(a) {
	          var b = n.find.attr(a, "value");return null != b ? b : n.trim(n.text(a));
	        } }, select: { get: function get(a) {
	          for (var b, c, d = a.options, e = a.selectedIndex, f = "select-one" === a.type || 0 > e, g = f ? null : [], h = f ? e + 1 : d.length, i = 0 > e ? h : f ? e : 0; h > i; i++) {
	            if ((c = d[i], !(!c.selected && i !== e || (k.optDisabled ? c.disabled : null !== c.getAttribute("disabled")) || c.parentNode.disabled && n.nodeName(c.parentNode, "optgroup")))) {
	              if ((b = n(c).val(), f)) return b;g.push(b);
	            }
	          }return g;
	        }, set: function set(a, b) {
	          var c,
	              d,
	              e = a.options,
	              f = n.makeArray(b),
	              g = e.length;while (g--) {
	            d = e[g], (d.selected = n.inArray(d.value, f) >= 0) && (c = !0);
	          }return c || (a.selectedIndex = -1), f;
	        } } } }), n.each(["radio", "checkbox"], function () {
	    n.valHooks[this] = { set: function set(a, b) {
	        return n.isArray(b) ? a.checked = n.inArray(n(a).val(), b) >= 0 : void 0;
	      } }, k.checkOn || (n.valHooks[this].get = function (a) {
	      return null === a.getAttribute("value") ? "on" : a.value;
	    });
	  }), n.each("blur focus focusin focusout load resize scroll unload click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup error contextmenu".split(" "), function (a, b) {
	    n.fn[b] = function (a, c) {
	      return arguments.length > 0 ? this.on(b, null, a, c) : this.trigger(b);
	    };
	  }), n.fn.extend({ hover: function hover(a, b) {
	      return this.mouseenter(a).mouseleave(b || a);
	    }, bind: function bind(a, b, c) {
	      return this.on(a, null, b, c);
	    }, unbind: function unbind(a, b) {
	      return this.off(a, null, b);
	    }, delegate: function delegate(a, b, c, d) {
	      return this.on(b, a, c, d);
	    }, undelegate: function undelegate(a, b, c) {
	      return 1 === arguments.length ? this.off(a, "**") : this.off(b, a || "**", c);
	    } });var cc = n.now(),
	      dc = /\?/;n.parseJSON = function (a) {
	    return JSON.parse(a + "");
	  }, n.parseXML = function (a) {
	    var b, c;if (!a || "string" != typeof a) return null;try {
	      c = new DOMParser(), b = c.parseFromString(a, "text/xml");
	    } catch (d) {
	      b = void 0;
	    }return (!b || b.getElementsByTagName("parsererror").length) && n.error("Invalid XML: " + a), b;
	  };var ec = /#.*$/,
	      fc = /([?&])_=[^&]*/,
	      gc = /^(.*?):[ \t]*([^\r\n]*)$/gm,
	      hc = /^(?:about|app|app-storage|.+-extension|file|res|widget):$/,
	      ic = /^(?:GET|HEAD)$/,
	      jc = /^\/\//,
	      kc = /^([\w.+-]+:)(?:\/\/(?:[^\/?#]*@|)([^\/?#:]*)(?::(\d+)|)|)/,
	      lc = {},
	      mc = {},
	      nc = "*/".concat("*"),
	      oc = a.location.href,
	      pc = kc.exec(oc.toLowerCase()) || [];function qc(a) {
	    return function (b, c) {
	      "string" != typeof b && (c = b, b = "*");var d,
	          e = 0,
	          f = b.toLowerCase().match(E) || [];if (n.isFunction(c)) while (d = f[e++]) {
	        "+" === d[0] ? (d = d.slice(1) || "*", (a[d] = a[d] || []).unshift(c)) : (a[d] = a[d] || []).push(c);
	      }
	    };
	  }function rc(a, b, c, d) {
	    var e = {},
	        f = a === mc;function g(h) {
	      var i;return e[h] = !0, n.each(a[h] || [], function (a, h) {
	        var j = h(b, c, d);return "string" != typeof j || f || e[j] ? f ? !(i = j) : void 0 : (b.dataTypes.unshift(j), g(j), !1);
	      }), i;
	    }return g(b.dataTypes[0]) || !e["*"] && g("*");
	  }function sc(a, b) {
	    var c,
	        d,
	        e = n.ajaxSettings.flatOptions || {};for (c in b) {
	      void 0 !== b[c] && ((e[c] ? a : d || (d = {}))[c] = b[c]);
	    }return d && n.extend(!0, a, d), a;
	  }function tc(a, b, c) {
	    var d,
	        e,
	        f,
	        g,
	        h = a.contents,
	        i = a.dataTypes;while ("*" === i[0]) {
	      i.shift(), void 0 === d && (d = a.mimeType || b.getResponseHeader("Content-Type"));
	    }if (d) for (e in h) {
	      if (h[e] && h[e].test(d)) {
	        i.unshift(e);break;
	      }
	    }if (i[0] in c) f = i[0];else {
	      for (e in c) {
	        if (!i[0] || a.converters[e + " " + i[0]]) {
	          f = e;break;
	        }g || (g = e);
	      }f = f || g;
	    }return f ? (f !== i[0] && i.unshift(f), c[f]) : void 0;
	  }function uc(a, b, c, d) {
	    var e,
	        f,
	        g,
	        h,
	        i,
	        j = {},
	        k = a.dataTypes.slice();if (k[1]) for (g in a.converters) {
	      j[g.toLowerCase()] = a.converters[g];
	    }f = k.shift();while (f) {
	      if ((a.responseFields[f] && (c[a.responseFields[f]] = b), !i && d && a.dataFilter && (b = a.dataFilter(b, a.dataType)), i = f, f = k.shift())) if ("*" === f) f = i;else if ("*" !== i && i !== f) {
	        if ((g = j[i + " " + f] || j["* " + f], !g)) for (e in j) {
	          if ((h = e.split(" "), h[1] === f && (g = j[i + " " + h[0]] || j["* " + h[0]]))) {
	            g === !0 ? g = j[e] : j[e] !== !0 && (f = h[0], k.unshift(h[1]));break;
	          }
	        }if (g !== !0) if (g && a["throws"]) b = g(b);else try {
	          b = g(b);
	        } catch (l) {
	          return { state: "parsererror", error: g ? l : "No conversion from " + i + " to " + f };
	        }
	      }
	    }return { state: "success", data: b };
	  }n.extend({ active: 0, lastModified: {}, etag: {}, ajaxSettings: { url: oc, type: "GET", isLocal: hc.test(pc[1]), global: !0, processData: !0, async: !0, contentType: "application/x-www-form-urlencoded; charset=UTF-8", accepts: { "*": nc, text: "text/plain", html: "text/html", xml: "application/xml, text/xml", json: "application/json, text/javascript" }, contents: { xml: /xml/, html: /html/, json: /json/ }, responseFields: { xml: "responseXML", text: "responseText", json: "responseJSON" }, converters: { "* text": String, "text html": !0, "text json": n.parseJSON, "text xml": n.parseXML }, flatOptions: { url: !0, context: !0 } }, ajaxSetup: function ajaxSetup(a, b) {
	      return b ? sc(sc(a, n.ajaxSettings), b) : sc(n.ajaxSettings, a);
	    }, ajaxPrefilter: qc(lc), ajaxTransport: qc(mc), ajax: function ajax(a, b) {
	      "object" == (typeof a === "undefined" ? "undefined" : _typeof(a)) && (b = a, a = void 0), b = b || {};var c,
	          d,
	          e,
	          f,
	          g,
	          h,
	          i,
	          j,
	          k = n.ajaxSetup({}, b),
	          l = k.context || k,
	          m = k.context && (l.nodeType || l.jquery) ? n(l) : n.event,
	          o = n.Deferred(),
	          p = n.Callbacks("once memory"),
	          q = k.statusCode || {},
	          r = {},
	          s = {},
	          t = 0,
	          u = "canceled",
	          v = { readyState: 0, getResponseHeader: function getResponseHeader(a) {
	          var b;if (2 === t) {
	            if (!f) {
	              f = {};while (b = gc.exec(e)) {
	                f[b[1].toLowerCase()] = b[2];
	              }
	            }b = f[a.toLowerCase()];
	          }return null == b ? null : b;
	        }, getAllResponseHeaders: function getAllResponseHeaders() {
	          return 2 === t ? e : null;
	        }, setRequestHeader: function setRequestHeader(a, b) {
	          var c = a.toLowerCase();return t || (a = s[c] = s[c] || a, r[a] = b), this;
	        }, overrideMimeType: function overrideMimeType(a) {
	          return t || (k.mimeType = a), this;
	        }, statusCode: function statusCode(a) {
	          var b;if (a) if (2 > t) for (b in a) {
	            q[b] = [q[b], a[b]];
	          } else v.always(a[v.status]);return this;
	        }, abort: function abort(a) {
	          var b = a || u;return c && c.abort(b), x(0, b), this;
	        } };if ((o.promise(v).complete = p.add, v.success = v.done, v.error = v.fail, k.url = ((a || k.url || oc) + "").replace(ec, "").replace(jc, pc[1] + "//"), k.type = b.method || b.type || k.method || k.type, k.dataTypes = n.trim(k.dataType || "*").toLowerCase().match(E) || [""], null == k.crossDomain && (h = kc.exec(k.url.toLowerCase()), k.crossDomain = !(!h || h[1] === pc[1] && h[2] === pc[2] && (h[3] || ("http:" === h[1] ? "80" : "443")) === (pc[3] || ("http:" === pc[1] ? "80" : "443")))), k.data && k.processData && "string" != typeof k.data && (k.data = n.param(k.data, k.traditional)), rc(lc, k, b, v), 2 === t)) return v;i = n.event && k.global, i && 0 === n.active++ && n.event.trigger("ajaxStart"), k.type = k.type.toUpperCase(), k.hasContent = !ic.test(k.type), d = k.url, k.hasContent || (k.data && (d = k.url += (dc.test(d) ? "&" : "?") + k.data, delete k.data), k.cache === !1 && (k.url = fc.test(d) ? d.replace(fc, "$1_=" + cc++) : d + (dc.test(d) ? "&" : "?") + "_=" + cc++)), k.ifModified && (n.lastModified[d] && v.setRequestHeader("If-Modified-Since", n.lastModified[d]), n.etag[d] && v.setRequestHeader("If-None-Match", n.etag[d])), (k.data && k.hasContent && k.contentType !== !1 || b.contentType) && v.setRequestHeader("Content-Type", k.contentType), v.setRequestHeader("Accept", k.dataTypes[0] && k.accepts[k.dataTypes[0]] ? k.accepts[k.dataTypes[0]] + ("*" !== k.dataTypes[0] ? ", " + nc + "; q=0.01" : "") : k.accepts["*"]);for (j in k.headers) {
	        v.setRequestHeader(j, k.headers[j]);
	      }if (k.beforeSend && (k.beforeSend.call(l, v, k) === !1 || 2 === t)) return v.abort();u = "abort";for (j in { success: 1, error: 1, complete: 1 }) {
	        v[j](k[j]);
	      }if (c = rc(mc, k, b, v)) {
	        v.readyState = 1, i && m.trigger("ajaxSend", [v, k]), k.async && k.timeout > 0 && (g = setTimeout(function () {
	          v.abort("timeout");
	        }, k.timeout));try {
	          t = 1, c.send(r, x);
	        } catch (w) {
	          if (!(2 > t)) throw w;x(-1, w);
	        }
	      } else x(-1, "No Transport");function x(a, b, f, h) {
	        var j,
	            r,
	            s,
	            u,
	            w,
	            x = b;2 !== t && (t = 2, g && clearTimeout(g), c = void 0, e = h || "", v.readyState = a > 0 ? 4 : 0, j = a >= 200 && 300 > a || 304 === a, f && (u = tc(k, v, f)), u = uc(k, u, v, j), j ? (k.ifModified && (w = v.getResponseHeader("Last-Modified"), w && (n.lastModified[d] = w), w = v.getResponseHeader("etag"), w && (n.etag[d] = w)), 204 === a || "HEAD" === k.type ? x = "nocontent" : 304 === a ? x = "notmodified" : (x = u.state, r = u.data, s = u.error, j = !s)) : (s = x, (a || !x) && (x = "error", 0 > a && (a = 0))), v.status = a, v.statusText = (b || x) + "", j ? o.resolveWith(l, [r, x, v]) : o.rejectWith(l, [v, x, s]), v.statusCode(q), q = void 0, i && m.trigger(j ? "ajaxSuccess" : "ajaxError", [v, k, j ? r : s]), p.fireWith(l, [v, x]), i && (m.trigger("ajaxComplete", [v, k]), --n.active || n.event.trigger("ajaxStop")));
	      }return v;
	    }, getJSON: function getJSON(a, b, c) {
	      return n.get(a, b, c, "json");
	    }, getScript: function getScript(a, b) {
	      return n.get(a, void 0, b, "script");
	    } }), n.each(["get", "post"], function (a, b) {
	    n[b] = function (a, c, d, e) {
	      return n.isFunction(c) && (e = e || d, d = c, c = void 0), n.ajax({ url: a, type: b, dataType: e, data: c, success: d });
	    };
	  }), n._evalUrl = function (a) {
	    return n.ajax({ url: a, type: "GET", dataType: "script", async: !1, global: !1, "throws": !0 });
	  }, n.fn.extend({ wrapAll: function wrapAll(a) {
	      var b;return n.isFunction(a) ? this.each(function (b) {
	        n(this).wrapAll(a.call(this, b));
	      }) : (this[0] && (b = n(a, this[0].ownerDocument).eq(0).clone(!0), this[0].parentNode && b.insertBefore(this[0]), b.map(function () {
	        var a = this;while (a.firstElementChild) {
	          a = a.firstElementChild;
	        }return a;
	      }).append(this)), this);
	    }, wrapInner: function wrapInner(a) {
	      return this.each(n.isFunction(a) ? function (b) {
	        n(this).wrapInner(a.call(this, b));
	      } : function () {
	        var b = n(this),
	            c = b.contents();c.length ? c.wrapAll(a) : b.append(a);
	      });
	    }, wrap: function wrap(a) {
	      var b = n.isFunction(a);return this.each(function (c) {
	        n(this).wrapAll(b ? a.call(this, c) : a);
	      });
	    }, unwrap: function unwrap() {
	      return this.parent().each(function () {
	        n.nodeName(this, "body") || n(this).replaceWith(this.childNodes);
	      }).end();
	    } }), n.expr.filters.hidden = function (a) {
	    return a.offsetWidth <= 0 && a.offsetHeight <= 0;
	  }, n.expr.filters.visible = function (a) {
	    return !n.expr.filters.hidden(a);
	  };var vc = /%20/g,
	      wc = /\[\]$/,
	      xc = /\r?\n/g,
	      yc = /^(?:submit|button|image|reset|file)$/i,
	      zc = /^(?:input|select|textarea|keygen)/i;function Ac(a, b, c, d) {
	    var e;if (n.isArray(b)) n.each(b, function (b, e) {
	      c || wc.test(a) ? d(a, e) : Ac(a + "[" + ("object" == (typeof e === "undefined" ? "undefined" : _typeof(e)) ? b : "") + "]", e, c, d);
	    });else if (c || "object" !== n.type(b)) d(a, b);else for (e in b) {
	      Ac(a + "[" + e + "]", b[e], c, d);
	    }
	  }n.param = function (a, b) {
	    var c,
	        d = [],
	        e = function e(a, b) {
	      b = n.isFunction(b) ? b() : null == b ? "" : b, d[d.length] = encodeURIComponent(a) + "=" + encodeURIComponent(b);
	    };if ((void 0 === b && (b = n.ajaxSettings && n.ajaxSettings.traditional), n.isArray(a) || a.jquery && !n.isPlainObject(a))) n.each(a, function () {
	      e(this.name, this.value);
	    });else for (c in a) {
	      Ac(c, a[c], b, e);
	    }return d.join("&").replace(vc, "+");
	  }, n.fn.extend({ serialize: function serialize() {
	      return n.param(this.serializeArray());
	    }, serializeArray: function serializeArray() {
	      return this.map(function () {
	        var a = n.prop(this, "elements");return a ? n.makeArray(a) : this;
	      }).filter(function () {
	        var a = this.type;return this.name && !n(this).is(":disabled") && zc.test(this.nodeName) && !yc.test(a) && (this.checked || !T.test(a));
	      }).map(function (a, b) {
	        var c = n(this).val();return null == c ? null : n.isArray(c) ? n.map(c, function (a) {
	          return { name: b.name, value: a.replace(xc, "\r\n") };
	        }) : { name: b.name, value: c.replace(xc, "\r\n") };
	      }).get();
	    } }), n.ajaxSettings.xhr = function () {
	    try {
	      return new XMLHttpRequest();
	    } catch (a) {}
	  };var Bc = 0,
	      Cc = {},
	      Dc = { 0: 200, 1223: 204 },
	      Ec = n.ajaxSettings.xhr();a.attachEvent && a.attachEvent("onunload", function () {
	    for (var a in Cc) {
	      Cc[a]();
	    }
	  }), k.cors = !!Ec && "withCredentials" in Ec, k.ajax = Ec = !!Ec, n.ajaxTransport(function (a) {
	    var b;return k.cors || Ec && !a.crossDomain ? { send: function send(c, d) {
	        var e,
	            f = a.xhr(),
	            g = ++Bc;if ((f.open(a.type, a.url, a.async, a.username, a.password), a.xhrFields)) for (e in a.xhrFields) {
	          f[e] = a.xhrFields[e];
	        }a.mimeType && f.overrideMimeType && f.overrideMimeType(a.mimeType), a.crossDomain || c["X-Requested-With"] || (c["X-Requested-With"] = "XMLHttpRequest");for (e in c) {
	          f.setRequestHeader(e, c[e]);
	        }b = function (a) {
	          return function () {
	            b && (delete Cc[g], b = f.onload = f.onerror = null, "abort" === a ? f.abort() : "error" === a ? d(f.status, f.statusText) : d(Dc[f.status] || f.status, f.statusText, "string" == typeof f.responseText ? { text: f.responseText } : void 0, f.getAllResponseHeaders()));
	          };
	        }, f.onload = b(), f.onerror = b("error"), b = Cc[g] = b("abort");try {
	          f.send(a.hasContent && a.data || null);
	        } catch (h) {
	          if (b) throw h;
	        }
	      }, abort: function abort() {
	        b && b();
	      } } : void 0;
	  }), n.ajaxSetup({ accepts: { script: "text/javascript, application/javascript, application/ecmascript, application/x-ecmascript" }, contents: { script: /(?:java|ecma)script/ }, converters: { "text script": function textScript(a) {
	        return n.globalEval(a), a;
	      } } }), n.ajaxPrefilter("script", function (a) {
	    void 0 === a.cache && (a.cache = !1), a.crossDomain && (a.type = "GET");
	  }), n.ajaxTransport("script", function (a) {
	    if (a.crossDomain) {
	      var b, c;return { send: function send(d, e) {
	          b = n("<script>").prop({ async: !0, charset: a.scriptCharset, src: a.url }).on("load error", c = function (a) {
	            b.remove(), c = null, a && e("error" === a.type ? 404 : 200, a.type);
	          }), l.head.appendChild(b[0]);
	        }, abort: function abort() {
	          c && c();
	        } };
	    }
	  });var Fc = [],
	      Gc = /(=)\?(?=&|$)|\?\?/;n.ajaxSetup({ jsonp: "callback", jsonpCallback: function jsonpCallback() {
	      var a = Fc.pop() || n.expando + "_" + cc++;return this[a] = !0, a;
	    } }), n.ajaxPrefilter("json jsonp", function (b, c, d) {
	    var e,
	        f,
	        g,
	        h = b.jsonp !== !1 && (Gc.test(b.url) ? "url" : "string" == typeof b.data && !(b.contentType || "").indexOf("application/x-www-form-urlencoded") && Gc.test(b.data) && "data");return h || "jsonp" === b.dataTypes[0] ? (e = b.jsonpCallback = n.isFunction(b.jsonpCallback) ? b.jsonpCallback() : b.jsonpCallback, h ? b[h] = b[h].replace(Gc, "$1" + e) : b.jsonp !== !1 && (b.url += (dc.test(b.url) ? "&" : "?") + b.jsonp + "=" + e), b.converters["script json"] = function () {
	      return g || n.error(e + " was not called"), g[0];
	    }, b.dataTypes[0] = "json", f = a[e], a[e] = function () {
	      g = arguments;
	    }, d.always(function () {
	      a[e] = f, b[e] && (b.jsonpCallback = c.jsonpCallback, Fc.push(e)), g && n.isFunction(f) && f(g[0]), g = f = void 0;
	    }), "script") : void 0;
	  }), n.parseHTML = function (a, b, c) {
	    if (!a || "string" != typeof a) return null;"boolean" == typeof b && (c = b, b = !1), b = b || l;var d = v.exec(a),
	        e = !c && [];return d ? [b.createElement(d[1])] : (d = n.buildFragment([a], b, e), e && e.length && n(e).remove(), n.merge([], d.childNodes));
	  };var Hc = n.fn.load;n.fn.load = function (a, b, c) {
	    if ("string" != typeof a && Hc) return Hc.apply(this, arguments);var d,
	        e,
	        f,
	        g = this,
	        h = a.indexOf(" ");return h >= 0 && (d = n.trim(a.slice(h)), a = a.slice(0, h)), n.isFunction(b) ? (c = b, b = void 0) : b && "object" == (typeof b === "undefined" ? "undefined" : _typeof(b)) && (e = "POST"), g.length > 0 && n.ajax({ url: a, type: e, dataType: "html", data: b }).done(function (a) {
	      f = arguments, g.html(d ? n("<div>").append(n.parseHTML(a)).find(d) : a);
	    }).complete(c && function (a, b) {
	      g.each(c, f || [a.responseText, b, a]);
	    }), this;
	  }, n.each(["ajaxStart", "ajaxStop", "ajaxComplete", "ajaxError", "ajaxSuccess", "ajaxSend"], function (a, b) {
	    n.fn[b] = function (a) {
	      return this.on(b, a);
	    };
	  }), n.expr.filters.animated = function (a) {
	    return n.grep(n.timers, function (b) {
	      return a === b.elem;
	    }).length;
	  };var Ic = a.document.documentElement;function Jc(a) {
	    return n.isWindow(a) ? a : 9 === a.nodeType && a.defaultView;
	  }n.offset = { setOffset: function setOffset(a, b, c) {
	      var d,
	          e,
	          f,
	          g,
	          h,
	          i,
	          j,
	          k = n.css(a, "position"),
	          l = n(a),
	          m = {};"static" === k && (a.style.position = "relative"), h = l.offset(), f = n.css(a, "top"), i = n.css(a, "left"), j = ("absolute" === k || "fixed" === k) && (f + i).indexOf("auto") > -1, j ? (d = l.position(), g = d.top, e = d.left) : (g = parseFloat(f) || 0, e = parseFloat(i) || 0), n.isFunction(b) && (b = b.call(a, c, h)), null != b.top && (m.top = b.top - h.top + g), null != b.left && (m.left = b.left - h.left + e), "using" in b ? b.using.call(a, m) : l.css(m);
	    } }, n.fn.extend({ offset: function offset(a) {
	      if (arguments.length) return void 0 === a ? this : this.each(function (b) {
	        n.offset.setOffset(this, a, b);
	      });var b,
	          c,
	          d = this[0],
	          e = { top: 0, left: 0 },
	          f = d && d.ownerDocument;if (f) return b = f.documentElement, n.contains(b, d) ? (_typeof(d.getBoundingClientRect) !== U && (e = d.getBoundingClientRect()), c = Jc(f), { top: e.top + c.pageYOffset - b.clientTop, left: e.left + c.pageXOffset - b.clientLeft }) : e;
	    }, position: function position() {
	      if (this[0]) {
	        var a,
	            b,
	            c = this[0],
	            d = { top: 0, left: 0 };return "fixed" === n.css(c, "position") ? b = c.getBoundingClientRect() : (a = this.offsetParent(), b = this.offset(), n.nodeName(a[0], "html") || (d = a.offset()), d.top += n.css(a[0], "borderTopWidth", !0), d.left += n.css(a[0], "borderLeftWidth", !0)), { top: b.top - d.top - n.css(c, "marginTop", !0), left: b.left - d.left - n.css(c, "marginLeft", !0) };
	      }
	    }, offsetParent: function offsetParent() {
	      return this.map(function () {
	        var a = this.offsetParent || Ic;while (a && !n.nodeName(a, "html") && "static" === n.css(a, "position")) {
	          a = a.offsetParent;
	        }return a || Ic;
	      });
	    } }), n.each({ scrollLeft: "pageXOffset", scrollTop: "pageYOffset" }, function (b, c) {
	    var d = "pageYOffset" === c;n.fn[b] = function (e) {
	      return J(this, function (b, e, f) {
	        var g = Jc(b);return void 0 === f ? g ? g[c] : b[e] : void (g ? g.scrollTo(d ? a.pageXOffset : f, d ? f : a.pageYOffset) : b[e] = f);
	      }, b, e, arguments.length, null);
	    };
	  }), n.each(["top", "left"], function (a, b) {
	    n.cssHooks[b] = yb(k.pixelPosition, function (a, c) {
	      return c ? (c = xb(a, b), vb.test(c) ? n(a).position()[b] + "px" : c) : void 0;
	    });
	  }), n.each({ Height: "height", Width: "width" }, function (a, b) {
	    n.each({ padding: "inner" + a, content: b, "": "outer" + a }, function (c, d) {
	      n.fn[d] = function (d, e) {
	        var f = arguments.length && (c || "boolean" != typeof d),
	            g = c || (d === !0 || e === !0 ? "margin" : "border");return J(this, function (b, c, d) {
	          var e;return n.isWindow(b) ? b.document.documentElement["client" + a] : 9 === b.nodeType ? (e = b.documentElement, Math.max(b.body["scroll" + a], e["scroll" + a], b.body["offset" + a], e["offset" + a], e["client" + a])) : void 0 === d ? n.css(b, c, g) : n.style(b, c, d, g);
	        }, b, f ? d : void 0, f, null);
	      };
	    });
	  }), n.fn.size = function () {
	    return this.length;
	  }, n.fn.andSelf = n.fn.addBack, "function" == "function" && __webpack_require__(48) && !(__WEBPACK_AMD_DEFINE_ARRAY__ = [], __WEBPACK_AMD_DEFINE_RESULT__ = function () {
	    return n;
	  }.apply(exports, __WEBPACK_AMD_DEFINE_ARRAY__), __WEBPACK_AMD_DEFINE_RESULT__ !== undefined && (module.exports = __WEBPACK_AMD_DEFINE_RESULT__));var Kc = a.jQuery,
	      Lc = a.$;return n.noConflict = function (b) {
	    return a.$ === n && (a.$ = Lc), b && a.jQuery === n && (a.jQuery = Kc), n;
	  }, (typeof b === "undefined" ? "undefined" : _typeof(b)) === U && (a.jQuery = a.$ = n), n;
	});
	/* WEBPACK VAR INJECTION */}.call(exports, __webpack_require__(47)(module)))

/***/ }),

/***/ 47:
/***/ (function(module, exports) {

	module.exports = function(module) {
		if(!module.webpackPolyfill) {
			module.deprecate = function() {};
			module.paths = [];
			// module.parent = undefined by default
			module.children = [];
			module.webpackPolyfill = 1;
		}
		return module;
	}


/***/ }),

/***/ 48:
/***/ (function(module, exports) {

	/* WEBPACK VAR INJECTION */(function(__webpack_amd_options__) {module.exports = __webpack_amd_options__;

	/* WEBPACK VAR INJECTION */}.call(exports, {}))

/***/ }),

/***/ 55:
/***/ (function(module, exports) {

	"use strict";function _typeof(obj){return obj && typeof Symbol !== "undefined" && obj.constructor === Symbol?"symbol":typeof obj;} /* Javascript plotting library for jQuery, version 0.8.2.

	Copyright (c) 2007-2013 IOLA and Ole Laursen.
	Licensed under the MIT license.

	*/ // first an inline dependency, jquery.colorhelpers.js, we inline it here
	// for convenience
	/* Plugin for jQuery for working with colors.
	 *
	 * Version 1.1.
	 *
	 * Inspiration from jQuery color animation plugin by John Resig.
	 *
	 * Released under the MIT license by Ole Laursen, October 2009.
	 *
	 * Examples:
	 *
	 *   $.color.parse("#fff").scale('rgb', 0.25).add('a', -0.5).toString()
	 *   var c = $.color.extract($("#mydiv"), 'background-color');
	 *   console.log(c.r, c.g, c.b, c.a);
	 *   $.color.make(100, 50, 25, 0.4).toString() // returns "rgba(100,50,25,0.4)"
	 *
	 * Note that .scale() and .add() return the same modified object
	 * instead of making a new one.
	 *
	 * V. 1.1: Fix error handling so e.g. parsing an empty string does
	 * produce a color rather than just crashing.
	 */(function($){$.color = {};$.color.make = function(r,g,b,a){var o={};o.r = r || 0;o.g = g || 0;o.b = b || 0;o.a = a != null?a:1;o.add = function(c,d){for(var i=0;i < c.length;++i) {o[c.charAt(i)] += d;}return o.normalize();};o.scale = function(c,f){for(var i=0;i < c.length;++i) {o[c.charAt(i)] *= f;}return o.normalize();};o.toString = function(){if(o.a >= 1){return "rgb(" + [o.r,o.g,o.b].join(",") + ")";}else {return "rgba(" + [o.r,o.g,o.b,o.a].join(",") + ")";}};o.normalize = function(){function clamp(min,value,max){return value < min?min:value > max?max:value;}o.r = clamp(0,parseInt(o.r),255);o.g = clamp(0,parseInt(o.g),255);o.b = clamp(0,parseInt(o.b),255);o.a = clamp(0,o.a,1);return o;};o.clone = function(){return $.color.make(o.r,o.b,o.g,o.a);};return o.normalize();};$.color.extract = function(elem,css){var c;do {c = elem.css(css).toLowerCase();if(c != "" && c != "transparent")break;elem = elem.parent();}while(elem.length && !$.nodeName(elem.get(0),"body"));if(c == "rgba(0, 0, 0, 0)")c = "transparent";return $.color.parse(c);};$.color.parse = function(str){var res,m=$.color.make;if(res = /rgb\(\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*\)/.exec(str))return m(parseInt(res[1],10),parseInt(res[2],10),parseInt(res[3],10));if(res = /rgba\(\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*,\s*([0-9]+(?:\.[0-9]+)?)\s*\)/.exec(str))return m(parseInt(res[1],10),parseInt(res[2],10),parseInt(res[3],10),parseFloat(res[4]));if(res = /rgb\(\s*([0-9]+(?:\.[0-9]+)?)\%\s*,\s*([0-9]+(?:\.[0-9]+)?)\%\s*,\s*([0-9]+(?:\.[0-9]+)?)\%\s*\)/.exec(str))return m(parseFloat(res[1]) * 2.55,parseFloat(res[2]) * 2.55,parseFloat(res[3]) * 2.55);if(res = /rgba\(\s*([0-9]+(?:\.[0-9]+)?)\%\s*,\s*([0-9]+(?:\.[0-9]+)?)\%\s*,\s*([0-9]+(?:\.[0-9]+)?)\%\s*,\s*([0-9]+(?:\.[0-9]+)?)\s*\)/.exec(str))return m(parseFloat(res[1]) * 2.55,parseFloat(res[2]) * 2.55,parseFloat(res[3]) * 2.55,parseFloat(res[4]));if(res = /#([a-fA-F0-9]{2})([a-fA-F0-9]{2})([a-fA-F0-9]{2})/.exec(str))return m(parseInt(res[1],16),parseInt(res[2],16),parseInt(res[3],16));if(res = /#([a-fA-F0-9])([a-fA-F0-9])([a-fA-F0-9])/.exec(str))return m(parseInt(res[1] + res[1],16),parseInt(res[2] + res[2],16),parseInt(res[3] + res[3],16));var name=$.trim(str).toLowerCase();if(name == "transparent")return m(255,255,255,0);else {res = lookupColors[name] || [0,0,0];return m(res[0],res[1],res[2]);}};var lookupColors={aqua:[0,255,255],azure:[240,255,255],beige:[245,245,220],black:[0,0,0],blue:[0,0,255],brown:[165,42,42],cyan:[0,255,255],darkblue:[0,0,139],darkcyan:[0,139,139],darkgrey:[169,169,169],darkgreen:[0,100,0],darkkhaki:[189,183,107],darkmagenta:[139,0,139],darkolivegreen:[85,107,47],darkorange:[255,140,0],darkorchid:[153,50,204],darkred:[139,0,0],darksalmon:[233,150,122],darkviolet:[148,0,211],fuchsia:[255,0,255],gold:[255,215,0],green:[0,128,0],indigo:[75,0,130],khaki:[240,230,140],lightblue:[173,216,230],lightcyan:[224,255,255],lightgreen:[144,238,144],lightgrey:[211,211,211],lightpink:[255,182,193],lightyellow:[255,255,224],lime:[0,255,0],magenta:[255,0,255],maroon:[128,0,0],navy:[0,0,128],olive:[128,128,0],orange:[255,165,0],pink:[255,192,203],purple:[128,0,128],violet:[128,0,128],red:[255,0,0],silver:[192,192,192],white:[255,255,255],yellow:[255,255,0]};})(jQuery); // the actual Flot code
	(function($){ // Cache the prototype hasOwnProperty for faster access
	var hasOwnProperty=Object.prototype.hasOwnProperty; ///////////////////////////////////////////////////////////////////////////
	// The Canvas object is a wrapper around an HTML5 <canvas> tag.
	//
	// @constructor
	// @param {string} cls List of classes to apply to the canvas.
	// @param {element} container Element onto which to append the canvas.
	//
	// Requiring a container is a little iffy, but unfortunately canvas
	// operations don't work unless the canvas is attached to the DOM.
	function Canvas(cls,container){var element=container.children("." + cls)[0];if(element == null){element = document.createElement("canvas");element.className = cls;$(element).css({direction:"ltr",position:"absolute",left:0,top:0}).appendTo(container); // If HTML5 Canvas isn't available, fall back to [Ex|Flash]canvas
	if(!element.getContext){if(window.G_vmlCanvasManager){element = window.G_vmlCanvasManager.initElement(element);}else {throw new Error("Canvas is not available. If you're using IE with a fall-back such as Excanvas, then there's either a mistake in your conditional include, or the page has no DOCTYPE and is rendering in Quirks Mode.");}}}this.element = element;var context=this.context = element.getContext("2d"); // Determine the screen's ratio of physical to device-independent
	// pixels.  This is the ratio between the canvas width that the browser
	// advertises and the number of pixels actually present in that space.
	// The iPhone 4, for example, has a device-independent width of 320px,
	// but its screen is actually 640px wide.  It therefore has a pixel
	// ratio of 2, while most normal devices have a ratio of 1.
	var devicePixelRatio=window.devicePixelRatio || 1,backingStoreRatio=context.webkitBackingStorePixelRatio || context.mozBackingStorePixelRatio || context.msBackingStorePixelRatio || context.oBackingStorePixelRatio || context.backingStorePixelRatio || 1;this.pixelRatio = devicePixelRatio / backingStoreRatio; // Size the canvas to match the internal dimensions of its container
	this.resize(container.width(),container.height()); // Collection of HTML div layers for text overlaid onto the canvas
	this.textContainer = null;this.text = {}; // Cache of text fragments and metrics, so we can avoid expensively
	// re-calculating them when the plot is re-rendered in a loop.
	this._textCache = {};} // Resizes the canvas to the given dimensions.
	//
	// @param {number} width New width of the canvas, in pixels.
	// @param {number} width New height of the canvas, in pixels.
	Canvas.prototype.resize = function(width,height){if(width <= 0 || height <= 0){throw new Error("Invalid dimensions for plot, width = " + width + ", height = " + height);}var element=this.element,context=this.context,pixelRatio=this.pixelRatio; // Resize the canvas, increasing its density based on the display's
	// pixel ratio; basically giving it more pixels without increasing the
	// size of its element, to take advantage of the fact that retina
	// displays have that many more pixels in the same advertised space.
	// Resizing should reset the state (excanvas seems to be buggy though)
	if(this.width != width){element.width = width * pixelRatio;element.style.width = width + "px";this.width = width;}if(this.height != height){element.height = height * pixelRatio;element.style.height = height + "px";this.height = height;} // Save the context, so we can reset in case we get replotted.  The
	// restore ensure that we're really back at the initial state, and
	// should be safe even if we haven't saved the initial state yet.
	context.restore();context.save(); // Scale the coordinate space to match the display density; so even though we
	// may have twice as many pixels, we still want lines and other drawing to
	// appear at the same size; the extra pixels will just make them crisper.
	context.scale(pixelRatio,pixelRatio);}; // Clears the entire canvas area, not including any overlaid HTML text
	Canvas.prototype.clear = function(){this.context.clearRect(0,0,this.width,this.height);}; // Finishes rendering the canvas, including managing the text overlay.
	Canvas.prototype.render = function(){var cache=this._textCache; // For each text layer, add elements marked as active that haven't
	// already been rendered, and remove those that are no longer active.
	for(var layerKey in cache) {if(hasOwnProperty.call(cache,layerKey)){var layer=this.getTextLayer(layerKey),layerCache=cache[layerKey];layer.hide();for(var styleKey in layerCache) {if(hasOwnProperty.call(layerCache,styleKey)){var styleCache=layerCache[styleKey];for(var key in styleCache) {if(hasOwnProperty.call(styleCache,key)){var positions=styleCache[key].positions;for(var i=0,position;position = positions[i];i++) {if(position.active){if(!position.rendered){layer.append(position.element);position.rendered = true;}}else {positions.splice(i--,1);if(position.rendered){position.element.detach();}}}if(positions.length == 0){delete styleCache[key];}}}}}layer.show();}}}; // Creates (if necessary) and returns the text overlay container.
	//
	// @param {string} classes String of space-separated CSS classes used to
	//     uniquely identify the text layer.
	// @return {object} The jQuery-wrapped text-layer div.
	Canvas.prototype.getTextLayer = function(classes){var layer=this.text[classes]; // Create the text layer if it doesn't exist
	if(layer == null){ // Create the text layer container, if it doesn't exist
	if(this.textContainer == null){this.textContainer = $("<div class='flot-text'></div>").css({position:"absolute",top:0,left:0,bottom:0,right:0,'font-size':"smaller",color:"#545454"}).insertAfter(this.element);}layer = this.text[classes] = $("<div></div>").addClass(classes).css({position:"absolute",top:0,left:0,bottom:0,right:0}).appendTo(this.textContainer);}return layer;}; // Creates (if necessary) and returns a text info object.
	//
	// The object looks like this:
	//
	// {
	//     width: Width of the text's wrapper div.
	//     height: Height of the text's wrapper div.
	//     element: The jQuery-wrapped HTML div containing the text.
	//     positions: Array of positions at which this text is drawn.
	// }
	//
	// The positions array contains objects that look like this:
	//
	// {
	//     active: Flag indicating whether the text should be visible.
	//     rendered: Flag indicating whether the text is currently visible.
	//     element: The jQuery-wrapped HTML div containing the text.
	//     x: X coordinate at which to draw the text.
	//     y: Y coordinate at which to draw the text.
	// }
	//
	// Each position after the first receives a clone of the original element.
	//
	// The idea is that that the width, height, and general 'identity' of the
	// text is constant no matter where it is placed; the placements are a
	// secondary property.
	//
	// Canvas maintains a cache of recently-used text info objects; getTextInfo
	// either returns the cached element or creates a new entry.
	//
	// @param {string} layer A string of space-separated CSS classes uniquely
	//     identifying the layer containing this text.
	// @param {string} text Text string to retrieve info for.
	// @param {(string|object)=} font Either a string of space-separated CSS
	//     classes or a font-spec object, defining the text's font and style.
	// @param {number=} angle Angle at which to rotate the text, in degrees.
	//     Angle is currently unused, it will be implemented in the future.
	// @param {number=} width Maximum width of the text before it wraps.
	// @return {object} a text info object.
	Canvas.prototype.getTextInfo = function(layer,text,font,angle,width){var textStyle,layerCache,styleCache,info; // Cast the value to a string, in case we were given a number or such
	text = "" + text; // If the font is a font-spec object, generate a CSS font definition
	if((typeof font === "undefined"?"undefined":_typeof(font)) === "object"){textStyle = font.style + " " + font.variant + " " + font.weight + " " + font.size + "px/" + font.lineHeight + "px " + font.family;}else {textStyle = font;} // Retrieve (or create) the cache for the text's layer and styles
	layerCache = this._textCache[layer];if(layerCache == null){layerCache = this._textCache[layer] = {};}styleCache = layerCache[textStyle];if(styleCache == null){styleCache = layerCache[textStyle] = {};}info = styleCache[text]; // If we can't find a matching element in our cache, create a new one
	if(info == null){var element=$("<div></div>").html(text).css({position:"absolute",'max-width':width,top:-9999}).appendTo(this.getTextLayer(layer));if((typeof font === "undefined"?"undefined":_typeof(font)) === "object"){element.css({font:textStyle,color:font.color});}else if(typeof font === "string"){element.addClass(font);}info = styleCache[text] = {width:element.outerWidth(true),height:element.outerHeight(true),element:element,positions:[]};element.detach();}return info;}; // Adds a text string to the canvas text overlay.
	//
	// The text isn't drawn immediately; it is marked as rendering, which will
	// result in its addition to the canvas on the next render pass.
	//
	// @param {string} layer A string of space-separated CSS classes uniquely
	//     identifying the layer containing this text.
	// @param {number} x X coordinate at which to draw the text.
	// @param {number} y Y coordinate at which to draw the text.
	// @param {string} text Text string to draw.
	// @param {(string|object)=} font Either a string of space-separated CSS
	//     classes or a font-spec object, defining the text's font and style.
	// @param {number=} angle Angle at which to rotate the text, in degrees.
	//     Angle is currently unused, it will be implemented in the future.
	// @param {number=} width Maximum width of the text before it wraps.
	// @param {string=} halign Horizontal alignment of the text; either "left",
	//     "center" or "right".
	// @param {string=} valign Vertical alignment of the text; either "top",
	//     "middle" or "bottom".
	Canvas.prototype.addText = function(layer,x,y,text,font,angle,width,halign,valign){var info=this.getTextInfo(layer,text,font,angle,width),positions=info.positions; // Tweak the div's position to match the text's alignment
	if(halign == "center"){x -= info.width / 2;}else if(halign == "right"){x -= info.width;}if(valign == "middle"){y -= info.height / 2;}else if(valign == "bottom"){y -= info.height;} // Determine whether this text already exists at this position.
	// If so, mark it for inclusion in the next render pass.
	for(var i=0,position;position = positions[i];i++) {if(position.x == x && position.y == y){position.active = true;return;}} // If the text doesn't exist at this position, create a new entry
	// For the very first position we'll re-use the original element,
	// while for subsequent ones we'll clone it.
	position = {active:true,rendered:false,element:positions.length?info.element.clone():info.element,x:x,y:y};positions.push(position); // Move the element to its final position within the container
	position.element.css({top:Math.round(y),left:Math.round(x),'text-align':halign // In case the text wraps
	});}; // Removes one or more text strings from the canvas text overlay.
	//
	// If no parameters are given, all text within the layer is removed.
	//
	// Note that the text is not immediately removed; it is simply marked as
	// inactive, which will result in its removal on the next render pass.
	// This avoids the performance penalty for 'clear and redraw' behavior,
	// where we potentially get rid of all text on a layer, but will likely
	// add back most or all of it later, as when redrawing axes, for example.
	//
	// @param {string} layer A string of space-separated CSS classes uniquely
	//     identifying the layer containing this text.
	// @param {number=} x X coordinate of the text.
	// @param {number=} y Y coordinate of the text.
	// @param {string=} text Text string to remove.
	// @param {(string|object)=} font Either a string of space-separated CSS
	//     classes or a font-spec object, defining the text's font and style.
	// @param {number=} angle Angle at which the text is rotated, in degrees.
	//     Angle is currently unused, it will be implemented in the future.
	Canvas.prototype.removeText = function(layer,x,y,text,font,angle){if(text == null){var layerCache=this._textCache[layer];if(layerCache != null){for(var styleKey in layerCache) {if(hasOwnProperty.call(layerCache,styleKey)){var styleCache=layerCache[styleKey];for(var key in styleCache) {if(hasOwnProperty.call(styleCache,key)){var positions=styleCache[key].positions;for(var i=0,position;position = positions[i];i++) {position.active = false;}}}}}}}else {var positions=this.getTextInfo(layer,text,font,angle).positions;for(var i=0,position;position = positions[i];i++) {if(position.x == x && position.y == y){position.active = false;}}}}; ///////////////////////////////////////////////////////////////////////////
	// The top-level container for the entire plot.
	function Plot(placeholder,data_,options_,plugins){ // data is on the form:
	//   [ series1, series2 ... ]
	// where series is either just the data as [ [x1, y1], [x2, y2], ... ]
	// or { data: [ [x1, y1], [x2, y2], ... ], label: "some label", ... }
	var series=[],options={ // the color theme used for graphs
	colors:["#edc240","#afd8f8","#cb4b4b","#4da74d","#9440ed"],legend:{show:true,noColumns:1, // number of colums in legend table
	labelFormatter:null, // fn: string -> string
	labelBoxBorderColor:"#ccc", // border color for the little label boxes
	container:null, // container (as jQuery object) to put legend in, null means default on top of graph
	position:"ne", // position of default legend container within plot
	margin:5, // distance from grid edge to default legend container within plot
	backgroundColor:null, // null means auto-detect
	backgroundOpacity:0.85, // set to 0 to avoid background
	sorted:null // default to no legend sorting
	},xaxis:{show:null, // null = auto-detect, true = always, false = never
	position:"bottom", // or "top"
	mode:null, // null or "time"
	font:null, // null (derived from CSS in placeholder) or object like { size: 11, lineHeight: 13, style: "italic", weight: "bold", family: "sans-serif", variant: "small-caps" }
	color:null, // base color, labels, ticks
	tickColor:null, // possibly different color of ticks, e.g. "rgba(0,0,0,0.15)"
	transform:null, // null or f: number -> number to transform axis
	inverseTransform:null, // if transform is set, this should be the inverse function
	min:null, // min. value to show, null means set automatically
	max:null, // max. value to show, null means set automatically
	autoscaleMargin:null, // margin in % to add if auto-setting min/max
	ticks:null, // either [1, 3] or [[1, "a"], 3] or (fn: axis info -> ticks) or app. number of ticks for auto-ticks
	tickFormatter:null, // fn: number -> string
	labelWidth:null, // size of tick labels in pixels
	labelHeight:null,reserveSpace:null, // whether to reserve space even if axis isn't shown
	tickLength:null, // size in pixels of ticks, or "full" for whole line
	alignTicksWithAxis:null, // axis number or null for no sync
	tickDecimals:null, // no. of decimals, null means auto
	tickSize:null, // number or [number, "unit"]
	minTickSize:null // number or [number, "unit"]
	},yaxis:{autoscaleMargin:0.02,position:"left" // or "right"
	},xaxes:[],yaxes:[],series:{points:{show:false,radius:3,lineWidth:2, // in pixels
	fill:true,fillColor:"#ffffff",symbol:"circle" // or callback
	},lines:{ // we don't put in show: false so we can see
	// whether lines were actively disabled
	lineWidth:2, // in pixels
	fill:false,fillColor:null,steps:false // Omit 'zero', so we can later default its value to
	// match that of the 'fill' option.
	},bars:{show:false,lineWidth:2, // in pixels
	barWidth:1, // in units of the x axis
	fill:true,fillColor:null,align:"left", // "left", "right", or "center"
	horizontal:false,zero:true},shadowSize:3,highlightColor:null},grid:{show:true,aboveData:false,color:"#545454", // primary color used for outline and labels
	backgroundColor:null, // null for transparent, else color
	borderColor:null, // set if different from the grid color
	tickColor:null, // color for the ticks, e.g. "rgba(0,0,0,0.15)"
	margin:0, // distance from the canvas edge to the grid
	labelMargin:5, // in pixels
	axisMargin:8, // in pixels
	borderWidth:2, // in pixels
	minBorderMargin:null, // in pixels, null means taken from points radius
	markings:null, // array of ranges or fn: axes -> array of ranges
	markingsColor:"#f4f4f4",markingsLineWidth:2, // interactive stuff
	clickable:false,hoverable:false,autoHighlight:true, // highlight in case mouse is near
	mouseActiveRadius:10 // how far the mouse can be away to activate an item
	},interaction:{redrawOverlayInterval:1000 / 60 // time between updates, -1 means in same flow
	},hooks:{}},surface=null, // the canvas for the plot itself
	overlay=null, // canvas for interactive stuff on top of plot
	eventHolder=null, // jQuery object that events should be bound to
	ctx=null,octx=null,xaxes=[],yaxes=[],plotOffset={left:0,right:0,top:0,bottom:0},plotWidth=0,plotHeight=0,hooks={processOptions:[],processRawData:[],processDatapoints:[],processOffset:[],drawBackground:[],drawSeries:[],draw:[],bindEvents:[],drawOverlay:[],shutdown:[]},plot=this; // public functions
	plot.setData = setData;plot.setupGrid = setupGrid;plot.draw = draw;plot.getPlaceholder = function(){return placeholder;};plot.getCanvas = function(){return surface.element;};plot.getPlotOffset = function(){return plotOffset;};plot.width = function(){return plotWidth;};plot.height = function(){return plotHeight;};plot.offset = function(){var o=eventHolder.offset();o.left += plotOffset.left;o.top += plotOffset.top;return o;};plot.getData = function(){return series;};plot.getAxes = function(){var res={},i;$.each(xaxes.concat(yaxes),function(_,axis){if(axis)res[axis.direction + (axis.n != 1?axis.n:"") + "axis"] = axis;});return res;};plot.getXAxes = function(){return xaxes;};plot.getYAxes = function(){return yaxes;};plot.c2p = canvasToAxisCoords;plot.p2c = axisToCanvasCoords;plot.getOptions = function(){return options;};plot.highlight = highlight;plot.unhighlight = unhighlight;plot.triggerRedrawOverlay = triggerRedrawOverlay;plot.pointOffset = function(point){return {left:parseInt(xaxes[axisNumber(point,"x") - 1].p2c(+point.x) + plotOffset.left,10),top:parseInt(yaxes[axisNumber(point,"y") - 1].p2c(+point.y) + plotOffset.top,10)};};plot.shutdown = shutdown;plot.destroy = function(){shutdown();placeholder.removeData("plot").empty();series = [];options = null;surface = null;overlay = null;eventHolder = null;ctx = null;octx = null;xaxes = [];yaxes = [];hooks = null;highlights = [];plot = null;};plot.resize = function(){var width=placeholder.width(),height=placeholder.height();surface.resize(width,height);overlay.resize(width,height);}; // public attributes
	plot.hooks = hooks; // initialize
	initPlugins(plot);parseOptions(options_);setupCanvases();setData(data_);setupGrid();draw();bindEvents();function executeHooks(hook,args){args = [plot].concat(args);for(var i=0;i < hook.length;++i) {hook[i].apply(this,args);}}function initPlugins(){ // References to key classes, allowing plugins to modify them
	var classes={Canvas:Canvas};for(var i=0;i < plugins.length;++i) {var p=plugins[i];p.init(plot,classes);if(p.options)$.extend(true,options,p.options);}}function parseOptions(opts){$.extend(true,options,opts); // $.extend merges arrays, rather than replacing them.  When less
	// colors are provided than the size of the default palette, we
	// end up with those colors plus the remaining defaults, which is
	// not expected behavior; avoid it by replacing them here.
	if(opts && opts.colors){options.colors = opts.colors;}if(options.xaxis.color == null)options.xaxis.color = $.color.parse(options.grid.color).scale('a',0.22).toString();if(options.yaxis.color == null)options.yaxis.color = $.color.parse(options.grid.color).scale('a',0.22).toString();if(options.xaxis.tickColor == null) // grid.tickColor for back-compatibility
	options.xaxis.tickColor = options.grid.tickColor || options.xaxis.color;if(options.yaxis.tickColor == null) // grid.tickColor for back-compatibility
	options.yaxis.tickColor = options.grid.tickColor || options.yaxis.color;if(options.grid.borderColor == null)options.grid.borderColor = options.grid.color;if(options.grid.tickColor == null)options.grid.tickColor = $.color.parse(options.grid.color).scale('a',0.22).toString(); // Fill in defaults for axis options, including any unspecified
	// font-spec fields, if a font-spec was provided.
	// If no x/y axis options were provided, create one of each anyway,
	// since the rest of the code assumes that they exist.
	var i,axisOptions,axisCount,fontSize=placeholder.css("font-size"),fontSizeDefault=fontSize?+fontSize.replace("px",""):13,fontDefaults={style:placeholder.css("font-style"),size:Math.round(0.8 * fontSizeDefault),variant:placeholder.css("font-variant"),weight:placeholder.css("font-weight"),family:placeholder.css("font-family")};axisCount = options.xaxes.length || 1;for(i = 0;i < axisCount;++i) {axisOptions = options.xaxes[i];if(axisOptions && !axisOptions.tickColor){axisOptions.tickColor = axisOptions.color;}axisOptions = $.extend(true,{},options.xaxis,axisOptions);options.xaxes[i] = axisOptions;if(axisOptions.font){axisOptions.font = $.extend({},fontDefaults,axisOptions.font);if(!axisOptions.font.color){axisOptions.font.color = axisOptions.color;}if(!axisOptions.font.lineHeight){axisOptions.font.lineHeight = Math.round(axisOptions.font.size * 1.15);}}}axisCount = options.yaxes.length || 1;for(i = 0;i < axisCount;++i) {axisOptions = options.yaxes[i];if(axisOptions && !axisOptions.tickColor){axisOptions.tickColor = axisOptions.color;}axisOptions = $.extend(true,{},options.yaxis,axisOptions);options.yaxes[i] = axisOptions;if(axisOptions.font){axisOptions.font = $.extend({},fontDefaults,axisOptions.font);if(!axisOptions.font.color){axisOptions.font.color = axisOptions.color;}if(!axisOptions.font.lineHeight){axisOptions.font.lineHeight = Math.round(axisOptions.font.size * 1.15);}}} // backwards compatibility, to be removed in future
	if(options.xaxis.noTicks && options.xaxis.ticks == null)options.xaxis.ticks = options.xaxis.noTicks;if(options.yaxis.noTicks && options.yaxis.ticks == null)options.yaxis.ticks = options.yaxis.noTicks;if(options.x2axis){options.xaxes[1] = $.extend(true,{},options.xaxis,options.x2axis);options.xaxes[1].position = "top";}if(options.y2axis){options.yaxes[1] = $.extend(true,{},options.yaxis,options.y2axis);options.yaxes[1].position = "right";}if(options.grid.coloredAreas)options.grid.markings = options.grid.coloredAreas;if(options.grid.coloredAreasColor)options.grid.markingsColor = options.grid.coloredAreasColor;if(options.lines)$.extend(true,options.series.lines,options.lines);if(options.points)$.extend(true,options.series.points,options.points);if(options.bars)$.extend(true,options.series.bars,options.bars);if(options.shadowSize != null)options.series.shadowSize = options.shadowSize;if(options.highlightColor != null)options.series.highlightColor = options.highlightColor; // save options on axes for future reference
	for(i = 0;i < options.xaxes.length;++i) {getOrCreateAxis(xaxes,i + 1).options = options.xaxes[i];}for(i = 0;i < options.yaxes.length;++i) {getOrCreateAxis(yaxes,i + 1).options = options.yaxes[i];} // add hooks from options
	for(var n in hooks) {if(options.hooks[n] && options.hooks[n].length)hooks[n] = hooks[n].concat(options.hooks[n]);}executeHooks(hooks.processOptions,[options]);}function setData(d){series = parseData(d);fillInSeriesOptions();processData();}function parseData(d){var res=[];for(var i=0;i < d.length;++i) {var s=$.extend(true,{},options.series);if(d[i].data != null){s.data = d[i].data; // move the data instead of deep-copy
	delete d[i].data;$.extend(true,s,d[i]);d[i].data = s.data;}else s.data = d[i];res.push(s);}return res;}function axisNumber(obj,coord){var a=obj[coord + "axis"];if((typeof a === "undefined"?"undefined":_typeof(a)) == "object") // if we got a real axis, extract number
	a = a.n;if(typeof a != "number")a = 1; // default to first axis
	return a;}function allAxes(){ // return flat array without annoying null entries
	return $.grep(xaxes.concat(yaxes),function(a){return a;});}function canvasToAxisCoords(pos){ // return an object with x/y corresponding to all used axes
	var res={},i,axis;for(i = 0;i < xaxes.length;++i) {axis = xaxes[i];if(axis && axis.used)res["x" + axis.n] = axis.c2p(pos.left);}for(i = 0;i < yaxes.length;++i) {axis = yaxes[i];if(axis && axis.used)res["y" + axis.n] = axis.c2p(pos.top);}if(res.x1 !== undefined)res.x = res.x1;if(res.y1 !== undefined)res.y = res.y1;return res;}function axisToCanvasCoords(pos){ // get canvas coords from the first pair of x/y found in pos
	var res={},i,axis,key;for(i = 0;i < xaxes.length;++i) {axis = xaxes[i];if(axis && axis.used){key = "x" + axis.n;if(pos[key] == null && axis.n == 1)key = "x";if(pos[key] != null){res.left = axis.p2c(pos[key]);break;}}}for(i = 0;i < yaxes.length;++i) {axis = yaxes[i];if(axis && axis.used){key = "y" + axis.n;if(pos[key] == null && axis.n == 1)key = "y";if(pos[key] != null){res.top = axis.p2c(pos[key]);break;}}}return res;}function getOrCreateAxis(axes,number){if(!axes[number - 1])axes[number - 1] = {n:number, // save the number for future reference
	direction:axes == xaxes?"x":"y",options:$.extend(true,{},axes == xaxes?options.xaxis:options.yaxis)};return axes[number - 1];}function fillInSeriesOptions(){var neededColors=series.length,maxIndex=-1,i; // Subtract the number of series that already have fixed colors or
	// color indexes from the number that we still need to generate.
	for(i = 0;i < series.length;++i) {var sc=series[i].color;if(sc != null){neededColors--;if(typeof sc == "number" && sc > maxIndex){maxIndex = sc;}}} // If any of the series have fixed color indexes, then we need to
	// generate at least as many colors as the highest index.
	if(neededColors <= maxIndex){neededColors = maxIndex + 1;} // Generate all the colors, using first the option colors and then
	// variations on those colors once they're exhausted.
	var c,colors=[],colorPool=options.colors,colorPoolSize=colorPool.length,variation=0;for(i = 0;i < neededColors;i++) {c = $.color.parse(colorPool[i % colorPoolSize] || "#666"); // Each time we exhaust the colors in the pool we adjust
	// a scaling factor used to produce more variations on
	// those colors. The factor alternates negative/positive
	// to produce lighter/darker colors.
	// Reset the variation after every few cycles, or else
	// it will end up producing only white or black colors.
	if(i % colorPoolSize == 0 && i){if(variation >= 0){if(variation < 0.5){variation = -variation - 0.2;}else variation = 0;}else variation = -variation;}colors[i] = c.scale('rgb',1 + variation);} // Finalize the series options, filling in their colors
	var colori=0,s;for(i = 0;i < series.length;++i) {s = series[i]; // assign colors
	if(s.color == null){s.color = colors[colori].toString();++colori;}else if(typeof s.color == "number")s.color = colors[s.color].toString(); // turn on lines automatically in case nothing is set
	if(s.lines.show == null){var v,show=true;for(v in s) {if(s[v] && s[v].show){show = false;break;}}if(show)s.lines.show = true;} // If nothing was provided for lines.zero, default it to match
	// lines.fill, since areas by default should extend to zero.
	if(s.lines.zero == null){s.lines.zero = !!s.lines.fill;} // setup axes
	s.xaxis = getOrCreateAxis(xaxes,axisNumber(s,"x"));s.yaxis = getOrCreateAxis(yaxes,axisNumber(s,"y"));}}function processData(){var topSentry=Number.POSITIVE_INFINITY,bottomSentry=Number.NEGATIVE_INFINITY,fakeInfinity=Number.MAX_VALUE,i,j,k,m,length,s,points,ps,x,y,axis,val,f,p,data,format;function updateAxis(axis,min,max){if(min < axis.datamin && min != -fakeInfinity)axis.datamin = min;if(max > axis.datamax && max != fakeInfinity)axis.datamax = max;}$.each(allAxes(),function(_,axis){ // init axis
	axis.datamin = topSentry;axis.datamax = bottomSentry;axis.used = false;});for(i = 0;i < series.length;++i) {s = series[i];s.datapoints = {points:[]};executeHooks(hooks.processRawData,[s,s.data,s.datapoints]);} // first pass: clean and copy data
	for(i = 0;i < series.length;++i) {s = series[i];data = s.data;format = s.datapoints.format;if(!format){format = []; // find out how to copy
	format.push({x:true,number:true,required:true});format.push({y:true,number:true,required:true});if(s.bars.show || s.lines.show && s.lines.fill){var autoscale=!!(s.bars.show && s.bars.zero || s.lines.show && s.lines.zero);format.push({y:true,number:true,required:false,defaultValue:0,autoscale:autoscale});if(s.bars.horizontal){delete format[format.length - 1].y;format[format.length - 1].x = true;}}s.datapoints.format = format;}if(s.datapoints.pointsize != null)continue; // already filled in
	s.datapoints.pointsize = format.length;ps = s.datapoints.pointsize;points = s.datapoints.points;var insertSteps=s.lines.show && s.lines.steps;s.xaxis.used = s.yaxis.used = true;for(j = k = 0;j < data.length;++j,k += ps) {p = data[j];var nullify=p == null;if(!nullify){for(m = 0;m < ps;++m) {val = p[m];f = format[m];if(f){if(f.number && val != null){val = +val; // convert to number
	if(isNaN(val))val = null;else if(val == Infinity)val = fakeInfinity;else if(val == -Infinity)val = -fakeInfinity;}if(val == null){if(f.required)nullify = true;if(f.defaultValue != null)val = f.defaultValue;}}points[k + m] = val;}}if(nullify){for(m = 0;m < ps;++m) {val = points[k + m];if(val != null){f = format[m]; // extract min/max info
	if(f.autoscale !== false){if(f.x){updateAxis(s.xaxis,val,val);}if(f.y){updateAxis(s.yaxis,val,val);}}}points[k + m] = null;}}else { // a little bit of line specific stuff that
	// perhaps shouldn't be here, but lacking
	// better means...
	if(insertSteps && k > 0 && points[k - ps] != null && points[k - ps] != points[k] && points[k - ps + 1] != points[k + 1]){ // copy the point to make room for a middle point
	for(m = 0;m < ps;++m) {points[k + ps + m] = points[k + m];} // middle point has same y
	points[k + 1] = points[k - ps + 1]; // we've added a point, better reflect that
	k += ps;}}}} // give the hooks a chance to run
	for(i = 0;i < series.length;++i) {s = series[i];executeHooks(hooks.processDatapoints,[s,s.datapoints]);} // second pass: find datamax/datamin for auto-scaling
	for(i = 0;i < series.length;++i) {s = series[i];points = s.datapoints.points;ps = s.datapoints.pointsize;format = s.datapoints.format;var xmin=topSentry,ymin=topSentry,xmax=bottomSentry,ymax=bottomSentry;for(j = 0;j < points.length;j += ps) {if(points[j] == null)continue;for(m = 0;m < ps;++m) {val = points[j + m];f = format[m];if(!f || f.autoscale === false || val == fakeInfinity || val == -fakeInfinity)continue;if(f.x){if(val < xmin)xmin = val;if(val > xmax)xmax = val;}if(f.y){if(val < ymin)ymin = val;if(val > ymax)ymax = val;}}}if(s.bars.show){ // make sure we got room for the bar on the dancing floor
	var delta;switch(s.bars.align){case "left":delta = 0;break;case "right":delta = -s.bars.barWidth;break;default:delta = -s.bars.barWidth / 2;}if(s.bars.horizontal){ymin += delta;ymax += delta + s.bars.barWidth;}else {xmin += delta;xmax += delta + s.bars.barWidth;}}updateAxis(s.xaxis,xmin,xmax);updateAxis(s.yaxis,ymin,ymax);}$.each(allAxes(),function(_,axis){if(axis.datamin == topSentry)axis.datamin = null;if(axis.datamax == bottomSentry)axis.datamax = null;});}function setupCanvases(){ // Make sure the placeholder is clear of everything except canvases
	// from a previous plot in this container that we'll try to re-use.
	placeholder.css("padding",0) // padding messes up the positioning
	.children().filter(function(){return !$(this).hasClass("flot-overlay") && !$(this).hasClass('flot-base');}).remove();if(placeholder.css("position") == 'static')placeholder.css("position","relative"); // for positioning labels and overlay
	surface = new Canvas("flot-base",placeholder);overlay = new Canvas("flot-overlay",placeholder); // overlay canvas for interactive features
	ctx = surface.context;octx = overlay.context; // define which element we're listening for events on
	eventHolder = $(overlay.element).unbind(); // If we're re-using a plot object, shut down the old one
	var existing=placeholder.data("plot");if(existing){existing.shutdown();overlay.clear();} // save in case we get replotted
	placeholder.data("plot",plot);}function bindEvents(){ // bind events
	if(options.grid.hoverable){eventHolder.mousemove(onMouseMove); // Use bind, rather than .mouseleave, because we officially
	// still support jQuery 1.2.6, which doesn't define a shortcut
	// for mouseenter or mouseleave.  This was a bug/oversight that
	// was fixed somewhere around 1.3.x.  We can return to using
	// .mouseleave when we drop support for 1.2.6.
	eventHolder.bind("mouseleave",onMouseLeave);}if(options.grid.clickable)eventHolder.click(onClick);executeHooks(hooks.bindEvents,[eventHolder]);}function shutdown(){if(redrawTimeout)clearTimeout(redrawTimeout);eventHolder.unbind("mousemove",onMouseMove);eventHolder.unbind("mouseleave",onMouseLeave);eventHolder.unbind("click",onClick);executeHooks(hooks.shutdown,[eventHolder]);}function setTransformationHelpers(axis){ // set helper functions on the axis, assumes plot area
	// has been computed already
	function identity(x){return x;}var s,m,t=axis.options.transform || identity,it=axis.options.inverseTransform; // precompute how much the axis is scaling a point
	// in canvas space
	if(axis.direction == "x"){s = axis.scale = plotWidth / Math.abs(t(axis.max) - t(axis.min));m = Math.min(t(axis.max),t(axis.min));}else {s = axis.scale = plotHeight / Math.abs(t(axis.max) - t(axis.min));s = -s;m = Math.max(t(axis.max),t(axis.min));} // data point to canvas coordinate
	if(t == identity) // slight optimization
	axis.p2c = function(p){return (p - m) * s;};else axis.p2c = function(p){return (t(p) - m) * s;}; // canvas coordinate to data point
	if(!it)axis.c2p = function(c){return m + c / s;};else axis.c2p = function(c){return it(m + c / s);};}function measureTickLabels(axis){var opts=axis.options,ticks=axis.ticks || [],labelWidth=opts.labelWidth || 0,labelHeight=opts.labelHeight || 0,maxWidth=labelWidth || (axis.direction == "x"?Math.floor(surface.width / (ticks.length || 1)):null),legacyStyles=axis.direction + "Axis " + axis.direction + axis.n + "Axis",layer="flot-" + axis.direction + "-axis flot-" + axis.direction + axis.n + "-axis " + legacyStyles,font=opts.font || "flot-tick-label tickLabel";for(var i=0;i < ticks.length;++i) {var t=ticks[i];if(!t.label)continue;var info=surface.getTextInfo(layer,t.label,font,null,maxWidth);labelWidth = Math.max(labelWidth,info.width);labelHeight = Math.max(labelHeight,info.height);}axis.labelWidth = opts.labelWidth || labelWidth;axis.labelHeight = opts.labelHeight || labelHeight;}function allocateAxisBoxFirstPhase(axis){ // find the bounding box of the axis by looking at label
	// widths/heights and ticks, make room by diminishing the
	// plotOffset; this first phase only looks at one
	// dimension per axis, the other dimension depends on the
	// other axes so will have to wait
	var lw=axis.labelWidth,lh=axis.labelHeight,pos=axis.options.position,isXAxis=axis.direction === "x",tickLength=axis.options.tickLength,axisMargin=options.grid.axisMargin,padding=options.grid.labelMargin,innermost=true,outermost=true,first=true,found=false; // Determine the axis's position in its direction and on its side
	$.each(isXAxis?xaxes:yaxes,function(i,a){if(a && a.reserveSpace){if(a === axis){found = true;}else if(a.options.position === pos){if(found){outermost = false;}else {innermost = false;}}if(!found){first = false;}}}); // The outermost axis on each side has no margin
	if(outermost){axisMargin = 0;} // The ticks for the first axis in each direction stretch across
	if(tickLength == null){tickLength = first?"full":5;}if(!isNaN(+tickLength))padding += +tickLength;if(isXAxis){lh += padding;if(pos == "bottom"){plotOffset.bottom += lh + axisMargin;axis.box = {top:surface.height - plotOffset.bottom,height:lh};}else {axis.box = {top:plotOffset.top + axisMargin,height:lh};plotOffset.top += lh + axisMargin;}}else {lw += padding;if(pos == "left"){axis.box = {left:plotOffset.left + axisMargin,width:lw};plotOffset.left += lw + axisMargin;}else {plotOffset.right += lw + axisMargin;axis.box = {left:surface.width - plotOffset.right,width:lw};}} // save for future reference
	axis.position = pos;axis.tickLength = tickLength;axis.box.padding = padding;axis.innermost = innermost;}function allocateAxisBoxSecondPhase(axis){ // now that all axis boxes have been placed in one
	// dimension, we can set the remaining dimension coordinates
	if(axis.direction == "x"){axis.box.left = plotOffset.left - axis.labelWidth / 2;axis.box.width = surface.width - plotOffset.left - plotOffset.right + axis.labelWidth;}else {axis.box.top = plotOffset.top - axis.labelHeight / 2;axis.box.height = surface.height - plotOffset.bottom - plotOffset.top + axis.labelHeight;}}function adjustLayoutForThingsStickingOut(){ // possibly adjust plot offset to ensure everything stays
	// inside the canvas and isn't clipped off
	var minMargin=options.grid.minBorderMargin,axis,i; // check stuff from the plot (FIXME: this should just read
	// a value from the series, otherwise it's impossible to
	// customize)
	if(minMargin == null){minMargin = 0;for(i = 0;i < series.length;++i) {minMargin = Math.max(minMargin,2 * (series[i].points.radius + series[i].points.lineWidth / 2));}}var margins={left:minMargin,right:minMargin,top:minMargin,bottom:minMargin}; // check axis labels, note we don't check the actual
	// labels but instead use the overall width/height to not
	// jump as much around with replots
	$.each(allAxes(),function(_,axis){if(axis.reserveSpace && axis.ticks && axis.ticks.length){var lastTick=axis.ticks[axis.ticks.length - 1];if(axis.direction === "x"){margins.left = Math.max(margins.left,axis.labelWidth / 2);if(lastTick.v <= axis.max){margins.right = Math.max(margins.right,axis.labelWidth / 2);}}else {margins.bottom = Math.max(margins.bottom,axis.labelHeight / 2);if(lastTick.v <= axis.max){margins.top = Math.max(margins.top,axis.labelHeight / 2);}}}});plotOffset.left = Math.ceil(Math.max(margins.left,plotOffset.left));plotOffset.right = Math.ceil(Math.max(margins.right,plotOffset.right));plotOffset.top = Math.ceil(Math.max(margins.top,plotOffset.top));plotOffset.bottom = Math.ceil(Math.max(margins.bottom,plotOffset.bottom));}function setupGrid(){var i,axes=allAxes(),showGrid=options.grid.show; // Initialize the plot's offset from the edge of the canvas
	for(var a in plotOffset) {var margin=options.grid.margin || 0;plotOffset[a] = typeof margin == "number"?margin:margin[a] || 0;}executeHooks(hooks.processOffset,[plotOffset]); // If the grid is visible, add its border width to the offset
	for(var a in plotOffset) {if(_typeof(options.grid.borderWidth) == "object"){plotOffset[a] += showGrid?options.grid.borderWidth[a]:0;}else {plotOffset[a] += showGrid?options.grid.borderWidth:0;}} // init axes
	$.each(axes,function(_,axis){axis.show = axis.options.show;if(axis.show == null)axis.show = axis.used; // by default an axis is visible if it's got data
	axis.reserveSpace = axis.show || axis.options.reserveSpace;setRange(axis);});if(showGrid){var allocatedAxes=$.grep(axes,function(axis){return axis.reserveSpace;});$.each(allocatedAxes,function(_,axis){ // make the ticks
	setupTickGeneration(axis);setTicks(axis);snapRangeToTicks(axis,axis.ticks); // find labelWidth/Height for axis
	measureTickLabels(axis);}); // with all dimensions calculated, we can compute the
	// axis bounding boxes, start from the outside
	// (reverse order)
	for(i = allocatedAxes.length - 1;i >= 0;--i) {allocateAxisBoxFirstPhase(allocatedAxes[i]);} // make sure we've got enough space for things that
	// might stick out
	adjustLayoutForThingsStickingOut();$.each(allocatedAxes,function(_,axis){allocateAxisBoxSecondPhase(axis);});}plotWidth = surface.width - plotOffset.left - plotOffset.right;plotHeight = surface.height - plotOffset.bottom - plotOffset.top; // now we got the proper plot dimensions, we can compute the scaling
	$.each(axes,function(_,axis){setTransformationHelpers(axis);});if(showGrid){drawAxisLabels();}insertLegend();}function setRange(axis){var opts=axis.options,min=+(opts.min != null?opts.min:axis.datamin),max=+(opts.max != null?opts.max:axis.datamax),delta=max - min;if(delta == 0.0){ // degenerate case
	var widen=max == 0?1:0.01;if(opts.min == null)min -= widen; // always widen max if we couldn't widen min to ensure we
	// don't fall into min == max which doesn't work
	if(opts.max == null || opts.min != null)max += widen;}else { // consider autoscaling
	var margin=opts.autoscaleMargin;if(margin != null){if(opts.min == null){min -= delta * margin; // make sure we don't go below zero if all values
	// are positive
	if(min < 0 && axis.datamin != null && axis.datamin >= 0)min = 0;}if(opts.max == null){max += delta * margin;if(max > 0 && axis.datamax != null && axis.datamax <= 0)max = 0;}}}axis.min = min;axis.max = max;}function setupTickGeneration(axis){var opts=axis.options; // estimate number of ticks
	var noTicks;if(typeof opts.ticks == "number" && opts.ticks > 0)noTicks = opts.ticks;else  // heuristic based on the model a*sqrt(x) fitted to
	// some data points that seemed reasonable
	noTicks = 0.3 * Math.sqrt(axis.direction == "x"?surface.width:surface.height);var delta=(axis.max - axis.min) / noTicks,dec=-Math.floor(Math.log(delta) / Math.LN10),maxDec=opts.tickDecimals;if(maxDec != null && dec > maxDec){dec = maxDec;}var magn=Math.pow(10,-dec),norm=delta / magn, // norm is between 1.0 and 10.0
	size;if(norm < 1.5){size = 1;}else if(norm < 3){size = 2; // special case for 2.5, requires an extra decimal
	if(norm > 2.25 && (maxDec == null || dec + 1 <= maxDec)){size = 2.5;++dec;}}else if(norm < 7.5){size = 5;}else {size = 10;}size *= magn;if(opts.minTickSize != null && size < opts.minTickSize){size = opts.minTickSize;}axis.delta = delta;axis.tickDecimals = Math.max(0,maxDec != null?maxDec:dec);axis.tickSize = opts.tickSize || size; // Time mode was moved to a plug-in in 0.8, but since so many people use this
	// we'll add an especially friendly make sure they remembered to include it.
	if(opts.mode == "time" && !axis.tickGenerator){throw new Error("Time mode requires the flot.time plugin.");} // Flot supports base-10 axes; any other mode else is handled by a plug-in,
	// like flot.time.js.
	if(!axis.tickGenerator){axis.tickGenerator = function(axis){var ticks=[],start=floorInBase(axis.min,axis.tickSize),i=0,v=Number.NaN,prev;do {prev = v;v = start + i * axis.tickSize;ticks.push(v);++i;}while(v < axis.max && v != prev);return ticks;};axis.tickFormatter = function(value,axis){var factor=axis.tickDecimals?Math.pow(10,axis.tickDecimals):1;var formatted="" + Math.round(value * factor) / factor; // If tickDecimals was specified, ensure that we have exactly that
	// much precision; otherwise default to the value's own precision.
	if(axis.tickDecimals != null){var decimal=formatted.indexOf(".");var precision=decimal == -1?0:formatted.length - decimal - 1;if(precision < axis.tickDecimals){return (precision?formatted:formatted + ".") + ("" + factor).substr(1,axis.tickDecimals - precision);}}return formatted;};}if($.isFunction(opts.tickFormatter))axis.tickFormatter = function(v,axis){return "" + opts.tickFormatter(v,axis);};if(opts.alignTicksWithAxis != null){var otherAxis=(axis.direction == "x"?xaxes:yaxes)[opts.alignTicksWithAxis - 1];if(otherAxis && otherAxis.used && otherAxis != axis){ // consider snapping min/max to outermost nice ticks
	var niceTicks=axis.tickGenerator(axis);if(niceTicks.length > 0){if(opts.min == null)axis.min = Math.min(axis.min,niceTicks[0]);if(opts.max == null && niceTicks.length > 1)axis.max = Math.max(axis.max,niceTicks[niceTicks.length - 1]);}axis.tickGenerator = function(axis){ // copy ticks, scaled to this axis
	var ticks=[],v,i;for(i = 0;i < otherAxis.ticks.length;++i) {v = (otherAxis.ticks[i].v - otherAxis.min) / (otherAxis.max - otherAxis.min);v = axis.min + v * (axis.max - axis.min);ticks.push(v);}return ticks;}; // we might need an extra decimal since forced
	// ticks don't necessarily fit naturally
	if(!axis.mode && opts.tickDecimals == null){var extraDec=Math.max(0,-Math.floor(Math.log(axis.delta) / Math.LN10) + 1),ts=axis.tickGenerator(axis); // only proceed if the tick interval rounded
	// with an extra decimal doesn't give us a
	// zero at end
	if(!(ts.length > 1 && /\..*0$/.test((ts[1] - ts[0]).toFixed(extraDec))))axis.tickDecimals = extraDec;}}}}function setTicks(axis){var oticks=axis.options.ticks,ticks=[];if(oticks == null || typeof oticks == "number" && oticks > 0)ticks = axis.tickGenerator(axis);else if(oticks){if($.isFunction(oticks)) // generate the ticks
	ticks = oticks(axis);else ticks = oticks;} // clean up/labelify the supplied ticks, copy them over
	var i,v;axis.ticks = [];for(i = 0;i < ticks.length;++i) {var label=null;var t=ticks[i];if((typeof t === "undefined"?"undefined":_typeof(t)) == "object"){v = +t[0];if(t.length > 1)label = t[1];}else v = +t;if(label == null)label = axis.tickFormatter(v,axis);if(!isNaN(v))axis.ticks.push({v:v,label:label});}}function snapRangeToTicks(axis,ticks){if(axis.options.autoscaleMargin && ticks.length > 0){ // snap to ticks
	if(axis.options.min == null)axis.min = Math.min(axis.min,ticks[0].v);if(axis.options.max == null && ticks.length > 1)axis.max = Math.max(axis.max,ticks[ticks.length - 1].v);}}function draw(){surface.clear();executeHooks(hooks.drawBackground,[ctx]);var grid=options.grid; // draw background, if any
	if(grid.show && grid.backgroundColor)drawBackground();if(grid.show && !grid.aboveData){drawGrid();}for(var i=0;i < series.length;++i) {executeHooks(hooks.drawSeries,[ctx,series[i]]);drawSeries(series[i]);}executeHooks(hooks.draw,[ctx]);if(grid.show && grid.aboveData){drawGrid();}surface.render(); // A draw implies that either the axes or data have changed, so we
	// should probably update the overlay highlights as well.
	triggerRedrawOverlay();}function extractRange(ranges,coord){var axis,from,to,key,axes=allAxes();for(var i=0;i < axes.length;++i) {axis = axes[i];if(axis.direction == coord){key = coord + axis.n + "axis";if(!ranges[key] && axis.n == 1)key = coord + "axis"; // support x1axis as xaxis
	if(ranges[key]){from = ranges[key].from;to = ranges[key].to;break;}}} // backwards-compat stuff - to be removed in future
	if(!ranges[key]){axis = coord == "x"?xaxes[0]:yaxes[0];from = ranges[coord + "1"];to = ranges[coord + "2"];} // auto-reverse as an added bonus
	if(from != null && to != null && from > to){var tmp=from;from = to;to = tmp;}return {from:from,to:to,axis:axis};}function drawBackground(){ctx.save();ctx.translate(plotOffset.left,plotOffset.top);ctx.fillStyle = getColorOrGradient(options.grid.backgroundColor,plotHeight,0,"rgba(255, 255, 255, 0)");ctx.fillRect(0,0,plotWidth,plotHeight);ctx.restore();}function drawGrid(){var i,axes,bw,bc;ctx.save();ctx.translate(plotOffset.left,plotOffset.top); // draw markings
	var markings=options.grid.markings;if(markings){if($.isFunction(markings)){axes = plot.getAxes(); // xmin etc. is backwards compatibility, to be
	// removed in the future
	axes.xmin = axes.xaxis.min;axes.xmax = axes.xaxis.max;axes.ymin = axes.yaxis.min;axes.ymax = axes.yaxis.max;markings = markings(axes);}for(i = 0;i < markings.length;++i) {var m=markings[i],xrange=extractRange(m,"x"),yrange=extractRange(m,"y"); // fill in missing
	if(xrange.from == null)xrange.from = xrange.axis.min;if(xrange.to == null)xrange.to = xrange.axis.max;if(yrange.from == null)yrange.from = yrange.axis.min;if(yrange.to == null)yrange.to = yrange.axis.max; // clip
	if(xrange.to < xrange.axis.min || xrange.from > xrange.axis.max || yrange.to < yrange.axis.min || yrange.from > yrange.axis.max)continue;xrange.from = Math.max(xrange.from,xrange.axis.min);xrange.to = Math.min(xrange.to,xrange.axis.max);yrange.from = Math.max(yrange.from,yrange.axis.min);yrange.to = Math.min(yrange.to,yrange.axis.max);if(xrange.from == xrange.to && yrange.from == yrange.to)continue; // then draw
	xrange.from = xrange.axis.p2c(xrange.from);xrange.to = xrange.axis.p2c(xrange.to);yrange.from = yrange.axis.p2c(yrange.from);yrange.to = yrange.axis.p2c(yrange.to);if(xrange.from == xrange.to || yrange.from == yrange.to){ // draw line
	ctx.beginPath();ctx.strokeStyle = m.color || options.grid.markingsColor;ctx.lineWidth = m.lineWidth || options.grid.markingsLineWidth;ctx.moveTo(xrange.from,yrange.from);ctx.lineTo(xrange.to,yrange.to);ctx.stroke();}else { // fill area
	ctx.fillStyle = m.color || options.grid.markingsColor;ctx.fillRect(xrange.from,yrange.to,xrange.to - xrange.from,yrange.from - yrange.to);}}} // draw the ticks
	axes = allAxes();bw = options.grid.borderWidth;for(var j=0;j < axes.length;++j) {var axis=axes[j],box=axis.box,t=axis.tickLength,x,y,xoff,yoff;if(!axis.show || axis.ticks.length == 0)continue;ctx.lineWidth = 1; // find the edges
	if(axis.direction == "x"){x = 0;if(t == "full")y = axis.position == "top"?0:plotHeight;else y = box.top - plotOffset.top + (axis.position == "top"?box.height:0);}else {y = 0;if(t == "full")x = axis.position == "left"?0:plotWidth;else x = box.left - plotOffset.left + (axis.position == "left"?box.width:0);} // draw tick bar
	if(!axis.innermost){ctx.strokeStyle = axis.options.color;ctx.beginPath();xoff = yoff = 0;if(axis.direction == "x")xoff = plotWidth + 1;else yoff = plotHeight + 1;if(ctx.lineWidth == 1){if(axis.direction == "x"){y = Math.floor(y) + 0.5;}else {x = Math.floor(x) + 0.5;}}ctx.moveTo(x,y);ctx.lineTo(x + xoff,y + yoff);ctx.stroke();} // draw ticks
	ctx.strokeStyle = axis.options.tickColor;ctx.beginPath();for(i = 0;i < axis.ticks.length;++i) {var v=axis.ticks[i].v;xoff = yoff = 0;if(isNaN(v) || v < axis.min || v > axis.max // skip those lying on the axes if we got a border
	 || t == "full" && ((typeof bw === "undefined"?"undefined":_typeof(bw)) == "object" && bw[axis.position] > 0 || bw > 0) && (v == axis.min || v == axis.max))continue;if(axis.direction == "x"){x = axis.p2c(v);yoff = t == "full"?-plotHeight:t;if(axis.position == "top")yoff = -yoff;}else {y = axis.p2c(v);xoff = t == "full"?-plotWidth:t;if(axis.position == "left")xoff = -xoff;}if(ctx.lineWidth == 1){if(axis.direction == "x")x = Math.floor(x) + 0.5;else y = Math.floor(y) + 0.5;}ctx.moveTo(x,y);ctx.lineTo(x + xoff,y + yoff);}ctx.stroke();} // draw border
	if(bw){ // If either borderWidth or borderColor is an object, then draw the border
	// line by line instead of as one rectangle
	bc = options.grid.borderColor;if((typeof bw === "undefined"?"undefined":_typeof(bw)) == "object" || (typeof bc === "undefined"?"undefined":_typeof(bc)) == "object"){if((typeof bw === "undefined"?"undefined":_typeof(bw)) !== "object"){bw = {top:bw,right:bw,bottom:bw,left:bw};}if((typeof bc === "undefined"?"undefined":_typeof(bc)) !== "object"){bc = {top:bc,right:bc,bottom:bc,left:bc};}if(bw.top > 0){ctx.strokeStyle = bc.top;ctx.lineWidth = bw.top;ctx.beginPath();ctx.moveTo(0 - bw.left,0 - bw.top / 2);ctx.lineTo(plotWidth,0 - bw.top / 2);ctx.stroke();}if(bw.right > 0){ctx.strokeStyle = bc.right;ctx.lineWidth = bw.right;ctx.beginPath();ctx.moveTo(plotWidth + bw.right / 2,0 - bw.top);ctx.lineTo(plotWidth + bw.right / 2,plotHeight);ctx.stroke();}if(bw.bottom > 0){ctx.strokeStyle = bc.bottom;ctx.lineWidth = bw.bottom;ctx.beginPath();ctx.moveTo(plotWidth + bw.right,plotHeight + bw.bottom / 2);ctx.lineTo(0,plotHeight + bw.bottom / 2);ctx.stroke();}if(bw.left > 0){ctx.strokeStyle = bc.left;ctx.lineWidth = bw.left;ctx.beginPath();ctx.moveTo(0 - bw.left / 2,plotHeight + bw.bottom);ctx.lineTo(0 - bw.left / 2,0);ctx.stroke();}}else {ctx.lineWidth = bw;ctx.strokeStyle = options.grid.borderColor;ctx.strokeRect(-bw / 2,-bw / 2,plotWidth + bw,plotHeight + bw);}}ctx.restore();}function drawAxisLabels(){$.each(allAxes(),function(_,axis){var box=axis.box,legacyStyles=axis.direction + "Axis " + axis.direction + axis.n + "Axis",layer="flot-" + axis.direction + "-axis flot-" + axis.direction + axis.n + "-axis " + legacyStyles,font=axis.options.font || "flot-tick-label tickLabel",tick,x,y,halign,valign; // Remove text before checking for axis.show and ticks.length;
	// otherwise plugins, like flot-tickrotor, that draw their own
	// tick labels will end up with both theirs and the defaults.
	surface.removeText(layer);if(!axis.show || axis.ticks.length == 0)return;for(var i=0;i < axis.ticks.length;++i) {tick = axis.ticks[i];if(!tick.label || tick.v < axis.min || tick.v > axis.max)continue;if(axis.direction == "x"){halign = "center";x = plotOffset.left + axis.p2c(tick.v);if(axis.position == "bottom"){y = box.top + box.padding;}else {y = box.top + box.height - box.padding;valign = "bottom";}}else {valign = "middle";y = plotOffset.top + axis.p2c(tick.v);if(axis.position == "left"){x = box.left + box.width - box.padding;halign = "right";}else {x = box.left + box.padding;}}surface.addText(layer,x,y,tick.label,font,null,null,halign,valign);}});}function drawSeries(series){if(series.lines.show)drawSeriesLines(series);if(series.bars.show)drawSeriesBars(series);if(series.points.show)drawSeriesPoints(series);}function drawSeriesLines(series){function plotLine(datapoints,xoffset,yoffset,axisx,axisy){var points=datapoints.points,ps=datapoints.pointsize,prevx=null,prevy=null;ctx.beginPath();for(var i=ps;i < points.length;i += ps) {var x1=points[i - ps],y1=points[i - ps + 1],x2=points[i],y2=points[i + 1];if(x1 == null || x2 == null)continue; // clip with ymin
	if(y1 <= y2 && y1 < axisy.min){if(y2 < axisy.min)continue; // line segment is outside
	// compute new intersection point
	x1 = (axisy.min - y1) / (y2 - y1) * (x2 - x1) + x1;y1 = axisy.min;}else if(y2 <= y1 && y2 < axisy.min){if(y1 < axisy.min)continue;x2 = (axisy.min - y1) / (y2 - y1) * (x2 - x1) + x1;y2 = axisy.min;} // clip with ymax
	if(y1 >= y2 && y1 > axisy.max){if(y2 > axisy.max)continue;x1 = (axisy.max - y1) / (y2 - y1) * (x2 - x1) + x1;y1 = axisy.max;}else if(y2 >= y1 && y2 > axisy.max){if(y1 > axisy.max)continue;x2 = (axisy.max - y1) / (y2 - y1) * (x2 - x1) + x1;y2 = axisy.max;} // clip with xmin
	if(x1 <= x2 && x1 < axisx.min){if(x2 < axisx.min)continue;y1 = (axisx.min - x1) / (x2 - x1) * (y2 - y1) + y1;x1 = axisx.min;}else if(x2 <= x1 && x2 < axisx.min){if(x1 < axisx.min)continue;y2 = (axisx.min - x1) / (x2 - x1) * (y2 - y1) + y1;x2 = axisx.min;} // clip with xmax
	if(x1 >= x2 && x1 > axisx.max){if(x2 > axisx.max)continue;y1 = (axisx.max - x1) / (x2 - x1) * (y2 - y1) + y1;x1 = axisx.max;}else if(x2 >= x1 && x2 > axisx.max){if(x1 > axisx.max)continue;y2 = (axisx.max - x1) / (x2 - x1) * (y2 - y1) + y1;x2 = axisx.max;}if(x1 != prevx || y1 != prevy)ctx.moveTo(axisx.p2c(x1) + xoffset,axisy.p2c(y1) + yoffset);prevx = x2;prevy = y2;ctx.lineTo(axisx.p2c(x2) + xoffset,axisy.p2c(y2) + yoffset);}ctx.stroke();}function plotLineArea(datapoints,axisx,axisy){var points=datapoints.points,ps=datapoints.pointsize,bottom=Math.min(Math.max(0,axisy.min),axisy.max),i=0,top,areaOpen=false,ypos=1,segmentStart=0,segmentEnd=0; // we process each segment in two turns, first forward
	// direction to sketch out top, then once we hit the
	// end we go backwards to sketch the bottom
	while(true) {if(ps > 0 && i > points.length + ps)break;i += ps; // ps is negative if going backwards
	var x1=points[i - ps],y1=points[i - ps + ypos],x2=points[i],y2=points[i + ypos];if(areaOpen){if(ps > 0 && x1 != null && x2 == null){ // at turning point
	segmentEnd = i;ps = -ps;ypos = 2;continue;}if(ps < 0 && i == segmentStart + ps){ // done with the reverse sweep
	ctx.fill();areaOpen = false;ps = -ps;ypos = 1;i = segmentStart = segmentEnd + ps;continue;}}if(x1 == null || x2 == null)continue; // clip x values
	// clip with xmin
	if(x1 <= x2 && x1 < axisx.min){if(x2 < axisx.min)continue;y1 = (axisx.min - x1) / (x2 - x1) * (y2 - y1) + y1;x1 = axisx.min;}else if(x2 <= x1 && x2 < axisx.min){if(x1 < axisx.min)continue;y2 = (axisx.min - x1) / (x2 - x1) * (y2 - y1) + y1;x2 = axisx.min;} // clip with xmax
	if(x1 >= x2 && x1 > axisx.max){if(x2 > axisx.max)continue;y1 = (axisx.max - x1) / (x2 - x1) * (y2 - y1) + y1;x1 = axisx.max;}else if(x2 >= x1 && x2 > axisx.max){if(x1 > axisx.max)continue;y2 = (axisx.max - x1) / (x2 - x1) * (y2 - y1) + y1;x2 = axisx.max;}if(!areaOpen){ // open area
	ctx.beginPath();ctx.moveTo(axisx.p2c(x1),axisy.p2c(bottom));areaOpen = true;} // now first check the case where both is outside
	if(y1 >= axisy.max && y2 >= axisy.max){ctx.lineTo(axisx.p2c(x1),axisy.p2c(axisy.max));ctx.lineTo(axisx.p2c(x2),axisy.p2c(axisy.max));continue;}else if(y1 <= axisy.min && y2 <= axisy.min){ctx.lineTo(axisx.p2c(x1),axisy.p2c(axisy.min));ctx.lineTo(axisx.p2c(x2),axisy.p2c(axisy.min));continue;} // else it's a bit more complicated, there might
	// be a flat maxed out rectangle first, then a
	// triangular cutout or reverse; to find these
	// keep track of the current x values
	var x1old=x1,x2old=x2; // clip the y values, without shortcutting, we
	// go through all cases in turn
	// clip with ymin
	if(y1 <= y2 && y1 < axisy.min && y2 >= axisy.min){x1 = (axisy.min - y1) / (y2 - y1) * (x2 - x1) + x1;y1 = axisy.min;}else if(y2 <= y1 && y2 < axisy.min && y1 >= axisy.min){x2 = (axisy.min - y1) / (y2 - y1) * (x2 - x1) + x1;y2 = axisy.min;} // clip with ymax
	if(y1 >= y2 && y1 > axisy.max && y2 <= axisy.max){x1 = (axisy.max - y1) / (y2 - y1) * (x2 - x1) + x1;y1 = axisy.max;}else if(y2 >= y1 && y2 > axisy.max && y1 <= axisy.max){x2 = (axisy.max - y1) / (y2 - y1) * (x2 - x1) + x1;y2 = axisy.max;} // if the x value was changed we got a rectangle
	// to fill
	if(x1 != x1old){ctx.lineTo(axisx.p2c(x1old),axisy.p2c(y1)); // it goes to (x1, y1), but we fill that below
	} // fill triangular section, this sometimes result
	// in redundant points if (x1, y1) hasn't changed
	// from previous line to, but we just ignore that
	ctx.lineTo(axisx.p2c(x1),axisy.p2c(y1));ctx.lineTo(axisx.p2c(x2),axisy.p2c(y2)); // fill the other rectangle if it's there
	if(x2 != x2old){ctx.lineTo(axisx.p2c(x2),axisy.p2c(y2));ctx.lineTo(axisx.p2c(x2old),axisy.p2c(y2));}}}ctx.save();ctx.translate(plotOffset.left,plotOffset.top);ctx.lineJoin = "round";var lw=series.lines.lineWidth,sw=series.shadowSize; // FIXME: consider another form of shadow when filling is turned on
	if(lw > 0 && sw > 0){ // draw shadow as a thick and thin line with transparency
	ctx.lineWidth = sw;ctx.strokeStyle = "rgba(0,0,0,0.1)"; // position shadow at angle from the mid of line
	var angle=Math.PI / 18;plotLine(series.datapoints,Math.sin(angle) * (lw / 2 + sw / 2),Math.cos(angle) * (lw / 2 + sw / 2),series.xaxis,series.yaxis);ctx.lineWidth = sw / 2;plotLine(series.datapoints,Math.sin(angle) * (lw / 2 + sw / 4),Math.cos(angle) * (lw / 2 + sw / 4),series.xaxis,series.yaxis);}ctx.lineWidth = lw;ctx.strokeStyle = series.color;var fillStyle=getFillStyle(series.lines,series.color,0,plotHeight);if(fillStyle){ctx.fillStyle = fillStyle;plotLineArea(series.datapoints,series.xaxis,series.yaxis);}if(lw > 0)plotLine(series.datapoints,0,0,series.xaxis,series.yaxis);ctx.restore();}function drawSeriesPoints(series){function plotPoints(datapoints,radius,fillStyle,offset,shadow,axisx,axisy,symbol){var points=datapoints.points,ps=datapoints.pointsize;for(var i=0;i < points.length;i += ps) {var x=points[i],y=points[i + 1];if(x == null || x < axisx.min || x > axisx.max || y < axisy.min || y > axisy.max)continue;ctx.beginPath();x = axisx.p2c(x);y = axisy.p2c(y) + offset;if(symbol == "circle")ctx.arc(x,y,radius,0,shadow?Math.PI:Math.PI * 2,false);else symbol(ctx,x,y,radius,shadow);ctx.closePath();if(fillStyle){ctx.fillStyle = fillStyle;ctx.fill();}ctx.stroke();}}ctx.save();ctx.translate(plotOffset.left,plotOffset.top);var lw=series.points.lineWidth,sw=series.shadowSize,radius=series.points.radius,symbol=series.points.symbol; // If the user sets the line width to 0, we change it to a very 
	// small value. A line width of 0 seems to force the default of 1.
	// Doing the conditional here allows the shadow setting to still be 
	// optional even with a lineWidth of 0.
	if(lw == 0)lw = 0.0001;if(lw > 0 && sw > 0){ // draw shadow in two steps
	var w=sw / 2;ctx.lineWidth = w;ctx.strokeStyle = "rgba(0,0,0,0.1)";plotPoints(series.datapoints,radius,null,w + w / 2,true,series.xaxis,series.yaxis,symbol);ctx.strokeStyle = "rgba(0,0,0,0.2)";plotPoints(series.datapoints,radius,null,w / 2,true,series.xaxis,series.yaxis,symbol);}ctx.lineWidth = lw;ctx.strokeStyle = series.color;plotPoints(series.datapoints,radius,getFillStyle(series.points,series.color),0,false,series.xaxis,series.yaxis,symbol);ctx.restore();}function drawBar(x,y,b,barLeft,barRight,fillStyleCallback,axisx,axisy,c,horizontal,lineWidth){var left,right,bottom,top,drawLeft,drawRight,drawTop,drawBottom,tmp; // in horizontal mode, we start the bar from the left
	// instead of from the bottom so it appears to be
	// horizontal rather than vertical
	if(horizontal){drawBottom = drawRight = drawTop = true;drawLeft = false;left = b;right = x;top = y + barLeft;bottom = y + barRight; // account for negative bars
	if(right < left){tmp = right;right = left;left = tmp;drawLeft = true;drawRight = false;}}else {drawLeft = drawRight = drawTop = true;drawBottom = false;left = x + barLeft;right = x + barRight;bottom = b;top = y; // account for negative bars
	if(top < bottom){tmp = top;top = bottom;bottom = tmp;drawBottom = true;drawTop = false;}} // clip
	if(right < axisx.min || left > axisx.max || top < axisy.min || bottom > axisy.max)return;if(left < axisx.min){left = axisx.min;drawLeft = false;}if(right > axisx.max){right = axisx.max;drawRight = false;}if(bottom < axisy.min){bottom = axisy.min;drawBottom = false;}if(top > axisy.max){top = axisy.max;drawTop = false;}left = axisx.p2c(left);bottom = axisy.p2c(bottom);right = axisx.p2c(right);top = axisy.p2c(top); // fill the bar
	if(fillStyleCallback){c.fillStyle = fillStyleCallback(bottom,top);c.fillRect(left,top,right - left,bottom - top);} // draw outline
	if(lineWidth > 0 && (drawLeft || drawRight || drawTop || drawBottom)){c.beginPath(); // FIXME: inline moveTo is buggy with excanvas
	c.moveTo(left,bottom);if(drawLeft)c.lineTo(left,top);else c.moveTo(left,top);if(drawTop)c.lineTo(right,top);else c.moveTo(right,top);if(drawRight)c.lineTo(right,bottom);else c.moveTo(right,bottom);if(drawBottom)c.lineTo(left,bottom);else c.moveTo(left,bottom);c.stroke();}}function drawSeriesBars(series){function plotBars(datapoints,barLeft,barRight,fillStyleCallback,axisx,axisy){var points=datapoints.points,ps=datapoints.pointsize;for(var i=0;i < points.length;i += ps) {if(points[i] == null)continue;drawBar(points[i],points[i + 1],points[i + 2],barLeft,barRight,fillStyleCallback,axisx,axisy,ctx,series.bars.horizontal,series.bars.lineWidth);}}ctx.save();ctx.translate(plotOffset.left,plotOffset.top); // FIXME: figure out a way to add shadows (for instance along the right edge)
	ctx.lineWidth = series.bars.lineWidth;ctx.strokeStyle = series.color;var barLeft;switch(series.bars.align){case "left":barLeft = 0;break;case "right":barLeft = -series.bars.barWidth;break;default:barLeft = -series.bars.barWidth / 2;}var fillStyleCallback=series.bars.fill?function(bottom,top){return getFillStyle(series.bars,series.color,bottom,top);}:null;plotBars(series.datapoints,barLeft,barLeft + series.bars.barWidth,fillStyleCallback,series.xaxis,series.yaxis);ctx.restore();}function getFillStyle(filloptions,seriesColor,bottom,top){var fill=filloptions.fill;if(!fill)return null;if(filloptions.fillColor)return getColorOrGradient(filloptions.fillColor,bottom,top,seriesColor);var c=$.color.parse(seriesColor);c.a = typeof fill == "number"?fill:0.4;c.normalize();return c.toString();}function insertLegend(){if(options.legend.container != null){$(options.legend.container).html("");}else {placeholder.find(".legend").remove();}if(!options.legend.show){return;}var fragments=[],entries=[],rowStarted=false,lf=options.legend.labelFormatter,s,label; // Build a list of legend entries, with each having a label and a color
	for(var i=0;i < series.length;++i) {s = series[i];if(s.label){label = lf?lf(s.label,s):s.label;if(label){entries.push({label:label,color:s.color});}}} // Sort the legend using either the default or a custom comparator
	if(options.legend.sorted){if($.isFunction(options.legend.sorted)){entries.sort(options.legend.sorted);}else if(options.legend.sorted == "reverse"){entries.reverse();}else {var ascending=options.legend.sorted != "descending";entries.sort(function(a,b){return a.label == b.label?0:a.label < b.label != ascending?1:-1 // Logical XOR
	;});}} // Generate markup for the list of entries, in their final order
	for(var i=0;i < entries.length;++i) {var entry=entries[i];if(i % options.legend.noColumns == 0){if(rowStarted)fragments.push('</tr>');fragments.push('<tr>');rowStarted = true;}fragments.push('<td class="legendColorBox"><div style="border:1px solid ' + options.legend.labelBoxBorderColor + ';padding:1px"><div style="width:4px;height:0;border:5px solid ' + entry.color + ';overflow:hidden"></div></div></td>' + '<td class="legendLabel">' + entry.label + '</td>');}if(rowStarted)fragments.push('</tr>');if(fragments.length == 0)return;var table='<table style="font-size:smaller;color:' + options.grid.color + '">' + fragments.join("") + '</table>';if(options.legend.container != null)$(options.legend.container).html(table);else {var pos="",p=options.legend.position,m=options.legend.margin;if(m[0] == null)m = [m,m];if(p.charAt(0) == "n")pos += 'top:' + (m[1] + plotOffset.top) + 'px;';else if(p.charAt(0) == "s")pos += 'bottom:' + (m[1] + plotOffset.bottom) + 'px;';if(p.charAt(1) == "e")pos += 'right:' + (m[0] + plotOffset.right) + 'px;';else if(p.charAt(1) == "w")pos += 'left:' + (m[0] + plotOffset.left) + 'px;';var legend=$('<div class="legend">' + table.replace('style="','style="position:absolute;' + pos + ';') + '</div>').appendTo(placeholder);if(options.legend.backgroundOpacity != 0.0){ // put in the transparent background
	// separately to avoid blended labels and
	// label boxes
	var c=options.legend.backgroundColor;if(c == null){c = options.grid.backgroundColor;if(c && typeof c == "string")c = $.color.parse(c);else c = $.color.extract(legend,'background-color');c.a = 1;c = c.toString();}var div=legend.children();$('<div style="position:absolute;width:' + div.width() + 'px;height:' + div.height() + 'px;' + pos + 'background-color:' + c + ';"> </div>').prependTo(legend).css('opacity',options.legend.backgroundOpacity);}}} // interactive features
	var highlights=[],redrawTimeout=null; // returns the data item the mouse is over, or null if none is found
	function findNearbyItem(mouseX,mouseY,seriesFilter){var maxDistance=options.grid.mouseActiveRadius,smallestDistance=maxDistance * maxDistance + 1,item=null,foundPoint=false,i,j,ps;for(i = series.length - 1;i >= 0;--i) {if(!seriesFilter(series[i]))continue;var s=series[i],axisx=s.xaxis,axisy=s.yaxis,points=s.datapoints.points,mx=axisx.c2p(mouseX), // precompute some stuff to make the loop faster
	my=axisy.c2p(mouseY),maxx=maxDistance / axisx.scale,maxy=maxDistance / axisy.scale;ps = s.datapoints.pointsize; // with inverse transforms, we can't use the maxx/maxy
	// optimization, sadly
	if(axisx.options.inverseTransform)maxx = Number.MAX_VALUE;if(axisy.options.inverseTransform)maxy = Number.MAX_VALUE;if(s.lines.show || s.points.show){for(j = 0;j < points.length;j += ps) {var x=points[j],y=points[j + 1];if(x == null)continue; // For points and lines, the cursor must be within a
	// certain distance to the data point
	if(x - mx > maxx || x - mx < -maxx || y - my > maxy || y - my < -maxy)continue; // We have to calculate distances in pixels, not in
	// data units, because the scales of the axes may be different
	var dx=Math.abs(axisx.p2c(x) - mouseX),dy=Math.abs(axisy.p2c(y) - mouseY),dist=dx * dx + dy * dy; // we save the sqrt
	// use <= to ensure last point takes precedence
	// (last generally means on top of)
	if(dist < smallestDistance){smallestDistance = dist;item = [i,j / ps];}}}if(s.bars.show && !item){ // no other point can be nearby
	var barLeft,barRight;switch(s.bars.align){case "left":barLeft = 0;break;case "right":barLeft = -s.bars.barWidth;break;default:barLeft = -s.bars.barWidth / 2;}barRight = barLeft + s.bars.barWidth;for(j = 0;j < points.length;j += ps) {var x=points[j],y=points[j + 1],b=points[j + 2];if(x == null)continue; // for a bar graph, the cursor must be inside the bar
	if(series[i].bars.horizontal?mx <= Math.max(b,x) && mx >= Math.min(b,x) && my >= y + barLeft && my <= y + barRight:mx >= x + barLeft && mx <= x + barRight && my >= Math.min(b,y) && my <= Math.max(b,y))item = [i,j / ps];}}}if(item){i = item[0];j = item[1];ps = series[i].datapoints.pointsize;return {datapoint:series[i].datapoints.points.slice(j * ps,(j + 1) * ps),dataIndex:j,series:series[i],seriesIndex:i};}return null;}function onMouseMove(e){if(options.grid.hoverable)triggerClickHoverEvent("plothover",e,function(s){return s["hoverable"] != false;});}function onMouseLeave(e){if(options.grid.hoverable)triggerClickHoverEvent("plothover",e,function(s){return false;});}function onClick(e){triggerClickHoverEvent("plotclick",e,function(s){return s["clickable"] != false;});} // trigger click or hover event (they send the same parameters
	// so we share their code)
	function triggerClickHoverEvent(eventname,event,seriesFilter){var offset=eventHolder.offset(),canvasX=event.pageX - offset.left - plotOffset.left,canvasY=event.pageY - offset.top - plotOffset.top,pos=canvasToAxisCoords({left:canvasX,top:canvasY});pos.pageX = event.pageX;pos.pageY = event.pageY;var item=findNearbyItem(canvasX,canvasY,seriesFilter);if(item){ // fill in mouse pos for any listeners out there
	item.pageX = parseInt(item.series.xaxis.p2c(item.datapoint[0]) + offset.left + plotOffset.left,10);item.pageY = parseInt(item.series.yaxis.p2c(item.datapoint[1]) + offset.top + plotOffset.top,10);}if(options.grid.autoHighlight){ // clear auto-highlights
	for(var i=0;i < highlights.length;++i) {var h=highlights[i];if(h.auto == eventname && !(item && h.series == item.series && h.point[0] == item.datapoint[0] && h.point[1] == item.datapoint[1]))unhighlight(h.series,h.point);}if(item)highlight(item.series,item.datapoint,eventname);}placeholder.trigger(eventname,[pos,item]);}function triggerRedrawOverlay(){var t=options.interaction.redrawOverlayInterval;if(t == -1){ // skip event queue
	drawOverlay();return;}if(!redrawTimeout)redrawTimeout = setTimeout(drawOverlay,t);}function drawOverlay(){redrawTimeout = null; // draw highlights
	octx.save();overlay.clear();octx.translate(plotOffset.left,plotOffset.top);var i,hi;for(i = 0;i < highlights.length;++i) {hi = highlights[i];if(hi.series.bars.show)drawBarHighlight(hi.series,hi.point);else drawPointHighlight(hi.series,hi.point);}octx.restore();executeHooks(hooks.drawOverlay,[octx]);}function highlight(s,point,auto){if(typeof s == "number")s = series[s];if(typeof point == "number"){var ps=s.datapoints.pointsize;point = s.datapoints.points.slice(ps * point,ps * (point + 1));}var i=indexOfHighlight(s,point);if(i == -1){highlights.push({series:s,point:point,auto:auto});triggerRedrawOverlay();}else if(!auto)highlights[i].auto = false;}function unhighlight(s,point){if(s == null && point == null){highlights = [];triggerRedrawOverlay();return;}if(typeof s == "number")s = series[s];if(typeof point == "number"){var ps=s.datapoints.pointsize;point = s.datapoints.points.slice(ps * point,ps * (point + 1));}var i=indexOfHighlight(s,point);if(i != -1){highlights.splice(i,1);triggerRedrawOverlay();}}function indexOfHighlight(s,p){for(var i=0;i < highlights.length;++i) {var h=highlights[i];if(h.series == s && h.point[0] == p[0] && h.point[1] == p[1])return i;}return -1;}function drawPointHighlight(series,point){var x=point[0],y=point[1],axisx=series.xaxis,axisy=series.yaxis,highlightColor=typeof series.highlightColor === "string"?series.highlightColor:$.color.parse(series.color).scale('a',0.5).toString();if(x < axisx.min || x > axisx.max || y < axisy.min || y > axisy.max)return;var pointRadius=series.points.radius + series.points.lineWidth / 2;octx.lineWidth = pointRadius;octx.strokeStyle = highlightColor;var radius=1.5 * pointRadius;x = axisx.p2c(x);y = axisy.p2c(y);octx.beginPath();if(series.points.symbol == "circle")octx.arc(x,y,radius,0,2 * Math.PI,false);else series.points.symbol(octx,x,y,radius,false);octx.closePath();octx.stroke();}function drawBarHighlight(series,point){var highlightColor=typeof series.highlightColor === "string"?series.highlightColor:$.color.parse(series.color).scale('a',0.5).toString(),fillStyle=highlightColor,barLeft;switch(series.bars.align){case "left":barLeft = 0;break;case "right":barLeft = -series.bars.barWidth;break;default:barLeft = -series.bars.barWidth / 2;}octx.lineWidth = series.bars.lineWidth;octx.strokeStyle = highlightColor;drawBar(point[0],point[1],point[2] || 0,barLeft,barLeft + series.bars.barWidth,function(){return fillStyle;},series.xaxis,series.yaxis,octx,series.bars.horizontal,series.bars.lineWidth);}function getColorOrGradient(spec,bottom,top,defaultColor){if(typeof spec == "string")return spec;else { // assume this is a gradient spec; IE currently only
	// supports a simple vertical gradient properly, so that's
	// what we support too
	var gradient=ctx.createLinearGradient(0,top,0,bottom);for(var i=0,l=spec.colors.length;i < l;++i) {var c=spec.colors[i];if(typeof c != "string"){var co=$.color.parse(defaultColor);if(c.brightness != null)co = co.scale('rgb',c.brightness);if(c.opacity != null)co.a *= c.opacity;c = co.toString();}gradient.addColorStop(i / (l - 1),c);}return gradient;}}} // Add the plot function to the top level of the jQuery object
	$.plot = function(placeholder,data,options){ //var t0 = new Date();
	var plot=new Plot($(placeholder),data,options,$.plot.plugins); //(window.console ? console.log : alert)("time used (msecs): " + ((new Date()).getTime() - t0.getTime()));
	return plot;};$.plot.version = "0.8.2";$.plot.plugins = []; // Also add the plot function as a chainable property
	$.fn.plot = function(data,options){return this.each(function(){$.plot(this,data,options);});}; // round to nearby lower multiple of base
	function floorInBase(n,base){return base * Math.floor(n / base);}})(jQuery);

/***/ }),

/***/ 56:
/***/ (function(module, exports) {

	"use strict";

	/*
	 * jquery.flot.tooltip
	 *
	 * desc:	create tooltip with values of hovered point on the graph, 
						support many series, time mode, stacking and pie charts
						you can set custom tip content (also with use of HTML tags) and precision of values
	 * version:	0.4.4
	 * author: 	Krzysztof Urbas @krzysu [myviews.pl] with help of @ismyrnow
	 * website:	https://github.com/krzysu/flot.tooltip
	 * 
	 * released under MIT License, 2012
	*/

	(function ($) {
	    var options = {
	        tooltip: false, //boolean
	        tooltipOpts: {
	            content: "%s | X: %x | Y: %y.2", //%s -> series label, %x -> X value, %y -> Y value, %x.2 -> precision of X value, %p -> percent
	            dateFormat: "%y-%0m-%0d",
	            shifts: {
	                x: 10,
	                y: 20
	            },
	            defaultTheme: true
	        }
	    };

	    var init = function init(plot) {

	        var tipPosition = { x: 0, y: 0 };
	        var opts = plot.getOptions();

	        var updateTooltipPosition = function updateTooltipPosition(pos) {
	            tipPosition.x = pos.x;
	            tipPosition.y = pos.y;
	        };

	        var onMouseMove = function onMouseMove(e) {

	            var pos = { x: 0, y: 0 };

	            pos.x = e.pageX;
	            pos.y = e.pageY;

	            updateTooltipPosition(pos);
	        };

	        var timestampToDate = function timestampToDate(tmst) {

	            var theDate = new Date(tmst);

	            return $.plot.formatDate(theDate, opts.tooltipOpts.dateFormat);
	        };

	        plot.hooks.bindEvents.push(function (plot, eventHolder) {

	            var to = opts.tooltipOpts;
	            var placeholder = plot.getPlaceholder();
	            var $tip;

	            if (opts.tooltip === false) return;

	            if ($('#flotTip').length > 0) {
	                $tip = $('#flotTip');
	            } else {
	                $tip = $('<div />').attr('id', 'flotTip');
	                $tip.appendTo('body').hide().css({ position: 'absolute' });

	                if (to.defaultTheme) {
	                    $tip.css({
	                        'background': '#fff',
	                        'z-index': '100',
	                        'padding': '0.4em 0.6em',
	                        'border-radius': '0.5em',
	                        'font-size': '0.8em',
	                        'border': '1px solid #111'
	                    });
	                }
	            }

	            $(placeholder).bind("plothover", function (event, pos, item) {
	                if (item) {
	                    var tipText;

	                    if (opts.xaxis.mode === "time" || opts.xaxes[0].mode === "time") {
	                        tipText = stringFormat(to.content, item, timestampToDate);
	                    } else {
	                        tipText = stringFormat(to.content, item);
	                    }

	                    $tip.html(tipText).css({ left: tipPosition.x + to.shifts.x, top: tipPosition.y + to.shifts.y }).show();
	                } else {
	                    $tip.hide().html('');
	                }
	            });

	            eventHolder.mousemove(onMouseMove);
	        });

	        var stringFormat = function stringFormat(content, item, fnct) {

	            var percentPattern = /%p\.{0,1}(\d{0,})/;
	            var seriesPattern = /%s/;
	            var xPattern = /%x\.{0,1}(\d{0,})/;
	            var yPattern = /%y\.{0,1}(\d{0,})/;

	            //percent match
	            if (typeof item.series.percent !== 'undefined') {
	                content = adjustValPrecision(percentPattern, content, item.series.percent);
	            }
	            //series match
	            if (typeof item.series.label !== 'undefined') {
	                content = content.replace(seriesPattern, item.series.label);
	            }
	            // xVal match
	            if (typeof fnct === 'function') {
	                content = content.replace(xPattern, fnct(item.series.data[item.dataIndex][0]));
	            } else if (typeof item.series.data[item.dataIndex][0] === 'number') {
	                content = adjustValPrecision(xPattern, content, item.series.data[item.dataIndex][0]);
	            }
	            // yVal match
	            if (typeof item.series.data[item.dataIndex][1] === 'number') {
	                content = adjustValPrecision(yPattern, content, item.series.data[item.dataIndex][1]);
	            }

	            return content;
	        };

	        var adjustValPrecision = function adjustValPrecision(pattern, content, value) {

	            var precision;
	            if (content.match(pattern) !== 'null') {
	                if (RegExp.$1 !== '') {
	                    precision = RegExp.$1;
	                    if (precision && 20 > precision > 0) value = value.toFixed(precision);
	                }
	                content = content.replace(pattern, value);
	            }

	            return content;
	        };
	    };

	    $.plot.plugins.push({
	        init: init,
	        options: options,
	        name: 'tooltip',
	        version: '0.4.4'
	    });
	})(jQuery);

/***/ })

/******/ });