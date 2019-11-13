# Kbd Makefile

NM= kbd
VRS= 2.2.0
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= d1d7ae0b5fb875dc082731e09cd0c8bc

PATCH= $(DIR)-backspace-1.patch
URL-$(PATCH)= $(HTTP_LFS)/$(PATCH)
MD5-$(PATCH)= f75cca16a38da6caa7d52151f7136895

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) $(PATCH)
	$(std_build)

compile-stage2:
	patch -Np1 -i ../$(PATCH)
	sed -i 's/\(RESIZECONS_PROGS=\)yes/\lno/g' configure
	sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in
	PKG_CONFIG_PATH=/tools/lib/pkgconfig	\
	./configure 				\
		--prefix=/usr			\
		--disable-vlock
	make -j$(JOBS)
	make install
	mkdir -v /usr/share/doc/$(DIR)
	cp -R -v docs/doc/* /usr/share/doc/$(DIR)

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
