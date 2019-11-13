# eudev Makefile

NM= eudev
VRS= 3.2.8
CONFVRS= 20171102
DIR= $(NM)-$(VRS)
CONFDIR=udev-lfs-$(CONFVRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= ce166b3fdd910c2a4a840378f48fedaf

FILE1= $(CONFDIR).tar.xz
URL-$(FILE1)= $(HTTP_LFS)/$(FILE1)
MD5-$(FILE1)= 27cd82f9a61422e186b9d6759ddf1634

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) $(FILE1)
	$(std_build)

compile-stage2:
	./configure			\
		--prefix=/usr		\
		--bindir=/sbin		\
		--sbindir=/sbin		\
		--libdir=/usr/lib	\
		--sysconfdir=/etc	\
		--libexecdir=/lib	\
		--with-rootprefix=	\
		--with-rootlibdir=/lib	\
		--enable-manpages	\
		--disable-static
	make -j$(JOBS)
	mkdir -pv /lib/udev/rules.d
	mkdir -pv /etc/udev/rules.d
	make install
	tar -xvf ../udev-lfs-20171102.tar.xz
	make -f udev-lfs-20171102/Makefile.lfs install
	udevadm hwdb --update

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
