# Iana-etc Makefile

NM= iana-etc
VRS= 2.30
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 3ba3afb1d1b261383d247f46cb135ee8

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
