# libcap Makefile

NM= libcap
VRS= 2.27
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 2e8f9fab32eb5ccb37969fe317fd17aa

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i '/install.*STALIBNAME/d' libcap/Makefile
	make -j$(JOBS)
	make RAISE_SETFCAP=no lib=lib prefix=/usr install
	chmod -v 755 /usr/lib/libcap.so.*
	mv -v /usr/lib/libcap.so.* /lib
	ln -sfv ../../lib/$$(readlink /usr/lib/libcap.so) /usr/lib/libcap.so


clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
