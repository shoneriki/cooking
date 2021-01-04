class DishesController < ApplicationController
  def index
    @dishes = Dish.all
  end

  def new
    @dish = Dish.new
  end

  def show
    @dish = Dish.find(params[:id])
  end

end
