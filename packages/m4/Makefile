# M4 Makefile

NM= m4
VRS= 1.4.18
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 730bb15d96fffe47e148d1e09235af82

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' lib/*.c
	echo "#define _IO_IN_BACKUP 0x100" >> lib/stdio-impl.h
	./configure \
		--prefix=$(TT)
	make -j$(JOBS)
	make install

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' lib/*.c
	echo "#define _IO_IN_BACKUP 0x100" >> lib/stdio-impl.h
	./configure \
		--prefix=/usr 
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean compile-stage2
