# Bison Makefile

NM= bison
VRS= 3.4.1
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 201286a573b12da109df96282fe4ff4a

# Targets

include $(MY_ROOT)/scripts/functions

stage1: Makefile $(FILE)
	$(std_build)

compile-stage1:
	./configure \
		--prefix=$(TT)
	make -j1
	make install

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i '6855 s/mv/cp/' Makefile.in
	./configure		\
		--prefix=/usr	\
		--docdir=/usr/share/doc/bison-3.4.1
	make -j1
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage1 compile-stage2
