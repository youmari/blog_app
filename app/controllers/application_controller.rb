class ApplicationController < ActionController::Base
  include Pagy::Backend
  def self.current_user
    User.first
  end
end
