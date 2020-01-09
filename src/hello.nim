
import linuxapi


var a = newSeq[int](10)

proc nim_init(): cint {.cdecl, exportc.} = 
  a.add 42
  echo "Hello ", $a
  echo "Hophop\n"


proc nim_exit() {.cdecl, exportc.} = 
  echo "Bye"


{.emit:"""
#include <linux/module.h>
module_init(nim_init)
module_exit(nim_exit)
MODULE_AUTHOR("Zevv");
MODULE_DESCRIPTION("Linux kernel module in Nim");
MODULE_LICENSE("MIT");
"""}

