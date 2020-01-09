
Proof of concept minimal configuration for running Nim in linux kernel space.


I test this with user mode linux for convenience, but also works on any other target.

== Build

make KDIR=<PATH_TO_YOUR_KERNEL> M=`pwd`

