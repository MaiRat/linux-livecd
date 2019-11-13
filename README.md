# linux-livecd

The linux-livecd is a project to create a standardized livecd based on Linux,
especially based on LinuxFromScratch and the abandoned LFS-livecd project.

## Why another livecd?

Another? :) The only recent stand-alone livecd for Linux is Knoppix, based
on Debian and is not so recent, due to exclusive releases through magazines & co.

The aim of this project is the creation of a distribution independent livecd.
Well, LinuxFromScratch is a kind of distribution, too. But if you know LFS already,
you are aware of the dynamic modularized package system. E.g. you can compile the
Midnight Commander optionally with slang (or not).

## Use it / start up

Insert and boot from CD. Type "linux" or "linux64" and press return key. If
you want to use the graphical environment, append " vga=<vga-code>" to the
boot command line.

## Roadmap

The first preview of the linux-livecd based on LFS and BLFS 9.0 is now available
on this repo.

## Contribute

You are welcome to test and submit issues as well as patches/pull-requests.

## Target architecture(s)

The first target is x86-32. More is planned.
x86-64, arm*
