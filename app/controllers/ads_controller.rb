class AdsController < ApplicationController
 before_action :signed_in_user, only: [:create,:index, :destroy]

  def index
    @ads = Ad.all
  end
  def create
    @ad = current_user.ads.build(ad_params)
    if @ad.save
      redirect_to root_url

    else
      render 'welcome/index'
    end

  end
  def destroy
    Ad.find(params[:id]).destroy
    redirect_to ads_url

  end
  private
  def ad_params
    params.require(:ad).permit(:title, :description,:contact_details)
  end

end
