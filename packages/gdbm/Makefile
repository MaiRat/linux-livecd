# gdbm Makefile

NM= gdbm
VRS= 1.18.1
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 988dc82182121c7570e0cb8b4fcd5415

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure			\
		--prefix=/usr		\
		--enable-libgdbm-compat	\
		--disable-static
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage1 compile-stage2
