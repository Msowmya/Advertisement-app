class VisitorsController < ApplicationController
  def new
   @visitor = Visitor.new
  end
  def index
    @visitors = Visitor.all
  end
  def show
    @visitor = Visitor.find(params[:id])
  end
  def create
    @visitor = Visitor.new(visitor_params)
     @visitor.save
      redirect_to @visitor
  end

  private

  def visitor_params
    params.require(:visitor).permit(:name, :email)
  end

end
