# Texinfo Makefile

NM= texinfo
VRS= 6.6
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 5231da3e6aa106cd0532b8609e5b3702

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
	./configure		\
		--prefix=/usr	\
		--disable-static
	make -j$(JOBS)
	make install
	make TEXMF=/usr/share/texmf install-tex

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean compile-stage2
