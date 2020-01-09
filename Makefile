
obj-m += hello.o

hello-objs += src/stubs/stubs.o
hello-objs += nimcache/@mhello.nim.o
hello-objs += nimcache/stdlib_allocators.nim.o
hello-objs += nimcache/stdlib_io.nim.o
hello-objs += nimcache/stdlib_system.nim.o

NIM_C += $(src)/nimcache/@mhello.nim.c
NIM_C += $(src)/nimcache/stdlib_allocators.nim.c
NIM_C += $(src)/nimcache/stdlib_io.nim.c
NIM_C += $(src)/nimcache/stdlib_system.nim.c

ccflags-y := -I$(src) -I$(src)/src/stubs -I/home/ico/external/Nim/lib/

default:
	$(MAKE) -C $(KDIR) SUBDIRS=$(shell pwd) modules

clean:
	rm -rf nimcache *.ko* *.mod* *.o modules.order *.symvers *.a

$(NIM_C): $(obj)/nimcache/@mhello.nim.c

$(src)/nimcache/@mhello.nim.c: $(src)/src/hello.nim
	nim c \
		-c \
		--gc:arc \
		--nimcache:$(src)/nimcache \
		--noMain:On \
		--os:ansic \
		-d:useMalloc \
		-d:danger \
		-d:noSignalHandler \
		$(src)/src/hello.nim


