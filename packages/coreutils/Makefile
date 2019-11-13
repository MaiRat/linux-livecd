# Coreutils Makefile

NM= coreutils
VRS= 8.31
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 0009a224d8e288e8ec406ef0161f9293

PATCH= $(DIR)-i18n-1.patch
URL-$(PATCH)= $(HTTP_LFS)/$(PATCH)
MD5-$(PATCH)= a9404fb575dfd5514f3c8f4120f9ca7d

# Targets

include $(MY_ROOT)/scripts/functions


prebuild: $(FILE)
	$(std_build)

compile-prebuild:
	./configure		\
		--prefix=$(TT)	\
		--enable-install-program=hostname
	make -j$(JOBS)
	make install

stage1: $(FILE)
	$(std_build)

compile-stage1:
	./configure		\
		--prefix=$(TT)	\
		--enable-install-program=hostname
	make -j$(JOBS)
	make install

stage2: Makefile $(FILE) $(PATCH)
	$(std_build)

compile-stage2:
	patch -Np1 -i ../$(PATCH)
	autoreconf -fiv
	FORCE_UNSAFE_CONFIGURE=1	\
	./configure			\
		--prefix=/usr		\
		--enable-no-install-program=kill,uptime
	make -j$(JOBS)
	make install
	mv -v /usr/bin/{cat,chgrp,chmod,chown,cp,date,dd,df,echo} /bin
	mv -v /usr/bin/{false,ln,ls,mkdir,mknod,mv,pwd,rm} /bin
	mv -v /usr/bin/{rmdir,stty,sync,true,uname} /bin
	mv -v /usr/bin/chroot /usr/sbin
	mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8
	mv -v /usr/bin/{head,sleep,nice,touch} /bin

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean compile-stage2
