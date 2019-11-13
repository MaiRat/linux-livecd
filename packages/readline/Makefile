# Readline Makefile

NM= readline
VRS= 8.0
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 7e6c1f16aee3244a69aba6e438295ca3

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i '/MV.*old/d' Makefile.in
	sed -i '/{OLDSUFF}/c:' support/shlib-install
	./configure			\
		--prefix=/usr		\
		--disable-static	\
		--docdir=/usr/share/doc/readline-$(VRS)
	make SHLIB_LIBS="-L$(TT)/lib -lncursesw" -j$(JOBS)
	make SHLIB_LIBS="-L$(TT)/lib -lncursesw" install
	mv -v /usr/lib/lib{readline,history}.so.* /lib
	chmod -v u+w /lib/lib{readline,history}.so.*
	ln -sfv ../../lib/$$(readlink /usr/lib/libreadline.so) /usr/lib/libreadline.so
	ln -sfv ../../lib/$$(readlink /usr/lib/libhistory.so) /usr/lib/libhistory.so

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
