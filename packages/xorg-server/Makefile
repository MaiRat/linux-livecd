# xorg-server Makefile

NM= xorg-server
VRS= 1.20.5
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.bz2
URL-$(FILE)= $(HTTP_BLFS)/Xorg/$(FILE)
MD5-$(FILE)= c9fc7e21e11286dbedd22c00df652130

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure			\
		$(XORG_CONFIG)		\
		--disable-glamor	\
		--enable-suid-wrapper	\
		--disable-dri		\
		--disable-dri2		\
		--disable-dri3		\
		--disable-glx		\
		--with-xkb-output=/var/lib/xkb
	make -j$(JOBS)
	make install
	mkdir -pv /etc/X11/xorg.conf.d
	echo /tmp/.ICE-unix dir 1777 root root >> /etc/sysconfig/createfiles
	echo /tmp/.X11-unix dir 1777 root root >> /etc/sysconfig/createfiles

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
