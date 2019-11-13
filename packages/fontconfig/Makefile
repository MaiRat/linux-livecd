# Fontconfig Makefile

NM= fontconfig
VRS= 2.13.1
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP_BLFS)/f/$(FILE)
MD5-$(FILE)= 36cdea1058ef13cbbfdabe6cb019dc1c

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	rm -f src/fcobjshash.h
	./configure --prefix=/usr --sysconfdir=/etc \
	 --localstatedir=/var \
	 --disable-docs  \
	 --docdir=/usr/share/doc/$(DIR)
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
