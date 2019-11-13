# Syslinux Makefile

NM= syslinux
VRS= 3.86
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= http://www.kernel.org/pub/linux/utils/boot/syslinux/3.xx/$(FILE)
MD5-$(FILE)= d6fb0231e82190b4932b2aa20274911a

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) split-boot-help $(MY_ROOT)/doc/README.txt
	$(std_build)

compile-stage2:
	chmod +x ../split-boot-help
	install -dv /boot/isolinux
	cp -v core/isolinux.bin /boot/isolinux
	sed 's/\\_/_/g' $(MY_ROOT)/doc/README.txt | ../split-boot-help
	cp -v F*.txt /boot/isolinux
	cp -v $(MY_ROOT)/isolinux/{isolinux.cfg,boot.msg,splash.lss} /boot/isolinux

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
