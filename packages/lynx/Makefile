# Lynx Makefile

NM= lynx
VRS= 2.8.9rel.1
DIR= $(NM)$(VRS)

FILE= $(NM)$(VRS).tar.bz2
URL-$(FILE)= $(HTTP_BLFS)/l/$(FILE)
MD5-$(FILE)= 44316f1b8a857b59099927edc26bef79

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure					\
		--prefix=/usr				\
		--sysconfdir=/etc/lynx			\
		--datadir=/usr/share/doc/$(NM)-$(VRS)	\
		--with-zlib				\
		--with-bzlib				\
		--with-screen=ncursesw			\
		--enable-locale-charset			\
		--with-ssl
	make -j$(JOBS)
	make install-full
	chgrp -v -R root /usr/share/doc/$(NM)-$(VRS)/lynx_doc

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
