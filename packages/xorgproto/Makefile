# xorgproto Makefile

NM= xorgproto
VRS= 2019.1
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP_BLFS)/Xorg/$(FILE)
MD5-$(FILE)= 802ccb9e977ba3cf94ba798ddb2898a4

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(sep_dir_build)

compile-stage2:
	meson --prefix=$(XORG_PREFIX) ../$(DIR)
	ninja
	ninja install

clean:
	-rm -rf $(DIR)
	-rm -rf $(NM)-build

.PHONY: clean compile-stage2
