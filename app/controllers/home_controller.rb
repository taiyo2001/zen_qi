class HomeController < ApplicationController
  def index
    return unless user_signed_in?

    @current_user = current_user
  end
end
