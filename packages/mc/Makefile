# MC Makefile

NM= mc
VRS= 4.8.23
DIR= $(NM)-$(VRS)

FILE= $(NM)-$(VRS).tar.xz
URL-$(FILE)= $(HTTP_BLFS)/m/$(FILE)
MD5-$(FILE)= 466c3135f727f8ac2102d060a080ace3

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure			\
		--prefix=/usr		\
		--enable-charset	\
		--sysconfdir=/etc
	make -j$(JOBS) 
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
