# mesa Makefile

NM= mesa
VRS= 19.1.4
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.xz
URL-$(FILE)= $(HTTP_BLFS)/Xorg/$(FILE)
MD5-$(FILE)= 90eed05e3239c96ad9e92eb11eb67ada

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(sep_dir_build)

compile-stage2:
	meson --prefix=/usr			\
		-Dbuildtype=release		\
		-Ddri-drivers=			\
		-Dgallium-drivers=		\
		-Dvulkan-drivers=		\
		-Dgallium-nine=false		\
		-Dglx=dri			\
		-Dvalgrind=false		\
		-Dllvm=false			\
		-Dplatforms=x11			\
		../$(DIR)
	ninja
	ninja install

clean:
	-rm -rf $(DIR)
	-rm -rf $(NM)-build

.PHONY: clean chroot compile-stage2
