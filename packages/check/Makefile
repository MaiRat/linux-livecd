# check Makefile

NM= check
VRS= 0.12.0
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 31b17c6075820a434119592941186f70

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure	\
	       --prefix=/usr
	make -j$(JOBS)
	make docdir=/usr/share/doc/check-$(VRS) install
	sed -i '1 s/tools/usr/' /usr/bin/checkmk

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
