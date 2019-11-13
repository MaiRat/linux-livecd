# yasm Makefile

NM= yasm
VRS= 1.3.0
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://www.tortall.net/projects/yasm/releases/$(FILE)
MD5-$(FILE)= fc9e586751ff789b34b1f21d572d96af

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i 's#) ytasm.*#)#' Makefile.in
	./configure --prefix=/usr
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
