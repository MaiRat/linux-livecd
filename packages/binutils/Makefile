# Binutils Makefile

NM= binutils
VRS= 2.32
DIR= $(NM)-$(VRS)

FILE= $(NM)-$(VRS).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 0d174cdaf85721c5723bf52355be41e6

# Targets

include $(MY_ROOT)/scripts/functions

prebuild: $(FILE)
	$(sep_dir_build)

compile-prebuild:
	../$(DIR)/configure			\
		--prefix=$(TT)			\
		--with-sysroot=$(TT)/../image/	\
		--with-lib-path=$(TT)/lib	\
		--target=$(BUILD_ARCH)		\
		--disable-nls			\
		--disable-werror
	make -j$(JOBS)
	make install

stage1: $(FILE)
	$(sep_dir_build)

compile-stage1:
	CC=$(BUILD_ARCH)-gcc			\
	AR=$(BUILD_ARCH)-ar			\
	RANLIB=$(BUILD_ARCH)-ranlib		\
	../$(DIR)/configure			\
		--prefix=$(TT)			\
		--disable-nls			\
		--with-lib-path=$(TT)/lib	\
		--disable-werror		\
		--with-sysroot
	make -j$(JOBS)
	make install
	make -C ld clean
	make -C ld LIB_PATH=/usr/lib:/lib
	cp -v ld/ld-new $(TT)/bin

stage2: $(FILE)
	$(sep_dir_build)

compile-stage2:
	../$(DIR)/configure		\
		--prefix=/usr		\
		--enable-shared		\
		--disable-werror	\
		--enable-gold		\
		--enable-ld=default	\
		--enable-plugins	\
		--enable-64-bit-bfd	\
		--with-system-zlib
	make tooldir=/usr -j$(JOBS)
	make tooldir=/usr install
	
stage3: $(FILE)
	$(sep_dir_build)
	
compile-stage3:
	../$(DIR)/configure			\
	--prefix=$(TT)				\
	--with-sysroot=$(TT)/,,/image/		\
	--with-lib-path=$(TT)/lib		\
	--target=x86_64-unknown-linux-gnu	\
	--disable-nls				\
	--disable-werror
	make
	make install

clean:
	-rm -rf $(DIR)
	-rm -rf $(NM)-build

.PHONY: compile-prebuild clean compile-stage1 compile-stage2 compile-stage3
