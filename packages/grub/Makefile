# Grub Makefile

NM= grub
VRS= 2.04
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 5aaca6713b47ca2456d8324a58755ac7

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure			\
		--prefix=/usr		\
	    	--sysconfdir=/etc	\
		--disable-werror	\
		--disable-efiemu	\
		--sbindir=/sbin
	make -j$(JOBS)
	make install
	mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
