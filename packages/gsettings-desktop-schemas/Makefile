# gsettings-desktop-schemas Makefile

NM= gsettings-desktop-schemas
VRS= 3.32.0
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_BLFS)/g/$(FILE)
MD5-$(FILE)= 0c2d468a482c12594757442c983aa8ea

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(sep_dir_build)

compile-stage2:
	cd ../$(DIR) ; sed -i -r 's:"(/system):"/org/gnome\1:g' schemas/*.in
	meson --prefix=/usr -Dintrospection=false      \
		 ../$(DIR)
	ninja
	ninja install

clean:
	-rm -rf $(DIR)
	-rm -rf $(NM)-build

.PHONY: clean compile-stage2
