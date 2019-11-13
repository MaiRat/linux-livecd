# libxslt Makefile

NM= libxslt
VRS= 1.1.33
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_BLFS)/l/$(FILE)
MD5-$(FILE)= b3bd254a03e46d58f8ad1e4559cd2c2f

PATCH= $(DIR)-security_fix-1.patch
URL-$(PATCH)= $(HTTP_BLFS_PATCHES)/$(PATCH)
MD5-$(PATCH)= b0decc961810f02ad5a279691319f9e7

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) $(PATCH)
	$(std_build)

compile-stage2:
	patch -Np1 -i ../$(PATCH)
	./configure	\
		--prefix=/usr
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
