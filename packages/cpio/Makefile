# cpio Makefile

NM= cpio
VRS= 2.12
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP_BLFS)/c/$(FILE)
MD5-$(FILE)= 93eea9f07c0058c097891c73e4955456

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure		\
		--prefix=/usr	\
		--bindir=/bin	\
		--enable-mt	\
		--with-rmt=/usr/libexec/rmt
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
