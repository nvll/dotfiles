UNAME := $(shell uname)

CONFIGS := \
	.bash_profile \
	.bashrc \
	.bashrc.$(UNAME) \
	.git-prompt.sh \
	.gitconfig \
	.vim \
	.vimrc \

TARGETS = $(addprefix $(HOME)/, $(CONFIGS))

all: $(TARGETS)

$(HOME)/%:
	ln -s $(HOME)/configs/$(@F) $@

clean:
	rm -f $(TARGETS)
