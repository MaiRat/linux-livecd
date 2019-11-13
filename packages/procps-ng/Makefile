# procps-ng Makefile

NM= procps-ng
VRS= 3.3.15
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 2b0717a7cb474b3d6dfdeedfbad2eccc

# Targets

include $(MY_ROOT)/scripts/functions

stage2: $(FILE)
	$(std_build)

compile-stage2:
	./configure				\
		--prefix=/usr			\
		--exec-prefix=			\
		--docdir=/usr/share/doc/$(DIR)	\
		--libdir=/usr/lib		\
		--disable-static		\
		--disable-kill
	make -j$(JOBS)
	make install
	mv -v /usr/lib/libprocps.so.* /lib
	ln -sfv ../../lib/$$(readlink /usr/lib/libprocps.so) /usr/lib/libprocps.so

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
