# mpc Makefile

NM= mpc
VRS= 1.1.0
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 4125404e41e482ec68282a2e687f6c73

# Targets

include $(MY_ROOT)/scripts/functions

stage2: $(FILE)
	$(std_build)

compile-stage2:
	./configure			\
		--prefix=/usr		\
		--disable-static	\
		--docdir=/usr/share/doc/mpc-$(VRS)
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
