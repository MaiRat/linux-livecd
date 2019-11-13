# BLFS Bootscripts Makefile

NM= blfs-bootscripts
VRS= 20190609
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_BLFS)/b/$(FILE)
MD5-$(FILE)= 9e2aaee06008c801a72fd252b6506044

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	make install-service-dhcpcd
	make install-gpm
	make install-dbus
	install -m754 blfs/init.d/sshd /etc/rc.d/init.d/ 
	install -m754 blfs/init.d/random /etc/rc.d/init.d/ 
	install -m754 blfs/init.d/nfs-server /etc/rc.d/init.d/ 
	install -m754 blfs/init.d/nfs-client /etc/rc.d/init.d/ 
	install -m754 blfs/init.d/rsyncd /etc/rc.d/init.d/
	sed -i 's| --compress||' /etc/rc.d/init.d/rsyncd

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
