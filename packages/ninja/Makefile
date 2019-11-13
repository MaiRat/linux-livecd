# ninja Makefile

NM= ninja
VRS= 1.9.0
DIR= $(NM)-$(VRS)

FILE= $(DIR).tar.gz
URL-$(FILE)= $(HTTP_LFS)/$(FILE)
MD5-$(FILE)= f340be768a76724b83e6daab69009902

# Targets

include $(MY_ROOT)/scripts/functions

stage2: Makefile $(FILE)
	$(std_build)

compile-stage2:
	sed -i '/int Guess/a				\
		int   j = 0;				\
		char* jobs = getenv( "NINJAJOBS" );	\
		if ( jobs != NULL ) j = atoi( jobs );	\
		if ( j > 0 ) return j;			\
		' src/ninja.cc
	python3 configure.py --bootstrap
	install -vm755 ninja /usr/bin/
	install -vDm644 misc/bash-completion /usr/share/bash-completion/completions/ninja
	install -vDm644 misc/zsh-completion  /usr/share/zsh/site-functions/_ninja

clean:
	-rm -rf $(DIR)

.PHONY: clean compile-stage2
