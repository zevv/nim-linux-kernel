
proc printk*(str: cstring) {.header: "linux/module.h", varargs, importc: "printk"}

