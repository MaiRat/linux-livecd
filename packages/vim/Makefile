# Vim Makefile

NM= vim
VRS= 8.1.1846
DIR= $(NM)-$(VRS)

FILE= $(NM)-$(VRS).tar.gz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= 4f129a05254d93c739fcede843df87df

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h
	./configure	\
		--prefix=/usr
	make -j$(JOBS)
	make install
	ln -sfv vim /usr/bin/vi
	for L in /usr/share/man/{,*/}man1/vim.1; do \
	    ln -sfv vim.1 $$(dirname $$L)/vi.1 ; done
	ln -nsfv ../vim/$(DIR)/doc /usr/share/doc/vim-$(VRS)
	cp $(MY_ROOT)/etc/vimrc /etc

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
