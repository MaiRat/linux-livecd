# MarkupSafe Makefile

NM= MarkupSafe
VRS= 1.1.1
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_BLFS)/python-modules/$(FILE)
MD5-$(FILE)= 43fd756864fe42063068e092e220c57b

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	python3 setup.py build
	python3 setup.py install --optimize=1

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
