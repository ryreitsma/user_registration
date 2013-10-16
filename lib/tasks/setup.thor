class Setup < Thor
  desc :init, "prepare environment"
  def init
    system <<-CMDS
      rake secret > config/secret_token
      cp config/database.yml.example config/database.yml
      rake db:create db:schema:load db:test:prepare
    CMDS
  end

  desc :poltergeist, "setup poltergeist on your machine"
  def poltergeist
    unless `whoami`.chomp == 'root'
      puts "This command requires 'sudo'"
      return
    end

    phantom_url = "https://phantomjs.googlecode.com/files/phantomjs-1.9.2-linux-x86_64.tar.bz2"

    system <<-CMDS
      mkdir /opt
      pushd /opt
      wget #{phantom_url}
      bunzip2 phantom*.bz2
      tar xvf phantomjs*.tar
      rm phantomjs*.tar
      mv phantomjs* phantomjs
      cp phantomjs/bin/phantomjs /bin
    CMDS
  end
end
