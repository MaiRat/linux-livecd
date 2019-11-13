# xcb-proto Makefile

NM= xcb-proto
VRS= 1.13
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP_BLFS)/Xorg/$(FILE)
MD5-$(FILE)= abe9aa4886138150bbc04ae4f29b90e3

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
