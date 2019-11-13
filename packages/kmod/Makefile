# Module-Init-Tools Makefile

NM= kmod
VRS= 26
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 1129c243199bdd7db01b55a61aa19601

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure			\
		--prefix=/usr		\
		--bindir=/bin		\
		--with-rootlibdir=/lib	\
		--sysconfdir=/etc	\
		--with-xz		\
		--with-zlib
	make -j$(JOBS)
	make install
	for target in depmod insmod lsmod modinfo modprobe rmmod; do ln -sfv ../bin/kmod /sbin/$$target ; done
	ln -sfv kmod /bin/lsmod
clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
