# elfutils Makefile

NM= elfutils
VRS= 0.177
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 0b583722f911e1632544718d502aab87

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure	\
		--prefix=/usr
	make -j$(JOBS)
	make -C libelf install
	install -vm644 config/libelf.pc /usr/lib/pkgconfig

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
