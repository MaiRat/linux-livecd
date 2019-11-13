# vte Makefile

NM= vte
VRS= 0.56.3
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_BLFS)/v/$(FILE)
MD5-$(FILE)= adf341807861a5dad9f98e5c701c0769

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure	--prefix=/usr		\
			--sysconfdir=/etc	\
			--disable-static	\
			--without-gnutls	\
			--enable-vala=no	\
			--enable-introspection=no
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
