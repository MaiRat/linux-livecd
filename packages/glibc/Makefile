# Glibc Makefile

NM= glibc
VRS= 2.30
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 2b1dbdf27b28620752956c061d62f60c

FILE1= tzdata2019b.tar.gz
URL-$(FILE1)= $(HTTP_LFS)/$(FILE1)
MD5-$(FILE1)= b26b5d7d844cb96c73ed2fb6d588daaf

PATCH1= $(DIR)-fhs-1.patch
URL-$(PATCH1)= $(HTTP_LFS)/$(PATCH1)
MD5-$(PATCH1)= 9a5997c3452909b1769918c759eff8a2

# Targets

include $(MY_ROOT)/scripts/functions

chroot:
	chroot "$(MP)" $(chenv-pre-bash) \
        'cd $(MY_ROOT) && make ch-$(NM) $(chbash-pre-bash)'

stage1: $(FILE)
	$(sep_dir_build)

compile-stage1:
	../$(DIR)/configure					\
		--prefix=$(TT)					\
		--host=$(BUILD_ARCH)				\
		--build=$$(../$(DIR)/scripts/config.guess)	\
		--enable-kernel=3.2				\
		--with-headers=$(TT)/include
	make -j$(JOBS)
	make install
	echo 'int main(){}' | $(BUILD_ARCH)-gcc -B$(TT)/lib/ -x c - -v -Wl,--verbose
	readelf -l a.out | grep $(TT)
	rm -vf a.out

stage2: $(FILE) $(FILE1) $(PATCH1)
	$(sep_dir_build)

compile-stage2:
	cd ../$(DIR) ; patch -Np1 -i ../$(PATCH1)
	cd ../$(DIR) ; sed -i '/asm.socket.h/a# include <linux/sockios.h>' sysdeps/unix/sysv/linux/bits/socket.h
	ln -sfv ld-linux.so.2 /lib/ld-lsb.so.3
	CC="gcc -ffile-prefix-map=/tools=/usr"	\
	../$(DIR)/configure			\
		--prefix=/usr			\
		--disable-werror		\
		--enable-kernel=3.2		\
		--with-headers=/usr/include	\
	        --enable-stack-protector=strong	\
	        libc_cv_slibdir=/lib
	make -j$(JOBS)
	touch /etc/ld.so.conf
	cd ../$(DIR) ; sed '/test-installation/s@$$(PERL)@echo not running@' -i Makefile
	make install
	cp -v ../$(DIR)/nscd/nscd.conf /etc/nscd.conf
	mkdir -pv /var/cache/nscd
	mkdir -pv /usr/lib/locale
	localedef -i POSIX -f UTF-8 C.UTF-8 2> /dev/null || true
	localedef -i cs_CZ -f UTF-8 cs_CZ.UTF-8
	localedef -i de_DE -f ISO-8859-1 de_DE
	localedef -i de_DE@euro -f ISO-8859-15 de_DE@euro
	localedef -i de_DE -f UTF-8 de_DE.UTF-8
	localedef -i el_GR -f ISO-8859-7 el_GR
	localedef -i en_GB -f UTF-8 en_GB.UTF-8
	localedef -i en_HK -f ISO-8859-1 en_HK
	localedef -i en_PH -f ISO-8859-1 en_PH
	localedef -i en_US -f ISO-8859-1 en_US
	localedef -i en_US -f UTF-8 en_US.UTF-8
	localedef -i es_MX -f ISO-8859-1 es_MX
	localedef -i fa_IR -f UTF-8 fa_IR
	localedef -i fr_FR -f ISO-8859-1 fr_FR
	localedef -i fr_FR@euro -f ISO-8859-15 fr_FR@euro
	localedef -i fr_FR -f UTF-8 fr_FR.UTF-8
	localedef -i it_IT -f ISO-8859-1 it_IT
	localedef -i it_IT -f UTF-8 it_IT.UTF-8
	localedef -i ja_JP -f EUC-JP ja_JP
	localedef -i ja_JP -f SHIFT_JIS ja_JP.SIJS 2> /dev/null || true
	localedef -i ja_JP -f UTF-8 ja_JP.UTF-8
	localedef -i tr_TR -f UTF-8 tr_TR.UTF-8
	localedef -i zh_CN -f GB18030 zh_CN.GB18030
	localedef -i zh_HK -f BIG5-HKSCS zh_HK.BIG5-HKSCS
	cp $(MY_ROOT)/etc/nsswitch.conf /etc
	tar -xf ../$(FILE1)
	mkdir -pv /usr/share/zoneinfo/{posix,right}
	for tz in etcetera southamerica northamerica europe africa antarctica \
	asia australasia backward pacificnew systemv ; do \
			zic -L /dev/null -d /usr/share/zoneinfo $${tz} ; \
			zic -L /dev/null -d /usr/share/zoneinfo/posix $${tz} ; \
			zic -L leapseconds -d /usr/share/zoneinfo/right $${tz} ; done
	cp -v zone.tab zone1970.tab iso3166.tab /usr/share/zoneinfo
	zic -d /usr/share/zoneinfo -p America/New_York
	cp --remove-destination /usr/share/zoneinfo/$(timezone) /etc/localtime
	mv -v /tools/bin/{ld,ld-old}
	mv -v /tools/$$(uname -m)-pc-linux-gnu/bin/{ld,ld-old}
	mv -v /tools/bin/{ld-new,ld}
	ln -sv /tools/bin/ld /tools/$$(uname -m)-pc-linux-gnu/bin/ld
	gcc -dumpspecs | sed -e 's@/tools@@g'				\
		-e '/\*startfile_prefix_spec:/{n;s@.*@/usr/lib/ @}'	\
		-e '/\*cpp:/{n;s@$$@ -isystem /usr/include@}' >		\
		`dirname $$(gcc --print-libgcc-file-name)`/specs
clean:
	-rm -rf $(DIR)
	-rm -rf $(NM)-build

.PHONY: compile-stage1 clean compile-stage2 chroot
