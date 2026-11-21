# ########################################################################################################
# colores                                                                                               #
# ########################################################################################################
RESET   := \e[0m
BOLD    := \e[1m
BLACK   := \e[30m
RED     := \e[31m
GREEN   := \e[32m
YELLOW  := \e[33m
BLUE    := \e[34m
MAGENTA := \e[35m
CYAN    := \e[36m
WHITE   := \e[37m
GRAY    := \e[90m

# ########################################################################################################
# makefile                                                                                               #
# ########################################################################################################
.ONESHELL :
SILENT := >/dev/null 2>&1
OKRULE = @printf "[ $(GREEN)OK$(RESET) ] $(GRAY)$(notdir $@)$(RESET)\n"

# ########################################################################################################
# dotfiles                                                                                               #
# ########################################################################################################
RULESDOT := zsh ssh git nvim
.PHONY : dotfiles $(RULESDOT)
dotfiles : $(RULESDOT)

# ########################################################################################################
# zsh                                                                                                    #
# ########################################################################################################
DOT_ZSH_RC := zsh/zshrc
SYS_ZSH_RC := ~/.zshrc
DOT_ZSH_PRO := zsh/zprofile
SYS_ZSH_PRO := ~/.zprofile
zsh : $(SYS_ZSH_RC) $(SYS_ZSH_PRO)

$(SYS_ZSH_RC) : $(DOT_ZSH_RC)
	@cp -f $< $@ $(SILENT)
	$(OKRULE)

$(SYS_ZSH_PRO) : $(DOT_ZSH_PRO)
	@cp -f $< $@ $(SILENT)
	$(OKRULE)

# ########################################################################################################
# ssh                                                                                                    #
# ########################################################################################################
DOT_SSH_CONF := ssh/config
SYS_SSH_CONF := ~/.ssh/config
DOT_SSH_GIT  := /Volumes/Archivos/config/ssh/github
SYS_SSH_GIT  := ~/.ssh/github
ssh : $(SYS_SSH_CONF) $(SYS_SSH_GIT)

$(SYS_SSH_CONF) : $(DOT_SSH_CONF)
	@mkdir -p ~/.ssh $(SILENT)
	@cp -f $< $@ $(SILENT)
	$(OKRULE)

$(SYS_SSH_GIT) : $(DOT_SSH_GIT)
	@mkdir -p ~/.ssh $(SILENT)
	@cp -f $< $@ $(SILENT)
	@chmod 700 ~/.ssh $(SILENT)
	@chmod 600 $@ $(SILENT)
	$(OKRULE)

# ########################################################################################################
# git                                                                                                    #
# ########################################################################################################
DOT_GIT_CONF := git/gitconfig
SYS_GIT_CONF := ~/.gitconfig
git : $(SYS_GIT_CONF)

$(SYS_GIT_CONF) : $(DOT_GIT_CONF)
	@cp -f $< $@ $(SILENT)
	$(OKRULE)

# ########################################################################################################
# neovim                                                                                                 #
# ########################################################################################################
DOT_NVIM_LUA := nvim/init.lua
SYS_NVIM_LUA := ~/.config/nvim/init.lua
nvim : $(SYS_NVIM_LUA)

$(SYS_NVIM_LUA) : $(DOT_NVIM_LUA)
	@mkdir -p $(dir $@) $(SILENT)
	@cp -f $< $@ $(SILENT)
	$(OKRULE)

