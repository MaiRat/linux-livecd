# PCRE Makefile

NM= pcre
VRS= 8.43
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP_BLFS)/p/$(FILE)
MD5-$(FILE)= 636222e79e392c3d95dcc545f24f98c4

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure				\
		--prefix=/usr			\
		--docdir=/usr/share/doc/$(DIR)	\
	 	--enable-unicode-properties	\
	 	--enable-pcregrep-libz		\
	 	--enable-pcregrep-libbz2	\
		--enable-pcre16			\
		--enable-pcre32			\
		--enable-pcretest-libreadline	\
		--disable-static
	make -j$(JOBS)
	make install
	mv -v /usr/lib/libpcre.so.* /lib/
	ln -v -sf ../../lib/$$(readlink /usr/lib/libpcre.so) /usr/lib/libpcre.so

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
