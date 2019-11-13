# Zlib Makefile

NM= zlib
VRS= 1.2.11
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 85adef240c5f370b308da8c938951a68

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	./configure --prefix=$(TT)
	make -j$(JOBS)
	make install

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr
	make -j$(JOBS)
	make install
	mv -v /usr/lib/libz.so.* /lib
	ln -sfv ../../lib/$$(readlink /usr/lib/libz.so) /usr/lib/libz.so


clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage1 compile-stage2
