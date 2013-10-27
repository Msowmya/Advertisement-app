class AdsController < ApplicationController
  def new
    @ad = Ad.new
  end
  def show
    @ad = Ad.find(params[:id])
  end
  def index
    @ads = Ad.all
  end
  def create
    @ad = Ad.new(ad_params)
    if @ad.save
      redirect_to @ad
    else
      render 'new'
    end
  end

  private

  def ad_params
    params.require(:ad).permit(:title, :description, :contact_details)

  end
end
