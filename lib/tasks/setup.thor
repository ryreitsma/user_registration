class Setup < Thor
  desc :init, "prepare environment"
  def init
    `rake secret > config/secret_token`
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

    #`pushd /tmp ; mkdir phantomjs ; cd phantomjs ; wget  ; bunzip phantomjs* ; tar xvf phantomjs* ; 
    #`wget https://phantomjs.googlecode.com/files/phantomjs-1.9.2-linux-x86_64.tar.bz2`
  end
end
