# sudo Makefile

NM= sudo
VRS= 1.8.27
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_BLFS)/s/$(FILE)
MD5-$(FILE)= b5c184b13b6b5de32af630af2fd013fd

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE) $(PATCH1)
	$(std_build)

compile-stage2:
	./configure \
		--prefix=/usr \
		--libexecdir=/usr/lib \
		--with-secure-path \
		--with-env-editor \
	 	--with-all-insults
	make -j$(JOBS)
	rm -f /etc/sudoers
	env -i PATH=$$PATH make install
	echo 'jhalfs    ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
