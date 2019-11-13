# Perl Makefile

NM= perl
VRS= 5.30.0
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 037c35000550bdcb47552ad0f6d3064d

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	sh Configure		\
		-des		\
		-Dprefix=$(TT)	\
		-Dlibs=-lm	\
		-Uloclibpth	\
		-Ulocincpth
	make -j$(JOBS)
	cp -v perl cpan/podlators/scripts/pod2man $(TT)/bin
	mkdir -pv $(TT)/lib/perl5/$(VRS)
	cp -Rv lib/* $(TT)/lib/perl5/$(VRS)

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	# LFS has:
	# echo "127.0.0.1 localhost $(hostname)" > /etc/hosts
	# this is already taken care of by the createfiles target
	BUILD_ZLIB=False BUILD_BZIP2=0		\
	sh Configure				\
		-des				\
		-Dprefix=/usr			\
		-Dvendorprefix=/usr		\
		-Dman1dir=/usr/share/man/man1	\
		-Dman3dir=/usr/share/man/man3	\
		-Dpager="/usr/bin/less -isR"	\
		-Duseshrplib			\
		-Dusethreads
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean compile-stage2
