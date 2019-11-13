# libtirpc Makefile

NM= libtirpc
VRS= 1.1.4
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP_BLFS)/l/$(FILE)
MD5-$(FILE)= f5d2a623e9dfbd818d2f3f3a4a878e3a

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure 	--prefix=/usr \
			--sysconfdir=/etc \
			--disable-static \
			--disable-gssapi
	make -j$(JOBS)
	make install
	mv -v /usr/lib/libtirpc.so.* /lib
	ln -sfv ../../lib/libtirpc.so.3.0.0 /usr/lib/libtirpc.so

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
