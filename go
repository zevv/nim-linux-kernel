make all \
	KDIR=/home/ico/external/linux-stable  \
	M=`pwd` \
	ARCH=um modules "$@"

