function MaterialSpinner(t) {
    "use strict";
    this.element_ = t,
    this.init()
}
function MaterialProgress(t) {
    "use strict";
    this.element_ = t,
    this.init()
}
function MaterialMenu(t) {
    "use strict";
    this.element_ = t,
    this.init()
}
function MaterialButton(t) {
    "use strict";
    this.element_ = t,
    this.init()
}
function MaterialRadio(t) {
    "use strict";
    this.element_ = t,
    this.init()
}
function MaterialCheckbox(t) {
    "use strict";
    this.element_ = t,
    this.init()
}
function MaterialSwitch(t) {
    "use strict";
    this.element_ = t,
    this.init()
}
function MaterialTextfield(t) {
    "use strict";
    this.element_ = t,
    this.maxRows = this.Constant_.NO_MAX_ROWS,
    this.init()
}
function MaterialTabs(t) {
    "use strict";
    this.element_ = t,
    this.init()
}
function MaterialTab(t, e) {
    "use strict";
    if (t) {
        if (e.element_.classList.contains(e.CssClasses_.MDL_JS_RIPPLE_EFFECT)) {
            var s = document.createElement("span");
            s.classList.add(e.CssClasses_.MDL_RIPPLE_CONTAINER),
            s.classList.add(e.CssClasses_.MDL_JS_RIPPLE_EFFECT);
            var i = document.createElement("span");
            i.classList.add(e.CssClasses_.MDL_RIPPLE),
            s.appendChild(i),
            t.appendChild(s)
        }
        t.addEventListener("click",
        function(s) {
            var i = $.Event("tabSelected.ulite.tabs", {
                relatedTarget: s.relatedTarget
            });
            if ($(t).trigger(i), !i.isDefaultPrevented()) {
                s.preventDefault();
                var n = t.href.split("#")[1],
                a = e.element_.querySelector("#" + n);
                e.resetTabState_(),
                e.resetPanelState_(),
                t.classList.add(e.CssClasses_.ACTIVE_CLASS),
                a.classList.add(e.CssClasses_.ACTIVE_CLASS)
            }
        })
    }
}
function MaterialRipple(t) {
    "use strict";
    this.element_ = t,
    this.init()
}
var componentHandler = function() {
    "use strict";
    function t(t, e) {
        for (var s = 0; s < u.length; s++) if (u[s].className === t) return void 0 !== e && (u[s] = e),
        u[s];
        return ! 1
    }
    function e(t) {
        var e = t.getAttribute("data-upgraded");
        return null === e ? [""] : e.split(",")
    }
    function s(t, s) {
        var i = e(t);
        return - 1 !== i.indexOf(s)
    }
    function i(e, s) {
        if (void 0 === e && void 0 === s) for (var a = 0; a < u.length; a++) i(u[a].className, u[a].cssClass);
        else {
            var o = e;
            if (void 0 === s) {
                var r = t(o);
                r && (s = r.cssClass)
            }
            for (var l = document.querySelectorAll("." + s), d = 0; d < l.length; d++) n(l[d], o)
        }
    }
    function n(i, n) {
        if (! ("object" == typeof i && i instanceof Element)) throw new Error("Invalid argument provided to upgrade MDL element.");
        var a = e(i),
        o = [];
        if (n) s(i, n) || o.push(t(n));
        else {
            var r = i.classList;
            u.forEach(function(t) {
                r.contains(t.cssClass) && -1 === o.indexOf(t) && !s(i, t.className) && o.push(t)
            })
        }
        for (var l, d = 0,
        h = o.length; h > d; d++) {
            if (l = o[d], !l) throw new Error("Unable to find a registered component for the given class.");
            a.push(l.className),
            i.setAttribute("data-upgraded", a.join(","));
            var c = new l.classConstructor(i);
            c[g] = l,
            m.push(c);
            for (var p = 0,
            f = l.callbacks.length; f > p; p++) l.callbacks[p](i);
            l.widget && (i[l.className] = c);
            var C = document.createEvent("Events");
            C.initEvent("mdl-componentupgraded", !0, !0),
            i.dispatchEvent(C)
        }
    }
    function a(t) {
        Array.isArray(t) || (t = "function" == typeof t.item ? Array.prototype.slice.call(t) : [t]);
        for (var e, s = 0,
        i = t.length; i > s; s++) e = t[s],
        e instanceof HTMLElement && (e.children.length > 0 && a(e.children), n(e))
    }
    function o(e) {
        var s = {
            classConstructor: e.constructor,
            className: e.classAsString,
            cssClass: e.cssClass,
            widget: void 0 === e.widget ? !0 : e.widget,
            callbacks: []
        };
        if (u.forEach(function(t) {
            if (t.cssClass === s.cssClass) throw new Error("The provided cssClass has already been registered.");
            if (t.className === s.className) throw new Error("The provided className has already been registered")
        }), e.constructor.prototype.hasOwnProperty(g)) throw new Error("MDL component classes must not have " + g + " defined as a property.");
        var i = t(e.classAsString, s);
        i || u.push(s)
    }
    function r(e, s) {
        var i = t(e);
        i && i.callbacks.push(s)
    }
    function l() {
        for (var t = 0; t < u.length; t++) i(u[t].className)
    }
    function d(t) {
        for (var e = 0; e < m.length; e++) {
            var s = m[e];
            if (s.element_ === t) return s
        }
    }
    function h(t) {
        if (t && t[g].classConstructor.prototype.hasOwnProperty(f)) {
            t[f]();
            var e = m.indexOf(t);
            m.splice(e, 1);
            var s = t.element_.getAttribute("data-upgraded").split(","),
            i = s.indexOf(t[g].classAsString);
            s.splice(i, 1),
            t.element_.setAttribute("data-upgraded", s.join(","));
            var n = document.createEvent("Events");
            n.initEvent("mdl-componentdowngraded", !0, !0),
            t.element_.dispatchEvent(n)
        }
    }
    function c(t) {
        var e = function(t) {
            h(d(t))
        };
        if (t instanceof Array || t instanceof NodeList) for (var s = 0; s < t.length; s++) e(t[s]);
        else {
            if (! (t instanceof Node)) throw new Error("Invalid argument provided to downgrade MDL nodes.");
            e(t)
        }
    }
    function p(t) {
        for (var e = [], s = t.previousSibling; s;) 1 === s.nodeType && e.push(s),
        s = s.previousSibling;
        e.reverse();
        for (var i = t.nextSibling; i;) 1 === i.nodeType && e.push(i),
        i = i.nextSibling;
        return e
    }
    var u = [],
    m = [],
    f = "mdlDowngrade_",
    g = "mdlComponentConfigInternal_";
    return {
        upgradeDom: i,
        upgradeElement: n,
        upgradeElements: a,
        upgradeAllRegistered: l,
        registerUpgradedCallback: r,
        register: o,
        findSibling: p,
        downgradeElements: c
    }
} ();
window.addEventListener("load",
function() {
    "use strict";
    "classList" in document.createElement("div") && "querySelector" in document && "addEventListener" in window && Array.prototype.forEach ? (document.documentElement.classList.add("mdl-js"), componentHandler.upgradeAllRegistered()) : componentHandler.upgradeElement = componentHandler.register = function() {}
}),
componentHandler.ComponentConfig,
componentHandler.Component,
function() {
    "classList" in document.documentElement || Object.defineProperty(HTMLElement.prototype, "classList", {
        get: function() {
            function t(t) {
                return function(s) {
                    var i = e.className.split(/\s+/g),
                    n = i.indexOf(s);
                    t(i, n, s),
                    e.className = i.join(" ")
                }
            }
            var e = this;
            return {
                add: t(function(t, e, s) {~e || t.push(s)
                }),
                remove: t(function(t, e) {~e && t.splice(e, 1)
                }),
                toggle: t(function(t, e, s) {~e ? t.splice(e, 1) : t.push(s)
                }),
                contains: function(t) {
                    return !! ~e.className.split(/\s+/g).indexOf(t)
                },
                item: function(t) {
                    return e.className.split(/\s+/g)[t] || null
                }
            }
        }
    })
} (),
function() {
    "use strict";
    Date.now || (Date.now = function() {
        return (new Date).getTime()
    });
    for (var t = ["webkit", "moz"], e = 0; e < t.length && !window.requestAnimationFrame; ++e) {
        var s = t[e];
        window.requestAnimationFrame = window[s + "RequestAnimationFrame"],
        window.cancelAnimationFrame = window[s + "CancelAnimationFrame"] || window[s + "CancelRequestAnimationFrame"]
    }
    if (/iP(ad|hone|od).*OS 6/.test(window.navigator.userAgent) || !window.requestAnimationFrame || !window.cancelAnimationFrame) {
        var i = 0;
        window.requestAnimationFrame = function(t) {
            var e = Date.now(),
            s = Math.max(i + 16, e);
            return setTimeout(function() {
                t(i = s)
            },
            s - e)
        },
        window.cancelAnimationFrame = clearTimeout
    }
} (),
MaterialSpinner.prototype.Constant_ = {
    MDL_SPINNER_LAYER_COUNT: 4
},
MaterialSpinner.prototype.CssClasses_ = {
    MDL_SPINNER_LAYER: "spinner-layer",
    MDL_SPINNER_CIRCLE_CLIPPER: "spinner-circle-clipper",
    MDL_SPINNER_CIRCLE: "spinner-circle",
    MDL_SPINNER_GAP_PATCH: "spinner-gap-patch",
    MDL_SPINNER_LEFT: "spinner-left",
    MDL_SPINNER_RIGHT: "spinner-right"
},
MaterialSpinner.prototype.createLayer = function(t) {
    "use strict";
    var e = document.createElement("div");
    e.classList.add(this.CssClasses_.MDL_SPINNER_LAYER),
    e.classList.add(this.CssClasses_.MDL_SPINNER_LAYER + "-" + t);
    var s = document.createElement("div");
    s.classList.add(this.CssClasses_.MDL_SPINNER_CIRCLE_CLIPPER),
    s.classList.add(this.CssClasses_.MDL_SPINNER_LEFT);
    var i = document.createElement("div");
    i.classList.add(this.CssClasses_.MDL_SPINNER_GAP_PATCH);
    var n = document.createElement("div");
    n.classList.add(this.CssClasses_.MDL_SPINNER_CIRCLE_CLIPPER),
    n.classList.add(this.CssClasses_.MDL_SPINNER_RIGHT);
    for (var a = [s, i, n], o = 0; o < a.length; o++) {
        var r = document.createElement("div");
        r.classList.add(this.CssClasses_.MDL_SPINNER_CIRCLE),
        a[o].appendChild(r)
    }
    e.appendChild(s),
    e.appendChild(i),
    e.appendChild(n),
    this.element_.appendChild(e)
},
MaterialSpinner.prototype.stop = function() {
    "use strict";
    this.element_.classList.remove("is-active")
},
MaterialSpinner.prototype.start = function() {
    "use strict";
    this.element_.classList.add("is-active")
},
MaterialSpinner.prototype.init = function() {
    "use strict";
    if (this.element_) {
        for (var t = 1; t <= this.Constant_.MDL_SPINNER_LAYER_COUNT; t++) this.createLayer(t);
        this.element_.classList.add("is-upgraded")
    }
},
componentHandler.register({
    constructor: MaterialSpinner,
    classAsString: "MaterialSpinner",
    cssClass: "ulite-js-spinner",
    widget: !0
}),
MaterialProgress.prototype.Constant_ = {},
MaterialProgress.prototype.CssClasses_ = {
    INDETERMINATE_CLASS: "mdl-progress__indeterminate"
},
MaterialProgress.prototype.setProgress = function(t) {
    "use strict";
    this.element_.classList.contains(this.CssClasses_.INDETERMINATE_CLASS) || (this.progressbar_.style.width = t + "%")
},
MaterialProgress.prototype.setBuffer = function(t) {
    "use strict";
    this.bufferbar_.style.width = t + "%",
    this.auxbar_.style.width = 100 - t + "%"
},
MaterialProgress.prototype.init = function() {
    "use strict";
    if (this.element_) {
        var t = document.createElement("div");
        t.className = "progressbar bar bar1",
        this.element_.appendChild(t),
        this.progressbar_ = t,
        t = document.createElement("div"),
        t.className = "bufferbar bar bar2",
        this.element_.appendChild(t),
        this.bufferbar_ = t,
        t = document.createElement("div"),
        t.className = "auxbar bar bar3",
        this.element_.appendChild(t),
        this.auxbar_ = t,
        this.progressbar_.style.width = "0%",
        this.bufferbar_.style.width = "100%",
        this.auxbar_.style.width = "0%",
        this.element_.classList.add("is-upgraded")
    }
},
MaterialProgress.prototype.mdlDowngrade_ = function() {
    "use strict";
    for (; this.element_.firstChild;) this.element_.removeChild(this.element_.firstChild)
},
componentHandler.register({
    constructor: MaterialProgress,
    classAsString: "MaterialProgress",
    cssClass: "ulite-js-progress",
    widget: !0
}),
MaterialMenu.prototype.Constant_ = {},
MaterialMenu.prototype.CssClasses_ = {
    ACTIVE_CONTAINER: "active",
    NO_ACTIVE_CONTAINER: "no-active",
    ROOT_MENU: "menu-vertical",
    CHILD_MENU_CONTAINER: "menu-vertical-child",
    CHILD_MENU: ".menu-vertical-child li",
    RIPPLE_EFFECT: "ulite-js-ripple-effect",
    RIPPLE_CONTAINER: "btn-ripple-container",
    RIPPLE: "ripple"
},
MaterialMenu.prototype.blurHandler = function(t) {
    "use strict";
    t && this.element_.blur()
},
MaterialMenu.prototype.clickHandler = function(t) {
    "use strict";
    if (t) {
        var e = this.element_.parentNode;
        if ($(this.element_).hasClass(this.CssClasses_.NO_ACTIVE_CONTAINER)) return ! 1;
        if (e.classList.contains(this.CssClasses_.ACTIVE_CONTAINER)) e.classList.remove(this.CssClasses_.ACTIVE_CONTAINER);
        else {
            var s = e.parentNode,
            i = $(s).parents("." + this.CssClasses_.ROOT_MENU)[0];
            if (s.classList.contains(this.CssClasses_.CHILD_MENU_CONTAINER)) for (var n = i.querySelectorAll(this.CssClasses_.CHILD_MENU), a = n.length - 1; a >= 0; a--) n[a].classList.remove(this.CssClasses_.ACTIVE_CONTAINER);
            e.classList.add(this.CssClasses_.ACTIVE_CONTAINER);
            var o = $(e).siblings("li");
            o.removeClass(this.CssClasses_.ACTIVE_CONTAINER)
        }
    }
},
MaterialMenu.prototype.disable = function() {
    "use strict";
    this.element_.disabled = !0
},
MaterialMenu.prototype.enable = function() {
    "use strict";
    this.element_.disabled = !1
},
MaterialMenu.prototype.init = function() {
    "use strict";
    if (this.element_) {
        if (this.element_.classList.contains(this.CssClasses_.RIPPLE_EFFECT)) {
            var t = document.createElement("span");
            t.classList.add(this.CssClasses_.RIPPLE_CONTAINER),
            this.rippleElement_ = document.createElement("span"),
            this.rippleElement_.classList.add(this.CssClasses_.RIPPLE),
            t.appendChild(this.rippleElement_),
            this.boundRippleBlurHandler = this.blurHandler.bind(this),
            this.rippleElement_.addEventListener("mouseup", this.boundRippleBlurHandler),
            this.element_.appendChild(t)
        }
        this.boundButtonBlurHandler = this.blurHandler.bind(this),
        this.boundButtonClickHandler = this.clickHandler.bind(this),
        this.element_.addEventListener("mouseup", this.boundButtonBlurHandler),
        this.element_.addEventListener("mouseleave", this.boundButtonBlurHandler),
        this.element_.addEventListener("click", this.boundButtonClickHandler)
    }
},
MaterialMenu.prototype.mdlDowngrade_ = function() {
    "use strict";
    this.rippleElement_ && this.rippleElement_.removeEventListener("mouseup", this.boundRippleBlurHandler),
    this.element_.removeEventListener("mouseup", this.boundButtonBlurHandler),
    this.element_.removeEventListener("mouseleave", this.boundButtonBlurHandler),
    this.element_.removeEventListener("click", this.boundButtonClickHandler)
},
componentHandler.register({
    constructor: MaterialMenu,
    classAsString: "MaterialMenu",
    cssClass: "ulite-js-menu",
    widget: !0
}),
MaterialButton.prototype.Constant_ = {},
MaterialButton.prototype.CssClasses_ = {
    RIPPLE_EFFECT: "ulite-js-ripple-effect",
    RIPPLE_CONTAINER: "btn-ripple-container",
    RIPPLE: "ripple"
},
MaterialButton.prototype.blurHandler = function(t) {
    "use strict";
    t && this.element_.blur()
},
MaterialButton.prototype.disable = function() {
    "use strict";
    this.element_.disabled = !0
},
MaterialButton.prototype.enable = function() {
    "use strict";
    this.element_.disabled = !1
},
MaterialButton.prototype.init = function() {
    "use strict";
    if (this.element_) {
        if (this.element_.classList.contains(this.CssClasses_.RIPPLE_EFFECT)) {
            var t = document.createElement("span");
            t.classList.add(this.CssClasses_.RIPPLE_CONTAINER),
            this.rippleElement_ = document.createElement("span"),
            this.rippleElement_.classList.add(this.CssClasses_.RIPPLE),
            t.appendChild(this.rippleElement_),
            this.boundRippleBlurHandler = this.blurHandler.bind(this),
            this.rippleElement_.addEventListener("mouseup", this.boundRippleBlurHandler),
            this.element_.appendChild(t)
        }
        this.boundButtonBlurHandler = this.blurHandler.bind(this),
        this.element_.addEventListener("mouseup", this.boundButtonBlurHandler),
        this.element_.addEventListener("mouseleave", this.boundButtonBlurHandler)
    }
},
MaterialButton.prototype.mdlDowngrade_ = function() {
    "use strict";
    this.rippleElement_ && this.rippleElement_.removeEventListener("mouseup", this.boundRippleBlurHandler),
    this.element_.removeEventListener("mouseup", this.boundButtonBlurHandler),
    this.element_.removeEventListener("mouseleave", this.boundButtonBlurHandler)
},
componentHandler.register({
    constructor: MaterialButton,
    classAsString: "MaterialButton",
    cssClass: "ulite-js-btn",
    widget: !0
}),
MaterialRadio.prototype.Constant_ = {
    TINY_TIMEOUT: .001
},
MaterialRadio.prototype.CssClasses_ = {
    IS_FOCUSED: "is-focused",
    IS_DISABLED: "is-disabled",
    IS_CHECKED: "is-checked",
    IS_UPGRADED: "is-upgraded",
    JS_RADIO: "ulite-js-radio",
    RADIO_BTN: "radio-btn",
    RADIO_OUTER_CIRCLE: "radio-outer-circle",
    RADIO_INNER_CIRCLE: "radio-inner-circle",
    RIPPLE_EFFECT: "ulite-js-ripple-effect",
    RIPPLE_IGNORE_EVENTS: "ulite-js-ripple-effect--ignore-events",
    RIPPLE_CONTAINER: "radio-ripple-container",
    RIPPLE_CENTER: "ulite-ripple--center",
    RIPPLE: "ripple"
},
MaterialRadio.prototype.onChange_ = function(t) {
    "use strict";
    for (var e = document.getElementsByClassName(this.CssClasses_.JS_RADIO), s = 0; s < e.length; s++) {
        var i = e[s].querySelector("." + this.CssClasses_.RADIO_BTN);
        i.getAttribute("name") === this.btnElement_.getAttribute("name") && e[s].MaterialRadio.updateClasses_()
    }
},
MaterialRadio.prototype.onFocus_ = function(t) {
    "use strict";
    this.element_.classList.add(this.CssClasses_.IS_FOCUSED)
},
MaterialRadio.prototype.onBlur_ = function(t) {
    "use strict";
    this.element_.classList.remove(this.CssClasses_.IS_FOCUSED)
},
MaterialRadio.prototype.onMouseup_ = function(t) {
    "use strict";
    this.blur_()
},
MaterialRadio.prototype.updateClasses_ = function() {
    "use strict";
    this.checkDisabled(),
    this.checkToggleState()
},
MaterialRadio.prototype.blur_ = function(t) {
    "use strict";
    window.setTimeout(function() {
        this.btnElement_.blur()
    }.bind(this), this.Constant_.TINY_TIMEOUT)
},
MaterialRadio.prototype.checkDisabled = function() {
    "use strict";
    this.btnElement_.disabled ? this.element_.classList.add(this.CssClasses_.IS_DISABLED) : this.element_.classList.remove(this.CssClasses_.IS_DISABLED)
},
MaterialRadio.prototype.checkToggleState = function() {
    "use strict";
    this.btnElement_.checked ? this.element_.classList.add(this.CssClasses_.IS_CHECKED) : this.element_.classList.remove(this.CssClasses_.IS_CHECKED)
},
MaterialRadio.prototype.disable = function() {
    "use strict";
    this.btnElement_.disabled = !0,
    this.updateClasses_()
},
MaterialRadio.prototype.enable = function() {
    "use strict";
    this.btnElement_.disabled = !1,
    this.updateClasses_()
},
MaterialRadio.prototype.check = function() {
    "use strict";
    this.btnElement_.checked = !0,
    this.updateClasses_()
},
MaterialRadio.prototype.uncheck = function() {
    "use strict";
    this.btnElement_.checked = !1,
    this.updateClasses_()
},
MaterialRadio.prototype.init = function() {
    "use strict";
    if (this.element_) {
        this.btnElement_ = this.element_.querySelector("." + this.CssClasses_.RADIO_BTN);
        var t = document.createElement("span");
        t.classList.add(this.CssClasses_.RADIO_OUTER_CIRCLE);
        var e = document.createElement("span");
        e.classList.add(this.CssClasses_.RADIO_INNER_CIRCLE),
        this.element_.appendChild(t),
        this.element_.appendChild(e);
        var s;
        if (this.element_.classList.contains(this.CssClasses_.RIPPLE_EFFECT)) {
            this.element_.classList.add(this.CssClasses_.RIPPLE_IGNORE_EVENTS),
            s = document.createElement("span"),
            s.classList.add(this.CssClasses_.RIPPLE_CONTAINER),
            s.classList.add(this.CssClasses_.RIPPLE_EFFECT),
            s.classList.add(this.CssClasses_.RIPPLE_CENTER),
            s.addEventListener("mouseup", this.onMouseup_.bind(this));
            var i = document.createElement("span");
            i.classList.add(this.CssClasses_.RIPPLE),
            s.appendChild(i),
            this.element_.appendChild(s)
        }
        this.btnElement_.addEventListener("change", this.onChange_.bind(this)),
        this.btnElement_.addEventListener("focus", this.onFocus_.bind(this)),
        this.btnElement_.addEventListener("blur", this.onBlur_.bind(this)),
        this.element_.addEventListener("mouseup", this.onMouseup_.bind(this)),
        this.updateClasses_(),
        this.element_.classList.add(this.CssClasses_.IS_UPGRADED)
    }
},
componentHandler.register({
    constructor: MaterialRadio,
    classAsString: "MaterialRadio",
    cssClass: "ulite-js-radio",
    widget: !0
}),
MaterialCheckbox.prototype.Constant_ = {
    TINY_TIMEOUT: .001
},
MaterialCheckbox.prototype.CssClasses_ = {
    INPUT: "checkbox-input",
    BOX_OUTLINE: "checkbox-box-outline",
    FOCUS_HELPER: "checkbox-focus-helper",
    TICK_OUTLINE: "checkbox-tick-outline",
    RIPPLE_EFFECT: "ulite-js-ripple-effect",
    RIPPLE_IGNORE_EVENTS: "ulite-js-ripple-effect--ignore-events",
    RIPPLE_CONTAINER: "checkbox-ripple-container",
    RIPPLE_CENTER: "ulite-ripple--center",
    RIPPLE: "ripple",
    IS_FOCUSED: "is-focused",
    IS_DISABLED: "is-disabled",
    IS_CHECKED: "is-checked",
    IS_UPGRADED: "is-upgraded"
},
MaterialCheckbox.prototype.onChange_ = function(t) {
    "use strict";
    this.updateClasses_()
},
MaterialCheckbox.prototype.onFocus_ = function(t) {
    "use strict";
    this.element_.classList.add(this.CssClasses_.IS_FOCUSED)
},
MaterialCheckbox.prototype.onBlur_ = function(t) {
    "use strict";
    this.element_.classList.remove(this.CssClasses_.IS_FOCUSED)
},
MaterialCheckbox.prototype.onMouseUp_ = function(t) {
    "use strict";
    this.blur_()
},
MaterialCheckbox.prototype.updateClasses_ = function() {
    "use strict";
    this.checkDisabled(),
    this.checkToggleState()
},
MaterialCheckbox.prototype.blur_ = function(t) {
    "use strict";
    window.setTimeout(function() {
        this.inputElement_.blur()
    }.bind(this), this.Constant_.TINY_TIMEOUT)
},
MaterialCheckbox.prototype.checkToggleState = function() {
    "use strict";
    this.inputElement_.checked ? this.element_.classList.add(this.CssClasses_.IS_CHECKED) : this.element_.classList.remove(this.CssClasses_.IS_CHECKED)
},
MaterialCheckbox.prototype.checkDisabled = function() {
    "use strict";
    this.inputElement_.disabled ? this.element_.classList.add(this.CssClasses_.IS_DISABLED) : this.element_.classList.remove(this.CssClasses_.IS_DISABLED)
},
MaterialCheckbox.prototype.disable = function() {
    "use strict";
    this.inputElement_.disabled = !0,
    this.updateClasses_()
},
MaterialCheckbox.prototype.enable = function() {
    "use strict";
    this.inputElement_.disabled = !1,
    this.updateClasses_()
},
MaterialCheckbox.prototype.check = function() {
    "use strict";
    this.inputElement_.checked = !0,
    this.updateClasses_()
},
MaterialCheckbox.prototype.uncheck = function() {
    "use strict";
    this.inputElement_.checked = !1,
    this.updateClasses_()
},
MaterialCheckbox.prototype.init = function() {
    "use strict";
    if (this.element_) {
        this.inputElement_ = this.element_.querySelector("." + this.CssClasses_.INPUT);
        var t = document.createElement("span");
        t.classList.add(this.CssClasses_.BOX_OUTLINE);
        var e = document.createElement("span");
        e.classList.add(this.CssClasses_.FOCUS_HELPER);
        var s = document.createElement("span");
        if (s.classList.add(this.CssClasses_.TICK_OUTLINE), t.appendChild(s), this.element_.appendChild(e), this.element_.appendChild(t), this.element_.classList.contains(this.CssClasses_.RIPPLE_EFFECT)) {
            this.element_.classList.add(this.CssClasses_.RIPPLE_IGNORE_EVENTS),
            this.rippleContainerElement_ = document.createElement("span"),
            this.rippleContainerElement_.classList.add(this.CssClasses_.RIPPLE_CONTAINER),
            this.rippleContainerElement_.classList.add(this.CssClasses_.RIPPLE_EFFECT),
            this.rippleContainerElement_.classList.add(this.CssClasses_.RIPPLE_CENTER),
            this.boundRippleMouseUp = this.onMouseUp_.bind(this),
            this.rippleContainerElement_.addEventListener("mouseup", this.boundRippleMouseUp);
            var i = document.createElement("span");
            i.classList.add(this.CssClasses_.RIPPLE),
            this.rippleContainerElement_.appendChild(i),
            this.element_.appendChild(this.rippleContainerElement_)
        }
        this.boundInputOnChange = this.onChange_.bind(this),
        this.boundInputOnFocus = this.onFocus_.bind(this),
        this.boundInputOnBlur = this.onBlur_.bind(this),
        this.boundElementMouseUp = this.onMouseUp_.bind(this),
        this.inputElement_.addEventListener("change", this.boundInputOnChange),
        this.inputElement_.addEventListener("focus", this.boundInputOnFocus),
        this.inputElement_.addEventListener("blur", this.boundInputOnBlur),
        this.element_.addEventListener("mouseup", this.boundElementMouseUp),
        this.updateClasses_(),
        this.element_.classList.add(this.CssClasses_.IS_UPGRADED)
    }
},
MaterialCheckbox.prototype.mdlDowngrade_ = function() {
    "use strict";
    this.rippleContainerElement_ && this.rippleContainerElement_.removeEventListener("mouseup", this.boundRippleMouseUp),
    this.inputElement_.removeEventListener("change", this.boundInputOnChange),
    this.inputElement_.removeEventListener("focus", this.boundInputOnFocus),
    this.inputElement_.removeEventListener("blur", this.boundInputOnBlur),
    this.element_.removeEventListener("mouseup", this.boundElementMouseUp)
},
componentHandler.register({
    constructor: MaterialCheckbox,
    classAsString: "MaterialCheckbox",
    cssClass: "ulite-js-checkbox",
    widget: !0
}),
MaterialSwitch.prototype.Constant_ = {
    TINY_TIMEOUT: .001
},
MaterialSwitch.prototype.CssClasses_ = {
    INPUT: "switch-input",
    TRACK: "switch-track",
    THUMB: "switch-thumb",
    FOCUS_HELPER: "switch-focus-helper",
    RIPPLE_EFFECT: "ulite-js-ripple-effect",
    RIPPLE_IGNORE_EVENTS: "ulite-js-ripple-effect--ignore-events",
    RIPPLE_CONTAINER: "switch-ripple-container",
    RIPPLE_CENTER: "ulite-ripple--center",
    RIPPLE: "ripple",
    IS_FOCUSED: "is-focused",
    IS_DISABLED: "is-disabled",
    IS_CHECKED: "is-checked"
},
MaterialSwitch.prototype.onChange_ = function(t) {
    "use strict";
    this.updateClasses_()
},
MaterialSwitch.prototype.onFocus_ = function(t) {
    "use strict";
    this.element_.classList.add(this.CssClasses_.IS_FOCUSED)
},
MaterialSwitch.prototype.onBlur_ = function(t) {
    "use strict";
    this.element_.classList.remove(this.CssClasses_.IS_FOCUSED)
},
MaterialSwitch.prototype.onMouseUp_ = function(t) {
    "use strict";
    this.blur_()
},
MaterialSwitch.prototype.updateClasses_ = function() {
    "use strict";
    this.checkDisabled(),
    this.checkToggleState()
},
MaterialSwitch.prototype.blur_ = function(t) {
    "use strict";
    window.setTimeout(function() {
        this.inputElement_.blur()
    }.bind(this), this.Constant_.TINY_TIMEOUT)
},
MaterialSwitch.prototype.checkDisabled = function() {
    "use strict";
    this.inputElement_.disabled ? this.element_.classList.add(this.CssClasses_.IS_DISABLED) : this.element_.classList.remove(this.CssClasses_.IS_DISABLED)
},
MaterialSwitch.prototype.checkToggleState = function() {
    "use strict";
    this.inputElement_.checked ? this.element_.classList.add(this.CssClasses_.IS_CHECKED) : this.element_.classList.remove(this.CssClasses_.IS_CHECKED)
},
MaterialSwitch.prototype.disable = function() {
    "use strict";
    this.inputElement_.disabled = !0,
    this.updateClasses_()
},
MaterialSwitch.prototype.enable = function() {
    "use strict";
    this.inputElement_.disabled = !1,
    this.updateClasses_()
},
MaterialSwitch.prototype.on = function() {
    "use strict";
    this.inputElement_.checked = !0,
    this.updateClasses_()
},
MaterialSwitch.prototype.off = function() {
    "use strict";
    this.inputElement_.checked = !1,
    this.updateClasses_()
},
MaterialSwitch.prototype.init = function() {
    "use strict";
    if (this.element_) {
        this.inputElement_ = this.element_.querySelector("." + this.CssClasses_.INPUT);
        var t = document.createElement("div");
        t.classList.add(this.CssClasses_.TRACK);
        var e = document.createElement("div");
        e.classList.add(this.CssClasses_.THUMB);
        var s = document.createElement("span");
        if (s.classList.add(this.CssClasses_.FOCUS_HELPER), e.appendChild(s), this.element_.appendChild(t), this.element_.appendChild(e), this.boundMouseUpHandler = this.onMouseUp_.bind(this), this.element_.classList.contains(this.CssClasses_.RIPPLE_EFFECT)) {
            this.element_.classList.add(this.CssClasses_.RIPPLE_IGNORE_EVENTS),
            this.rippleContainerElement_ = document.createElement("span"),
            this.rippleContainerElement_.classList.add(this.CssClasses_.RIPPLE_CONTAINER),
            this.rippleContainerElement_.classList.add(this.CssClasses_.RIPPLE_EFFECT),
            this.rippleContainerElement_.classList.add(this.CssClasses_.RIPPLE_CENTER),
            this.rippleContainerElement_.addEventListener("mouseup", this.boundMouseUpHandler);
            var i = document.createElement("span");
            i.classList.add(this.CssClasses_.RIPPLE),
            this.rippleContainerElement_.appendChild(i),
            this.element_.appendChild(this.rippleContainerElement_)
        }
        this.boundChangeHandler = this.onChange_.bind(this),
        this.boundFocusHandler = this.onFocus_.bind(this),
        this.boundBlurHandler = this.onBlur_.bind(this),
        this.inputElement_.addEventListener("change", this.boundChangeHandler),
        this.inputElement_.addEventListener("focus", this.boundFocusHandler),
        this.inputElement_.addEventListener("blur", this.boundBlurHandler),
        this.element_.addEventListener("mouseup", this.boundMouseUpHandler),
        this.updateClasses_(),
        this.element_.classList.add("is-upgraded")
    }
},
MaterialSwitch.prototype.mdlDowngrade_ = function() {
    "use strict";
    this.rippleContainerElement_ && this.rippleContainerElement_.removeEventListener("mouseup", this.boundMouseUpHandler),
    this.inputElement_.removeEventListener("change", this.boundChangeHandler),
    this.inputElement_.removeEventListener("focus", this.boundFocusHandler),
    this.inputElement_.removeEventListener("blur", this.boundBlurHandler),
    this.element_.removeEventListener("mouseup", this.boundMouseUpHandler)
},
componentHandler.register({
    constructor: MaterialSwitch,
    classAsString: "MaterialSwitch",
    cssClass: "ulite-js-switch",
    widget: !0
}),
MaterialTextfield.prototype.Constant_ = {
    NO_MAX_ROWS: -1,
    MAX_ROWS_ATTRIBUTE: "maxrows"
},
MaterialTextfield.prototype.CssClasses_ = {
    LABEL: "textfield-label",
    INPUT: "textfield-input",
    IS_DIRTY: "is-dirty",
    IS_FOCUSED: "is-focused",
    IS_DISABLED: "is-disabled",
    IS_INVALID: "is-invalid",
    IS_UPGRADED: "is-upgraded"
},
MaterialTextfield.prototype.onKeyDown_ = function(t) {
    "use strict";
    var e = t.target.value.split("\n").length;
    13 === t.keyCode && e >= this.maxRows && t.preventDefault()
},
MaterialTextfield.prototype.onFocus_ = function(t) {
    "use strict";
    this.element_.classList.add(this.CssClasses_.IS_FOCUSED)
},
MaterialTextfield.prototype.onBlur_ = function(t) {
    "use strict";
    this.element_.classList.remove(this.CssClasses_.IS_FOCUSED)
},
MaterialTextfield.prototype.updateClasses_ = function() {
    "use strict";
    this.checkDisabled(),
    this.checkValidity(),
    this.checkDirty()
},
MaterialTextfield.prototype.checkDisabled = function() {
    "use strict";
    this.input_.disabled ? this.element_.classList.add(this.CssClasses_.IS_DISABLED) : this.element_.classList.remove(this.CssClasses_.IS_DISABLED)
},
MaterialTextfield.prototype.checkValidity = function() {
    "use strict";
    this.input_.validity.valid ? this.element_.classList.remove(this.CssClasses_.IS_INVALID) : this.element_.classList.add(this.CssClasses_.IS_INVALID)
},
MaterialTextfield.prototype.checkDirty = function() {
    "use strict";
    this.input_.value && this.input_.value.length > 0 ? this.element_.classList.add(this.CssClasses_.IS_DIRTY) : this.element_.classList.remove(this.CssClasses_.IS_DIRTY)
},
MaterialTextfield.prototype.disable = function() {
    "use strict";
    this.input_.disabled = !0,
    this.updateClasses_()
},
MaterialTextfield.prototype.enable = function() {
    "use strict";
    this.input_.disabled = !1,
    this.updateClasses_()
},
MaterialTextfield.prototype.change = function(t) {
    "use strict";
    t && (this.input_.value = t),
    this.updateClasses_()
},
MaterialTextfield.prototype.init = function() {
    "use strict";
    this.element_ && (this.label_ = this.element_.querySelector("." + this.CssClasses_.LABEL), this.input_ = this.element_.querySelector("." + this.CssClasses_.INPUT), this.input_ && (this.input_.hasAttribute(this.Constant_.MAX_ROWS_ATTRIBUTE) && (this.maxRows = parseInt(this.input_.getAttribute(this.Constant_.MAX_ROWS_ATTRIBUTE), 10), isNaN(this.maxRows) && (this.maxRows = this.Constant_.NO_MAX_ROWS)), this.boundUpdateClassesHandler = this.updateClasses_.bind(this), this.boundFocusHandler = this.onFocus_.bind(this), this.boundBlurHandler = this.onBlur_.bind(this), this.input_.addEventListener("input", this.boundUpdateClassesHandler), this.input_.addEventListener("focus", this.boundFocusHandler), this.input_.addEventListener("blur", this.boundBlurHandler), this.maxRows !== this.Constant_.NO_MAX_ROWS && (this.boundKeyDownHandler = this.onKeyDown_.bind(this), this.input_.addEventListener("keydown", this.boundKeyDownHandler)), this.updateClasses_(), this.element_.classList.add(this.CssClasses_.IS_UPGRADED)))
},
MaterialTextfield.prototype.mdlDowngrade_ = function() {
    "use strict";
    this.input_.removeEventListener("input", this.boundUpdateClassesHandler),
    this.input_.removeEventListener("focus", this.boundFocusHandler),
    this.input_.removeEventListener("blur", this.boundBlurHandler),
    this.boundKeyDownHandler && this.input_.removeEventListener("keydown", this.boundKeyDownHandler)
},
componentHandler.register({
    constructor: MaterialTextfield,
    classAsString: "MaterialTextfield",
    cssClass: "ulite-js-textfield",
    widget: !0
}),
MaterialTabs.prototype.Constant_ = {},
MaterialTabs.prototype.CssClasses_ = {
    TAB_CLASS: "tabs-tab",
    PANEL_CLASS: "tabs-panel",
    ACTIVE_CLASS: "is-active",
    UPGRADED_CLASS: "is-upgraded",
    MDL_JS_RIPPLE_EFFECT: "ulite-js-ripple-effect",
    MDL_RIPPLE_CONTAINER: "tabs-ripple-container",
    MDL_RIPPLE: "ripple",
    MDL_JS_RIPPLE_EFFECT_IGNORE_EVENTS: "ulite-js-ripple-effect--ignore-events"
},
MaterialTabs.prototype.initTabs_ = function(t) {
    "use strict";
    this.element_.classList.contains(this.CssClasses_.MDL_JS_RIPPLE_EFFECT) && this.element_.classList.add(this.CssClasses_.MDL_JS_RIPPLE_EFFECT_IGNORE_EVENTS),
    this.tabs_ = this.element_.querySelectorAll("." + this.CssClasses_.TAB_CLASS),
    this.panels_ = this.element_.querySelectorAll("." + this.CssClasses_.PANEL_CLASS);
    for (var e = 0; e < this.tabs_.length; e++) new MaterialTab(this.tabs_[e], this);
    this.element_.classList.add(this.CssClasses_.UPGRADED_CLASS)
},
MaterialTabs.prototype.resetTabState_ = function() {
    "use strict";
    for (var t = 0; t < this.tabs_.length; t++) this.tabs_[t].classList.remove(this.CssClasses_.ACTIVE_CLASS)
},
MaterialTabs.prototype.resetPanelState_ = function() {
    "use strict";
    for (var t = 0; t < this.panels_.length; t++) this.panels_[t].classList.remove(this.CssClasses_.ACTIVE_CLASS)
},
MaterialTabs.prototype.init = function() {
    "use strict";
    this.element_ && this.initTabs_()
},
componentHandler.register({
    constructor: MaterialTabs,
    classAsString: "MaterialTabs",
    cssClass: "ulite-js-tabs"
}),
+
function(t) {
    "use strict";
    function e(e, i) {
        return this.each(function() {
            var n = t(this),
            a = n.data("amos.tag"),
            o = t.extend({},
            s.DEFAULTS, n.data(), "object" == typeof e && e);
            a || n.data("amos.tag", a = new s(this, o)),
            "string" == typeof e && a[e](i)
        })
    }
    var s = function(e, s) {
        this.options = s,
        this.parentDom = t(e),
        this.removeAtSelected = this.options.removeAtSelected,
        this.selectedTagClickable = this.options.selectedTagClickable,
        this.type = this.options.type,
        this.tagClass = this.options.tagClass,
        this.selected = this.options.selected,
        this.avaliable = this.options.avaliable,
        this.selectedTextClass = this.options.selectedTextClass,
        this.selectedChangeClass = this.options.selectedChangeClass,
        this.selectedChangeText = this.options.selectedChangeText,
        this.tagQuery = "." + this.tagClass,
        this.selectedChangeQuery = "." + this.selectedChangeClass,
        this.dataId = this.options.dataId,
        this.dataName = this.options.dataName,
        this.selectedContainerClass = this.options.selectedContainerClass,
        this.avaliableContainerClass = this.options.avaliableContainerClass,
        this.selectedContainer = this.parentDom.find("." + this.selectedContainerClass),
        this.avaliableContainer = this.parentDom.find("." + this.avaliableContainerClass),
        this.init()
    };
    s.VERSION = "0.0.1",
    s.EVENTS = {
        parent: ".amos.tag",
        selectedClick: "selectedClick.amos.tag",
        beforeSelected: "beforeSelected.amos.tag",
        afterSelected: "afterSelected.amos.tag",
        click: "click.amos.tag"
    },
    s.DEFAULTS = {
        removeAtSelected: !0,
        selectedTagClickable: !1,
        type: "multiple",
        tagClass: "tag",
        selectedContainerClass: "tag-selected-container",
        avaliableContainerClass: "tag-avaliable-container",
        selectedTextClass: "tag-text",
        selectedChangeClass: "btn-link",
        selectedChangeText: "修改",
        dataId: "id",
        dataName: "name",
        selected: [],
        avaliable: []
    },
    s.prototype = {
        constructor: s,
        init: function() {
            this.reset(),
            this.addSelected(this.selected),
            this.addAvaliable(this.avaliable),
            this.selectedTagClickable ? this.selectedContainer.on(s.EVENTS.click, this.tagQuery, t.proxy(this.selectedTagClick, this)) : this.selectedContainer.on(s.EVENTS.click, this.selectedChangeQuery, t.proxy(this.selectedTagClick, this)),
            this.avaliableContainer.on(s.EVENTS.click, this.tagQuery, t.proxy(this.onSelected, this))
        },
        reset: function() {
            this.parentDom.off(s.EVENTS.parent),
            this.resetSelected(),
            this.resetAvaliable()
        },
        resetSelected: function() {
            this.selectedContainer.html("")
        },
        resetAvaliable: function() {
            this.avaliableContainer.html(""),
            this.avaliableContainer.hide()
        },
        addSelected: function(t) {
            for (var e = 0; e < t.length; e++) {
                var s = '<div class="' + this.tagClass + '" data-value="' + t[e][this.dataId] + '"><span class="' + this.selectedTextClass + '">' + t[e][this.dataName] + '</span><div class="' + this.selectedChangeClass + '">' + this.selectedChangeText + "</div></div>";
                this.selectedContainer.append(s)
            }
        },
        addAvaliable: function(t) {
            for (var e = 0; e < t.length; e++) {
                var s = '<div class="' + this.tagClass + '" data-value="' + t[e][this.dataId] + '"><span class="' + this.selectedTextClass + '">' + t[e][this.dataName] + "</span></div>";
                this.avaliableContainer.append(s)
            }
            this.avaliableContainer.show()
        },
        addAvaliableItem: function(t) {
            var e = '<div class="' + this.tagClass + '" data-value="' + t[this.dataId] + '"><span class="' + this.selectedTextClass + '">' + t[this.dataName] + "</span></div>";
            this.avaliableContainer.append(e)
        },
        selectedTagClick: function(e) {
            var i = t(e.currentTarget),
            n = i.hasClass(this.tagClass),
            a = {};
            a = n ? i: i.parents(this.tagQuery);
            var o = a.index(),
            r = {
                relatedTarget: a[0]
            },
            l = t.Event(s.EVENTS.selectedClick, r);
            this.parentDom.trigger(l, [o]),
            l.isDefaultPrevented()
        },
        onSelected: function(e) {
            var i = t(e.currentTarget),
            n = {
                relatedTarget: i[0]
            },
            a = i.data("value"),
            o = i.text(),
            r = t.Event(s.EVENTS.beforeSelected, n);
            if (this.parentDom.trigger(r, [a, o]), !r.isDefaultPrevented()) {
                this.removeAtSelected && i.remove();
                var l = {};
                l[this.dataId] = a,
                l[this.dataName] = o,
                this.selected.push(l),
                this.addSelected([l]),
                r = t.Event(s.EVENTS.afterSelected, n),
                this.parentDom.trigger(r, [a, o])
            }
        }
    };
    var i = t.fn.tag;
    t.fn.tag = e,
    t.fn.tag.Constructor = s,
    t.fn.tag.noConflict = function() {
        return t.fn.tag = i,
        this
    }
} (jQuery),
MaterialRipple.prototype.Constant_ = {
    INITIAL_SCALE: "scale(0.0001, 0.0001)",
    INITIAL_SIZE: "1px",
    INITIAL_OPACITY: "0.4",
    FINAL_OPACITY: "0",
    FINAL_SCALE: ""
},
MaterialRipple.prototype.CssClasses_ = {
    RIPPLE_CENTER: "ulite-ripple--center",
    RIPPLE_EFFECT_IGNORE_EVENTS: "ulite-js-ripple-effect--ignore-events",
    RIPPLE: "ripple",
    IS_ANIMATING: "is-animating",
    IS_VISIBLE: "is-visible"
},
MaterialRipple.prototype.downHandler_ = function(t) {
    "use strict";
    if (!this.rippleElement_.style.width && !this.rippleElement_.style.height) {
        var e = this.element_.getBoundingClientRect();
        this.boundHeight = e.height,
        this.boundWidth = e.width,
        this.rippleSize_ = 2 * Math.sqrt(e.width * e.width + e.height * e.height) + 2,
        this.rippleElement_.style.width = this.rippleSize_ + "px",
        this.rippleElement_.style.height = this.rippleSize_ + "px"
    }
    if (this.rippleElement_.classList.add(this.CssClasses_.IS_VISIBLE), "mousedown" === t.type && this.ignoringMouseDown_) this.ignoringMouseDown_ = !1;
    else {
        "touchstart" === t.type && (this.ignoringMouseDown_ = !0);
        var s = this.getFrameCount();
        if (s > 0) return;
        this.setFrameCount(1);
        var i, n, a = t.currentTarget.getBoundingClientRect();
        if (0 === t.clientX && 0 === t.clientY) i = Math.round(a.width / 2),
        n = Math.round(a.height / 2);
        else {
            var o = t.clientX ? t.clientX: t.touches[0].clientX,
            r = t.clientY ? t.clientY: t.touches[0].clientY;
            i = Math.round(o - a.left),
            n = Math.round(r - a.top)
        }
        this.setRippleXY(i, n),
        this.setRippleStyles(!0),
        window.requestAnimationFrame(this.animFrameHandler.bind(this))
    }
},
MaterialRipple.prototype.upHandler_ = function(t) {
    "use strict";
    t && 2 !== t.detail && this.rippleElement_.classList.remove(this.CssClasses_.IS_VISIBLE)
},
MaterialRipple.prototype.init = function() {
    "use strict";
    if (this.element_) {
        var t = this.element_.classList.contains(this.CssClasses_.RIPPLE_CENTER);
        this.element_.classList.contains(this.CssClasses_.RIPPLE_EFFECT_IGNORE_EVENTS) || (this.rippleElement_ = this.element_.querySelector("." + this.CssClasses_.RIPPLE), this.frameCount_ = 0, this.rippleSize_ = 0, this.x_ = 0, this.y_ = 0, this.ignoringMouseDown_ = !1, this.boundDownHandler = this.downHandler_.bind(this), this.element_.addEventListener("mousedown", this.boundDownHandler), this.element_.addEventListener("touchstart", this.boundDownHandler), this.boundUpHandler = this.upHandler_.bind(this), this.element_.addEventListener("mouseup", this.boundUpHandler), this.element_.addEventListener("mouseleave", this.boundUpHandler), this.element_.addEventListener("touchend", this.boundUpHandler), this.element_.addEventListener("blur", this.boundUpHandler), this.getFrameCount = function() {
            return this.frameCount_
        },
        this.setFrameCount = function(t) {
            this.frameCount_ = t
        },
        this.getRippleElement = function() {
            return this.rippleElement_
        },
        this.setRippleXY = function(t, e) {
            this.x_ = t,
            this.y_ = e
        },
        this.setRippleStyles = function(e) {
            if (null !== this.rippleElement_) {
                var s, i, n, a = "translate(" + this.x_ + "px, " + this.y_ + "px)";
                e ? (i = this.Constant_.INITIAL_SCALE, n = this.Constant_.INITIAL_SIZE) : (i = this.Constant_.FINAL_SCALE, n = this.rippleSize_ + "px", t && (a = "translate(" + this.boundWidth / 2 + "px, " + this.boundHeight / 2 + "px)")),
                s = "translate(-50%, -50%) " + a + i,
                this.rippleElement_.style.webkitTransform = s,
                this.rippleElement_.style.msTransform = s,
                this.rippleElement_.style.transform = s,
                e ? this.rippleElement_.classList.remove(this.CssClasses_.IS_ANIMATING) : this.rippleElement_.classList.add(this.CssClasses_.IS_ANIMATING)
            }
        },
        this.animFrameHandler = function() {
            this.frameCount_-->0 ? window.requestAnimationFrame(this.animFrameHandler.bind(this)) : this.setRippleStyles(!1)
        })
    }
},
MaterialRipple.prototype.mdlDowngrade_ = function() {
    "use strict";
    this.element_.removeEventListener("mousedown", this.boundDownHandler),
    this.element_.removeEventListener("touchstart", this.boundDownHandler),
    this.element_.removeEventListener("mouseup", this.boundUpHandler),
    this.element_.removeEventListener("mouseleave", this.boundUpHandler),
    this.element_.removeEventListener("touchend", this.boundUpHandler),
    this.element_.removeEventListener("blur", this.boundUpHandler)
},
componentHandler.register({
    constructor: MaterialRipple,
    classAsString: "MaterialRipple",
    cssClass: "ulite-js-ripple-effect",
    widget: !1
}),
+
function(t) {
    "use strict";
    function e() {
        var t = document.createElement("bootstrap"),
        e = {
            WebkitTransition: "webkitTransitionEnd",
            MozTransition: "transitionend",
            OTransition: "oTransitionEnd otransitionend",
            transition: "transitionend"
        };
        for (var s in e) if (void 0 !== t.style[s]) return {
            end: e[s]
        };
        return ! 1
    }
    t.fn.emulateTransitionEnd = function(e) {
        var s = !1,
        i = this;
        t(this).one("bsTransitionEnd",
        function() {
            s = !0
        });
        var n = function() {
            s || t(i).trigger(t.support.transition.end)
        };
        return setTimeout(n, e),
        this
    },
    t(function() {
        t.support.transition = e(),
        t.support.transition && (t.event.special.bsTransitionEnd = {
            bindType: t.support.transition.end,
            delegateType: t.support.transition.end,
            handle: function(e) {
                return t(e.target).is(this) ? e.handleObj.handler.apply(this, arguments) : void 0
            }
        })
    })
} (jQuery),
+
function(t) {
    "use strict";
    function e(e) {
        return this.each(function() {
            var i = t(this),
            n = i.data("bs.carousel"),
            a = t.extend({},
            s.DEFAULTS, i.data(), "object" == typeof e && e),
            o = "string" == typeof e ? e: a.slide;
            n || i.data("bs.carousel", n = new s(this, a)),
            "number" == typeof e ? n.to(e) : o ? n[o]() : a.interval && n.pause().cycle()
        })
    }
    var s = function(e, s) {
        this.$element = t(e),
        this.$indicators = this.$element.find(".carousel-indicators"),
        this.options = s,
        this.paused = null,
        this.sliding = null,
        this.interval = null,
        this.$active = null,
        this.$items = null,
        this.options.keyboard && this.$element.on("keydown.bs.carousel", t.proxy(this.keydown, this)),
        "hover" !== this.options.pause || "ontouchstart" in document.documentElement || this.$element.on("mouseenter.bs.carousel", t.proxy(this.pause, this)).on("mouseleave.bs.carousel", t.proxy(this.cycle, this)),
        this.options.touch && this.$element.on("touchstart.bs.carousel", t.proxy(this.onTouchStart, this)).on("touchmove.bs.carousel", t.proxy(this.onTouchMove, this)).on("touchend.bs.carousel", t.proxy(this.onTouchEnd, this))
    };
    s.VERSION = "3.3.5",
    s.TRANSITION_DURATION = 600,
    s.DEFAULTS = {
        interval: 3e3,
        pause: "hover",
        wrap: !0,
        keyboard: !0,
        touch: !1
    },
    s.prototype.onTouchStart = function(t) {
        var e = t.originalEvent.targetTouches[0];
        this.startPos = {
            x: e.pageX,
            y: e.pageY,
            time: +new Date
        },
        this.isScrolling = 0
    },
    s.prototype.onTouchMove = function(t) {
        if (! (t.originalEvent.targetTouches.length > 1 || t.scale && 1 !== t.scale)) {
            var e = t.originalEvent.targetTouches[0];
            this.endPos = {
                x: e.pageX - this.startPos.x,
                y: e.pageY - this.startPos.y
            },
            this.isScrolling = Math.abs(this.endPos.x) < Math.abs(this.endPos.y) ? 1 : 0,
            0 === this.isScrolling && t.preventDefault()
        }
    },
    s.prototype.onTouchEnd = function(t) {
        var e = +new Date - this.startPos.time;
        0 === this.isScrolling && Number(e) > 10 && (this.endPos.x > 10 ? this.prev() : this.endPos.x < -10 && this.next())
    },
    s.prototype.keydown = function(t) {
        if (!/input|textarea/i.test(t.target.tagName)) {
            switch (t.which) {
            case 37:
                this.prev();
                break;
            case 39:
                this.next();
                break;
            default:
                return
            }
            t.preventDefault()
        }
    },
    s.prototype.cycle = function(e) {
        return e || (this.paused = !1),
        this.interval && clearInterval(this.interval),
        this.options.interval && !this.paused && (this.interval = setInterval(t.proxy(this.next, this), this.options.interval)),
        this
    },
    s.prototype.getItemIndex = function(t) {
        return this.$items = t.parent().children(".item"),
        this.$items.index(t || this.$active)
    },
    s.prototype.getItemForDirection = function(t, e) {
        var s = this.getItemIndex(e),
        i = "prev" === t && 0 === s || "next" === t && s === this.$items.length - 1;
        if (i && !this.options.wrap) return e;
        var n = "prev" === t ? -1 : 1,
        a = (s + n) % this.$items.length;
        return this.$items.eq(a)
    },
    s.prototype.to = function(t) {
        var e = this,
        s = this.getItemIndex(this.$active = this.$element.find(".item.active"));
        return t > this.$items.length - 1 || 0 > t ? void 0 : this.sliding ? this.$element.one("slid.bs.carousel",
        function() {
            e.to(t)
        }) : s === t ? this.pause().cycle() : this.slide(t > s ? "next": "prev", this.$items.eq(t))
    },
    s.prototype.pause = function(e) {
        return e || (this.paused = !0),
        this.$element.find(".next, .prev").length && t.support.transition && (this.$element.trigger(t.support.transition.end), this.cycle(!0)),
        this.interval = clearInterval(this.interval),
        this
    },
    s.prototype.next = function() {
        return this.sliding ? void 0 : this.slide("next")
    },
    s.prototype.prev = function() {
        return this.sliding ? void 0 : this.slide("prev")
    },
    s.prototype.slide = function(e, i) {
        var n = this.$element.find(".item.active"),
        a = i || this.getItemForDirection(e, n),
        o = this.interval,
        r = "next" === e ? "left": "right",
        l = this;
        if (a.hasClass("active")) return this.sliding = !1;
        var d = a[0],
        h = t.Event("slide.bs.carousel", {
            relatedTarget: d,
            direction: r
        });
        if (this.$element.trigger(h), !h.isDefaultPrevented()) {
            if (this.sliding = !0, o && this.pause(), this.$indicators.length) {
                this.$indicators.find(".active").removeClass("active");
                var c = t(this.$indicators.children()[this.getItemIndex(a)]);
                c && c.addClass("active")
            }
            var p = t.Event("slid.bs.carousel", {
                relatedTarget: d,
                direction: r
            });
            return t.support.transition && this.$element.hasClass("slide") ? (a.addClass(e), a[0].offsetWidth, n.addClass(r), a.addClass(r), n.one("bsTransitionEnd",
            function() {
                a.removeClass([e, r].join(" ")).addClass("active"),
                n.removeClass(["active", r].join(" ")),
                l.sliding = !1,
                setTimeout(function() {
                    l.$element.trigger(p)
                },
                0)
            }).emulateTransitionEnd(s.TRANSITION_DURATION)) : (n.removeClass("active"), a.addClass("active"), this.sliding = !1, this.$element.trigger(p)),
            o && this.cycle(),
            this
        }
    };
    var i = t.fn.carousel;
    t.fn.carousel = e,
    t.fn.carousel.Constructor = s,
    t.fn.carousel.noConflict = function() {
        return t.fn.carousel = i,
        this
    };
    var n = function(s) {
        var i, n = t(this),
        a = t(n.attr("data-target") || (i = n.attr("href")) && i.replace(/.*(?=#[^\s]+$)/, ""));
        if (a.hasClass("carousel")) {
            var o = t.extend({},
            a.data(), n.data()),
            r = n.attr("data-slide-to");
            r && (o.interval = !1),
            e.call(a, o),
            r && a.data("bs.carousel").to(r),
            s.preventDefault()
        }
    };
    t(document).on("click.bs.carousel.data-api", "[data-slide]", n).on("mouseenter.bs.carousel.data-api", "[data-slide-to]", n),
    t(window).on("load",
    function() {
        t('[data-ride="carousel"]').each(function() {
            var s = t(this);
            e.call(s, s.data())
        })
    })
} (jQuery),
+
function(t) {
    "use strict";
    function e(e) {
        var s = e.attr("data-target");
        s || (s = e.attr("href"), s = s && /#[A-Za-z]/.test(s) && s.replace(/.*(?=#[^\s]*$)/, ""));
        var i = s && t(s);
        return i && i.length ? i: e.parent()
    }
    function s(s) {
        s && 3 === s.which || (t(n).remove(), t(a).each(function() {
            var i = t(this),
            n = e(i),
            a = {
                relatedTarget: this
            };
            n.hasClass("open") && (s && "click" === s.type && /input|textarea/i.test(s.target.tagName) && t.contains(n[0], s.target) || (n.trigger(s = t.Event("hide.bs.dropdown", a)), s.isDefaultPrevented() || (i.attr("aria-expanded", "false"), n.removeClass("open").trigger(t.Event("hidden.bs.dropdown", a)))))
        }))
    }
    function i(e) {
        return this.each(function() {
            var s = t(this),
            i = s.data("bs.dropdown");
            i || s.data("bs.dropdown", i = new o(this)),
            "string" == typeof e && i[e].call(s)
        })
    }
    var n = ".dropdown-backdrop",
    a = '[data-toggle="dropdown"]',
    o = function(e) {
        t(e).on("click.bs.dropdown", this.toggle)
    };
    o.VERSION = "3.3.5",
    o.prototype.show = function(i) {
        var n = t(this);
        if (!n.is(".disabled, :disabled")) {
            var a = e(n);
            s(),
            "ontouchstart" in document.documentElement && !a.closest(".navbar-nav").length && t(document.createElement("div")).addClass("dropdown-backdrop").insertAfter(t(this)).on("click", s);
            var o = {
                relatedTarget: this
            };
            if (a.trigger(i = t.Event("show.bs.dropdown", o)), !i.isDefaultPrevented()) return n.trigger("focus").attr("aria-expanded", "true"),
            a.addClass("open").trigger(t.Event("shown.bs.dropdown", o)),
            !1
        }
    },
    o.prototype.hide = function(t) {
        s()
    },
    o.prototype.toggle = function(i) {
        var n = t(this);
        if (!n.is(".disabled, :disabled")) {
            var a = e(n),
            o = a.hasClass("open");
            if (s(), !o) {
                "ontouchstart" in document.documentElement && !a.closest(".navbar-nav").length && t(document.createElement("div")).addClass("dropdown-backdrop").insertAfter(t(this)).on("click", s);
                var r = {
                    relatedTarget: this
                };
                if (a.trigger(i = t.Event("show.bs.dropdown", r)), i.isDefaultPrevented()) return;
                n.trigger("focus").attr("aria-expanded", "true"),
                a.toggleClass("open").trigger(t.Event("shown.bs.dropdown", r))
            }
            return ! 1
        }
    },
    o.prototype.keydown = function(s) {
        if (/(38|40|27|32)/.test(s.which) && !/input|textarea/i.test(s.target.tagName)) {
            var i = t(this);
            if (s.preventDefault(), s.stopPropagation(), !i.is(".disabled, :disabled")) {
                var n = e(i),
                o = n.hasClass("open");
                if (!o && 27 !== s.which || o && 27 === s.which) return 27 === s.which && n.find(a).trigger("focus"),
                i.trigger("click");
                var r = " li:not(.disabled):visible a",
                l = n.find(".dropdown-menu" + r);
                if (l.length) {
                    var d = l.index(s.target);
                    38 === s.which && d > 0 && d--,
                    40 === s.which && d < l.length - 1 && d++,
                    ~d || (d = 0),
                    l.eq(d).trigger("focus")
                }
            }
        }
    };
    var r = t.fn.dropdown;
    t.fn.dropdown = i,
    t.fn.dropdown.Constructor = o,
    t.fn.dropdown.noConflict = function() {
        return t.fn.dropdown = r,
        this
    },
    t(document).on("click.bs.dropdown.data-api", s).on("click.bs.dropdown.data-api", ".dropdown form",
    function(t) {
        t.stopPropagation()
    }).on("click.bs.dropdown.data-api", a, o.prototype.toggle).on("keydown.bs.dropdown.data-api", a, o.prototype.keydown).on("keydown.bs.dropdown.data-api", ".dropdown-menu", o.prototype.keydown)
} (jQuery),
+
function(t) {
    "use strict";
    function e(e, i) {
        return this.each(function() {
            var n = t(this),
            a = n.data("bs.modal"),
            o = t.extend({},
            s.DEFAULTS, n.data(), "object" == typeof e && e);
            a || n.data("bs.modal", a = new s(this, o)),
            "string" == typeof e ? a[e](i) : o.show && a.show(i)
        })
    }
    var s = function(e, s) {
        this.options = s,
        this.$body = t(document.body),
        this.$element = t(e),
        this.$dialog = this.$element.find(".modal-dialog"),
        this.$backdrop = null,
        this.isShown = null,
        this.originalBodyPad = null,
        this.scrollbarWidth = 0,
        this.ignoreBackdropClick = !1,
        this.options.remote && this.$element.find(".modal-content").load(this.options.remote, t.proxy(function() {
            this.$element.trigger("loaded.bs.modal")
        },
        this))
    };
    s.VERSION = "3.3.5",
    s.TRANSITION_DURATION = 300,
    s.BACKDROP_TRANSITION_DURATION = 150,
    s.DEFAULTS = {
        backdrop: !0,
        keyboard: !0,
        show: !0
    },
    s.prototype.toggle = function(t) {
        return this.isShown ? this.hide() : this.show(t)
    },
    s.prototype.show = function(e) {
        var i = this,
        n = t.Event("show.bs.modal", {
            relatedTarget: e
        });
        this.$element.trigger(n),
        this.isShown || n.isDefaultPrevented() || (this.isShown = !0, this.checkScrollbar(), this.setScrollbar(), this.$body.addClass("modal-open"), this.escape(), this.resize(), this.$element.on("click.dismiss.bs.modal", '[data-dismiss="modal"]', t.proxy(this.hide, this)), this.$dialog.on("mousedown.dismiss.bs.modal",
        function() {
            i.$element.one("mouseup.dismiss.bs.modal",
            function(e) {
                t(e.target).is(i.$element) && (i.ignoreBackdropClick = !0)
            })
        }), this.backdrop(function() {
            var n = t.support.transition && i.$element.hasClass("fade");
            i.$element.parent().length || i.$element.appendTo(i.$body),
            i.$element.show().scrollTop(0),
            i.adjustDialog(),
            n && i.$element[0].offsetWidth,
            i.$element.addClass("in"),
            i.enforceFocus();
            var a = t.Event("shown.bs.modal", {
                relatedTarget: e
            });
            n ? i.$dialog.one("bsTransitionEnd",
            function() {
                i.$element.trigger("focus").trigger(a)
            }).emulateTransitionEnd(s.TRANSITION_DURATION) : i.$element.trigger("focus").trigger(a)
        }))
    },
    s.prototype.hide = function(e) {
        e && e.preventDefault(),
        e = t.Event("hide.bs.modal"),
        this.$element.trigger(e),
        this.isShown && !e.isDefaultPrevented() && (this.isShown = !1, this.escape(), this.resize(), t(document).off("focusin.bs.modal"), this.$element.removeClass("in").off("click.dismiss.bs.modal").off("mouseup.dismiss.bs.modal"), this.$dialog.off("mousedown.dismiss.bs.modal"), t.support.transition && this.$element.hasClass("fade") ? this.$element.one("bsTransitionEnd", t.proxy(this.hideModal, this)).emulateTransitionEnd(s.TRANSITION_DURATION) : this.hideModal())
    },
    s.prototype.enforceFocus = function() {
        t(document).off("focusin.bs.modal").on("focusin.bs.modal", t.proxy(function(t) {
            this.$element[0] === t.target || this.$element.has(t.target).length || this.$element.trigger("focus")
        },
        this))
    },
    s.prototype.escape = function() {
        this.isShown && this.options.keyboard ? this.$element.on("keydown.dismiss.bs.modal", t.proxy(function(t) {
            27 === t.which && this.hide()
        },
        this)) : this.isShown || this.$element.off("keydown.dismiss.bs.modal")
    },
    s.prototype.resize = function() {
        this.isShown ? t(window).on("resize.bs.modal", t.proxy(this.handleUpdate, this)) : t(window).off("resize.bs.modal")
    },
    s.prototype.hideModal = function() {
        var t = this;
        this.$element.hide(),
        this.backdrop(function() {
            t.$body.removeClass("modal-open"),
            t.resetAdjustments(),
            t.resetScrollbar(),
            t.$element.trigger("hidden.bs.modal")
        })
    },
    s.prototype.removeBackdrop = function() {
        this.$backdrop && this.$backdrop.remove(),
        this.$backdrop = null
    },
    s.prototype.backdrop = function(e) {
        var i = this,
        n = this.$element.hasClass("fade") ? "fade": "";
        if (this.isShown && this.options.backdrop) {
            var a = t.support.transition && n;
            if (this.$backdrop = t(document.createElement("div")).addClass("modal-backdrop " + n).appendTo(this.$body), this.$element.on("click.dismiss.bs.modal", t.proxy(function(t) {
                return this.ignoreBackdropClick ? void(this.ignoreBackdropClick = !1) : void(t.target === t.currentTarget && ("static" === this.options.backdrop ? this.$element[0].focus() : this.hide()))
            },
            this)), a && this.$backdrop[0].offsetWidth, this.$backdrop.addClass("in"), !e) return;
            a ? this.$backdrop.one("bsTransitionEnd", e).emulateTransitionEnd(s.BACKDROP_TRANSITION_DURATION) : e()
        } else if (!this.isShown && this.$backdrop) {
            this.$backdrop.removeClass("in");
            var o = function() {
                i.removeBackdrop(),
                e && e()
            };
            t.support.transition && this.$element.hasClass("fade") ? this.$backdrop.one("bsTransitionEnd", o).emulateTransitionEnd(s.BACKDROP_TRANSITION_DURATION) : o()
        } else e && e()
    },
    s.prototype.handleUpdate = function() {
        this.adjustDialog()
    },
    s.prototype.adjustDialog = function() {
        var t = this.$element[0].scrollHeight > document.documentElement.clientHeight;
        this.$element.css({
            paddingLeft: !this.bodyIsOverflowing && t ? this.scrollbarWidth: "",
            paddingRight: this.bodyIsOverflowing && !t ? this.scrollbarWidth: ""
        })
    },
    s.prototype.resetAdjustments = function() {
        this.$element.css({
            paddingLeft: "",
            paddingRight: ""
        })
    },
    s.prototype.checkScrollbar = function() {
        var t = window.innerWidth;
        if (!t) {
            var e = document.documentElement.getBoundingClientRect();
            t = e.right - Math.abs(e.left)
        }
        this.bodyIsOverflowing = document.body.clientWidth < t,
        this.scrollbarWidth = this.measureScrollbar()
    },
    s.prototype.setScrollbar = function() {
        var t = parseInt(this.$body.css("padding-right") || 0, 10);
        this.originalBodyPad = document.body.style.paddingRight || "",
        this.bodyIsOverflowing && this.$body.css("padding-right", t + this.scrollbarWidth)
    },
    s.prototype.resetScrollbar = function() {
        this.$body.css("padding-right", this.originalBodyPad)
    },
    s.prototype.measureScrollbar = function() {
        var t = document.createElement("div");
        t.className = "modal-scrollbar-measure",
        this.$body.append(t);
        var e = t.offsetWidth - t.clientWidth;
        return this.$body[0].removeChild(t),
        e
    };
    var i = t.fn.modal;
    t.fn.modal = e,
    t.fn.modal.Constructor = s,
    t.fn.modal.noConflict = function() {
        return t.fn.modal = i,
        this
    },
    t(document).on("click.bs.modal.data-api", '[data-toggle="modal"]',
    function(s) {
        var i = t(this),
        n = i.attr("href"),
        a = t(i.attr("data-target") || n && n.replace(/.*(?=#[^\s]+$)/, "")),
        o = a.data("bs.modal") ? "toggle": t.extend({
            remote: !/#/.test(n) && n
        },
        a.data(), i.data());
        i.is("a") && s.preventDefault(),
        a.one("show.bs.modal",
        function(t) {
            t.isDefaultPrevented() || a.one("hidden.bs.modal",
            function() {
                i.is(":visible") && i.trigger("focus")
            })
        }),
        e.call(a, o, this)
    })
} (jQuery),
+
function(t) {
    "use strict";
    function e(e) {
        var s, i = e.attr("data-target") || (s = e.attr("href")) && s.replace(/.*(?=#[^\s]+$)/, "");
        return t(i)
    }
    function s(e, s) {
        return this.each(function() {
            var n = t(this),
            a = n.data("bs.collapse"),
            o = t.extend({},
            i.DEFAULTS, n.data(), "object" == typeof e && e); ! a && o.toggle && /show|hide/.test(e) && (o.toggle = !1),
            a || n.data("bs.collapse", a = new i(this, o, s)),
            "string" == typeof e && a[e](s)
        })
    }
    var i = function(e, s, n) {
        this.$element = t(e),
        this.options = t.extend({},
        i.DEFAULTS, s),
        this.$trigger = t('[data-toggle="collapse"][href="#' + e.id + '"],[data-toggle="collapse"][data-target="#' + e.id + '"]'),
        this.transitioning = null,
        this.options.parent ? this.$parent = this.getParent() : this.addAriaAndCollapsedClass(this.$element, this.$trigger),
        this.options.toggle && this.toggle(n)
    };
    i.VERSION = "3.3.5",
    i.TRANSITION_DURATION = 350,
    i.DEFAULTS = {
        toggle: !0
    },
    i.prototype.dimension = function() {
        var t = this.$element.hasClass("width");
        return t ? "width": "height"
    },
    i.prototype.show = function(e) {
        if (!this.transitioning && !this.$element.hasClass("in")) {
            var n, a = this.$parent && this.$parent.children(".panel").children(".in, .collapsing");
            if (! (a && a.length && (n = a.data("bs.collapse"), n && n.transitioning))) {
                var o = t.Event("show.bs.collapse", {
                    relatedTarget: e
                });
                if (this.$element.trigger(o), !o.isDefaultPrevented()) {
                    a && a.length && (s.call(a, "hide"), n || a.data("bs.collapse", null));
                    var r = this.dimension();
                    this.$element.removeClass("collapse").addClass("collapsing")[r](0).attr("aria-expanded", !0),
                    this.$trigger.removeClass("collapsed").attr("aria-expanded", !0),
                    this.transitioning = 1;
                    var l = function() {
                        this.$element.removeClass("collapsing").addClass("collapse in")[r](""),
                        this.transitioning = 0,
                        this.$element.trigger("shown.bs.collapse")
                    };
                    if (!t.support.transition) return l.call(this);
                    var d = t.camelCase(["scroll", r].join("-"));
                    this.$element.one("bsTransitionEnd", t.proxy(l, this)).emulateTransitionEnd(i.TRANSITION_DURATION)[r](this.$element[0][d])
                }
            }
        }
    },
    i.prototype.hide = function(e) {
        if (!this.transitioning && this.$element.hasClass("in")) {
            var s = t.Event("hide.bs.collapse", {
                relatedTarget: e
            });
            if (this.$element.trigger(s), !s.isDefaultPrevented()) {
                var n = this.dimension();
                this.$element[n](this.$element[n]())[0].offsetHeight,
                this.$element.addClass("collapsing").removeClass("collapse in").attr("aria-expanded", !1),
                this.$trigger.addClass("collapsed").attr("aria-expanded", !1),
                this.transitioning = 1;
                var a = function() {
                    this.transitioning = 0,
                    this.$element.removeClass("collapsing").addClass("collapse").trigger("hidden.bs.collapse")
                };
                return t.support.transition ? void this.$element[n](0).one("bsTransitionEnd", t.proxy(a, this)).emulateTransitionEnd(i.TRANSITION_DURATION) : a.call(this)
            }
        }
    },
    i.prototype.toggle = function(t) {
        this[this.$element.hasClass("in") ? "hide": "show"](t)
    },
    i.prototype.getParent = function() {
        return t(this.options.parent).find('[data-toggle="collapse"][data-parent="' + this.options.parent + '"]').each(t.proxy(function(s, i) {
            var n = t(i);
            this.addAriaAndCollapsedClass(e(n), n)
        },
        this)).end()
    },
    i.prototype.addAriaAndCollapsedClass = function(t, e) {
        var s = t.hasClass("in");
        t.attr("aria-expanded", s),
        e.toggleClass("collapsed", !s).attr("aria-expanded", s)
    };
    var n = t.fn.collapse;
    t.fn.collapse = s,
    t.fn.collapse.Constructor = i,
    t.fn.collapse.noConflict = function() {
        return t.fn.collapse = n,
        this
    },
    t(document).on("click.bs.collapse.data-api", '[data-toggle="collapse"]',
    function(i) {
        var n = t(this);
        n.attr("data-target") || i.preventDefault();
        var a = e(n),
        o = a.data("bs.collapse"),
        r = o ? "toggle": n.data();
        s.call(a, r, this)
    })
} (jQuery),
+
function(t) {
    "use strict";
    function e(e) {
        return this.each(function() {
            var i = t(this),
            n = i.data("bs.tooltip"),
            a = "object" == typeof e && e; (n || !/destroy|hide/.test(e)) && (n || i.data("bs.tooltip", n = new s(this, a)), "string" == typeof e && n[e]())
        })
    }
    var s = function(t, e) {
        this.type = null,
        this.options = null,
        this.enabled = null,
        this.timeout = null,
        this.hoverState = null,
        this.$element = null,
        this.inState = null,
        this.init("tooltip", t, e)
    };
    s.VERSION = "3.3.5",
    s.TRANSITION_DURATION = 150,
    s.DEFAULTS = {
        animation: !0,
        placement: "top",
        selector: !1,
        template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>',
        trigger: "hover focus",
        title: "",
        delay: 0,
        html: !1,
        container: !1,
        viewport: {
            selector: "body",
            padding: 0
        }
    },
    s.prototype.init = function(e, s, i) {
        if (this.enabled = !0, this.type = e, this.$element = t(s), this.options = this.getOptions(i), this.$viewport = this.options.viewport && t(t.isFunction(this.options.viewport) ? this.options.viewport.call(this, this.$element) : this.options.viewport.selector || this.options.viewport), this.inState = {
            click: !1,
            hover: !1,
            focus: !1
        },
        this.$element[0] instanceof document.constructor && !this.options.selector) throw new Error("`selector` option must be specified when initializing " + this.type + " on the window.document object!");
        for (var n = this.options.trigger.split(" "), a = n.length; a--;) {
            var o = n[a];
            if ("click" === o) this.$element.on("click." + this.type, this.options.selector, t.proxy(this.toggle, this));
            else if ("manual" !== o) {
                var r = "hover" === o ? "mouseenter": "focusin",
                l = "hover" === o ? "mouseleave": "focusout";
                this.$element.on(r + "." + this.type, this.options.selector, t.proxy(this.enter, this)),
                this.$element.on(l + "." + this.type, this.options.selector, t.proxy(this.leave, this))
            }
        }
        this.options.selector ? this._options = t.extend({},
        this.options, {
            trigger: "manual",
            selector: ""
        }) : this.fixTitle()
    },
    s.prototype.getDefaults = function() {
        return s.DEFAULTS
    },
    s.prototype.getOptions = function(e) {
        return e = t.extend({},
        this.getDefaults(), this.$element.data(), e),
        e.delay && "number" == typeof e.delay && (e.delay = {
            show: e.delay,
            hide: e.delay
        }),
        e
    },
    s.prototype.getDelegateOptions = function() {
        var e = {},
        s = this.getDefaults();
        return this._options && t.each(this._options,
        function(t, i) {
            s[t] !== i && (e[t] = i)
        }),
        e
    },
    s.prototype.enter = function(e) {
        var s = e instanceof this.constructor ? e: t(e.currentTarget).data("bs." + this.type);
        return s || (s = new this.constructor(e.currentTarget, this.getDelegateOptions()), t(e.currentTarget).data("bs." + this.type, s)),
        e instanceof t.Event && (s.inState["focusin" === e.type ? "focus": "hover"] = !0),
        s.tip().hasClass("in") || "in" === s.hoverState ? void(s.hoverState = "in") : (clearTimeout(s.timeout), s.hoverState = "in", s.options.delay && s.options.delay.show ? void(s.timeout = setTimeout(function() {
            "in" === s.hoverState && s.show()
        },
        s.options.delay.show)) : s.show())
    },
    s.prototype.isInStateTrue = function() {
        for (var t in this.inState) if (this.inState[t]) return ! 0;
        return ! 1
    },
    s.prototype.leave = function(e) {
        var s = e instanceof this.constructor ? e: t(e.currentTarget).data("bs." + this.type);
        return s || (s = new this.constructor(e.currentTarget, this.getDelegateOptions()), t(e.currentTarget).data("bs." + this.type, s)),
        e instanceof t.Event && (s.inState["focusout" === e.type ? "focus": "hover"] = !1),
        s.isInStateTrue() ? void 0 : (clearTimeout(s.timeout), s.hoverState = "out", s.options.delay && s.options.delay.hide ? void(s.timeout = setTimeout(function() {
            "out" === s.hoverState && s.hide()
        },
        s.options.delay.hide)) : s.hide())
    },
    s.prototype.show = function() {
        var e = t.Event("show.bs." + this.type);
        if (this.hasContent() && this.enabled) {
            this.$element.trigger(e);
            var i = t.contains(this.$element[0].ownerDocument.documentElement, this.$element[0]);
            if (e.isDefaultPrevented() || !i) return;
            var n = this,
            a = this.tip(),
            o = this.getUID(this.type);
            this.setContent(),
            a.attr("id", o),
            this.$element.attr("aria-describedby", o),
            this.options.animation && a.addClass("fade");
            var r = "function" == typeof this.options.placement ? this.options.placement.call(this, a[0], this.$element[0]) : this.options.placement,
            l = /\s?auto?\s?/i,
            d = l.test(r);
            d && (r = r.replace(l, "") || "top"),
            a.detach().css({
                top: 0,
                left: 0,
                display: "block"
            }).addClass(r).data("bs." + this.type, this),
            this.options.container ? a.appendTo(this.options.container) : a.insertAfter(this.$element),
            this.$element.trigger("inserted.bs." + this.type);
            var h = this.getPosition(),
            c = a[0].offsetWidth,
            p = a[0].offsetHeight;
            if (d) {
                var u = r,
                m = this.getPosition(this.$viewport);
                r = "bottom" === r && h.bottom + p > m.bottom ? "top": "top" === r && h.top - p < m.top ? "bottom": "right" === r && h.right + c > m.width ? "left": "left" === r && h.left - c < m.left ? "right": r,
                a.removeClass(u).addClass(r)
            }
            var f = this.getCalculatedOffset(r, h, c, p);
            this.applyPlacement(f, r);
            var g = function() {
                var t = n.hoverState;
                n.$element.trigger("shown.bs." + n.type),
                n.hoverState = null,
                "out" === t && n.leave(n)
            };
            t.support.transition && this.$tip.hasClass("fade") ? a.one("bsTransitionEnd", g).emulateTransitionEnd(s.TRANSITION_DURATION) : g()
        }
    },
    s.prototype.applyPlacement = function(e, s) {
        var i = this.tip(),
        n = i[0].offsetWidth,
        a = i[0].offsetHeight,
        o = parseInt(i.css("margin-top"), 10),
        r = parseInt(i.css("margin-left"), 10);
        isNaN(o) && (o = 0),
        isNaN(r) && (r = 0),
        e.top += o,
        e.left += r,
        t.offset.setOffset(i[0], t.extend({
            using: function(t) {
                i.css({
                    top: Math.round(t.top),
                    left: Math.round(t.left)
                })
            }
        },
        e), 0),
        i.addClass("in");
        var l = i[0].offsetWidth,
        d = i[0].offsetHeight;
        "top" === s && d !== a && (e.top = e.top + a - d);
        var h = this.getViewportAdjustedDelta(s, e, l, d);
        h.left ? e.left += h.left: e.top += h.top;
        var c = /top|bottom/.test(s),
        p = c ? 2 * h.left - n + l: 2 * h.top - a + d,
        u = c ? "offsetWidth": "offsetHeight";
        i.offset(e),
        this.replaceArrow(p, i[0][u], c)
    },
    s.prototype.replaceArrow = function(t, e, s) {
        this.arrow().css(s ? "left": "top", 50 * (1 - t / e) + "%").css(s ? "top": "left", "")
    },
    s.prototype.setContent = function() {
        var t = this.tip(),
        e = this.getTitle();
        t.find(".tooltip-inner")[this.options.html ? "html": "text"](e),
        t.removeClass("fade in top bottom left right")
    },
    s.prototype.hide = function(e) {
        function i() {
            "in" !== n.hoverState && a.detach(),
            n.$element.removeAttr("aria-describedby").trigger("hidden.bs." + n.type),
            e && e()
        }
        var n = this,
        a = t(this.$tip),
        o = t.Event("hide.bs." + this.type);
        return this.$element.trigger(o),
        o.isDefaultPrevented() ? void 0 : (a.removeClass("in"), t.support.transition && a.hasClass("fade") ? a.one("bsTransitionEnd", i).emulateTransitionEnd(s.TRANSITION_DURATION) : i(), this.hoverState = null, this)
    },
    s.prototype.fixTitle = function() {
        var t = this.$element; (t.attr("title") || "string" != typeof t.attr("data-original-title")) && t.attr("data-original-title", t.attr("title") || "").attr("title", "")
    },
    s.prototype.hasContent = function() {
        return this.getTitle()
    },
    s.prototype.getPosition = function(e) {
        e = e || this.$element;
        var s = e[0],
        i = "BODY" === s.tagName,
        n = s.getBoundingClientRect();
        null === n.width && (n = t.extend({},
        n, {
            width: n.right - n.left,
            height: n.bottom - n.top
        }));
        var a = i ? {
            top: 0,
            left: 0
        }: e.offset(),
        o = {
            scroll: i ? document.documentElement.scrollTop || document.body.scrollTop: e.scrollTop()
        },
        r = i ? {
            width: t(window).width(),
            height: t(window).height()
        }: null;
        return t.extend({},
        n, o, r, a)
    },
    s.prototype.getCalculatedOffset = function(t, e, s, i) {
        return "bottom" === t ? {
            top: e.top + e.height,
            left: e.left + e.width / 2 - s / 2
        }: "top" === t ? {
            top: e.top - i,
            left: e.left + e.width / 2 - s / 2
        }: "left" === t ? {
            top: e.top + e.height / 2 - i / 2,
            left: e.left - s
        }: {
            top: e.top + e.height / 2 - i / 2,
            left: e.left + e.width
        }
    },
    s.prototype.getViewportAdjustedDelta = function(t, e, s, i) {
        var n = {
            top: 0,
            left: 0
        };
        if (!this.$viewport) return n;
        var a = this.options.viewport && this.options.viewport.padding || 0,
        o = this.getPosition(this.$viewport);
        if (/right|left/.test(t)) {
            var r = e.top - a - o.scroll,
            l = e.top + a - o.scroll + i;
            r < o.top ? n.top = o.top - r: l > o.top + o.height && (n.top = o.top + o.height - l)
        } else {
            var d = e.left - a,
            h = e.left + a + s;
            d < o.left ? n.left = o.left - d: h > o.right && (n.left = o.left + o.width - h)
        }
        return n
    },
    s.prototype.getTitle = function() {
        var t, e = this.$element,
        s = this.options;
        return t = e.attr("data-original-title") || ("function" == typeof s.title ? s.title.call(e[0]) : s.title)
    },
    s.prototype.getUID = function(t) {
        do t += ~~ (1e6 * Math.random());
        while (document.getElementById(t));
        return t
    },
    s.prototype.tip = function() {
        if (!this.$tip && (this.$tip = t(this.options.template), 1 !== this.$tip.length)) throw new Error(this.type + " `template` option must consist of exactly 1 top-level element!");

        return this.$tip
    },
    s.prototype.arrow = function() {
        return this.$arrow = this.$arrow || this.tip().find(".tooltip-arrow")
    },
    s.prototype.enable = function() {
        this.enabled = !0
    },
    s.prototype.disable = function() {
        this.enabled = !1
    },
    s.prototype.toggleEnabled = function() {
        this.enabled = !this.enabled
    },
    s.prototype.toggle = function(e) {
        var s = this;
        e && (s = t(e.currentTarget).data("bs." + this.type), s || (s = new this.constructor(e.currentTarget, this.getDelegateOptions()), t(e.currentTarget).data("bs." + this.type, s))),
        e ? (s.inState.click = !s.inState.click, s.isInStateTrue() ? s.enter(s) : s.leave(s)) : s.tip().hasClass("in") ? s.leave(s) : s.enter(s)
    },
    s.prototype.destroy = function() {
        var t = this;
        clearTimeout(this.timeout),
        this.hide(function() {
            t.$element.off("." + t.type).removeData("bs." + t.type),
            t.$tip && t.$tip.detach(),
            t.$tip = null,
            t.$arrow = null,
            t.$viewport = null
        })
    };
    var i = t.fn.tooltip;
    t.fn.tooltip = e,
    t.fn.tooltip.Constructor = s,
    t.fn.tooltip.noConflict = function() {
        return t.fn.tooltip = i,
        this
    }
} (jQuery),
+
function(t) {
    "use strict";
    function e(e, i) {
        return this.each(function() {
            var n = t(this),
            a = n.data("amos.gallery"),
            o = t.extend({},
            s.DEFAULTS, n.data(), "object" == typeof e && e);
            a || n.data("amos.gallery", a = new s(this, o)),
            "string" == typeof e ? a[e](i) : o.show && a.show(i)
        })
    }
    var s = function(e, s) {
        this.$body = t(document.body),
        this.$element = t(e),
        this.imageType = s.imageType,
        this.url = s.url,
        this.urlType = s.type,
        this.deleteUrl = s.deleteUrl,
        this.triggerObj = s.triggerObj,
        this.deleteUrlType = s.deleteType,
        this.fileSize = s.fileSize,
        this.uploadParam = s.uploadParam,
        this.receiveUploadSuccess = s.receiveUploadSuccess,
        this.receiveUploadFailure = s.receiveUploadFailure,
        this.prepareDelete = s.prepareDelete,
        this.receiveDeleteSuccess = s.receiveDeleteSuccess,
        this.receiveDeleteFailure = s.receiveDeleteFailure,
        this.$input = this.$element.find(".gallery-input"),
        this.$submit = this.$element.find(".gallery-submit"),
        this.$form = this.$element.find(".gallery-form"),
        this.$preview = this.$element.find(".gallery-preview-container"),
        this.$addBtn = this.$element.find('[data-toggle="gallery-add"]'),
        this.$upload = this.$element.find('[data-toggle="gallery-upload"]'),
        this.$remove = this.$element.find('[data-toggle="gallery-remove"]'),
        this.$multiple = this.$element.find('[data-toggle="gallery-multiple"]'),
        this.$multipleClose = this.$element.find('[data-toggle="gallery-multiple-close"]'),
        this.$multiAll = this.$element.find('[data-toggle="gallery-all"]'),
        this.$multiDelete = this.$element.find('[data-toggle="gallery-delete"]'),
        this.$previewTitle = this.$element.find('[data-toggle="gallery-preview-title"]'),
        this.$uploaded = this.$element.find(".gallery-uploaded-container"),
        this.$uploadedEmpty = this.$element.find(".gallery-uploaded-empty"),
        this.limit = s.max,
        this.uploadedHtml = '<div class="gallery-uploaded"><div class="gallery-triangle"><span class="glyphicon glyphicon-ok"></span></div></div>',
        this.previewHtml = '<div class="gallery-preview"><div class="gallery-upload-progress text-center hidden vertical-middle-block"><span class="vertical-middle-block-cell"></span></div><div class="gallery-preview-delete">删除</div></div>',
        this.isShown = null,
        this.selectedCount = 0,
        this.multiSelectedIndex = [],
        this.uploadFiles = [],
        this.uploadSuccess = 0,
        this.uploadError = 0,
        this.uploadedIndex = [],
        this.deleteSelected = []
    };
    s.VERSION = "0.0.1",
    s.DEFAULTS = {
        show: !0,
        max: 10,
        url: "",
        imageType: /^image/,
        urlType: "POST",
        fileSize: 3145728,
        deleteUrl: "",
        deleteType: "POST",
        uploadParam: "",
        triggerObj: t("body"),
        receiveUploadSuccess: function(t) {
            return t
        },
        receiveUploadFailure: function(t) {},
        prepareDelete: function(t) {
            var e = {};
            return e.index = t,
            e
        },
        receiveDeleteSuccess: function() {
            return ! 0
        },
        receiveDeleteFailure: function() {
            return ! 0
        }
    },
    s.prototype.toggle = function(t) {
        return this.isShown ? this.hide() : this.show(t)
    },
    s.prototype.refresh = function(t) {
        this.triggerObj = t,
        this.isShown = !0,
        this.selectedCount = 0,
        this.multiSelectedIndex = [],
        this.uploadFiles = [],
        this.uploadSuccess = 0,
        this.uploadError = 0,
        this.uploadedIndex = [],
        this.deleteSelected = [],
        this.$preview.html(""),
        this.hide(),
        this.show()
    },
    s.prototype.addUploaded = function(e) {
        var s = this;
        t.each(e,
        function(t, i) {
            s.$uploaded.append(s.uploadedHtml);
            var n = s.$uploaded.find(".gallery-uploaded:last-child");
            n.css("background-image", "url(" + e[t] + ")")
        })
    },
    s.prototype.changeUploadParam = function(t) {
        this.uploadParam = t
    },
    s.prototype.show = function(e) {
        var s = t.Event("show.amos.gallery", {
            relatedTarget: e
        });
        if (this.$element.trigger(s), !this.isShown && !s.isDefaultPrevented()) {
            this.isShown = !0,
            this.$element.show(),
            this.$element.on("click.amos.gallery.add", '[data-toggle="gallery-add"]', t.proxy(this.btnInput, this)),
            this.$element.on("click.amos.gallery.multiple", '[data-toggle="gallery-multiple"]', t.proxy(this.btnMultiple, this)),
            this.$element.on("click.amos.gallery.all", '[data-toggle="gallery-all"]', t.proxy(this.btnAll, this)),
            this.$element.on("click.amos.gallery.close", '[data-toggle="gallery-multiple-close"]', t.proxy(this.btnMultipleRemove, this)),
            this.$element.on("click.amos.gallery.upload", '[data-toggle="gallery-upload"]', t.proxy(this.btnUpload, this)),
            this.$element.on("click.amos.gallery.remove", '[data-toggle="gallery-remove"]', t.proxy(this.btnRemove, this)),
            this.$element.on("change.amos.gallery.input", ".gallery-input", t.proxy(this.inputChange, this));
            var i = this;
            this.$element.on("mouseover.amos.gallery.preview", ".gallery-preview",
            function(e) {
                t(this).find(".gallery-preview-delete").show()
            }),
            this.$element.on("mouseleave.amos.gallery.preview", ".gallery-preview",
            function(e) {
                t(this).find(".gallery-preview-delete").hide()
            }),
            this.$element.on("click.amos.gallery.delete", ".gallery-preview-delete",
            function(e) {
                var s = t(this).parent().index();
                i.fileDelete(s, !0)
            }),
            this.refreshUploaded(),
            this.refreshPreview()
        }
    },
    s.prototype.hide = function(e) {
        e && e.preventDefault(),
        e = t.Event("hide.amos.gallery"),
        this.$element.trigger(e),
        this.isShown && !e.isDefaultPrevented() && (this.isShown = !1, this.$element.hide(), this.$element.off("click.amos.gallery").off("mouseover.amos.gallery").off("mouseleave.amos.gallery"))
    },
    s.prototype.refreshPreview = function() {
        this.$preview.children().length > 0 ? (this.$upload.removeClass("hidden"), this.$remove.removeClass("hidden"), this.$previewTitle.removeClass("hidden")) : (this.$upload.addClass("hidden"), this.$remove.addClass("hidden"), this.$previewTitle.addClass("hidden"))
    },
    s.prototype.refreshUploaded = function() {
        this.$uploaded.children().length > 0 ? (this.$multiple.removeClass("hidden"), this.$uploadedEmpty.addClass("hidden")) : (this.$uploadedEmpty.removeClass("hidden"), this.$multiple.addClass("hidden"), this.btnMultipleRemove())
    },
    s.prototype.startUpload = function() {
        var e = this;
        this.uploadSuccess = 0,
        this.uploadError = 0,
        this.uploadedIndex = [],
        this.$upload.addClass("disabled"),
        this.$remove.addClass("disabled"),
        this.$multiple.addClass("disabled"),
        t.each(e.uploadFiles,
        function(t, s) {
            e.uploadFile(t, s)
        })
    },
    s.prototype.uploadFile = function(e, s) {
        if (s) {
            var i = this,
            n = new FormData;
            n.append("file", s),
            t.each(i.uploadParam,
            function(t, e) {
                n.append(t, e)
            });
            var a = new XMLHttpRequest;
            a.upload.addEventListener("progress",
            function(t) {
                i.onProgress(t.loaded, t.total, e)
            },
            !1),
            a.addEventListener("load",
            function(t) {
                200 === a.status ? i.onSuccess(a.responseText, e) : i.onFailure(a.responseText, e),
                i.uploadSuccess + i.uploadError === i.selectedCount && i.onComplete()
            },
            !1),
            a.addEventListener("error",
            function(t, s) {
                i.onFailure(s, e),
                i.uploadSuccess + i.uploadError === i.selectedCount && i.onComplete()
            },
            !1),
            a.open(this.urlType, i.url, !0),
            a.send(n)
        }
    },
    s.prototype.onComplete = function() {
        this.$element.trigger("complete.amos.gallery", [this.uploadSuccess, this.uploadError]),
        this.selectedCount -= this.uploadSuccess,
        this.$upload.removeClass("disabled"),
        this.$remove.removeClass("disabled"),
        this.$multiple.removeClass("disabled")
    },
    s.prototype.runtimeIndex = function(t) {
        for (var e = 0,
        s = 0; s < this.uploadedIndex.length; s++) this.uploadedIndex[s] < t && e++;
        return t - e
    },
    s.prototype.onProgress = function(t, e, s) {
        s = this.runtimeIndex(s);
        var i = this.$preview.children().eq(s).find(".gallery-upload-progress");
        i.removeClass("hidden");
        var n;
        isNaN(t) || isNaN(e) ? n = "-": (n = t / e * 100, n = Math.ceil(n)),
        i.find("span").html(n + "%")
    },
    s.prototype.onSuccess = function(t, e) {
        this.uploadSuccess++,
        this.$uploaded.append(this.uploadedHtml);
        var s = this.$uploaded.find(".gallery-uploaded:last-child"),
        i = this.receiveUploadSuccess(t, s, this.triggerObj);
        s.css("background-image", "url(" + i + ")");
        var n = this.runtimeIndex(e);
        this.fileDelete(n, !1),
        this.uploadedIndex.push(e),
        this.refreshUploaded()
    },
    s.prototype.onFailure = function(t, e) {
        this.uploadError++;
        var s = this.$preview.children().eq(e);
        s.addClass("gallery-upload-Error");
        var i = this.$preview.children().eq(e).find(".gallery-upload-progress");
        i.addClass("hidden"),
        this.receiveUploadFailure(t, s, this.triggerObj)
    },
    s.prototype.btnInput = function(t) {
        if (!this.$addBtn.hasClass("disabled")) {
            var e = this.limitChecked();
            e && this.$input.trigger("click")
        }
    },
    s.prototype.limitChecked = function() {
        var t = this.$uploaded.children().length;
        return this.limit <= t + this.selectedCount ? (this.$element.trigger("limit.amos.gallery", [this.limit]), !1) : !0
    },
    s.prototype.btnMultiple = function(e) {
        if (!this.$multiple.hasClass("disabled")) {
            this.$addBtn.addClass("disabled"),
            this.$multiple.addClass("disabled"),
            this.$multiAll.removeClass("hidden"),
            this.$multipleClose.removeClass("hidden"),
            this.$upload.addClass("disabled"),
            this.$remove.addClass("disabled");
            var s = this.$uploaded.find(".gallery-triangle .glyphicon");
            s.removeClass("glyphicon-ok"),
            s.addClass("glyphicon-unchecked");
            var i = this;
            this.$uploaded.on("click.amos.gallery.glyphicon", ".gallery-uploaded",
            function() {
                var e = t(this).index(),
                s = t(this).find(".glyphicon");
                i.btnGlyphCheck(e, !s.hasClass("glyphicon-check"))
            }),
            this.$multiDelete.on("click.amos.gallery.multiDelete", t.proxy(this.btnDeleteClick, this))
        }
    },
    s.prototype.btnMultipleRemove = function(t) {
        var e = this.$uploaded.find(".gallery-triangle .glyphicon");
        e.addClass("glyphicon-ok"),
        e.removeClass("glyphicon-unchecked"),
        e.removeClass("glyphicon-check"),
        this.$uploaded.off("click.amos.gallery.glyphicon"),
        this.$multiDelete.off("click.amos.gallery.multiDelete"),
        this.$addBtn.removeClass("disabled"),
        this.$multiple.removeClass("disabled"),
        this.$upload.removeClass("disabled"),
        this.$remove.removeClass("disabled"),
        this.$multiAll.addClass("hidden"),
        this.$multipleClose.addClass("hidden"),
        this.$multiDelete.addClass("hidden"),
        this.$multiAll.find(".glyphicon").hasClass("glyphicon-check") && (this.$multiAll.data("checked", !1), this.$multiAll.find(".glyphicon").removeClass("glyphicon-check"), this.$multiAll.find(".glyphicon").addClass("glyphicon-unchecked"))
    },
    s.prototype.btnGlyphCheck = function(e, s) {
        var i = this.$uploaded.children().eq(e).find(".glyphicon");
        s ? (i.addClass("glyphicon-check"), i.removeClass("glyphicon-unchecked")) : (i.removeClass("glyphicon-check"), i.addClass("glyphicon-unchecked"));
        var n = !1;
        t.each(this.$uploaded.children(),
        function(e, s) {
            var i = t(this).find(".glyphicon");
            return i.hasClass("glyphicon-check") ? (n = !0, !1) : void 0
        }),
        this.btnDeleteToggle(n)
    },
    s.prototype.btnDeleteToggle = function(t) {
        t ? this.$multiDelete.removeClass("hidden") : this.$multiDelete.addClass("hidden")
    },
    s.prototype.btnDeleteClick = function(e) {
        var s = this,
        i = [];
        if (t.each(this.$uploaded.children(),
        function(e, s) {
            var n = t(this).find(".glyphicon"),
            a = t(this).index();
            n.hasClass("glyphicon-check") && i.push(a)
        }), !(i.length <= 0)) {
            var n = this.prepareDelete(i);
            n.data = s.uploadParam,
            this.deleteSelected = i,
            t.ajax({
                url: s.deleteUrl,
                data: n,
                type: s.deleteUrlType,
                cache: !1,
                dataType: "json",
                success: t.proxy(s.deleteSuccess, s),
                error: t.proxy(s.deleteFailure, s)
            })
        }
    },
    s.prototype.deleteSuccess = function(e) {
        var s = this,
        i = s.receiveDeleteSuccess(e, s.triggerObj);
        i && (this.deleteSelected.sort(function(t, e) {
            return e - t
        }), t.each(this.deleteSelected,
        function(t, e) {
            var i = e;
            s.$uploaded.children().eq(i).remove()
        }), this.refreshUploaded())
    },
    s.prototype.deleteFailure = function(t) {
        var e = this,
        s = e.receiveDeleteFailure(t)
    },
    s.prototype.btnAll = function(t) {
        var e = this,
        s = e.$multiAll.data("checked");
        s = !s;
        var i = e.$uploaded.find(".glyphicon");
        s ? (e.$multiAll.find(".glyphicon").addClass("glyphicon-check"), e.$multiAll.find(".glyphicon").removeClass("glyphicon-unchecked"), i.addClass("glyphicon-check"), i.removeClass("glyphicon-unchecked")) : (e.$multiAll.find(".glyphicon").removeClass("glyphicon-check"), e.$multiAll.find(".glyphicon").addClass("glyphicon-unchecked"), i.removeClass("glyphicon-check"), i.addClass("glyphicon-unchecked")),
        this.btnDeleteToggle(s),
        e.$multiAll.data("checked", s)
    },
    s.prototype.btnUpload = function(t) {
        this.$upload.hasClass("disabled") || this.startUpload()
    },
    s.prototype.btnRemove = function(e) {
        if (!this.$remove.hasClass("disabled")) {
            this.$input.val("");
            var s = this;
            this.$preview.children().each(function() {
                s.fileDelete(t(this).index(), !0)
            })
        }
    },
    s.prototype.inputChange = function(e) {
        var s = this.$input[0].files ? this.$input[0].files: [];
        if (s.length) {
            if (!window.FileReader) return void window.alert("抱歉，您所使用的浏览器无法使用该功能，请在其他浏览器重试，推荐使用谷歌浏览器chrome");
            var i = this;
            s = i.fileFilter(s),
            this.multiSelectedIndex = [];
            var n = this.$preview.children().length;
            t.each(s,
            function(t, e) {
                i.readFile(t, e, n)
            })
        }
    },
    s.prototype.readFile = function(t, e, s) {
        var i = this,
        n = this.limitChecked();
        if (n) {
            var a = new FileReader;
            i.$upload.removeClass("hidden"),
            i.$remove.removeClass("hidden"),
            i.$previewTitle.removeClass("hidden"),
            i.selectedCount++,
            i.uploadFiles.push(e),
            a.readAsDataURL(e),
            a.onloadend = function(e) {
                i.$preview.append(i.previewHtml);
                var n = i.$preview.find(".gallery-preview:last-child");
                n.css("background-image", "url(" + this.result + ")");
                var a = i.multiRuntimeIndex(t);
                a >= 0 ? n.insertAfter(i.$preview.children().eq(a + s)) : n.insertBefore(i.$preview.children().eq(s)),
                i.multiSelectedIndex.push(t)
            }
        }
    },
    s.prototype.multiRuntimeIndex = function(t) {
        for (var e = 0,
        s = 0; s < this.multiSelectedIndex.length; s++) this.multiSelectedIndex[s] < t && e++;
        return e - 1
    },
    s.prototype.fileDelete = function(t, e) {
        this.$preview.find(".gallery-preview").eq(t).remove(),
        this.uploadFiles.splice(t, 1),
        e && this.selectedCount--;
        var s = this.$preview.children().length;
        0 >= s && (this.$previewTitle.addClass("hidden"), this.$upload.addClass("hidden"), this.$remove.addClass("hidden"))
    },
    s.prototype.fileFilter = function(e) {
        var s = this,
        i = [];
        return t.each(e,
        function(n, a) {
            return a.size > s.fileSize ? (s.$element.trigger("filesizelimit.amos.gallery", [s.fileSize]), !0) : s.imageType.test(a.type) ? void(t.inArray(a, s.uploadFiles) < 0 && i.push(e[n])) : (s.$element.trigger("imagetype.amos.gallery"), !0)
        }),
        i
    };
    var i = t.fn.gallery;
    t.fn.gallery = e,
    t.fn.gallery.Constructor = s,
    t.fn.gallery.noConflict = function() {
        return t.fn.gallery = i,
        this
    }
} (jQuery),
function(t) {
    "use strict";
    t.fn.tip = function(e) {
        function s(t, e) {
            l = setTimeout(function() {
                t.animate({
                    opacity: 0
                },
                500,
                function() {
                    t.remove(),
                    setTimeout(function() {
                        void 0 !== e && e()
                    },
                    300)
                })
            },
            1e3 * n.time)
        }
        var i = {
            height: 26,
            direction: 3,
            offsetX: 0,
            offsetY: 0,
            align: "center",
            lineHeight: 18,
            color: "#424242",
            autoClose: !0,
            time: 1.5,
            position: "absolute",
            background: "#ffffff",
            content: "tip",
            triangleWidth: 5
        },
        n = t.extend(i, e),
        a = '<span class="jb_con_len" style="display:none;position:absolute;white-space:nowrap;">' + n.content + "</span>";
        t("body").append(a); {
            var o = t(".jb_con_len").width(),
            r = o + 12;
            t(".jb_con_len").height() + 8
        }
        t(".jb_con_len").remove();
        var l = null;
        return this.each(function() {
            var e = t(this);
            e.css({
                position: "relative"
            });
            var i, a, d, h, c = e.offset().left,
            p = e.offset().top,
            u = parseInt(e.innerWidth()),
            m = parseInt(e.innerHeight()),
            f = 2 * n.triangleWidth;
            switch (n.direction) {
            case 2:
                i = c + (u - r) / 2 + n.offsetX,
                a = p - n.height - f + n.offsetY,
                d = (r - f) / 2,
                h = n.height;
                break;
            case 3:
                i = c + u + f + n.offsetX,
                a = p + (m - n.height) / 2 + n.offsetY,
                d = -f,
                h = (n.height - f) / 2;
                break;
            case 4:
                i = c + (u - r) / 2 + n.offsetX,
                a = p + m + f + n.offsetY,
                d = (r - f) / 2,
                h = -f;
                break;
            case 1:
            default:
                i = c - r - f + n.offsetX,
                a = p + (m - n.height) / 2 + n.offsetY,
                d = r,
                h = (n.height - f) / 2
            }
            "fixed" === n.position && (a -= parseInt(t(window).scrollTop()));
            var g = e.attr("data-tooltip-plugin-id");
            null === g && (g = (new Date).getTime(), e.attr("data-tooltip-plugin-id", g));
            var C = "box-sizing: content-box;text-align:center;box-shadow: 0 0 4px #ddd;position:" + n.position + ";z-index:2;border:1px solid #ddd;border-radius:3px;background:" + n.background + ";left:" + i + "px;top:" + a + "px;";
            C += "width:" + r + "px;height:" + n.height + "px;display:none;z-index:10004;line-height:12px;";
            var v = '<div class="jb_tip" data-id="' + g + '" style="' + C + '">',
            _ = "";
            switch (n.direction) {
            case 1:
                _ = "transparent transparent transparent " + n.background;
                break;
            case 2:
                _ = n.background + " transparent transparent transparent";
                break;
            case 3:
                _ = "transparent " + n.background + " transparent transparent";
                break;
            case 4:
                _ = "transparent transparent " + n.background + " transparent"
            }
            v += '<b style="width: 0;height: 0;border-width: ' + n.triangleWidth + "px;padding: 0;font-size: 0;line-height: 0;border-style: solid;border-color: " + _ + ";position: absolute;left: " + d + "px;top:" + h + 'px;z-index: 99;"></b>',
            v += '<div style="box-sizing: content-box;width:' + o + "px;vertical-align:middle;padding:4px 6px;line-height:" + n.lineHeight + "px;text-align:" + n.align + ";color:" + n.color + ';">' + n.content + "</div></div>",
            t(".jb_tip[data-id=" + g + "]").remove(),
            t("body").append(v);
            var b = t(".jb_tip[data-id=" + g + "]");
            b.fadeIn(100),
            n.autoClose && s(b, n.callBack),
            b.mouseenter(function() {
                null !== l && clearTimeout(l)
            }).mouseleave(function() {
                n.autoClose && s(b, n.callBack)
            })
        })
    }
} (jQuery),
+
function(t) {
    "use strict";
    function e(e, i) {
        return this.each(function() {
            var n = t(this),
            a = n.data("amos.fileupload"),
            o = t.extend({},
            s.DEFAULTS, n.data(), "object" == typeof e && e);
            a || n.data("amos.fileupload", a = new s(this, o)),
            "string" == typeof e && a[e](i)
        })
    }
    var s = function(e, i) {
        this.options = i,
        this.containerObj = t(e),
        this.triggerObj = this.containerObj.find(s.CLASS.trigger),
        this.inputObj = this.containerObj.find(s.CLASS.input),
        this.startObj = this.containerObj.find(s.CLASS.start),
        this.progressObj = this.containerObj.find(s.CLASS.progress),
        this.resultObj = this.containerObj.find(s.CLASS.result),
        this.isUploading = !1,
        this.uploadParam = {},
        this.init()
    };
    s.VERSION = "0.0.1",
    s.DEFAULTS = {
        url: "",
        fileType: /^image/,
        urlType: "POST",
        dataType: "json",
        fileSize: 3145728,
        autoUpload: !1,
        parentId: "body",
        success: function(t, e, s) {},
        failure: function(t, e) {},
        complete: function(t) {}
    },
    s.EVENTS = {
        choose: "choose.amos.fileupload",
        chosed: "chosed.amos.fileupload",
        size: "sizeerror.amos.fileupload",
        type: "typeerror.amos.fileupload",
        start: "start.amos.fileupload"
    },
    s.CLASS = {
        container: ".fileUpload",
        trigger: ".fileUploadTrigger",
        start: ".fileUploadStart",
        input: ".fileUploadInput",
        progress: ".fileUploadProgress",
        result: ".fileUploadResult",
        hidden: "hidden"
    },
    s.prototype.init = function() {
        this.isUploading = !1,
        this.progressObj.addClass(s.CLASS.hidden),
        this.triggerObj.removeClass(s.CLASS.hidden),
        this.startObj.prop("disabled", !0),
        this.containerObj.on("click.amos.fileupload.trigger", s.CLASS.trigger, t.proxy(this.choose, this)),
        this.containerObj.on("change.amos.fileupload.input", s.CLASS.input, t.proxy(this.chosed, this)),
        this.containerObj.on("click.amos.fileupload.start", s.CLASS.start, t.proxy(this.startUpload, this))
    },
    s.prototype.choose = function() {
        var e = t.Event(s.EVENTS.choose);
        this.containerObj.trigger(e),
        e.isDefaultPrevented() || this.inputObj.trigger("click")
    },
    s.prototype.chosed = function() {
        var e = t.Event(s.EVENTS.chosed);
        this.containerObj.trigger(e),
        e.isDefaultPrevented() || (this.startObj.prop("disabled", !1), this.options.autoUpload && this.startObj.trigger("click"))
    },
    s.prototype.filter = function() {
        var t = this.inputObj[0].files ? this.inputObj[0].files: [],
        e = t[0];
        return e.size > this.options.fileSize ? (this.containerObj.trigger(s.EVENTS.size, [this.options.fileSize]), !1) : this.options.fileType.test(e.type) ? !0 : (this.containerObj.trigger(s.EVENTS.type, [this.options.fileType]), !1)
    },
    s.prototype.startUpload = function() {
        var e = this.startObj.prop("disabled");
        if (!e || !this.isUploading) {
            var i = this.filter();
            if (i) {
                var n = this.inputObj[0].files ? this.inputObj[0].files: [],
                a = n[0];
                if ("" !== a) {
                    var o = t.Event(s.EVENTS.start);
                    this.containerObj.trigger(o),
                    o.isDefaultPrevented() || (this.isUploading = !0, this.progressObj.removeClass(s.CLASS.hidden), this.resultObj.addClass(s.CLASS.hidden), this.uploadFile(a))
                }
            }
        }
    },
    s.prototype.changeUploadParam = function(t) {
        this.uploadParam = t
    },
    s.prototype.uploadFile = function(e) {
        if (e) {
            var s = this,
            i = new FormData;
            i.append("file", e),
            t.each(s.uploadParam,
            function(t, e) {
                i.append(t, e)
            });
            var n = new XMLHttpRequest;
            n.addEventListener("load",
            function(t) {
                200 === n.status ? s.onSuccess(n.responseText) : s.onFailure(n.responseText),
                s.onComplete()
            },
            !1),
            n.addEventListener("error",
            function(t, e) {
                s.onFailure(e),
                s.onComplete()
            },
            !1),
            n.open(this.options.urlType, this.options.url, !0),
            n.send(i)
        }
    },
    s.prototype.onSuccess = function(e) {
        this.startObj.prop("disabled", !0),
        "json" === this.options.dataType && (e = t.parseJSON(e)),
        this.options.success(e, this.triggerObj, this.resultObj)
    },
    s.prototype.onFailure = function(t) {
        this.options.failure(t, this.triggerObj)
    },
    s.prototype.onComplete = function() {
        this.isUploading = !1,
        this.progressObj.addClass(s.CLASS.hidden),
        this.resultObj.removeClass(s.CLASS.hidden),
        this.options.complete()
    };
    var i = t.fn.fileUpload;
    t.fn.fileUpload = e,
    t.fn.fileUpload.Constructor = s,
    t.fn.fileUpload.noConflict = function() {
        return t.fn.fileUpload = i,
        this
    }
} (jQuery),
+
function(t) {
    "use strict";
    function e(e, i) {
        return this.each(function() {
            var n = t(this),
            a = n.data("amos.inputValidate"),
            o = t.extend({},
            s.DEFAULTS, n.data(), "object" == typeof e && e);
            a || n.data("amos.inputValidate", a = new s(this, o)),
            "string" == typeof e && a[e](i)
        })
    }
    var s = function(e, s) {
        this.options = s,
        this.parentDom = t(e),
        this.submit = this.options.submit,
        this.inputs = this.options.inputs,
        this.init()
    };
    s.VERSION = "0.0.1",
    s.EVENTS = {
        parent: ".amos.inputValidate",
        blur: "blur.amos.inputValidate",
        click: "click.amos.inputValidate",
        successSubmit: "successSubmit.amos.inputValidate",
        errorSubmit: "errorSubmit.amos.inputValidate",
        beforeSubmit: "beforeSubmit.amos.inputValidate",
        beforeBlur: "beforeBlur.amos.inputValidate",
        afterBlur: "afterBlur.amos.inputValidate",
        warning: "warning.amos.inputValidate",
        success: "success.amos.inputValidate",
        error: "error.amos.inputValidate"
    },
    s.DEFAULTS = {
        submit: {},
        inputs: []
    },
    s.TYPE = {
        warning: "warning",
        success: "success",
        error: "error"
    },
    s.DATA = {
        tipObject: "tip-object"
    },
    s.CLASS = {
        formSuccess: "has-success",
        formWarning: "has-warning",
        formError: "has-error",
        queryFormGroup: ".form-group",
        queryHelpBlock: ".help-block"
    },
    s.prototype = {
        constructor: s,
        regexp: {
            mobile: {}
        },
        init: function() {
            this.reset();
            for (var e = 0; e < this.inputs.length; e++) {
                var i = this.inputs[e];
                void 0 === i.emptyMessage && (i.emptyMessage = i.message),
                this.parentDom.on(s.EVENTS.blur, i.query, t.proxy(this.blur, this, i))
            }
            this.submit.obj = t(this.submit.query),
            this.submit.obj.on(s.EVENTS.click, t.proxy(this.submitClick, this))
        },
        reset: function() {
            this.parentDom.off(s.EVENTS.parent)
        },
        submitClick: function(e) {
            e.preventDefault();
            var i = this.submit.obj;
            if (void 0 !== i.attr("disabled")) return ! 1;
            var n = t.Event(s.EVENTS.beforeSubmit);
            if (i.trigger(n), !n.isDefaultPrevented()) {
                for (var a = {},
                o = !0,
                r = this,
                l = 0; l < this.inputs.length && (a = this.inputs[l], t.each(this.parentDom.find(a.query),
                function(e, s) {
                    return o = r.validateInput(a, t(s), !1),
                    o ? void 0 : !1
                }), o); l++);
                i.trigger(o ? s.EVENTS.successSubmit: s.EVENTS.errorSubmit)
            }
        },
        blur: function(e, i) {
            var n = t(i.currentTarget),
            a = t.Event(s.EVENTS.beforeBlur);
            if (n.trigger(a), !a.isDefaultPrevented()) {
                var o = this.validateInput(e, n, !0);
                n.trigger(s.EVENTS.afterBlur, o)
            }
        },
        validateInput: function(t, e, i) {
            var n = t.trim !== !1,
            a = e.val();
            n && (a = a.trim(), e.val(a));
            var o = t.required === !1,
            r = t.regexp,
            l = this.validateData(a, r),
            d = !0;
            switch (l) {
            case 0:
                d = !1,
                this.tip(e, t.message);
                break;
            case - 1 : d = o,
                i || (d ? this.tipReset(e) : this.tip(e, t.emptyMessage));
                break;
            case 1:
                d = !0,
                this.tipReset(e)
            }
            return d && void 0 !== t.warningRegexp && (l = this.validateData(a, t.warningRegexp), 1 === l && this.tip(e, t.warningMessage, s.TYPE.warning)),
            d
        },
        tip: function(e, i, n) {
            void 0 === n && (n = s.TYPE.error);
            var a = "";
            switch (n) {
            case s.TYPE.warning:
                a = s.CLASS.formWarning;
                break;
            case s.TYPE.success:
                a = s.CLASS.formSuccess;
                break;
            case s.TYPE.error:
                a = s.CLASS.formError
            }
            var o = e.data(s.DATA.tipObject),
            r = t(o),
            l = 0 !== r.length;
            l ? e.parents(s.CLASS.queryFormGroup).addClass(a) : r = e;
            var d = r.parents(s.CLASS.queryFormGroup),
            h = d.find(s.CLASS.queryHelpBlock);
            h.html(i),
            d.addClass(a)
        },
        tipReset: function(e) {
            var i = e.data(s.DATA.tipObject),
            n = t(i),
            a = 0 !== n.length;
            if (a) {
                var o = e.parents(s.CLASS.queryFormGroup);
                o.removeClass(s.CLASS.formWarning),
                o.removeClass(s.CLASS.formError),
                o.removeClass(s.CLASS.formSuccess)
            } else n = e;
            var r = n.parents(s.CLASS.queryFormGroup);
            r.removeClass(s.CLASS.formWarning),
            r.removeClass(s.CLASS.formError),
            r.removeClass(s.CLASS.formSuccess)
        },
        validateData: function(t, e) {
            return null === e && (e = /^.*$/),
            null === t ? -1 : e.test(t) ? 1 : 0 === t.length ? -1 : 0
        }
    };
    var i = t.fn.inputValidate;
    t.fn.inputValidate = e,
    t.fn.inputValidate.Constructor = s,
    t.fn.inputValidate.noConflict = function() {
        return t.fn.inputValidate = i,
        this
    }
} (jQuery),
+
function(t) {
    "use strict";
    function e(e, i) {
        return this.each(function() {
            var n = t(this),
            a = n.data("amos.inputAction"),
            o = t.extend({},
            s.DEFAULTS, n.data(), "object" == typeof e && e);
            a || n.data("amos.inputAction", a = new s(this, o)),
            "string" == typeof e && a[e](i)
        })
    }
    var s = function(e, s) {
        this.options = s,
        this.parentDom = t(e),
        this.init()
    };
    s.VERSION = "0.0.1",
    s.EVENTS = {
        parent: ".amos.inputAction",
        focus: "focus.amos.inputAction",
        blur: "blur.amos.inputAction",
        touch: "touchstart.amos.inputAction",
        click: "click.amos.inputAction",
        change: "input.amos.inputAction propertychange.amos.inputAction"
    },
    s.DEFAULTS = {
        global: !1
    },
    s.CLASS = {
        hidden: "hidden",
        clear: ".input-action-clear",
        clearTrigger: ".input-trigger-clear",
        password: ".input-action-password",
        passwordTrigger: ".input-trigger-password"
    },
    s.TYPE = {
        clear: 1,
        password: 2
    },
    s.prototype = {
        constructor: s,
        init: function() {
            this.reset(),
            this.options.global && (this.parentDom.on(s.EVENTS.change, s.CLASS.clear, t.proxy(this.change, this)), this.parentDom.on(s.EVENTS.focus, s.CLASS.clear, t.proxy(this.focus, this)), this.parentDom.on(s.EVENTS.blur, s.CLASS.clear, t.proxy(this.blur, this)), this.parentDom.on(s.EVENTS.click, s.CLASS.clearTrigger, t.proxy(this.click, this, s.TYPE.clear)), this.parentDom.on(s.EVENTS.touch, s.CLASS.clearTrigger, t.proxy(this.click, this, s.TYPE.clear)), this.parentDom.on(s.EVENTS.click, s.CLASS.passwordTrigger, t.proxy(this.click, this, s.TYPE.password)))
        },
        reset: function() {
            this.parentDom.off(s.EVENTS.parent)
        },
        click: function(e, i) {
            var n = t(i.currentTarget),
            a = null;
            switch (e) {
            case s.TYPE.clear:
                a = n.siblings(s.CLASS.clear),
                a.val(""),
                n.addClass(s.CLASS.hidden);
                break;
            case s.TYPE.password:
                a = n.siblings(s.CLASS.password);
                var o = a.attr("type");
                "password" === o ? (n.addClass("on"), a.attr("type", "text")) : (n.removeClass("on"), a.attr("type", "password"))
            }
        },
        change: function(e) {
            var i = t(e.currentTarget),
            n = i.siblings(s.CLASS.clearTrigger);
            null != i.val() && i.val().length > 0 ? n.removeClass(s.CLASS.hidden) : n.addClass(s.CLASS.hidden)
        },
        focus: function(e) {
            var i = t(e.currentTarget),
            n = i.siblings(s.CLASS.clearTrigger);
            null != i.val() && i.val().length > 0 ? n.removeClass(s.CLASS.hidden) : n.addClass(s.CLASS.hidden)
        },
        blur: function(e) {
            var i = t(e.currentTarget),
            n = e.relatedTarget;
            n ? i.siblings(s.CLASS.clearTrigger).addClass(s.CLASS.hidden) : window.setTimeout(function() {
                i.siblings(s.CLASS.clearTrigger).addClass(s.CLASS.hidden)
            },
            500)
        }
    };
    var i = t.fn.inputAction;
    t.fn.inputAction = e,
    t.fn.inputAction.Constructor = s,
    t.fn.inputAction.noConflict = function() {
        return t.fn.inputAction = i,
        this
    }
} (jQuery);