# hicolor-icon-theme Makefile

NM= hicolor-icon-theme
VRS= 0.17
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_BLFS)/h/$(FILE)
MD5-$(FILE)= 84eec8d6f810240a069c731f1870b474

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
