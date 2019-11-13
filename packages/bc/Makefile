# bc Makefile

NM= bc
VRS= 2.1.3
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 2a882dc39c0fb8e36c12f590d54cc039

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	PREFIX=/usr CC=gcc CFLAGS="-std=c99" ./configure.sh -G -O3
	make
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
