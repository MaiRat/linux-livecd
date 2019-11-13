# libffi Makefile

NM= libffi
VRS= 3.2.1
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 83b89587607e3eb65c70d361f13bab43

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed 	-e '/^includesdir/ s/$$(libdir).*$$/$$(includedir)/' \
		-i include/Makefile.in
	sed 	-e '/^includedir/ s/=.*$$/=@includedir@/' \
		-e 's/^Cflags: -I$${includedir}/Cflags:/' \
		-i libffi.pc.in
	./configure			\
		--prefix=/usr		\
		--disable-static	\
		--with-gcc-arch=native
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
