# DejaGNU Makefile

NM= dejagnu
VRS= 1.6.2
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= e1b07516533f351b3aba3423fafeffd6

# Targets

include $(MY_ROOT)/scripts/functions

stage1: $(FILE)
	$(std_build)

compile-stage1:
	./configure \
		--prefix=$(TT)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: compile-stage1 clean chroot
