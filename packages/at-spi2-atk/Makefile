# at-spi2-atk Makefile

NM= at-spi2-atk
VRS= 2.32.0
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_BLFS)/a/$(FILE)
MD5-$(FILE)= 6a4b27bace3b9352721ed462b95f6291

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(sep_dir_build)

compile-stage2:
	meson --prefix=/usr ../$(DIR)
	ninja
	ninja install

clean:
	-rm -rf $(DIR)
	-rm -rf $(NM)-build

.PHONY: clean compile-stage2
