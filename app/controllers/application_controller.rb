class ApplicationController < ActionController::API
  include AbstractController::Translation

  extend ProtectsFromSpam
end
