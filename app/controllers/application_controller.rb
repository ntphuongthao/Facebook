class ApplicationController < ActionController::Base
  def home
    render 'shared/about'
  end
end
