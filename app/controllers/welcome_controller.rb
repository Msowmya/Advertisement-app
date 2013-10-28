class WelcomeController < ApplicationController
  def index
    @ad = current_user.ads.build if signed_in?
  end
end
