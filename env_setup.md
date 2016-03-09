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
Install Postgres gem specifying directory
```
gem install pg -v '0.18.4' --  --with-pg-config=/Applications/Postgres.app/Contents/Versions/9.5/bin/pg_config
```
Control+O, Enter, and then Control+X
  - Two lines enable command line colors, and define colors for the ‘ls’ command
  - Finally, we alias ls to include a few flags by default. -G colorizes output, -h makes sizes human readable, and -F throws a / after a directory, * after an executable, and a @ after a symlink, making it easier to quickly identify things in directory listings

##### GitHub
Configure `$ git config --global -l`
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
sync your rebased branch
```
$ git push -f
```

##### Homebrew
[http://brew.sh](http://brew.sh)

Install latest version of Homebrew
```
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
configure
```
$ brew install wget
$ brew doctor
$ brew update
```

##### RVM
[https://rvm.io/rvm/install](https://rvm.io/rvm/install)

Install latest version of RVM
```
$ \curl -sSL https://get.rvm.io | bash -s stable --auto-dotfiles
```
disable documentation for all gem installs `$ echo "gem: --no-rdoc --no-ri" >> ~/.gemrc`

test installation
```
$ type rvm | head -n 1
```
should output `rvm is a function`

`gem env` will list the gem paths

should report the RVM-managed gem library paths

Install Ruby
```
$ rvm install 2.3.0
```
First install Bundler gem inside of a project
```
gem install bundler
```
Update all gems
```
$ rvm rubygems current
$ bundle update
```
Install Rails
```
$ gem install rails 4.2.6 --no-ri --no-rdoc
$ rails --version
```
RVM CLI usage

`rvm info` show information for current ruby

`rvm list` show currently installed versions

`rvm reload` reload RVM source itself (useful after changing RVM source)

`rvm use` setup current shell to use a specific ruby version

`rvm --default` when used with ruby selection, sets a default ruby for new shells

Update RVM
```
$ rvm get stable
```
Remove RVM
```
$ rvm implode --force
```
remove from the following locations
```
$ rm -rf /usr/local/rvm
$ sudo rm /etc/profile.d/rvm.sh
$ sudo rm /etc/rvmrc
$ sudo rm ~/.rvmrc
```
check the following files for RVM references
```
$ nano ~/.bashrc
$ nano ~/.bash_profile
$ nano ~/.profile
$ nano ~/.zshrc
$ nano ~/.zlogin
```
restart your terminal
