# Util-Linux-NG Makefile

NM= util-linux
VRS= 2.34
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= a78cbeaed9c39094b96a48ba8f891d50

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	mkdir -pv /var/lib/hwclock
	./configure					\
		ADJTIME_PATH=/var/lib/hwclock/adjtime	\
		--disable-chfn-chsh			\
		--disable-login				\
		--disable-nologin			\
		--disable-su				\
		--disable-setpriv			\
		--disable-static			\
		--disable-runuser			\
		--disable-pylibmount			\
		--without-python			\
		--without-systemd			\
		--without-systemdsystemunitdir
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
