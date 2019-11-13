# acl Makefile

NM= acl
VRS= 2.2.53
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 007aabf1dbb550bcddde52a244cd1070

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure			\
		--prefix=/usr		\
		--bindir=/bin		\
		--disable-static	\
		--libexecdir=/usr/lib	\
		--docdir=/usr/share/doc/acl-$(VRS)
	make -j$(JOBS)
	make install
	mv -v /usr/lib/libacl.so.* /lib
	ln -sfv ../../lib/$$(readlink /usr/lib/libacl.so) /usr/lib/libacl.so

clean:
	-rm -rf $(DIR) 

.PHONY: clean compile-stage2
