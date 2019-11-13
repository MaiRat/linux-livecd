# Python3 Makefile

NM= Python
VRS= 3.7.4
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= d33e4aae66097051c2eca45ee3604803

# Targets

include $(MY_ROOT)/scripts/functions

stage1: Makefile $(FILE)
	$(std_build)

compile-stage1:
	sed -i '/def add_multiarch_paths/a \        return' setup.py
	./configure		\
		--prefix=$(TT)	\
		--without-ensurepip
	make -j$(JOBS)
	make install

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure			\
		--prefix=/usr		\
		--enable-shared 	\
		--with-system-expat	\
		--with-system-ffi	\
		--with-ensurepip=yes
	make -j$(JOBS)
	make install
	chmod -v 755 /usr/lib/libpython3.7m.so
	chmod -v 755 /usr/lib/libpython3.so
	ln -sfv pip3.7 /usr/bin/pip3

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage1 compile-stage2
