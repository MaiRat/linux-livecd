# harfbuzz Makefile

NM= harfbuzz
VRS= 2.6.0
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_BLFS)/h/$(FILE)
MD5-$(FILE)= 3e2653d2195d6c18e5cded055c873601

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --with-gobject --with-graphite2
	make -j$(JOBS)
	make install

stage3: Makefile $(FILE)
	$(std_build)

compile-stage3:
	./configure --prefix=/usr --with-gobject --with-graphite2
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2 compile-stage3
