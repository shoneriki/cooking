class DishesController < ApplicationController
  def index
    @dishes = Dish.all
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)
    if @dish.save
      redirect_to dish_path(@dish)
    else
      render :new
    end
  end

  def show
    @dish = Dish.find(params[:id])
    @portion = Portion.new
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :photo)
  end

end
