# apr Makefile

NM= apr
VRS= 1.7.0
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP_BLFS)/a/$(FILE)
MD5-$(FILE)= 7a14a83d664e87599ea25ff4432e48a7

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure			\
		--prefix=/usr		\
		--disable-static	\
		--with-installbuilddir=/usr/share/apr-1/build	
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
