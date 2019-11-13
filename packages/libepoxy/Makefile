# libpng Makefile

NM= libepoxy
VRS= 1.5.3
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_BLFS)/l/$(FILE)
MD5-$(FILE)= e2845de8d2782b2d31c01ae8d7cd4cbb

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(sep_dir_build)

compile-stage2:
	meson --prefix=/usr -Degl=no ../$(DIR)
	ninja
	ninja install

clean:
	-rm -rf $(DIR)
	-rm -rf $(NM)-build

.PHONY: clean compile-stage2
