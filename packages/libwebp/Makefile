# libwebp Makefile

NM= libwebp
VRS= 1.0.3
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_BLFS)/l/$(FILE)
MD5-$(FILE)= 906ad85daaaa2eac97c8aa2dec9e8b77

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure	--prefix=/usr           \
			--enable-libwebpmux     \
			--enable-libwebpdemux   \
			--enable-libwebpdecoder \
			--enable-libwebpextras  \
			--enable-swap-16bit-csp \
			--disable-static
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
