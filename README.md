Terminal preferences
$ nano .bash_profile

$ export PS1=" 🙃 $ "
  export CLICOLOR=1
  export LSCOLORS=ExFxBxDxCxegedabagacad
  alias ls='ls -GFh'
    #Control+O, enter, and then Control+X
    Two lines enable command line colors, and define colors for the ‘ls’ command
    Finally, we alias ls to include a few flags by default. -G colorizes output, -h makes sizes human readable, and -F throws a / after a directory, * after an executable, and a @ after a symlink, making it easier to quickly identify things in directory listings.

Install Github for Mac
Install Xcode and xcode command line tools
  Install Xcode extensions: $ xcode-select --install
  #push local changes to Heroku after comitting to Git
  $ git push heroku master

Homebrew found http://brew.sh
  installation: $ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew
    /install/master/install)"
  configuration: $ brew install wget

Ruby found https://rvm.io/rvm/install
  RVM stable with Ruby: $ \curl -sSL https://get.rvm.io | bash -s stable --ruby
  Updating RVM & Ruby: $ rvm get stable --autolibs=enable
                       $ rvm install ruby
                       $ rvm --default use ruby-2.2.3
                       $ rvm list

  Ruby Gems (gem manager in Ruby): $ gem update --system
  Disables the documentation step: $ echo "gem: --no-document" >> ~/.gemrc

Rails
  rails installation: $ gem install rails --no-ri --no-rdoc
                      $ rails --version
  check SQLite3 version: $ sqlite3 --version
  start server: $ rails s

  check installation: $ brew doctor


  $ brew update
  $ bundle install

Postgres
  $ sudo ~/.bash_profile
  $ export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin
  #set /bin directory to your PATH for every terminal session

  $ heroku pg:psql


  #if not, try
  $ sudo su
  $ env ARCHFLAGS="-arch x86_64" gem install pg -v 0.18.4 -- --with-pg-config=/Applications/Postgres.app/Contents/Versions/9.4/bin/pg_config
