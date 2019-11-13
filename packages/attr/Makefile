# attr Makefile

NM= attr
VRS= 2.4.48
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= bc1e5cb5c96d99b24886f1f527d3bb3d

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure			\
		--prefix=/usr		\
		--bindir=/bin		\
		--disable-static	\
		--sysconfdir=/etc	\
		--docdir=/usr/share/doc/attr-$(VRS)
	make -j$(JOBS)
	make install
	mv -v /usr/lib/libattr.so.* /lib
	ln -sfv ../../lib/$$(readlink /usr/lib/libattr.so) /usr/lib/libattr.so

clean:
	-rm -rf $(DIR) 

.PHONY: clean compile-stage2
