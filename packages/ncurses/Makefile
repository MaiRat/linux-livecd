# Ncurses Makefile

NM= ncurses
VRS= 6.1
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 98c889aaf8d23910d2b92d65be2e737a

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	sed -i s/mawk// configure
	./configure 			\
		--prefix=$(TT)		\
		--with-shared		\
		--without-debug		\
		--without-ada		\
		--enable-widec		\
		--enable-overwrite
	make -j$(JOBS)
	make install
	ln -s libncursesw.so /tools/lib/libncurses.so

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i '/LIBTOOL_INSTALL/d' c++/Makefile.in
	./configure			\
		--prefix=/usr		\
		--mandir=/usr/share/man	\
		--with-shared		\
		--without-debug		\
		--without-normal	\
		--enable-pc-files	\
		--enable-widec
	make -j$(JOBS)
	make install
	mv /usr/lib/libncursesw.so.6* /lib
	ln -sfv ../../lib/$$(readlink /usr/lib/libncursesw.so) /usr/lib/libncursesw.so
	for lib in ncurses form panel menu ; do \
	  rm -vf /usr/lib/lib$${lib}.so ; \
	  echo "INPUT(-l$${lib}w)" >/usr/lib/lib$${lib}.so ; \
	  ln -sfv $${lib}w.pc /usr/lib/pkgconfig/$${lib}.pc ; \
	done
	rm -vf /usr/lib/libcursesw.so
	echo "INPUT(-lncursesw)" >/usr/lib/libcursesw.so
	ln -svf libncurses.so /usr/lib/libcurses.so

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean compile-stage2
