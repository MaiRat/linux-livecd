# Wget Makefile

NM= wget
VRS= 1.19.5
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_BLFS)/w/$(FILE)
MD5-$(FILE)= 2db6f03d655041f82eb64b8c8a1fa7da

# Targets

include $(MY_ROOT)/scripts/functions

ftpget:
	@cd $(SRC) ; sh $(MY_ROOT)/scripts/ftpget $(NM) $(VRS)
	@touch $@

prebuild: ftpget $(FILE)
	$(std_build)

compile-prebuild:
	./configure		\
		--prefix=$(TT)	\
		--with-ssl=openssl
	make -j$(JOBS)
	make install

stage1: $(FILE)
	$(std_build)

compile-stage1:
	./configure		\
		--prefix=$(TT)	\
		--with-ssl=openssl
	make -j$(JOBS)
	make install

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure			\
		--prefix=/usr		\
		--sysconfdir=/etc	\
		--with-ssl=openssl
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-prebuild clean chroot compile-stage2
