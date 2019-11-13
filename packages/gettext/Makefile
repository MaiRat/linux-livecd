# Gettext Makefile

NM= gettext
VRS= 0.20.1
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 9ed9e26ab613b668e0026222a9c23639

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	./configure	\
		--disable-shared
	make -j$(JOBS)
	cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} $(TT)/bin

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure			\
		--prefix=/usr		\
		--disable-static	\
		--docdir=/usr/share/doc/gettext-$(VRS)
	make -j$(JOBS)
	make install
	chmod -v 0755 /usr/lib/preloadable_libintl.so

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean compile-stage2
