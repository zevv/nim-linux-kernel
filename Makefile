
obj-m += hello.o

NIM_SRC1 = $(wildcard $(M)/nimcache/*.c)
NIM_SRC2 = $(subst $(src),,$(NIM_SRC1))
NIM_OBJS = $(subst .c,.o,$(NIM_SRC2))

hello-y += src/stubs/stubs.o $(NIM_OBJS)

ccflags-y = -I$(src) -I$(src)/src/stubs -I/home/ico/external/Nim/lib/

default: $(M)/nimcache/@mhello.nim.c
	$(MAKE) -C $(KDIR) SUBDIRS=$(shell pwd) modules

clean:
	rm -rf nimcache *.ko* *.mod* *.o modules.order *.symvers *.a

$(M)/nimcache/@mhello.nim.c: $(M)/src/hello.nim
	nim c \
		-c \
		--gc:arc \
		--nimcache:$(M)/nimcache \
		--noMain:On \
		--os:ansic \
		-d:useMalloc \
		-d:danger \
		-d:noSignalHandler \
		$(M)/src/hello.nim


