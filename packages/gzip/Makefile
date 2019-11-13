# Gzip Makefile

NM= gzip
VRS= 1.10
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 691b1221694c3394f1c537df4eee39d3

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build) 

compile-stage1:
	./configure \
		--prefix=$(TT)
	make -j$(JOBS)
	make install
	
stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr
	make -j$(JOBS)
	make install
	mv -v /usr/bin/gzip /bin

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean compile-stage2
