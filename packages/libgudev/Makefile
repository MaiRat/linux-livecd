# libgudev Makefile

NM= libgudev
VRS= 233
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_BLFS)/l/$(FILE)
MD5-$(FILE)= d59a317a40aaa02a2226056c0bb4d3e1

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --disable-umockdev
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
