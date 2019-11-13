# Gcc Makefile

NM= gcc
VRS= 9.2.0
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 3818ad8600447f05349098232c2ddc78

FILE1= mpfr-4.0.2.tar.xz
URL-$(FILE1)= $(HTTP_LFS)/$(FILE1)
MD5-$(FILE1)= 320fbc4463d4c8cb1e566929d8adc4f8

FILE2= gmp-6.1.2.tar.xz
URL-$(FILE2)= $(HTTP_LFS)/$(FILE2)
MD5-$(FILE2)= f58fa8001d60c4c77595fbbb62b63c1d

FILE3= mpc-1.1.0.tar.gz
URL-$(FILE3)= $(HTTP_LFS)/$(FILE3)
MD5-$(FILE3)= 4125404e41e482ec68282a2e687f6c73

# Targets

include $(MY_ROOT)/scripts/functions

prebuild: $(FILE) $(FILE1) $(FILE2) $(FILE3)
	$(sep_dir_build)

compile-prebuild:
	cd ../$(DIR) ; mv -v $$(unpack ../$(FILE1)) mpfr
	cd ../$(DIR) ; mv -v $$(unpack ../$(FILE2)) gmp
	cd ../$(DIR) ; mv -v $$(unpack ../$(FILE3)) mpc
	cd ../$(DIR) ; for file in gcc/config/{linux,i386/linux{,64}}.h ; \
	do cp -uv $$file{,.orig} && \
	sed -e 's@/lib\(64\)\?\(32\)\?/ld@$(TT)&@g' \
	    -e 's@/usr@$(TT)@g' $$file.orig > $$file && \
	echo '' >> $$file && \
	echo '#undef STANDARD_STARTFILE_PREFIX_1' >> $$file && \
	echo '#undef STANDARD_STARTFILE_PREFIX_2' >> $$file && \
	echo '#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"' >> $$file && \
	echo '#define STANDARD_STARTFILE_PREFIX_2 ""' >> $$file && \
	touch $$file.orig ; \
	done
	../$(DIR)/configure \
		--target=$(BUILD_ARCH) \
		--prefix=$(TT) \
		--with-glibc-version=2.11 \
		--with-sysroot=$(TT)/../image/ \
		--with-newlib \
		--without-headers \
		--with-local-prefix=$(TT) \
		--with-native-system-header-dir=$(TT)/include \
		--disable-nls \
		--disable-shared \
		--disable-multilib \
		--disable-decimal-float \
		--disable-threads \
		--disable-libgomp \
		--disable-libquadmath \
		--disable-libatomic \
		--disable-libssp \
		--disable-libvtv \
		--disable-libstdcxx \
		--enable-languages=c,c++
	make -j$(JOBS)
	make install

stage1: $(FILE) $(FILE1) $(FILE2) $(FILE3)
	$(sep_dir_build)

compile-stage1:
	cd ../$(DIR) ; cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
		`dirname $$($(BUILD_ARCH)-gcc -print-libgcc-file-name)`/include-fixed/limits.h 
	cd ../$(DIR) ; for file in gcc/config/{linux,i386/linux{,64}}.h ; \
	do cp -uv $$file{,.orig} && \
	sed -e 's@/lib\(64\)\?\(32\)\?/ld@$(TT)&@g' \
	    -e 's@/usr@$(TT)@g' $$file.orig > $$file && \
	echo '' >> $$file && \
	echo '#undef STANDARD_STARTFILE_PREFIX_1' >> $$file && \
	echo '#undef STANDARD_STARTFILE_PREFIX_2' >> $$file && \
	echo '#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"' >> $$file && \
	echo '#define STANDARD_STARTFILE_PREFIX_2 ""' >> $$file && \
	touch $$file.orig ; \
	done
	cd ../$(DIR) ; mv -v $$(unpack ../$(FILE1)) mpfr
	cd ../$(DIR) ; mv -v $$(unpack ../$(FILE2)) gmp
	cd ../$(DIR) ; mv -v $$(unpack ../$(FILE3)) mpc
	CXX=$(BUILD_ARCH)-g++					\
	CC=$(BUILD_ARCH)-gcc 					\
	AR=$(BUILD_ARCH)-ar					\
	RANLIB=$(BUILD_ARCH)-ranlib				\
	../$(DIR)/configure					\
		--prefix=$(TT)					\
		--with-local-prefix=$(TT)			\
		--with-native-system-header-dir=$(TT)/include	\
		--enable-languages=c,c++			\
		--disable-libstdcxx-pch				\
		--disable-multilib				\
		--disable-bootstrap				\
		--disable-libgomp
	make -j$(JOBS)
	make install
	ln -vs gcc $(TT)/bin/cc
	echo 'int main(){}' | cc -x c - -v -lrt -Wl,--verbose
	readelf -l a.out | grep $(TT)
	rm -vf a.out

chroot:
	chroot "$(MP)" $(chenv-pre-bash) \
	'cd $(MY_ROOT) && make ch-$(NM) $(chbash-pre-bash)'

stage2: $(FILE)
	$(sep_dir_build)

compile-stage2:
	SED=sed ../$(DIR)/configure		\
		--prefix=/usr			\
		--enable-languages=c,c++	\
		--disable-bootstrap		\
		--disable-multilib		\
		--with-system-zlib
	make -j$(JOBS)
	make install
	rm -rf /usr/lib/gcc/$$(gcc -dumpmachine)/$(VRS)/include-fixed/bits/
	chown -v -R root:root /usr/lib/gcc/*linux-gnu/$(VRS)/include{,-fixed}
	ln -svf ../usr/bin/cpp /lib
	ln -svf gcc /usr/bin/cc
	install -v -dm755 /usr/lib/bfd-plugins
	ln -sfv ../../libexec/gcc/$$(gcc -dumpmachine)/$(VRS)/liblto_plugin.so /usr/lib/bfd-plugins/
	echo 'main(){}' | cc -x c - -v -lrt -Wl,--verbose
	readelf -l a.out | grep "/lib"
	rm -vf a.out
	mkdir -pv /usr/share/gdb/auto-load/usr/lib
	mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib
	
stage3: $(FILE) $(FILE1) $(FILE2)
	$(sep_dir_build)
	
compile-stage3:
	cd ../$(DIR) ; mv -v $$(unpack ../$(FILE1)) mpfr
	cd ../$(DIR) ; mv -v $$(unpack ../$(FILE2)) gmp
	cd ../$(DIR) ; mv -v $$(unpack ../$(FILE3)) mpc
	cd ../$(DIR) ; for file in gcc/config/{linux,i386/linux{,64}}.h ; \
	do cp -uv $$file{,.orig} && \
	sed -e 's@/lib\(64\)\?\(32\)\?/ld@$(TT)&@g' \
	    -e 's@/usr@$(TT)@g' $$file.orig > $$file && \
	echo '' >> $$file && \
	echo '#undef STANDARD_STARTFILE_PREFIX_1' >> $$file && \
	echo '#undef STANDARD_STARTFILE_PREFIX_2' >> $$file && \
	echo '#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"' >> $$file && \
	echo '#define STANDARD_STARTFILE_PREFIX_2 ""' >> $$file && \
	touch $$file.orig ; \
	done
	../$(DIR)/configure \
		--target=x86_64-unknown-linux-gnu \
		--prefix=$(TT) \
		--with-glibc-version=2.11 \
		--with-sysroot=$(TT)/../image/ \
		--with-newlib \
		--without-headers \
		--with-local-prefix=$(TT) \
		--with-native-system-header-dir=$(TT)/include \
		--disable-nls \
		--disable-shared \
		--disable-multilib \
		--disable-decimal-float \
		--disable-threads \
		--disable-libgomp \
		--disable-libquadmath \
		--disable-libatomic \
		--disable-libssp \
		--disable-libvtv \
		--disable-libstdcxx \
		--enable-languages=c \
		--enable-static
	make -j$(JOBS)
	make install
#	PATH=$$PATH:$(TT)/bin make all-gcc
#	PATH=$$PATH:$(TT)/bin make install-gcc

clean:
	-rm -rf $(DIR)
	-rm -rf $(NM)-build

.PHONY: compile-stage1 clean chroot compile-prebuild compile-stage2 compile-stage3
