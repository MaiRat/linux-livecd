# libXdmcp Makefile

NM= libXdmcp
VRS= 1.1.3
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP_BLFS)/Xorg/$(FILE)
MD5-$(FILE)= 115c5c12ecce0e749cd91d999a5fd160

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
