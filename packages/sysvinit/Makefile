# Sysvinit Makefile

NM= sysvinit
VRS= 2.95
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 66f488c952c70ff4245774fc7e87e529

PATCH= $(DIR)-consolidated-1.patch
URL-$(PATCH)= $(HTTP_LFS)/$(PATCH)
MD5-$(PATCH)= 4900322141d493e74020c9cf437b2cdc


# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) $(PATCH)
	$(std_build)

compile-stage2:
	patch -Np1 -i ../$(PATCH)
	make -j$(JOBS)
	make install
	cp $(MY_ROOT)/etc/inittab /etc

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
