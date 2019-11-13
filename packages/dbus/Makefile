# dbus Makefile

NM= dbus
VRS= 1.12.16
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_BLFS)/d/$(FILE)
MD5-$(FILE)= 2dbeae80dfc9e3632320c6a53d5e8890

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=/usr			\
		--sysconfdir=/etc			\
		--localstatedir=/var			\
		--enable-user-session			\
		--disable-doxygen-docs			\
		--disable-xml-docs			\
		--disable-static			\
		--with-systemduserunitdir=no		\
		--with-systemdsystemunitdir=no		\
		--docdir=/usr/share/doc/dbus-1.12.16	\
		--with-console-auth-dir=/run/console	\
		--with-system-pid-file=/run/dbus/pid	\
		--with-system-socket=/run/dbus/system_bus_socket
	make -j$(JOBS)
	make install
	mv -v /usr/lib/libdbus-1.so.* /lib
	ln -sfv ../../lib/$$(readlink /usr/lib/libdbus-1.so) /usr/lib/libdbus-1.so
	dbus-uuidgen --ensure


clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
