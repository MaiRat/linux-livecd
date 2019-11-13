# Findutils Makefile

NM= findutils
VRS= 4.6.0
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 9936aa8009438ce185bea2694a997fc1

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' gl/lib/*.c
	sed -i '/unistd/a #include <sys/sysmacros.h>' gl/lib/mountlist.c
	echo "#define _IO_IN_BACKUP 0x100" >> gl/lib/stdio-impl.h
	./configure \
		--prefix=$(TT)
	make -j$(JOBS)
	make install

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' gl/lib/*.c
	sed -i '/unistd/a #include <sys/sysmacros.h>' gl/lib/mountlist.c
	echo "#define _IO_IN_BACKUP 0x100" >> gl/lib/stdio-impl.h
	./configure \
		--prefix=/usr \
	 	--localstatedir=/var/lib/locate
	make -j$(JOBS)
	make install
	mv -v /usr/bin/find /bin
	sed -i 's|find:=$${BINDIR}|find:=/bin|' /usr/bin/updatedb

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean compile-stage2
