# man-db Makefile

NM= man-db
VRS= 2.8.6.1
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 22e82fe1127f4ca95de7100168a927d1

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure					\
		--prefix=/usr				\
		--docdir=/usr/share/doc/$(DIR)		\
		--sysconfdir=/etc			\
		--disable-setuid			\
		--enable-cache-owner=bin		\
		--with-browser=/usr/bin/lynx		\
		--with-vgrind=/usr/bin/vgrind		\
		--with-grap=/usr/bin/grap		\
		--with-systemdtmpfilesdir=		\
		--with-systemdsystemunitdir=
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
