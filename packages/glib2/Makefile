# Glib Makefile

NM= glib
VRS= 2.60.6
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_BLFS)/g/$(FILE)
MD5-$(FILE)= cd6865d8ce40db5e4c12b7d180953de6

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(sep_dir_build)

compile-stage2:
	meson 	--prefix=/usr		\
		-Dman=false		\
		-Dselinux=disabled	\
		../$(DIR)
	ninja
	ninja install

clean:
	-rm -rf $(DIR)
	-rm -rf $(NM)-build

.PHONY: clean compile-stage2
