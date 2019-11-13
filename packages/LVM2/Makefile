# lvm2 Makefile

NM= LVM2
VRS= 2.03.05
DIR= $(NM).$(VRS)

FILE= $(DIR).tgz
URL-$(FILE)= $(HTTP_BLFS)/l/$(FILE)
MD5-$(FILE)= 22e4a9e66b94bbfcf81444472ed32a2d

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	PATH=$$PATH:/sbin:/usr/sbin ./configure	--prefix=/usr 		\
						--exec-prefix=		\
						--enable-applib     	\
						--enable-cmdlib		\
						--enable-pkgconfig	\
						--enable-udev_sync
	make -j$(JOBS)
	make -C tools install_tools_dynamic -j$(JOBS)
	make -C udev  install -j$(JOBS)
	make -C libdm install -j$(JOBS)

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
