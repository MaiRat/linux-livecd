# Sed Makefile

NM= sed
VRS= 4.7
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 777ddfd9d71dd06711fe91f0925e1573

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	./configure \
		--prefix=$(TT)
	make -j$(JOBS)
	make install

chroot:
	chroot "$(MP)" $(chenv-pre-bash) \
	'cd $(MY_ROOT) && make ch-$(NM) $(chbash-pre-bash)'

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i 's/usr/tools/'                 build-aux/help2man
	sed -i 's/testsuite.panic-tests.sh//' Makefile.in
	./configure		\
		--prefix=/usr	\
		--bindir=/bin
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean chroot compile-stage2
