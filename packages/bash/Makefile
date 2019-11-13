# Bash Makefile

NM= bash
VRS= 5.0
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 2b44b47b905be16f45709648f671820b

# Targets

include $(MY_ROOT)/scripts/functions

ftpget:
	@cd $(SRC) ; sh $(MY_ROOT)/scripts/ftpget $(NM) $(VRS)
	@touch $@

prebuild: ftpget $(FILE)
	@$(call echo_message, Building)
	@touch $(DIR)-$@.log
	@-ln -sf $(MY_ROOT)/packages/$(shell basename `pwd`)/$(DIR)-$@.log $(MY_ROOT)/logs/
	@unpack $(FILE) >>$(DIR)-$@.log 2>&1
	@make -C $(DIR) -f ../Makefile compile-$@>>$(DIR)-$@.log 2>&1
	@make clean >>$(DIR)-$@.log 2>&1
	@touch $@

compile-prebuild:
	./configure		\
		--prefix=$(TT)	\
		--without-bash-malloc
	make -j$(JOBS)
	make install
	ln -sfv bash $(TT)/bin/sh

stage1: $(FILE)
	$(std_build)

compile-stage1:
	./configure		\
		--prefix=$(TT)	\
		--without-bash-malloc
	make -j$(JOBS)
	make install
	ln -sfv bash $(TT)/bin/sh

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	./configure					\
		--prefix=/usr				\
		--docdir=/usr/share/doc/bash-5.0	\
		--without-bash-malloc 			\
		--with-installed-readlinie
	make -j$(JOBS)
	make install
	mv -vf /usr/bin/bash /bin

clean:
	-rm -rf $(DIR)

.PHONY: compile-prebuild compile-stage1 clean compile-stage2
