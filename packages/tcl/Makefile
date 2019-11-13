# Tcl Makefile

NM= tcl
VRS= 8.6.9
DIR= $(NM)$(VRS)

FILE= $(NM)$(VRS)-src.tar.gz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= aa0a121d95a0e7b73a036f26028538d4

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	cd unix ; ./configure \
		--prefix=$(TT)
	cd unix ; make -j$(JOBS)
	cd unix ; make install
	chmod -v u+w $(TT)/lib/libtcl8.6.so
	cd unix ; make install-private-headers
	ln -s tclsh8.6 $(TT)/bin/tclsh

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean chroot
