# libstdcxx Makefile

NM= libstdcxx
VRS= 9.2.0
DIR= gcc-$(VRS)

FILE= gcc-$(VRS).tar.xz
URL-$(FILE)= $(HTTP)/$(NM)/$(FILE)
MD5-$(FILE)= 3818ad8600447f05349098232c2ddc78

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(sep_dir_build)

compile-stage1:
	../gcc-$(VRS)/libstdc++-v3/configure	\
		--host=$(BUILD_ARCH)		\
		--prefix=$(TT)			\
		--disable-libstdcxx-pch		\
		--disable-libstdcxx-threads	\
		--disable-multilib		\
		--disable-nls			\
		--with-gxx-include-dir=$(TT)/$(BUILD_ARCH)/include/c++/$(VRS)
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)
	-rm -rf $(NM)-build

.PHONY: compile-stage1 clean
