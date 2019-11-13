# zisofs-tools Makefile

NM= zisofs-tools
VRS= 1.0.6
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= http://www.kernel.org/pub/linux/utils/fs/zisofs/$(FILE)
MD5-$(FILE)= fea684a07d199963d59731bb368750ad

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure --prefix=$(TT) CFLAGS="-I$(TT)/include" LDFLAGS="-L$(TT)/lib"
	make 
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
