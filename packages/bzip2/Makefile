# Bzip2 Makefile

NM= bzip2
VRS= 1.0.8
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 67e051268d0c475ea773822f7500d0e5

PATCH= $(DIR)-install_docs-1.patch
URL-$(PATCH)= $(HTTP_LFS)/$(PATCH)
MD5-$(PATCH)= 6a5ac7e89b791aae556de0f745916f7f

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	make -j$(JOBS)
	make PREFIX=$(TT) install

stage2: Makefile $(FILE) $(PATCH)
	$(std_build)

compile-stage2:
	patch -Np1 -i ../$(PATCH)
	sed -i 's@\(ln -s -f \)$$(PREFIX)/bin/@\1@' Makefile
	sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile
	make -f Makefile-libbz2_so 
	make clean
	make -j$(JOBS)
	make PREFIX=/usr install
	cp -v bzip2-shared /bin/bzip2
	cp -av libbz2.so* /lib
	ln -svf ../../lib/libbz2.so.1.0 /usr/lib/libbz2.so
	rm -v /usr/bin/{bunzip2,bzcat,bzip2}
	ln -svf bzip2 /bin/bunzip2
	ln -svf bzip2 /bin/bzcat

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean compile-stage2
