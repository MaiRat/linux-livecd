# Gtk+3 Makefile

NM= gtk+
VRS= 3.24.10
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_BLFS)/g/$(FILE)
MD5-$(FILE)= 1b9f49a500a104a3e40f8d8eb7e6ce96

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(sep_dir_build)

compile-stage2:
	meson --prefix=/usr		\
		-Dcolord=yes		\
		-Dgtk_doc=false		\
		-Dman=false		\
		-Dwayland_backend=false	\
		-Dintrospection=false	\
		-Dbroadway_backend=true ../$(DIR)
	ninja
	ninja install

clean:
	-rm -rf $(DIR)
	-rm -rf $(NM)-build

.PHONY: clean compile-stage2
