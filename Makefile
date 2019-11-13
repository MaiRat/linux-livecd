#
# Makefiles for automating the LFS LiveCD build
#
# Written by Jeremy Huntwork | jhuntwork AT linuxfromscratch DOT org
# Several additions and edits by Alexander Patrakov, Justin Knierim and
# Thomas Pegg
#
# These scripts are published under the GNU General Public License, version 2
#
#==============================================================================

# Place your personal customizations in Makefile.personal
# instead of editing this Makefile.
# Makefile.personal is deliberately not in SVN.

-include Makefile.personal

#==============================================================================
# Variables you may want to change.
#==============================================================================

# Timezone
export timezone ?= America/New_York

# Remote server location for packages
export HTTP ?= https://ftp.osuosl.org/pub
export HTTP_LFS ?= $(HTTP)/lfs/lfs-packages/9.0
export HTTP_BLFS ?= $(HTTP)/blfs/9.0
export HTTP_BLFS_PATCHES ?= http://www.linuxfromscratch.org/patches/blfs/9.0/

# Default paper size for groff.
export pagesize ?= letter
export JOBS ?= 2

#==============================================================================
# The following variables are not expected to be changed, but could be, if you
# understand how they are used and accept the consequences of changing them.
#==============================================================================

# Location for the temporary tools, must be a directory immediately under /
export TT := /tools

# Location for the sources, must be a directory immediately under /
export SRC := /sources

# The name of the build user account to create and use for the temporary tools
export USER := builduser

# Compiler optimizations
export CFLAGS := -O2 -pipe
export CXXFLAGS := $(CFLAGS)
export LDFLAGS := -s

export XORG_PREFIX := /usr
export XORG_CONFIG := --prefix=$(XORG_PREFIX) --sysconfdir=/etc --localstatedir=/var --disable-static

# Set the base architecture
# Currently supported: i686
# FIXME: Verify that the host is one of the above
export MY_ARCH := $(shell uname -m)
export LINKER = ld-linux.so.2

# The full path to the build scripts on the host OS
# e.g., /mnt/build/build-env
export MY_BASE := $(shell pwd)

# The path to the build directory - This must be the parent directory of $(MY_BUILD)
# e.g., /mnt/build
export MY_BUILD := $(shell dirname $(MY_BASE))

# The chroot form of $(MY_BASE), needed so that certain functions and scripts will
# work both inside and outside of the chroot environment.
# e.g., /build-env
export MY_ROOT := /$(shell basename $(MY_BASE))

# Free disk space needed for the build.
ROOTFS_MEGS := 1999

# LiveCD version
export CD_VERSION ?= $(MY_ARCH)-9.0

#==============================================================================
# The following variables are not expected to be changed
#==============================================================================

export MP := $(MY_BUILD)/image
export MKTREE := $(MP)$(MY_ROOT)
export LFSSRC := /lfs-sources

#==============================================================================
# Environment Variables - don't modify these!
#==============================================================================

export toolsenv := env -i HOME=/home/$(USER) LC_ALL=POSIX PATH=$(TT)/bin:/bin:/usr/bin /bin/bash -c
export toolsbash := set +o hashall 2>/dev/null || set -o nohash && umask 022 && cd $(MY_ROOT)

export chenv-pre-bash := $(TT)/bin/env -i HOME=/root TERM=$(TERM) PS1='\u:\w\$$ ' PATH=/bin:/usr/bin:/sbin:/usr/sbin:$(TT)/bin $(TT)/bin/bash -c
export chenv-post-bash := $(TT)/bin/env -i HOME=/root TERM=$(TERM) PS1='\u:\w\$$ ' PATH=/bin:/usr/bin:/sbin:/usr/sbin:$(TT)/bin /bin/bash -c

export WGET := $(TT)/bin/wget

export BRW = "[0;1m"
export RED = "[0;31m"
export GREEN = "[0;32m"
export ORANGE = "[0;33m"
export BLUE = "[0;44m"
export WHITE = "[00m"

# Architecture specifics
ifeq ($(MY_ARCH),ppc)
export MY_LIBDIR := lib
export BUILD_ARCH := powerpc-custom-linux-gnu
else
export BUILD_ARCH := $(MY_ARCH)-custom-linux-gnu
endif

#==============================================================================
# Build Targets
#==============================================================================

all: test-host base iso
	@echo $(GREEN)"The LiveCD, $(MY_BUILD)$(MY_ROOT)/lfslivecd-$(CD_VERSION).iso, is ready!"$(WHITE)

# Check host prerequisites
# FIXME: Fill this out with more package pre-reqs
test-host:
	@if [ $$EUID -ne 0 ] ; then \
	 echo "You must be logged in as root." && exit 1 ; fi
	@if ! type -p gawk >/dev/null 2>&1 ; then \
	 echo -e "Missing gawk on host!\nPlease install gawk and re-run 'make'." && exit 1 ; fi 

base: $(MKTREE) builduser build-tools
	@chroot "$(MP)" $(chenv-pre-bash) 'set +h && \
	chown -R 0:0 $(TT) $(SRC) $(MY_ROOT) &&\
	cd $(MY_ROOT) && make SHELL=$(TT)/bin/bash pre-bash'
	@chroot "$(MP)" $(chenv-post-bash) 'set +h && cd $(MY_ROOT) &&\
	make SHELL=/bin/bash post-bash'
	@install -m644 etc/issue* $(MP)/etc
	@touch $@

# This target populates the root.ext2 image and sets up some mounts
$(MKTREE): root.ext2
	mkdir -p $(MP) $(MY_BUILD)$(SRC) $(MY_BUILD)$(TT)/bin $(MY_BUILD)/iso/boot
	mount -o loop root.ext2 $(MP)
	mkdir -p $(MKTREE) $(MP)$(SRC) $(MP)$(TT)
	mkdir -p $(MP)/boot $(MP)$(LFSSRC) $(MY_BUILD)/iso$(LFSSRC)
	mount --bind $(MY_BASE) $(MP)$(MY_ROOT)
	mount --bind $(MY_BUILD)$(TT) $(MP)$(TT)
	mount --bind $(MY_BUILD)$(SRC) $(MP)$(SRC)
	mount --bind $(MY_BUILD)/iso/boot $(MP)/boot
	mount --bind $(MY_BUILD)/iso$(LFSSRC) $(MP)$(LFSSRC)
	-ln -nsf $(MY_BUILD)$(TT) /
	-install -dv $(TT)/bin
	-ln -sv /bin/bash $(TT)/bin/sh
	-ln -nsf $(MY_BUILD)$(SRC) /
	-ln -nsf $(MY_BUILD)$(MY_ROOT) /
	-mkdir -p $(MP)/{proc,sys,dev/shm,dev/pts}
	-mount -t proc proc $(MP)/proc
	-mount -t sysfs sysfs $(MP)/sys
	-mknod -m 600 $(MP)/dev/console c 5 1
	-mknod -m 666 $(MP)/dev/null c 1 3
	-mknod -m 666 $(MP)/dev/zero c 1 5
	-mknod -m 666 $(MP)/dev/ptmx c 5 2
	-mknod -m 666 $(MP)/dev/tty c 5 0
	-mknod -m 444 $(MP)/dev/random c 1 8
	-mknod -m 444 $(MP)/dev/urandom c 1 9
	-mount -t devtmpfs devtmpfs $(MP)/dev
	-mount -t tmpfs shm $(MP)/dev/shm
	-mount -t devpts devpts $(MP)/dev/pts
	-mkdir -pv $(MP)/{bin,boot,etc,home,lib,mnt,opt}
	-mkdir -pv $(MP)/{media/{floppy,cdrom},sbin,srv,var}
	-install -dv $(TT)/bin
	-install -m755 $(MY_BASE)/scripts/unpack $(TT)/bin
	-install -d -m 0750 $(MP)/root
	-install -d -m 1777 $(MP)/tmp $(MP)/var/tmp
	-mkdir -pv $(MP)/usr/{,local/}{bin,include,lib,sbin,src}
	-mkdir -pv $(MP)/usr/{,local/}share/{doc,info,locale,man}
	-mkdir -v  $(MP)/usr/{,local/}share/{misc,terminfo,zoneinfo}
	-mkdir -pv $(MP)/usr/{,local/}share/man/man{1..8}
	-for dir in $(MP)/usr $(MP)/usr/local; do ln -sv share/{man,doc,info} $$dir ; done
	-mkdir -v $(MP)/var/{lock,log,mail,run,spool}
	-mkdir -pv $(MP)/var/{opt,cache,lib/{misc,locate},local}
	-ln -s /proc/self/fd $(MP)/dev/fd
	-ln -s /proc/self/fd/0 $(MP)/dev/stdin
	-ln -s /proc/self/fd/1 $(MP)/dev/stdout
	-ln -s /proc/self/fd/2 $(MP)/dev/stderr
	-ln -s /proc/kcore $(MP)/dev/core
	-install -dv $(MY_BASE)/logs
	touch $(MKTREE)

# This image should be kept as clean as possible, i.e.:
# avoid creating files on it that you will later delete,
# preserve as many zeroed sectors as possible.
root.ext2:
	dd if=/dev/null of=root.ext2 bs=1M seek=$(ROOTFS_MEGS)
	mke2fs -F root.ext2
	tune2fs -c 0 -i 0 root.ext2

# Add the unprivileged user - will be used for building the temporary tools
builduser:
	@-groupadd $(USER)
	@-useradd -s /bin/bash -g $(USER) -m -k /dev/null $(USER)
	@-echo export MAKEFLAGS=-j8 >> /home/$(USER)/.bashrc
	@-chown -R $(USER):$(USER) $(MY_BUILD)$(TT) $(MY_BUILD)$(SRC) $(MY_BASE)
	@touch $@

build-tools:
	@su - $(USER) -c "$(toolsenv) '$(toolsbash) && make bash-prebuild'"
	@su - $(USER) -c "$(toolsenv) '$(toolsbash) && make SHELL=$(TT)/bin/sh wget-prebuild'"
	@su - $(USER) -c "$(toolsenv) '$(toolsbash) && make SHELL=$(TT)/bin/sh coreutils-prebuild'"
	@su - $(USER) -c "$(toolsenv) '$(toolsbash) && make SHELL=$(TT)/bin/sh tools'"
	@cp /etc/resolv.conf $(TT)/etc
	@rm -rf $(TT)/{,share/}{info,man}
	@-ln -s $(TT)/bin/bash $(MP)/bin/bash
	@install -m644 -oroot -groot $(MY_BASE)/etc/{group,passwd} $(MP)/etc
	@touch $@

maybe-tools:
	@if [ -f tools.tar.bz2 ] ; then \
	    echo "Found previously built tools. Unpacking..." && \
	    tar -C .. -jxpf tools.tar.bz2 ; \
	else \
	    su - lfs -c "$(lfsenv) '$(lfsbash) && $(MAKE) tools'" && \
	    echo "Packaging tools for later use..." && \
	    tar -C .. -jcpf tools.tar.bz2 tools ; \
	fi
	@touch $@

tools: \
	binutils-prebuild \
	gcc-prebuild \
	linux-headers-stage1 \
	glibc-stage1 \
	libstdcxx-stage1 \
	binutils-stage1 \
	gcc-stage1 \
	tcl-stage1 \
	expect-stage1 \
	dejagnu-stage1 \
	m4-stage1 \
	ncurses-stage1 \
	bash-stage1 \
	bison-stage1 \
	bzip2-stage1 \
	coreutils-stage1 \
	diffutils-stage1 \
	file-stage1 \
	findutils-stage1 \
	gawk-stage1 \
	gettext-stage1 \
	grep-stage1 \
	gzip-stage1 \
	make-stage1 \
	patch-stage1 \
	perl-stage1 \
	Python-stage1 \
	sed-stage1 \
	tar-stage1 \
	texinfo-stage1 \
	xz-stage1 \
	zlib-stage1 \
	openssl-stage1 \
	wget-stage1

pre-bash: \
	createfiles \
	linux-headers-stage2 \
	man-pages-stage2 \
	glibc-stage2 \
	zlib-stage2 \
	file-stage2 \
	readline-stage2 \
	m4-stage2 \
	bc-stage2 \
	binutils-stage2 \
	gmp-stage2 \
	mpfr-stage2 \
	mpc-stage2 \
	shadow-stage2 \
	gcc-stage2 \
	bzip2-stage2 \
	pkg-config-stage2 \
	ncurses-stage2 \
	attr-stage2 \
	acl-stage2 \
	libcap-stage2 \
	sed-stage2 \
	psmisc-stage2 \
	iana-etc-stage2 \
	bison-stage2 \
	flex-stage2 \
	bash-stage2

createfiles:
	@-$(TT)/bin/ln -s $(TT)/bin/{bash,cat,grep,pwd,stty} /bin
	@-$(TT)/bin/ln -s $(TT)/bin/perl /usr/bin
	@-$(TT)/bin/ln -s $(TT)/lib/libgcc_s.so{,.1} /usr/lib
	@-$(TT)/bin/ln -s $(TT)/lib/libstdc++.so{,.6} /usr/lib
	@-$(TT)/bin/ln -s bash /bin/sh
	@touch /var/run/utmp /var/log/{btmp,lastlog,wtmp}
	@chgrp utmp /var/run/utmp /var/log/lastlog
	@chmod 664 /var/run/utmp /var/log/lastlog
	@-mkdir -p /run/var
	@cp $(TT)/etc/resolv.conf /etc
	@-cp $(MY_ROOT)/etc/hosts /etc
	@touch $@

post-bash: \
	grep-stage2 \
	libtool-stage2 \
	gdbm-stage2 \
	gperf-stage2 \
	expat-stage2 \
	inetutils-stage2 \
	perl-stage2 \
	XML-Parser-stage2 \
	intltool-stage2 \
	autoconf-stage2 \
	automake-stage2 \
	xz-stage2 \
	kmod-stage2 \
	gettext-stage2 \
	elfutils-stage2 \
	libffi-stage2 \
	coreutils-stage2 \
	openssl-stage2 \
	Python-stage2 \
	ninja-stage2 \
	meson-stage2 \
	check-stage2 \
	diffutils-stage2 \
	gawk-stage2 \
	findutils-stage2 \
	groff-stage2 \
	grub-stage2 \
	less-stage2 \
	gzip-stage2 \
	iproute2-stage2 \
	kbd-stage2 \
	libpipeline-stage2 \
	make-stage2 \
	patch-stage2 \
	man-db-stage2 \
	tar-stage2 \
	texinfo-stage2 \
	vim-stage2 \
	procps-ng-stage2 \
	util-linux-stage2 \
	e2fsprogs-stage2 \
	sysklogd-stage2 \
	sysvinit-stage2 \
	eudev-stage2 \
	final-environment \
	wget-stage2 \
	unzip-stage2 \
	lynx-stage2 \
	lfs-bootscripts-stage2 \
	livecd-bootscripts-stage2 \
	blfs-bootscripts-stage2 \
	pcre-stage2 \
	libxml2-stage2 \
	libxslt-stage2 \
	glib2-stage2 \
	which-stage2 \
	dhcpcd-stage2 \
	slang-stage2 \
	iptables-stage2 \
	gpm-stage2 \
	mc-stage2 \
	dialog-stage2 \
	jansson-stage2 \
	libtirpc-stage2 \
	lmdb-stage2 \
	rpcsvc-proto-stage2 \
	libarchive-stage2 \
	samba-stage2 \
	zisofs-tools-stage2 \
	initramfs-stage2 \
	syslinux-stage2 \
	cpio-stage2 \
	libaio-stage2 \
	LVM2-stage2 \
	apr-stage2 \
	apr-util-stage2 \
	sqlite-stage2 \
	scons-stage2 \
	serf-stage2 \
	subversion-stage2 \
	hicolor-icon-theme-stage2 \
	util-macros-stage2 \
	Xorg-base-stage2 \
	xorgproto-stage2 \
	libXau-stage2 \
	libXdmcp-stage2 \
	xcb-proto-stage2 \
	libxcb-stage2 \
	libuv-stage2 \
	curl-stage2 \
	cmake-stage2 \
	graphite2-stage2 \
	icu-stage2 \
	freetype-stage2 \
	harfbuzz-stage2 \
	freetype-stage3 \
	harfbuzz-stage3 \
	fontconfig-stage2 \
	Xorg-lib-stage2 \
	xcb-util-stage2 \
	xcb-util-keysyms-stage2 \
	pixman-stage2 \
	libpng-stage2 \
	xbitmaps-stage2 \
	MarkupSafe-stage2 \
	Mako-stage2 \
	libdrm-stage2 \
	mesa-stage2 \
	Xorg-app-stage2 \
	xcursor-themes-stage2 \
	Xorg-font-stage2 \
	xkeyboard-config-stage2 \
	xorg-server-stage2 \
	libevdev-stage2 \
	mtdev-stage2 \
	Xorg-driver-stage2 \
	dbus-stage2 \
	at-spi2-core-stage2 \
	atk-stage2 \
	at-spi2-atk-stage2 \
	cairo-stage2 \
	fribidi-stage2 \
	pango-stage2 \
	shared-mime-info-stage2 \
	gdk-pixbuf-stage2 \
	libepoxy-stage2 \
	libxkbcommon-stage2 \
	gtk3-stage2 \
	URI-stage2 \
	startup-notification-stage2 \
	libwnck-stage2 \
	pcre2-stage2 \
	vte-stage2 \
	xfce-stage2 \
	gstreamer-stage2 \
	gst-plugins-base-stage2 \
	gst-plugins-bad-stage2 \
	gtk2-stage2 \
	libgudev-stage2 \
	libsecret-stage2 \
	libunistring-stage2 \
	libidn2-stage2 \
	libpsl-stage2 \
	libsoup-stage2 \
	libwebp-stage2 \
	openjpeg-stage2 \
	ruby-stage2 \
	libgpg-error-stage2 \
	libgcrypt-stage2 \
	yasm-stage2 \
	libjpeg-stage2 \
	libtasn1-stage2 \
	nettle-stage2 \
	gnutls-stage2 \
	gsettings-desktop-schemas-stage2 \
	glib-networking-stage2 \
	webkitgtk-stage2 \
	libcroco-stage2 \
	librsvg-stage2 \
	adwaita-icon-theme-stage2 \
	linux-stage2 \
	binutils-stage3 \
	gcc-stage3 \
	linux-stage3 \
	sudo-stage2 \
	update-caches

final-environment:
	@cp -a $(MY_ROOT)/etc/sysconfig /etc
	@rm -rf /etc/sysconfig/.svn
	@-cp $(MY_ROOT)/etc/inputrc /etc
	@-cp $(MY_ROOT)/etc/bashrc /etc
	@-cp $(MY_ROOT)/etc/profile /etc
	@-dircolors -p > /etc/dircolors
	@-cp $(MY_ROOT)/etc/fstab /etc

wget-list:
	@>wget-list ; \
	 for DIR in packages/* ; do \
	    make -C $${DIR} wget-list-entry || echo Never mind. ; \
	 done ; \
	 sed -i '/^$$/d' wget-list

stop:
	@echo $(GREEN)Stopping due to user specified stop point.$(WHITE)
	@exit 1

#==============================================================================
# Targets for building packages individually. Useful for troubleshooting.
# These are not used internally, but are expected to be specified manually on
# the command line, i.e., 'make [target]'
#==============================================================================

%-only-prebuild: builduser
	@su - $(USER) -c "$(toolsenv) '$(toolsbash) && make $*-prebuild'"

%-only-stage1: builduser
	@su - $(USER) -c "$(toolsenv) '$(toolsbash) && make $*-stage1'"

%-only-stage2: $(MKTREE)
	@chroot "$(MP)" $(chenv-post-bash) 'set +h && cd $(MY_ROOT) && \
	 make SHELL=/bin/bash -C packages/$* stage2'

# Clean the build directory of a single package.
%-clean:
	make -C packages/$* clean

#==============================================================================
# Do not call the targets below manually!
# These are used internally and must be called by other targets.
#==============================================================================

%-prebuild: %-clean
	make -C packages/$* prebuild

%-stage1: %-clean
	make -C packages/$* stage1

%-stage2: %-clean
	make -C packages/$* stage2

%-stage3: %-clean
	make -C packages/$* stage3

update-caches:
#	cd /usr/share/fonts ; mkfontscale ; mkfontdir ; fc-cache -f
#	mandb -c 2>/dev/null
	echo 'dummy / ext2 defaults 0 0' >/etc/mtab
	updatedb --prunepaths='/sources /tools /lfs-livecd /lfs-sources /proc /sys /dev /tmp /var/tmp'
	echo >/etc/mtab
	
#==============================================================================
# Targets to create the iso
#==============================================================================

prepiso: $(MKTREE)
	@-rm $(MP)/root/.bash_history
	@-rm $(MP)/etc/resolv.conf
	@>$(MP)/var/log/btmp
	@>$(MP)/var/log/wtmp
	@>$(MP)/var/log/lastlog
	@sed -i 's/Version:$$/Version: $(CD_VERSION)/' $(MP)/boot/isolinux/boot.msg
	@sed -i 's/Version:$$/Version: $(CD_VERSION)/' $(MP)/etc/issue*
	@install -m644 doc/lfscd-remastering-howto.txt $(MP)/root
	@sed -e 's/\[Version\]/$(CD_VERSION)/' -e 's/\\_/_/g' \
	    doc/README.txt >$(MP)/root/README.txt
	@install -m600 root/.bashrc $(MP)/root/.bashrc
	@install -m755 scripts/{net-setup,greeting,livecd-login} $(MP)/usr/bin/ 
	@sed s/@LINKER@/$(LINKER)/ scripts/shutdown-helper.in >$(MP)/usr/bin/shutdown-helper
	@chmod 755 $(MP)/usr/bin/shutdown-helper
	#@svn export --force root $(MP)/etc/skel

iso: prepiso
	@make unmount
	# Bug in old kernels requires a sync after unmounting the loop device
	# for data integrity.
	@sync ; sleep 1 ; sync
	# e2fsck optimizes directories and returns 1 after a clean build.
	# This is not a bug.
	@-e2fsck -f -p root.ext2
	@$(TT)/bin/mkzftree -F root.ext2 $(MY_BUILD)/iso/root.ext2
#	cp -v root.ext2 $(MY_BUILD)/iso/root.ext2
	@cd $(MY_BUILD)/iso ; mkisofs -z -R -l --allow-leading-dots -D -o \
	$(MY_BUILD)$(MY_ROOT)/lfslivecd-$(CD_VERSION).iso -b boot/isolinux/isolinux.bin \
	-c boot/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table \
	-V "lfslivecd-$(CD_VERSION)" ./

#==============================================================================
# Targets to clean the tree.
# 'clean' cleans the build system tree, scrub also cleans the installed system
#==============================================================================

clean: unmount
	@-rm -rf $(TT) $(MY_BUILD)$(TT) $(MY_BUILD)/iso
	@-userdel $(USER)
	@-groupdel $(USER)
	@rm -rf /home/$(USER)
	@rm -f {dirstruct,builduser,build-tools,base,createfiles,prep-mount,tools,prepiso}
	@-for i in `ls packages` ; do $(MAKE) -C packages/$$i clean ; done
	@find packages -name "prebuild" -exec rm -f \{} \;
	@find packages -name "stage*" -exec rm -f \{} \;
	@find packages -name "*.log" -exec rm -f \{} \;
	@rm -f logs/*
	@rm -f packages/Xorg-*/*-stage2
	@rm -f packages/binutils/{a.out,dummy.c,.spectest}
	@-rm -f $(SRC) $(MY_ROOT)
	@find packages/* -xtype l -exec rm -f \{} \;
	@-rm root.ext2

scrub: clean
	@rm -f lfslivecd-$(CD_VERSION).iso lfslivecd-$(CD_VERSION)-nosrc.iso

mount: $(MKTREE)

unmount:
	-umount $(MP)/dev/shm
	-umount $(MP)/dev/pts
	-umount $(MP)/proc
	-umount $(MP)/sys
	-umount $(MP)/boot
	-umount $(MP)$(LFSSRC)
	-umount $(MP)$(SRC)
	-umount $(MP)$(TT)
	-umount $(MP)$(MY_ROOT)
	-rmdir $(MP)$(SRC) $(MP)$(TT) $(MP)$(MY_ROOT)
	-rmdir $(MP)/boot $(MP)$(LFSSRC)
	-umount -R $(MP)

zeroes: $(MKTREE)
	-dd if=/dev/zero of=$(MP)/zeroes
	-rm $(MP)/zeroes
	-make unmount

#==============================================================================
.PHONY: unmount clean final-environment %-stage2 %-prebuild %-stage1 \
	%-only-stage2 %-only-prebuild %-only-stage1 post-bash pre-bash
