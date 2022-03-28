package example

import data.colorized.colorize
import data.colorized.reset
import data.colorized.rainbow

main {
    print(colorize("testing", "red"))
    print(colorize("testing", ["yellow", "blue"]))
    print(colorize("testing", {"fg": "green", "bg": "red", "reset": false}), "this is also colorized", reset(""))

    advanced := concat("", [
        colorize("", {"bg": "green", "reset": false}),
        rainbow("Rainbow on green background"),
        reset(""),
    ])

    print(advanced)
}
