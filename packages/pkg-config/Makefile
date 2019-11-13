# Pkgconfig Makefile

NM= pkg-config
VRS= 0.29.2
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= f6e931e319531b736fadc017f470e68a

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure			\
		--prefix=/usr		\
		--disable-host-tool	\
		--with-internal-glib	\
		--docdir=/usr/share/doc/pkg-config-$(VRS)
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean chroot compile-stage2
