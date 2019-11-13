# LibXML2 Makefile

NM= libxml2
VRS= 2.9.9
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_BLFS)/l/$(FILE)
MD5-$(FILE)= c04a5a0a042eaa157e8e8c9eabe76bd6

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure			\
		--prefix=/usr		\
		--with-history		\
		--disable-static	\
		--with-python=/usr/bin/python3
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
