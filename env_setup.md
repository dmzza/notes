##### terminal preferences
`$ nano .bash_profile`
```
export PS1=" 🙃  $ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.5/bin
```
Control+O, Enter, and then Control+X
  - Two lines enable command line colors, and define colors for the ‘ls’ command
  - Finally, we alias ls to include a few flags by default. -G colorizes output, -h makes sizes human readable, and -F throws a / after a directory, * after an executable, and a @ after a symlink, making it easier to quickly identify things in directory listings

##### GitHub
Config `$ git config --global -l`
```
filter.lfs.required=true
filter.lfs.clean=git-lfs clean %f
filter.lfs.smudge=git-lfs smudge %f
git config --global push.default simple
user.name=David
user.email=litlmoz@gmail.com
core.editor=atom --wait
```
Install Xcode and xcode command line tools
Install Xcode extensions: `$ xcode-select --install`

Rebase branch
```
$ git checkout <SHA>
$ git rebase master
$ git push -f origin HEAD:<name-of-remote-branch>
```
Sync your rebased branch
```
$ git push -f
```

##### Homebrew
[http://brew.sh](http://brew.sh)

Run to install latest version
```
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
Configure
```
$ brew install wget
$ brew doctor
$ brew update
```

##### RVM
[https://rvm.io/rvm/install](https://rvm.io/rvm/install)

Latest version
```
$ \curl -sSL https://get.rvm.io | bash -s stable --auto-dotfiles
```
Disable documentation for all gem installs `$ echo "gem: --no-rdoc --no-ri" >> ~/.gemrc`

Test installation
```
$ type rvm | head -n 1
```
Should output `rvm is a function`

Install Ruby
```
$ rvm install 2.3.0
```

Update all gems
```
$ rvm rubygems current
```
Install Rails
```
$ gem install rails --no-ri --no-rdoc
$ rails --version
```
