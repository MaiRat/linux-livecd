# Groff Makefile

NM= groff
VRS= 1.22.4
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 08fb04335e2f5e73f23ea4c3adbf0c5f

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	PAGE=$(pagesize)	\
	./configure 		\
		--prefix=/usr
	make -j1
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
