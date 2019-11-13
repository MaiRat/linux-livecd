# fribidi Makefile

NM= fribidi
VRS= 1.0.5
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP_BLFS)/f/$(FILE)
MD5-$(FILE)= 0f97f65038545340316ec0f4bd53df0b

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
