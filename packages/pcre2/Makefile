# PCRE2 Makefile

NM= pcre2
VRS= 10.33
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP_BLFS)/p/$(FILE)
MD5-$(FILE)= 80b355f2dce909a2e2424f5c79eddb44

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure 	--prefix=/usr                       \
			--docdir=/usr/share/doc/pcre2-10.33 \
			--enable-unicode                    \
			--enable-jit                        \
			--enable-pcre2-16                   \
			--enable-pcre2-32                   \
			--enable-pcre2grep-libz             \
			--enable-pcre2grep-libbz2           \
			--enable-pcre2test-libreadline      \
			--disable-static
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
