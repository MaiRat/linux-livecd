# cairo Makefile

NM= cairo
VRS= 1.16.0
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_BLFS)/c/$(FILE)
MD5-$(FILE)= f19e0353828269c22bd72e271243a552

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr --enable-tee --disable-static
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
