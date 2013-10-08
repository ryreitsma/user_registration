class Setup < Thor
  desc :init, "prepare environment"
  def init
    `rake secret > config/secret_token`
  end
end
