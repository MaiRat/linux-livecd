# Gtk+ Makefile

NM= gtk+
VRS= 2.24.32
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_BLFS)/g/$(FILE)
MD5-$(FILE)= d5742aa42275203a499b59b4c382a784

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -e 's#l \(gtk-.*\).sgml#& -o \1#' \
		-i docs/{faq,tutorial}/Makefile.in
	./configure --prefix=/usr --sysconfdir=/etc
	make -j$(JOBS)
	make install

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
