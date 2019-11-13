# OpenSSL Makefile

NM= openssl
VRS= 1.1.1c
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 15e21da6efe8aa0e0768ffd8cd37a5f6

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	sed -i '/\} data/s/ =.*$$/;\n    memset(\&data, 0, sizeof(data));/' crypto/rand/rand_lib.c
	./config			\
		--openssldir=$(TT)/etc/ssl	\
		--prefix=$(TT)		\
		shared 			\
		zlib-dynamic 		\
		--libdir=lib
	make -j$(JOBS)
	sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
	make MANSUFFIX=ssl install

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i '/\} data/s/ =.*$$/;\n    memset(\&data, 0, sizeof(data));/' crypto/rand/rand_lib.c
	./config			\
		--openssldir=/etc/ssl	\
		--prefix=/usr		\
		shared 			\
		zlib-dynamic 		\
		--libdir=lib
	make -j$(JOBS)
	sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
	make MANSUFFIX=ssl install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
