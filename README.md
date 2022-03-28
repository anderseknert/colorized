# rego-colorized

Colorized output for the Rego
[print](https://blog.openpolicyagent.org/introducing-the-opa-print-function-809da6a13aee)
function!

## Colors

Support "all" the [ANSI color codes](https://talyian.github.io/ansicolors/) by their name:

- black
- red
- green
- yellow
- blue
- magenta
- cyan
- white

## Functions

### `colorize(str, settings)`

Accepts as the first argument the string to colorize, and as the second argument either string, an array, or an object.

---

`string` - colorize the provided string using the value of argument as the foreground color.

#### Example

```rego
print(colorize("foo bar baz", "red"))
```

![fg_red](assets/fg_red.png)

---

`array` - colorize the provided string using the first value of the array as foreground color,
          and the second value as the background color.

#### Example

```rego
print(colorize("foo bar baz", ["yellow", "blue"]))
```

![fg_y_bg_b](assets/fg_y_bg_b.png)

---

`object` - colorize the provided string using the `"fg"` attribute of the object as foreground color,
           and the `"bg"` attribute as the background color. The optional `"reset"` boolean attribute
           may also be used to disable resetting the colors back to the defaults. This is useful when
           e.g. printing multiple lines of output without having to repeat the calls to colorize.
           NOTE: If disabled, ensure that the `reset(str)` function is called manually, or else _any_
           subsequent output will remain colorized, including the result of evaluation.

#### Example

```rego
print(colorize("foo bar baz", {"fg": "cyan", "bg": "red", "reset": false}]))
print("this too!")
print(reset(""))
```

![advanced](assets/advanced.png)

### `rainbow(str)`

Return the provided string with a different foreground color used for each letter of the string.

#### Example

```rego
print(rainbow("Double rainbows!!"))
```

![rainbow](assets/rainbow.png)

### `reset(str)`

Resets the colors to the default. Only necessary when reset was disabled in the first place, using the
object variant of `colorize`. You'll most likely won't need this.
