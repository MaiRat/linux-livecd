# Subversion Makefile

NM= subversion
VRS= 1.12.2
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP_BLFS)/s/$(FILE)
MD5-$(FILE)= 1ff249f848f834ded88536543e031975

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) $(FILE2)
	$(std_build)

compile-stage2:
	sed -i 's/classic/nofastunpack/' build.conf
	./configure				\
		--prefix=/usr			\
		--disable-static		\
		--with-apache-libexecdir	\
		--with-lz4=internal		\
		--with-utf8proc=internal
	make -j$(JOBS)
	make install
	install -v -m755 -d /usr/share/doc/subversion-$(VRS)
	cp      -v -R doc/* /usr/share/doc/subversion-$(VRS)


clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
