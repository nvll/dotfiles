UNAME := $(shell uname)

CONFIGS := \
	.bash_profile \
	.bashrc \
	.bashrc.$(UNAME) \
	.git-prompt.sh \
	.gitconfig \
	.vim \
	.vimrc \

ifeq ($(UNAME),Linux)
	CONFIGS += \
		.xmodmap \
		.xsession
endif

TARGETS = $(addprefix $(HOME)/, $(CONFIGS))

all: $(TARGETS)

$(HOME)/%:
	ln -s $(HOME)/configs/$(@F) $@

clean:
	test -L ~/.bash_profile && rm ~/.bash_profile
	test -L ~/.bashrc && rm ~/.bashrc
	test -L ~/.bashrc.$(UNAME) && rm ~/.bashrc.$(UNAME)
	test -L ~/.git-prompt.sh && rm ~/.git-prompt.sh
	test -L ~/.gitconfig && rm ~/.gitconfig
	test -L ~/.vim && rm ~/.vim
	test -L ~/.vimrc && rm ~/.vimrc
	test -L ~/.xmodmap && rm ~/.xmodmap || true
	test -L ~/.xsession && rm ~/.xession || true
