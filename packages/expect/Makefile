# Expect Makefile

NM= expect
VRS= 5.45.4
DIR= $(NM)$(VRS)

FILE= $(NM)$(VRS).tar.gz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 00fce8de158422f5ccd2666512329bd2

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	cp configure{,.bak}
	sed 's:/usr/local/bin:/bin:' configure.bak > configure
	./configure \
		--prefix=$(TT)		\
		--with-tcl=$(TT)/lib	\
		--with-tclinclude=$(TT)/include
	make -j$(JOBS) 
	make SCRIPTS="" install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean chroot
