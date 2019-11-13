# GPM Makefile

NM= gpm
VRS= 1.20.7
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP_BLFS)/g/$(FILE)
MD5-$(FILE)= bf84143905a6a903dbd4d4b911a2a2b8

PATCH= $(DIR)-glibc_2.26-1.patch
URL-$(PATCH)= $(HTTP_BLFS)/g/$(PATCH)
MD5-$(PATCH)= da53bf78a0ebaa5020e332aa6d6861159170ed86

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) $(PATCH)
	$(std_build)

compile-stage2:
	sed -i -e 's:<gpm.h>:"headers/gpm.h":' src/prog/{display-buttons,display-coords,get-versions}.c
	patch -Np1 -i ../$(PATCH)
	./autogen.sh
	./configure		\
		--prefix=/usr	\
		--sysconfdir=/etc
	make -j$(JOBS)
	make install
	ln -sfv libgpm.so.2.1.0 /usr/lib/libgpm.so
	install -v -m644 conf/gpm-root.conf /etc

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
