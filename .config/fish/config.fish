if status is-interactive

	set -x JAVA_HOME /usr/lib/jvm/java-19-openjdk-amd64
	set -x PATH $JAVA_HOME/bin $PATH
	set -x PATH $HOME/.local/share/bob/nvim-bin $PATH
	set -x PATH $HOME/.local/bin $PATH
	set -x PATH $HOME/.config/emacs/bin $PATH

	# Haskell paths
	set -x PATH /home/viveroz/.ghcup/bin $PATH
	set -x PATH $HOME/.cabal/bin $PATH

	# set fish_greeting
	function fish_greeting
			set -l greetings (shuf -n 1 -e "Hello!" "Hi" "G'day" "Howdy")
			set -l animal_words (shuf -n 1 -e "Cuddly" "Silly" "Playful" "Cheeky" "Adorable" "Mischievous" "Quirky")
			set -l domestic_animals (shuf -n 1 -e "Cat" "Dog" "Rabbit" "Guinea Pig" "Hamster" "Parrot" "Goldfish")

			set -l colors (shuf -n 4 -e "#f4dbd6" "#f0c6c6" "#f5bde6" "#c6a0f6" "#ed8796" "#ee99a0" "#f5a97f" "#eed49f" "#a6da95" "#8bd5ca" "#91d7e3" "#7dc4e4" "#8aadf4" "#b7bdf8")

			set -l color_greetings (echo $colors[1])
			set -l color_animal_words (echo $colors[2])
			set -l color_domestic_animals (echo $colors[3])
			set -l color_friend (echo $colors[4])

			set_color $color_greetings
			echo -n $greetings
			set_color normal
			echo -n ", "
			set_color $color_animal_words
			echo -n $animal_words
			set_color normal
			echo -n " "
			set_color $color_domestic_animals
			echo -n $domestic_animals
			set_color normal
			echo -n " "
			set_color $color_friend
			echo -n "friend"
			set_color normal
			echo "!"
	end

	# Bat theme
	set -x BAT_THEME "Catppuccin-macchiato"

	if test -x /usr/bin/lesspipe
		eval (env SHELL=/bin/sh lesspipe)
	end

	alias ls 'exa -al --color=always --icons --group-directories-first'
	#alias dir 'dir --color=auto'
	#alias vdir 'vdir --color=auto'

	alias grep 'grep --color=auto'
	alias fgrep 'fgrep --color=auto'
	alias egrep 'egrep --color=auto'

	alias ll='ls -alF'
	alias la='ls -A'
	alias l='ls -CF'
	alias c='xclip -i'
	alias v='xclip -o'
	alias cs='xclip -i -selection clipboard'
	alias vs='xclip -o -selection clipboard'
	alias emacs='emacsclient -c -a \'emacs\''

	#find directory and cd
	alias cf='cd $(fd -t d . ~ | fzf --preview=\'tree -L 2 -C {}\' --preview-window=up:40%)'

	#neovide
	alias nvid='/home/viveroz/Documentos/Programas/neovide/neovide --multigrid'

	# dotfiles git alias: https://www.atlassian.com/git/tutorials/dotfiles
	# git init --bare $HOME/.cfg
	# alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
	# config config --local status.showUntrackedFiles no
	alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
	
	#start starship
	starship init fish | source

	#show pfetch
	pfetch
end
