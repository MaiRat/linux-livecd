# Make Makefile

NM= make
VRS= 4.2.1
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 7d0dcb6c474b258aab4d54098f2cf5a7

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	sed -i '211,217 d; 219,229 d; 232 d' glob/glob.c
	./configure		\
		--prefix=$(TT)	\
		--without-guile
	make -j$(JOBS)
	make install

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i '211,217 d; 219,229 d; 232 d' glob/glob.c
	./configure \
		--prefix=/usr
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean compile-stage2
