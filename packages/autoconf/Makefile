# Autoconf Makefile

NM= autoconf
VRS= 2.69
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 50f97f4159805e374639a73e2636f22e

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed '361 s/{/\\{/' -i bin/autoscan.in
	./configure	\
		--prefix=/usr
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR) 

.PHONY: clean compile-stage2
