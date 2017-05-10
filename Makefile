CONFIGS := \
	.bash_profile \
	.bashrc \
	.gitconfig \
	.git-prompt.sh \
	.vim \
	.vimrc \

all:
	$(foreach conf, $(CONFIGS), ln -s $(HOME)/configs/$(conf) $(HOME)/$(conf);)

clean:
	$(foreach conf, $(CONFIGS), rm -f $(HOME)/$(conf);)
