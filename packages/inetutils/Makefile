# Inetutils Makefile

NM= inetutils
VRS= 1.9.4
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 87fef1fa3f603aef11c41dcc097af75e

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure			\
		--prefix=/usr		\
		--localstatedir=/var	\
		--disable-logger	\
		--disable-whois		\
		--disable-rcp		\
		--disable-rexec		\
		--disable-rlogin	\
		--disable-rsh		\
		--disable-servers
	make -j$(JOBS)
	make install
	mv -v /usr/bin/{hostname,ping,ping6,traceroute} /bin
	mv -v /usr/bin/ifconfig /sbin

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
