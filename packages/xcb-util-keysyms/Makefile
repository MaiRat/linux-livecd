# xcb-util-keysyms Makefile

NM= xcb-util-keysyms
VRS= 0.4.0
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP_BLFS)/Xorg/$(FILE)
MD5-$(FILE)= 1022293083eec9e62d5659261c29e367

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure $(XORG_CONFIG)
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
