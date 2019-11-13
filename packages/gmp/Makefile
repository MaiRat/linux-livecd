# gmp Makefile

NM= gmp
VRS= 6.1.2
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= f58fa8001d60c4c77595fbbb62b63c1d

# Targets

include $(MY_ROOT)/scripts/functions


stage2: $(FILE)
	$(std_build)

compile-stage2:
	ABI=32 ./configure		\
		--prefix=/usr		\
		--enable-cxx		\
		--disable-static	\
		--docdir=/usr/share/doc/gmp-$(VRS)
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
