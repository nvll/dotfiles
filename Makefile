UNAME := $(shell uname)

CONFIGS := \
	.bash_profile \
	.bashrc \
	.bashrc.$(UNAME) \
	.git-prompt.sh \
	.gitconfig \
	.i3 \
	.vim \
	.vimrc \

ifeq ($(UNAME),Linux)
	CONFIGS += \
		.Xmodmap \
		.xsession \
		.Xresources
endif

PACKAGES := \
	build-essential \
	i3 \
	i3status \
	neovim \
	nitrogen \
	python3-pip \
	silversearcher-ag \
	suckless-tools \
	tig \
	vim \
	xsecurelock

TARGETS = $(addprefix $(HOME)/, $(CONFIGS))

all: $(TARGETS) nvim

# This pipulates $(TARGETS) with the destination paths for everything in $(CONFIGS)
$(HOME)/%:
	ln -s $(HOME)/configs/$(@F) $@

nvim:
	mkdir -p $(HOME)/.config
	ln -s $(HOME)/.vim $(HOME)/.config/nvim

linux:
	sudo apt-get install $(PACKAGES) -y
	pip -q install neovim
	pip3 -q install neovim

# Creates a \n that can be used in the foreach
define \n


endef

.PHONY: clean
clean:
	# The || true catches a case where make would return an error if a file wasn't found
	$(foreach TARGET, $(TARGETS), (test -L $(TARGET) && rm -f $(TARGET)) || true;${\n})
	rm -f $(HOME)/.config/nvim

.PHONY: spotless
spotless: clean
	pip -q uninstall neovim || true
	pip3 -q uninstall neovim || true
	sudo apt-get remove $(PACKAGES)
