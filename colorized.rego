# METADATA
# description: Package to colorize strings provided to the print function
# authors:
# - Anders Eknert <anders@eknert.com>
package colorized

_fg := {
    "black":    "\u001b[30m",
    "red":      "\u001b[31m",
    "green":    "\u001b[32m",
    "yellow":   "\u001b[33m",
    "blue":     "\u001b[34m",
    "magenta":  "\u001b[35m",
    "cyan":     "\u001b[36m",
    "white":    "\u001b[37m",
}

_bg := {
    "black":    "\u001b[40m",
    "red":      "\u001b[41m",
    "green":    "\u001b[42m",
    "yellow":   "\u001b[43m",
    "blue":     "\u001b[44m",
    "magenta":  "\u001b[45m",
    "cyan":     "\u001b[46m",
    "white":    "\u001b[47m",
}

reset(s)    = concat("", [s, "\u001b[0m"])

rainbow(s)  = concat("", [f | k := [c | _ = _fg[c]]
                              l := count(k)
                              c := split(s, "")[i]
                              n := _fg[k[i % l]]
                              f := concat("", [n, c])])

colorize(str, settings) = reset(concat("", [_fg[settings], str])) {
    is_string(settings)
}

colorize(str, settings) = reset(concat("", [_bg[settings[1]], _fg[settings[0]], str])) {
    is_array(settings)
}

colorize(str, settings) = s {
    is_object(settings)
    config := object.union({"reset": true, "fg": "white", "bg": "black"}, settings)
    ret := concat("", [_bg[config.bg], _fg[config.fg], str])
    s := {true: reset(ret), false: ret}[config.reset]
}
