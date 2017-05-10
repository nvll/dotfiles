CONFIGS := \
	.bash_profile \
	.bashrc \
	.gitconfig \
	.git-prompt.sh \
	.vim \
	.vimrc \

TARGETS = $(addprefix $(HOME)/, $(CONFIGS))

all: $(TARGETS)

$(HOME)/%:
	ln -s $(HOME)/configs/$(@F) $@

clean: 
	rm -f $(TARGETS)
