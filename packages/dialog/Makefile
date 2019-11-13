# Dialog Makefile

NM= dialog
VRS= 1.2-20150920
DIR= $(NM)-$(VRS)

FILE= $(DIR).tgz
URL-$(FILE)= https://invisible-mirror.net/archives/dialog/$(DIR).tgz
MD5-$(FILE)= 2b7c002b0a88ce1e0014af34b6b1ebdc

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--enable-nls \
	    --enable-widec \
	    --with-ncursesw
	make 
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
