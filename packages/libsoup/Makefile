# libsoup Makefile

NM= libsoup
VRS= 2.66.2
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_BLFS)/l/$(FILE)
MD5-$(FILE)= 66c2ae89d6031b01337d78a2c57c75d5

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(sep_dir_build)

compile-stage2:
	meson --prefix=/usr -Dvapi=false -Dgssapi=false ../$(DIR)
	ninja
	ninja install


clean:
	-rm -rf $(DIR)
	-rm -rf $(NM)-build

.PHONY: clean compile-stage2
