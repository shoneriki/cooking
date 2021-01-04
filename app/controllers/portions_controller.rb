class PortionsController < ApplicationController
  def new
    @dish = Dish.find(params[:dish_id])
    @portion = Portion.new
  end
end
