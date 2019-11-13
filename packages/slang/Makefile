# slang Makefile

NM= slang
VRS= 2.3.2
DIR= $(NM)-$(VRS)

FILE= $(NM)-$(VRS).tar.bz2
URL-$(FILE)= $(HTTP_BLFS)/s/$(FILE)
MD5-$(FILE)= c2d5a7aa0246627da490be4e399c87cb

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure			\
		--prefix=/usr		\
		--sysconfdir=/etc	\
		--with-readline=gnu
	make -j1
	make install_doc_dir=/usr/share/doc/$(DIR)	\
		SLSH_DOC_DIR=/usr/share/doc/$(DIR)/slsh	\
		install-all
	chmod -v 755 /usr/lib/libslang.so.$(VRS)\
		/usr/lib/slang/v2/modules/*.so

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
