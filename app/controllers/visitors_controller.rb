class VisitorsController < ApplicationController
  def new

  end
  def index

  end
  def show

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
