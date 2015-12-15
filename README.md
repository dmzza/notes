# terminal preferences
`$ nano .bash_profile`
```
$ export PS1=" 🙃 $ "
  export CLICOLOR=1
  export LSCOLORS=ExFxBxDxCxegedabagacad
  alias ls='ls -GFh'
  ```
1. Control+O, enter, and then Control+X
2. Two lines enable command line colors, and define colors for the ‘ls’ command
3. Finally, we alias ls to include a few flags by default. -G colorizes output, -h makes sizes human readable, and -F throws a / after a directory, * after an executable, and a @ after a symlink, making it easier to quickly identify things in directory listings.

# git
1. Install Github for Mac
2. Install Xcode and xcode command line tools
3. Install Xcode extensions: `$ xcode-select --install`
4. push local changes to Heroku after comitting to Git `$ git push heroku master`

# homebrew found
1. http://brew.sh
2. installation: `$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
3. configuration: `$ brew install wget`

# ruby
1. found https://rvm.io/rvm/install
2. RVM stable with Ruby: `$ \curl -sSL https://get.rvm.io | bash -s stable --ruby`
3. Updating RVM & Ruby:
  - `$ rvm get stable --autolibs=enable`
  - `$ rvm install ruby`
  - `$ rvm --default use ruby-2.2.3`
  - `$ rvm list`
4. Ruby Gems (gem manager in Ruby): `$ gem update --system`
5. Disables the documentation step: `$ echo "gem: --no-document" >> ~/.gemrc`

# rails
1. installation: `$ gem install rails --no-ri --no-rdoc`
2. `$ rails --version`

# check installation:
1. `$ brew doctor`
2. `$ brew update`
3. `$ bundle install`

# postgres
`$ sudo ~/.bash_profile`
`$ export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin`
sets /bin directory to your PATH for every terminal session

`$ heroku pg:psql`

if not, try
`$ sudo su`
`$ env ARCHFLAGS="-arch x86_64" gem install pg -v 0.18.4 -- --with-pg-config=/Applications/Postgres.app/Contents/Versions/9.4/bin/pg_config`
