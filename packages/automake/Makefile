# Automake Makefile

NM= automake
VRS= 1.16.1
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 53f38e7591fa57c3d2cee682be668e5b

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure		\
		--prefix=/usr	\
		--docdir=/usr/share/doc/automake-1.16.1
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
