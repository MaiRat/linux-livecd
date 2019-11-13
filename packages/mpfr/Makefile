# mpfr Makefile

NM= mpfr
VRS= 4.0.2
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 320fbc4463d4c8cb1e566929d8adc4f8

# Targets

include $(MY_ROOT)/scripts/functions

stage2: $(FILE)
	$(std_build)

compile-stage2:
	./configure			\
		--prefix=/usr		\
		--enable-thread-safe	\
		--disable-static	\
		--docdir=/usr/share/doc/mpfr-$(VRS)
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
