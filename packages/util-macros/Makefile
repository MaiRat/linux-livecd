# util-macros Makefile

NM= util-macros
VRS= 1.19.2
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP_BLFS)/Xorg/$(FILE)
MD5-$(FILE)= 58edef899364f78fbde9479ded20211e

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure $(XORG_CONFIG)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
