# Shadow Makefile

NM= shadow
VRS= 4.7
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= f7ce18c8dfd05f1a009266cb604d58b7

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i 's/groups$$(EXEEXT) //' src/Makefile.in
	find man -name Makefile.in -exec sed -i 's/groups\.1 / /'   {} \;
	find man -name Makefile.in -exec sed -i 's/getspnam\.3 / /' {} \;
	find man -name Makefile.in -exec sed -i 's/passwd\.5 / /'   {} \;
	sed -i -e 's@#ENCRYPT_METHOD DES@ENCRYPT_METHOD MD5@' \
	 -e 's@/var/spool/mail@/var/mail@' etc/login.defs
	sed -i 's/1000/999/' etc/useradd
	./configure			\
		--sysconfdir=/etc	\
		--with-group-name-max-length=32
	make -j$(JOBS)
	make install
	mv -v /usr/bin/passwd /bin
	mkdir -pv /etc/default
	pwconv
	grpconv
	sed -i 's/yes/no/' /etc/default/useradd

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
