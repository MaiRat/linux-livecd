# Psmisc Makefile

NM= psmisc
VRS= 23.2
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 0524258861f00be1a02d27d39d8e5e62

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr
	make -j$(JOBS)
	make install
	mv -v /usr/bin/fuser /bin
	mv -v /usr/bin/killall /bin

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
