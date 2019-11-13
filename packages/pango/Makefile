# Pango Makefile

NM= pango
VRS= 1.42.4
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_BLFS)/p/$(FILE)
MD5-$(FILE)= deb171a31a3ad76342d5195a1b5bbc7c

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(sep_dir_build)

compile-stage2:
	meson --prefix=/usr --sysconfdir=/etc -Dgir=false ../$(DIR)
	ninja
	ninja install

clean:
	-rm -rf $(DIR)
	-rm -rf $(NM)-build

.PHONY: clean compile-stage2
