# LFS-Bootscripts Makefile

NM= lfs-bootscripts
VRS= 20190524
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 8b640ce5a7944c2d55b9f29d3e1f3773

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
