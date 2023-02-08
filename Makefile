UNAME := $(shell uname -s)

CONFIGS := \
	.bash_profile \
	.bashrc \
	.bashrc.$(UNAME) \
	.git-prompt.sh \
	.gitconfig \
	.vim \
	.vimrc

ifeq ($(UNAME),Linux)
	CONFIGS += \
		.i3 \
		.Xmodmap \
		.xsession \
		.Xresources
endif

DEBIAN_PACKAGES := \
	build-essential \
	cmake \
	tig \
	tmux \
	vim \

OSX_PACKAGES := \
	cscope \
	ctags \
	libusb \
	neovim \
	neovim \
	the_silver_searcher \
	tmux \
	vim \
	wget

TARGETS = $(addprefix $(HOME)/, $(CONFIGS))

all: $(TARGETS)

# This pipulates $(TARGETS) with the destination paths for everything in $(CONFIGS)
$(HOME)/%:
	ln -s $(HOME)/dotfiles/$(@F) $@

debian: rust
	sudo apt-get install $(DEBIAN_PACKAGES) -y

brew:
	mkdir -p $(HOME)/usr/local/
	curl -fsSL https://github.com/Homebrew/brew/tarball/master > /tmp/homebrew.tar && \
	tar xf /tmp/homebrew.tar
	mv Homebrew-* $(HOME)/usr/local/homebrew

brew-install:
	$(HOME)/usr/local/homebrew/bin/brew install $(OSX_PACKAGES)

rust:
	curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path
	cargo install ripgrep fd-find sd

# Creates a \n that can be used in the foreach
define \n


endef

.PHONY: clean
clean:
	# The || true catches a case where make would return an error if a file wasn't found
	$(foreach TARGET, $(TARGETS), (test -L $(TARGET) && rm -f $(TARGET)) || true;${\n})

.PHONY: spotless
spotless: clean
	sudo apt-get remove $(DEBIAN_PACKAGES)
