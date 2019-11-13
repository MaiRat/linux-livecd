# Samba Makefile

NM= samba
VRS= 4.10.7
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_BLFS)/s/$(FILE)
MD5-$(FILE)= 05472d0dd943b3ccbc3be5032a9eb563

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	echo "^samba4.rpc.echo.*on.*ncacn_np.*with.*object.*nt4_dc" >> selftest/knownfail
	CFLAGS="-I/usr/include/tirpc"          \
	LDFLAGS="-ltirpc"                      \
	./configure                            \
		--prefix=/usr                      \
		--sysconfdir=/etc                  \
		--localstatedir=/var               \
		--with-piddir=/run/samba           \
		--with-pammodulesdir=/lib/security \
		--enable-fhs                       \
		--without-ad-dc                    \
		--without-ads				\
		--without-pam				\
		--without-ldap				\
		--without-systemd                  \
		--enable-selftest                  
	make -j$(JOBS)
	make install
	mv -v /usr/lib/libnss_win{s,bind}.so*   /lib
	ln -v -sf ../../lib/libnss_winbind.so.2 /usr/lib/libnss_winbind.so
	ln -v -sf ../../lib/libnss_wins.so.2    /usr/lib/libnss_wins.so
	install -v -m644    examples/smb.conf.default /etc/samba

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
