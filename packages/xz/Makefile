# xz Utils Makefile

NM= xz
VRS= 5.2.4
DIR= $(NM)-$(VRS)

FILE= $(NM)-$(VRS).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 003e4d0b1b1899fc6e3000b24feddf7c

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	./configure	\
		--prefix=$(TT)
	make -j$(JOBS)
	make install

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure		\
		--prefix=/usr	\
		--disable-static
	make -j$(JOBS)
	make install
	mv -v /usr/bin/{lzma,unlzma,lzcat,xz,unxz,xzcat} /bin
	mv -v /usr/lib/liblzma.so.* /lib
	ln -svf ../../lib/$$(readlink /usr/lib/liblzma.so) /usr/lib/liblzma.so

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage1 compile-stage2
