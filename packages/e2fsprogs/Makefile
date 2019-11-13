# E2fsprogs Makefile

NM= e2fsprogs
VRS= 1.45.3
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 447a225c05f0a81121f6ddffbf55b06c

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	mkdir -v build
	cd build ; ../configure		\
		--prefix=/usr		\
		--bindir=/bin		\
		--with-root-prefix=""	\
		--enable-elf-shlibs	\
		--disable-libblkid	\
		--disable-libuuid	\
		--disable-uuidd		\
		--disable-fsck
	cd build ; make -j$(JOBS)
	cd build ; make install
	cd build ; make install-libs
	chmod -v u+w /usr/lib/{libcom_err,libe2p,libext2fs,libss}.a

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
