# gnutls Makefile

NM= gnutls
VRS= 3.6.9
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_BLFS)/g/$(FILE)
MD5-$(FILE)= a36cb11809d31268b6ddd17cb38b92bb

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure	--prefix=/usr \
			--docdir=/usr/share/doc/gnutls-3.6.9 \
			--disable-guile \
			--with-included-libtasn1 \
			--without-p11-kit
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
