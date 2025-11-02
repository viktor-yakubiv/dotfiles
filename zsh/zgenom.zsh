# Zgenom is a package manager to load plugins
#
# The manager is installed by the script install.sh
# It can be invoked at any configuration file in this repository
# and also in .localrc
export ZGENOM_HOME="$HOME/.local/share/zgenom"
source "$ZGENOM_HOME/zgenom.zsh"

# Check for plugin and zgenom updates every 7 days
# This does not increase the startup time.
zgenom autoupdate

# If the init script doesn't exist
if ! zgenom saved; then
    echo "Creating a zgenom save"

		# Oh My Zsh
		#
		# Oh My Zsh heavily relies on $ZSH and $ZSH_CACHE_DIR.
		# It is not possible local complete Oh My Zsh when $ZSH set
		# to a directory different from the ohmyzsh-repository root.
		# 
		# I set ZSH_CACHE_DIR and pick only things that I like keeping.
		export ZSH_CACHE_DIR="$HOME/.cache/zsh"
		zgenom ohmyzsh lib/completion.zsh
		zgenom ohmyzsh lib/clipboard.zsh
		zgenom ohmyzsh lib/directories.zsh
		zgenom ohmyzsh lib/history.zsh
		zgenom ohmyzsh lib/key-bindings.zsh

    # OhMyZsh plugins
    zgenom ohmyzsh plugins/git
    zgenom ohmyzsh plugins/sudo

    zgenom load zsh-users/zsh-syntax-highlighting
    zgenom load zsh-users/zsh-history-substring-search
    zgenom load zsh-users/zsh-autosuggestions
    zgenom load softmoth/zsh-vim-mode

    # Completions
    zgenom load zsh-users/zsh-completions

    # Save all to init script
    zgenom save

    # Compile zsh files
    zgenom compile "$HOME/.zshrc"
fi
