# at-spi2-core Makefile

NM= at-spi2-core
VRS= 2.32.1
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_BLFS)/a/$(FILE)
MD5-$(FILE)= 998fd9d858f8fa22c4c8c15567bf6254

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(sep_dir_build)

compile-stage2:
	meson --prefix=/usr      \
		--sysconfdir=/etc \
		-Dsystemd_user_dir=no ../$(DIR)
	ninja
	ninja install

clean:
	-rm -rf $(DIR)
	-rm -rf $(NM)-build

.PHONY: clean compile-stage2
