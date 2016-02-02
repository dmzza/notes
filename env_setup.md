# terminal preferences
`$ nano .bash_profile`
```
export PS1=" 🙃  $ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

source ~/.rvm/scripts/rvm

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin
  ```
  - Control+O, enter, and then Control+X
  - Two lines enable command line colors, and define colors for the ‘ls’ command
  - Finally, we alias ls to include a few flags by default. -G colorizes output, -h makes sizes human readable, and -F throws a / after a directory, * after an executable, and a @ after a symlink, making it easier to quickly identify things in directory listings.

# git
  - Install Github for Mac
  - Install Xcode and xcode command line tools
  - Install Xcode extensions: `$ xcode-select --install`
  - push local changes to Heroku after comitting to Git `$ git push heroku master`

# homebrew found
1. http://brew.sh
2. installation: `$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
3. configuration: `$ brew install wget`

# ruby
1. found https://rvm.io/rvm/install
2. RVM stable with Ruby: `$ \curl -sSL https://get.rvm.io | bash -s stable --ruby`
3. Install the most recent RubyGems that RVM knows about`rvm rubygems current`
3. Updating RVM & Ruby:
  - `$ rvm get stable --autolibs=enable`
  - `$ rvm install ruby`
  - `$ rvm list`
5. Disables the documentation step: `$ echo "gem: --no-document" >> ~/.gemrc`

# rails
  - installation: `$ gem install rails --no-ri --no-rdoc`
  - `$ rails --version`

# check installation:
  - `$ brew doctor`
  - `$ brew update`
  - `$ bundle install`
